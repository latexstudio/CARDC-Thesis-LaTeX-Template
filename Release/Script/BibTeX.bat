pushd %~dp0 
cd ..

call clean

xelatex main.tex > compile.1.log

bibtex main > compile.bib.log
bibtex main1-blx >> compile.bib.log
bibtex main2-blx >> compile.bib.log

xelatex main.tex > compile.2.log
xelatex main.tex > compile.3.log

call clean

start main.pdf






