# Dealing with composite string variables

The command **``multiresponse``** allows to split composite string variables to binary variables. 
For example, in a survey on e-Cigarettes, participants were asked about which types of e-Cigarettes they prefer. The variable ``c14`` (see the attached file ``e-cigarette.dta`` and ``image 1``) contains respondents' preferred e-Cigarettes under composite strings. Each composite string includes single texts, separated by a sparse character ``//``. To facilitate data analysis, it is necessary to split the composite string variable into binary variables, corresponding to e-Cigarettes.

![image](https://user-images.githubusercontent.com/60907709/115999761-4c3f9680-a5ed-11eb-8482-f5d826a609ea.png "image 1") ![image](https://user-images.githubusercontent.com/60907709/115999841-b6f0d200-a5ed-11eb-88eb-d532a0e5944b.png "image 2")

``syntax varlist(min = 1 string) [if] [in] [, DIRectory(string) FILEname(string) SYMbol(string)]``



