{smcl}
{hline}
help for {hi:multires}
{hline}

{title:multires - Dealing with composite string variables}


{title:Syntax}
{p 8 17 2}
{cmd:multires}
{it:varlist}
[{cmd:if} {it:exp}]
[{cmd:in} {it:range}] 
{cmdab:using}{it: filename}
[{cmd:,}
{cmdab:PARS:ing(}{it:string}{cmd:)}]


{title:Description}

{p 4 4 2}
{cmd:multires} splits composite strings, separated by a parsing character, to binary variables. By default, strings are parsed on "slash slash" (//). 


{title:Remarks}

{p 4 4 2}
{cmd:multires} requires openning a dataset before running the command as key variables are main arguments.


{title:Options}

{p 4 4 2}
{cmd:parsing} specifies the parsing character used to split string variables.


{title:Examples}

{p 8 17 2}{cmd:. use study, clear}{p_end}
{p 8 17 2}{cmd:. multires c5 c6 if id <= 10 using "./study"}{p_end}

{p 8 17 2}{cmd:. use study, clear}{p_end}
{p 8 17 2}{cmd:. multires c3 c4 using "./study", pars(",")}{p_end}

{p 8 17 2}{cmd:. use study, clear}{p_end}
{p 8 17 2}{cmd:. multires c1 c2 if id <= 10 using "./study", pars("/")}{p_end}


{title:Author} 

{p 4 4 2}Tri Hoang, University of Bonn{break}
        trihoang30ec@gmail.com
