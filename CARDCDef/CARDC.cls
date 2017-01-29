\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{CARDC}[2015/12/01 by L.Y.]

%是否使用Biber处理参考文献，提供Biber选项，将该选项传递给YYBib处理
\DeclareOption{Biber}{\PassOptionsToPackage{\CurrentOption}{CARDCDef/YYBib}}

%处理其余选项
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

%Minimum xeCJK version:3.2.10, date:2014/03/01
\RequirePackage{xeCJK}
\PassOptionsToPackage{CJKchecksingle}{xeCJK}

%采用5号字体
\LoadClass[cs4size,a4paper,fancyhdr,fntef,hyperref]{ctexbook}

%设置默认英文字体
\setmainfont{Times New Roman}

%将默认的红色改为黑色
\RequirePackage{hyperref,color}
\hypersetup{linkcolor=black,citecolor=black,urlcolor=black}

%封面
\RequirePackage{CARDCDef/CARDCTitlePage}
%参考文献
\RequirePackage{CARDCDef/YYBib}

\RequirePackage{metalogo}

\RequirePackage{latexsym,bm}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%中文字号，与Office-Word对应
%-------------------------------------------------------------------
\newcommand{\chuhao}    {\fontsize{42pt}   {\baselineskip}\selectfont}
\newcommand{\xiaochu}   {\fontsize{36pt}   {\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}   {\baselineskip}\selectfont}
\newcommand{\yihao}     {\fontsize{26pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoyi}    {\fontsize{24pt}   {\baselineskip}\selectfont}
\newcommand{\erhao}     {\fontsize{22pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoer}    {\fontsize{18pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoerhao} {\fontsize{18pt}   {\baselineskip}\selectfont}
\newcommand{\sanhao}    {\fontsize{16pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosan}   {\fontsize{15pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}   {\baselineskip}\selectfont}
\newcommand{\sihao}     {\fontsize{14pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosi}    {\fontsize{12pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosihao} {\fontsize{12pt}   {\baselineskip}\selectfont}
\newcommand{\wuhao}     {\fontsize{10.5pt} {\baselineskip}\selectfont}
\newcommand{\xiaowu}    {\fontsize{9pt}    {\baselineskip}\selectfont}
\newcommand{\xiaowuhao} {\fontsize{9pt}    {\baselineskip}\selectfont}
\newcommand{\liuhao}    {\fontsize{7.5pt}  {\baselineskip}\selectfont}
\newcommand{\qihao}     {\fontsize{5.5pt}  {\baselineskip}\selectfont}
%===================================================================


%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%版面细节设置
%-------------------------------------------------------------------
%版面大小设置
\RequirePackage[
    left        =   30mm,
    right       =   30mm,
    bottom      =   38mm,
    top         =   25mm,
    footskip    =   12mm
]{geometry}

%调整段间距
\setlength{\parskip}{0pt}

%设置为1.5倍行距
\renewcommand{\baselinestretch}{1.25}
%====================================================================


%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%设置页眉页脚
%-------------------------------------------------------------------
%硕士或者博士学位论文
\newcommand{\CARDC@MasterOrDoctor}{}
%文章标题
\newcommand{\CARDC@ArtTitle}{}

\newcommand{\makeheadrule}{%
    \rule[.7\baselineskip]{\headwidth}{0.4pt}\vskip-0.97\baselineskip
}

\renewcommand{\headrule}{%
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi}%
     \makeheadrule}

\fancypagestyle{plain}{}
\pagestyle{fancy}
\fancyhf{}

%奇数页、偶数页页眉对应情形
\fancyhead[CE]{\wuhao \nouppercase \leftmark}
\fancyhead[LO]{
    \raisebox{-2.2pt}{\includegraphics[width=11pt]{pic/CARDC/cardc.png}}%
    \wuhao{\CARDC@MasterOrDoctor 士学位论文}
}
\fancyhead[RO]{\wuhao{\CARDC@ArtTitle}}

%前面部分页码为罗马数字
\renewcommand\frontmatter{
    \cleardoublepage
    \pagenumbering{roman}
    \fancyfoot{}
    \fancyfoot[C]{\wuhao \thepage}
}

%正文页码为阿拉伯数字
\renewcommand\mainmatter{
    \cleardoublepage
    \pagenumbering{arabic}
    \fancyfoot{}
    \fancyfoot[C]{\wuhao \thepage}
}
%====================================================================


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%设置章节标题格式
%--------------------------------------------------------------------
\RequirePackage{titletoc}
\RequirePackage{titlesec}

%一级标题黑体小二
\CTEXsetup[format={\centering\xiaoer},
    beforeskip={0pt},afterskip={18pt}]{chapter}

%二级标题黑体三号
\CTEXsetup[name={\S\,,},format={\flushleft\bfseries\sanhao}]{section}

%三级标题黑体四号
\CTEXsetup[name={\S\,,},format={\bfseries\flushleft\sihao}]{subsection}
%====================================================================


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%设置目录格式
%--------------------------------------------------------------------
%与章节标题一致，黑体小二
\renewcommand{\tableofcontents}{
    \setcounter{secnumdepth}{-2}
    \chapter{目\hspace{1em}录}
    \@starttoc{toc}
    \setcounter{secnumdepth}{2}
}

%正文一级标题，黑体小三
\titlecontents{chapter*}[0em]
  {\vspace{6bp}\bfseries\xiaosan}
  {\thecontentslabel\hspace*{0.5em}}
  {}
  {\titlerule*[0.5pc]{$\cdot$}\contentspage}

\titlecontents{chapter}[0em]
  {\vspace{6bp}\bfseries\xiaosan}
  {\thecontentslabel\hspace*{0.5em}}
  {}
  {\titlerule*[0.5pc]{$\cdot$}\contentspage}

%正文二级标题，小四
\titlecontents{section}[1.1\ccwd]
  {\vspace{1bp} \xiaosi}
  {\S\,\thecontentslabel\hspace*{0.5em}}
  {}
  {\titlerule*[0.5pc]{$\cdot$}\contentspage}

%正文三级标题，小四
\titlecontents{subsection}[2.5\ccwd]
  {\vspace{1bp} \xiaosi}
  {\S\,\thecontentslabel\hspace*{0.5em}}
  {}
 {\titlerule*[0.5pc]{$\cdot$}\contentspage}
%====================================================================


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%设置摘要、致谢格式
%--------------------------------------------------------------------
%中文关键字
\DeclareRobustCommand{\ArtKeywordsCN}[1]{
  \vspace{3.5ex}\noindent{\textbf{关键词：~}} #1
}

%英文关键字
\DeclareRobustCommand{\ArtKeywordsEN}[1]{
  \vspace{3.5ex}\noindent{\textbf{Keywords:~}} #1}

%中文摘要环境
\newenvironment{AbstractCN}{
    \setcounter{secnumdepth}{-2}
    \chapter{摘\hspace{1em}要}
}{\setcounter{secnumdepth}{2}}

%英文摘要环境
\newenvironment{AbstractEN}{
    \setcounter{secnumdepth}{-2}
    \chapter{Abstract}
}{\setcounter{secnumdepth}{2}}

%致谢环境
\renewenvironment{thanks}{
    \setcounter{secnumdepth}{-2}
    \chapter{致\hspace{1em}谢}
}
{\setcounter{secnumdepth}{2}}
%====================================================================


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%图、表、公式
%--------------------------------------------------------------------
%全局设置
\RequirePackage[labelsep=quad,justification=centering]{caption}

\captionsetup[figure]{font={bf,small}}
\captionsetup[table]{font={bf}}

%按章排序，用到amsmath宏包
\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
%====================================================================


\endinput
