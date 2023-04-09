program multires
version 15.1
syntax varlist(min = 1 string) [if] [in] [, DIRectory(string) FILEname(string) PARSing(string)]

local s directory filename parsing  
local j = 0

foreach l of local s {
local ++j
if "``l''" == "" {
di as err "error 40`j': missing `l'"
exit 40`j'
}
}
		
cd "`directory'"

if strpos("`parsing'", ",") > 0 {
save `filename'_b, replace
local parsing = "//"
foreach multiple in `varlist' {
replace `multiple' = subinstr(`multiple', ",", "//", .) 
}
save `filename', replace
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
gen label = "la var " + "`multiple'" + v1 + " " + quote + v + quote 
keep label
save `multiple'_label, replace 
restore

drop num v `multiple'
gen `multiple' = 1
reshape wide `multiple', i(id) j(v1) string
foreach v of varlist `multiple'* {
replace `v' = 0 if `v' == . 
}
sort id 
save `multiple', replace
use `filename', clear
}

local getuse use
foreach v in `varlist'  {
`getuse' `v'_label
local getuse append using
erase `v'_label.dta 
}
save label, replace 

count
global N = `r(N)'

forval i = 1/$N {
local text`i' = label[`i']
}

erase label.dta

use `filename', clear
sort id

foreach v in `varlist'  {
merge 1:1 id using `v' 
drop _merge
rename `v' q`v'
order q`v' `v'* 
erase `v'.dta
}

forval i = 1/$N {
`text`i'' // label (new) binary variables
}

save `filename'_m, replace // final dataset contains (new) binary variables
end
