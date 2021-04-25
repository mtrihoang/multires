# Dealing with composite string variables

The command ``multiresponse`` allows to spilit composite string variables to binary variables. 
In a survey on e-Cigarettes, participants were asked about which types of e-Cigarettes they prefer. The variable ``c14`` (see the attached file ``e-cigarette.dta``) contains respodents' preferred e-Cigarettes under composite strings. Each composite string include single texts, seperated by a sparse character ``//``. To facilitate data analysis, it is necessary to split the composite string variable into binary variables, corresponding to e-Cigarettes. 

``e_cigarette.dta'', the variable ``c14'' contains 
``syntax varlist(min = 1 string) [if] [in] [, DIRectory(string) FILEname(string) SYMbol(string)]``


![image](https://user-images.githubusercontent.com/60907709/115999002-42686400-a5ea-11eb-8943-b325c036260c.png)
