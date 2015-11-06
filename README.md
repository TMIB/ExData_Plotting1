## Introduction

This content is my work for the Coursera course "Exploratory Data Analysis", Assignment 1. 
Rather than repeat the entire assignment requirements here, this readme contains relevant notes for the assignment evaluators.

## Citation:
This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, 

The following dataset is used:
* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

## General Notes:
In a real-world scenario, it is unlikely that I would want to construct these scripts this way. A great deal of code is repeated between each script- such as that for reading in and parsing the data. Instead of repeating the same code in each script as I have done here, it is much more practical to put shared code into a single script and refer to it from the other scripts. However the assignment stated that the code to read in the data should be in each script, so I am therefore doing so as specified.

Each of the plot#.R scripts reads in the relevant dates from the data set. The whole thing could have been read in and then parsed, but for purposes of speed and convenience, I elected to merely skip the rows before the dates specified in the assignments, and then not read more rows after these dates.