SHELL=/bin/sh

#**********************************************************************************

#BibTeX 处理参考文献，则启用下面语句
#bibProgram := ./Script/BibTeX.sh 

#Biber 处理参考文献，则启用下面语句
#bibProgram := ./Script/Biber.sh  

bibProgram := ./Script/BibTeX.sh 
cleanProgram := ./Script/Clean.sh 

#源码位置
#源码存在于多个位置时，以空格隔开即可
#sourceDir := 目录1 目录2
sourceDir := ./chapter

#源码文件
sourceFiles := $(foreach texDir, $(sourceDir), $(wildcard $(texDir)/*.tex))

#**********************************************************************************

EXEC := main.pdf

#终极目标
$(EXEC): main.tex $(sourceFiles)
	$(bibProgram) 

#伪目标
.PHONY: clean

#清理编译产生的中间文件
clean:
	$(cleanProgram)
	
