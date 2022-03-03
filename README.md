# Dealing with composite string variables

## Introduction

Command **``multires``** allows to split composite string variables to binary variables. 
For example, in a survey on programming languages, participants were asked about which programming languages they prefer. The variable ``c1`` (see data ``study.dta`` and attached ``image``) contains respondents' preferred software under composite strings. Each composite string includes single texts, separated by a parsing character ``/``. To facilitate data analysis, it is necessary to split the composite string variable into binary variables, corresponding to software.

![image](https://user-images.githubusercontent.com/60907709/156554106-322f1ec6-5fa3-4d8d-9aae-ecb1056d7f94.png)


## Usage
``syntax varlist(min = 1 string) [if] [in] [, DIRectory(string) FILEname(string) PARSing(string)]`` in which:
1. ``directory`` (or ``dir``): save outputs in a certain folder.
2. ``filename`` (or ``file``): original dataset.
3. ``parsing`` (or ``pars``): parsing character which seperates single options.

``Important:``
1. You have to create the **``id``** variable in your dataset.
2. You need to open your dataset before running the dofile.
3. If comma ``,`` is a parsing character then command **``multires``** will change it into ``//`` and generate a backup dataset.  

## Example
``use "D:\multi-response-master\study.dta", clear`` <br/>
``multires c1 c2, dir("D:\multi-response-master") file(study) pars(/)``
