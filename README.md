# Dealing with composite string variables

## Introduction

Command **``multires``** allows parsing composite strings.  

For example, in a survey on programming languages, participants were asked about which programming languages they prefer. Variable ``c1`` (see the attached image) contains respondents' preferred software under composite strings. Each composite string includes single texts, separated by parsing character ``/``. To facilitate data analysis, it is necessary to split the composite string variable into binary variables associated with programming languages.

![image](https://user-images.githubusercontent.com/60907709/156554106-322f1ec6-5fa3-4d8d-9aae-ecb1056d7f94.png)


## Usage
``multires varlist [if exp] [in range] using filename [, PARSing(string)]`` in which:
- ``filename``: the directory contains the original data. 
- ``parsing`` (or ``pars``): a parsing character.
- `filename_split`: the final dataset contains binary variables (generated after running the do file/ado file).

**Note:**
- If your dataset, `filename`, already included the ``id`` variable, it will be renamed ``old_id`` in the final dataset `filename_split`.
- You need to open your dataset before running the do file as the syntax always requires a list of key variables.

**Example:**
```
use study, clear
multires c3 c4 using "./study", pars(",")

use study, clear
multires c5 c6 if id <= 10 using "./study"

multires c1 c2 if id <= 10 using "./study", pars("/")
```

## Installation

```
net install multires, from(https://raw.githubusercontent.com/mtrihoang/multires/master) replace
help multires
```