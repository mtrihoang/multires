# Dealing with composite string variables

## Introduction

The command **``multires``** allows to split composite string variables to binary variables. 
For example, in a survey on e-Cigarettes, participants were asked about which types of e-Cigarettes they prefer. The variable ``c10`` (see the dataset ``e-cigarette.dta`` and attached ``image``) contains respondents' preferred e-Cigarettes under composite strings. Each composite string includes single texts, separated by a parsing character ``//``. To facilitate data analysis, it is necessary to split the composite string variable into binary variables, corresponding to e-Cigarettes.

![image](https://user-images.githubusercontent.com/60907709/116918335-11260e80-ac50-11eb-9bf3-49606cd904a6.png "image")


## Usage
``syntax varlist(min = 1 string) [if] [in] [, DIRectory(string) FILEname(string) SYMbol(string)]`` in which:
1. ``directory`` (or ``dir``): save outputs in a certain folder.
2. ``filename`` (or ``file``): original data file.
3. ``symbol`` (or ``sym``): parsing character which seperates single options.

``Important:`` 
1. You have to create the **``id``** variable in your dataset.
2. You need to open your dataset before running the dofile.

## Example
``use "D:\multi-response-master\study.dta", clear`` <br/>
``multires c1 c2, dir("D:\multi-response-master") file(study) pars("/")``


