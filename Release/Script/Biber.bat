pushd %~dp0 
cd ..

call clean

xelatex main.tex > compile.1.log

biber main  	 >  compile.bib.log

xelatex main.tex 	> compile.2.log
xelatex main.tex	> compile.3.log

call clean

start main.pdf






