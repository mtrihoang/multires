# Dealing with composite string variables

## Introduction

The command **``multiresponse``** allows to split composite string variables to binary variables. 
For example, in a survey on e-Cigarettes, participants were asked about which types of e-Cigarettes they prefer. The variable ``c10`` (see the dataset ``e-cigarette.dta`` and attached ``image``) contains respondents' preferred e-Cigarettes under composite strings. Each composite string includes single texts, separated by a parsing character ``//``. To facilitate data analysis, it is necessary to split the composite string variable into binary variables, corresponding to e-Cigarettes.

![image](https://user-images.githubusercontent.com/60907709/115999761-4c3f9680-a5ed-11eb-8482-f5d826a609ea.png "image 1")![image](https://user-images.githubusercontent.com/60907709/115999921-3ed6dc00-a5ee-11eb-888e-e63446638777.png "image 2")

## Usage
``syntax varlist(min = 1 string) [if] [in] [, DIRectory(string) FILEname(string) SYMbol(string)]`` in which:
1. ``directory`` (or ``dir``): save outputs in a certain folder.
2. ``filename`` (or ``file``): original data file.
3. ``symbol`` (or ``sym``): parsing character which seperates single options.

``Note:`` you have to create an ``id`` variable in your dataset.

The command creates two outputs: 
(1) dofile ``label.do`` for labelling newly binary variables 
(2) an output file

## Example

``multiresponse c10, dir(D:\test) file(e_cigarette) sym(//)``



