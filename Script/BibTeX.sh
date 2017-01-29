#!/bin/bash

xelatex main.tex 

bibtex main 
bibtex main1-blx 
bibtex main2-blx 

xelatex main.tex 
xelatex main.tex 
