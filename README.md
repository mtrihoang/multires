# Dealing with composite string variables

The command **``multiresponse``** allows to split composite string variables to binary variables. 
For example, in a survey on e-Cigarettes, participants were asked about which types of e-Cigarettes they prefer. The variable ``c14`` (see the attached file ``e-cigarette.dta`` and ``image 1``) contains respondents' preferred e-Cigarettes under composite strings. Each composite string includes single texts, separated by a sparse character ``//``. To facilitate data analysis, it is necessary to split the composite string variable into binary variables, corresponding to e-Cigarettes.

![image](https://user-images.githubusercontent.com/60907709/115999002-42686400-a5ea-11eb-8943-b325c036260c.png "image 1")

``syntax varlist(min = 1 string) [if] [in] [, DIRectory(string) FILEname(string) SYMbol(string)]``



