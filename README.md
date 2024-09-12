# DBCDatasus

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://lego-yaw.github.io/DBCDatasus.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://lego-yaw.github.io/DBCDatasus.jl/dev/)
[![Build Status](https://github.com/lego-yaw/DBCDatasus.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/lego-yaw/DBCDatasus.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/lego-yaw/DBCDatasus.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/lego-yaw/DBCDatasus.jl)



### DBCDatasus.jl
+ A simple package for converting *.dbc* (compressed DBC) files from Datasus into *.dbf* (DBF) and *data frames* tables. 

+ DATASUS plays a critical role in ensuring the efficient operation of Brazil's public health system. DATASUS is the name of the Departement of informatics of Brazil's health system (Sistema Unico de Saúde-SUS). They are responsible for maintaining and publishing Brazilian public health data. Aside this, the Brazilian National Agency for supplementary Health data (ANS), also use the same file format for storing public health data. 

+ *Please note* that, this package only handles *.dbc*  format used by DATASUS and is not in any way related to handling Microsoft Foxpro or CANdb DBC files.

## Installation
+ Package can be installed like any other julia package  

```Julia-repl
>>> ]
>>> add DBCDatasus
```
or

```
>>> using Pkg
>>> Pkg.add("DBCDatasus")
```
# Usage 
+ DBCDatasus is simple to use 

```
# converting dbc to dbf format
>>> using DBCDatasus
>>> dbctodbc("path/to/file.dbc, path/to/file.dbf) # input file is .dbc file and output file is .dbf

# converting dbc into dataframe Table
>>> using DBCDatasus
>>> df = dbcTable("path/to/file.dbc)" # input file is .dbc file and output file is in table format
>>> head(df) 

# Example
>>> using Downloads, using DBCDatasus
>>> Downloads.download("ftp://ftp.datasus.gov.br/dissemin/publicos/SIASUS/200801_/Dados/ABOAC1909.dbc", "ABOAC1909.dbc") # this link downlaods the ABOAC1909.dbc file from Datasus database.

# run fucntion
>>> df = dbcTable("ABOAC1909.dbc") ## read into dataframe Table
>>> display(df) 

or

>>> using DBCDatasus
>>> dbctodbc("ABOAC1909.dbc", "ABOAC1909.dbf") # conversion into DBF format

```

# Format description references

* https://en.wikipedia.org/wiki/.dbf
* https://www.clicketyclick.dk/databases/xbase/format/dbf.html
* http://www.independent-software.com/dbase-dbf-dbt-file-format.html

# Contact information
+ if you have any questions or suggestions, feel free to contact at amenubright2@gmail.com

# Citation
+ This project is based on the work of https://github.com/madler/zlib/tree/master/contrib/blast and https:// github.com/eaglebh/blast-dbf and the R version developed by danicat(https://github.com/danicat/read.dbc). 
Also this package wouldn't have been possible without DBFTable (https://github.com/JuliaData/DBFTables.jl)

+ Neither this project, nor its author, is related in any way to the Brazilian government.
