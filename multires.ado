program multires
version 15.1
syntax varlist(min = 1 string) [if] [in] using/ [, PARSing(string)]

local components varlist using

local j = 0

foreach com of local components {
    local ++j
    if "`com'" == "" {
        display as error "error 40`j': missing `com'"
        exit 40`j'
    }
}

local filename = subinstr("`using'", ".dta", "", .)

use "`filename'", clear
cd

tempvar touse 
mark `touse' `if' `in'
keep if `touse'

capture confirm variable id
if _rc == 111 {
	gen id = _n
}
else {
	rename id old_id
	gen id = _n
}

tempfile tempfilename
save `tempfilename', replace

if (strpos("`parsing'", ",") > 0) | (missing("`parsing'")) {
    local parsing = "//"
    foreach multiple in `varlist' {
        replace `multiple' = subinstr(`multiple', ",", "//", .)
    }
    save `tempfilename', replace
}

foreach multiple in `varlist' {
    keep id `multiple'
    replace `multiple' = strtrim(stritrim(`multiple'))
    replace `multiple' = subinstr(`multiple', "  ", " ", .)
    replace `multiple' = subinstr(`multiple', ",", "", .)
    replace `multiple' = subinstr(`multiple', char(10), "", .) // remove line breaks
    split `multiple', generate(v) parse(, "`parsing'") trim
    reshape long v, i(id) j(num)
    drop if missing(v)
    replace v = strtrim(stritrim(v))
    replace v = subinstr(v, char(10), "", .) // remove line breaks
    gen v1 = usubinstr(v,"Đđ","Dd",.)
    replace v1 = strtrim(strtrim(subinstr(ustrto(ustrnormalize(v1, "nfd"), "ascii", 2), " ", "", .))) // remove accents on a string variable
    replace v1 = substr(v1, 15, 29) if strlen(v1) > 29
    replace v1 = subinstr(v1, " ", "", .) // remove whitespace
    replace v1 = subinstr(v1, char(10), "", .) // remove line breaks
    replace v1 = strlower(v1) // lowercase characters in string

    preserve
    contract v1 v
    gen quote = char(34) // compound double quotes
    gen var_label = "la var " + "`multiple'" + v1 + " " + quote + v + quote
    keep var_label
    save "`multiple'_label", replace
    restore

    drop num v `multiple'
    gen `multiple' = 1
    reshape wide `multiple', i(id) j(v1) string
	
    foreach v of varlist `multiple'* {
        replace `v' = 0 if missing(`v')
    }
	
    sort id
    save "`multiple'", replace
    use "`tempfilename'", clear
}

cd

local getuse use
foreach v in `varlist'  {
    `getuse' `v'_label
    local getuse append using
    erase "`v'_label.dta"
}
save "label_all", replace

count
global N = `r(N)'

forval i = 1/$N {
    local text`i' = var_label[`i'] // add variable labels
}

erase "label_all.dta"

use "`tempfilename'", clear
sort id

foreach v in `varlist'  {
    merge 1:1 id using "`v'"
    drop _merge
    rename `v' q`v'
    order q`v' `v'*
    erase "`v'.dta"
}

forval i = 1/$N {
    `text`i'' // label (new) binary variables
}

save "`filename'_split", replace // the final dataset contains (new) binary variables
end
