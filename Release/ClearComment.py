import os

#目标路径
targetDir = "F:/WorkDocument/CARDC-Thesis-LaTeX-Template/Release/"
#目标类型
targetTypes = ['.sty', '.cls']

#文件完整路径
texFilePath = ""
#文件类型
texFileType = ""
#注释符
commentChar = '%'

def clearTexFileComment( filePath, targetFile ):
    fileObeject = open(filePath, 'r', encoding='utf-8')
    newFileObject = open(targetFile, 'w', encoding='utf-8')
    #检测连续空行
    cEmptyline = 0
    try:
        for line in fileObeject:
            line.strip()
            if line.strip().startswith(commentChar):
                #纯注释行
                continue
            else:#非纯注释行
                if line.strip() == "":
                    #空行
                    cEmptyline = cEmptyline + 1
                    if cEmptyline == 2:
                        cEmptyline = cEmptyline - 1
                        continue
                else:#非空行
                    cEmptyline = 0
                    commentCharIndex = line.find(commentChar)
                    #行后注释
                    if commentCharIndex != -1:
                        lineContent = line[:commentCharIndex]
                        newFileObject.write(lineContent+commentChar+"\n")
                        continue
            newFileObject.write(line)
    finally:
        fileObeject.close()
        newFileObject.close()
        os.remove(filePath)

for parent, dirnames, filenames in os.walk(targetDir):
    for texFileName in filenames:
        texFilePath = os.path.join(parent, texFileName)
        texFileType = os.path.splitext(texFileName)[-1]
        for targetType in targetTypes:
            if targetType == texFileType:
                texFilePathCopy = texFilePath+".backup"
                #重命名
                os.rename(texFilePath, texFilePathCopy)
                clearTexFileComment(texFilePathCopy, texFilePath)


