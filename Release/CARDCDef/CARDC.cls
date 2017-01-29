\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{CARDC}[2015/12/01 by L.Y.]

\DeclareOption{Biber}{\PassOptionsToPackage{\CurrentOption}{CARDCDef/YYBib}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

\RequirePackage{xeCJK}
\PassOptionsToPackage{CJKchecksingle}{xeCJK}

\LoadClass[cs4size,a4paper,fancyhdr,fntef,hyperref]{ctexbook}

\setmainfont{Times New Roman}

\RequirePackage{hyperref,color}
\hypersetup{linkcolor=black,citecolor=black,urlcolor=black}

\RequirePackage{CARDCDef/CARDCTitlePage}
\RequirePackage{CARDCDef/YYBib}

\RequirePackage{metalogo}

\RequirePackage{latexsym,bm}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
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

\RequirePackage[
    left        =   30mm,
    right       =   30mm,
    bottom      =   38mm,
    top         =   25mm,
    footskip    =   12mm
]{geometry}

\setlength{\parskip}{0pt}

\renewcommand{\baselinestretch}{1.25}

\newcommand{\CARDC@MasterOrDoctor}{}
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

\fancyhead[CE]{\wuhao \nouppercase \leftmark}
\fancyhead[LO]{
    \raisebox{-2.2pt}{\includegraphics[width=11pt]{pic/CARDC/cardc.png}}%
    \wuhao{\CARDC@MasterOrDoctor 士学位论文}
}
\fancyhead[RO]{\wuhao{\CARDC@ArtTitle}}

\renewcommand\frontmatter{
    \cleardoublepage
    \pagenumbering{roman}
    \fancyfoot{}
    \fancyfoot[C]{\wuhao \thepage}
}

\renewcommand\mainmatter{
    \cleardoublepage
    \pagenumbering{arabic}
    \fancyfoot{}
    \fancyfoot[C]{\wuhao \thepage}
}

\RequirePackage{titletoc}
\RequirePackage{titlesec}

\CTEXsetup[format={\centering\xiaoer},
    beforeskip={0pt},afterskip={18pt}]{chapter}

\CTEXsetup[name={\S\,,},format={\flushleft\bfseries\sanhao}]{section}

\CTEXsetup[name={\S\,,},format={\bfseries\flushleft\sihao}]{subsection}

\renewcommand{\tableofcontents}{
    \setcounter{secnumdepth}{-2}
    \chapter{目\hspace{1em}录}
    \@starttoc{toc}
    \setcounter{secnumdepth}{2}
}

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

\titlecontents{section}[1.1\ccwd]
  {\vspace{1bp} \xiaosi}
  {\S\,\thecontentslabel\hspace*{0.5em}}
  {}
  {\titlerule*[0.5pc]{$\cdot$}\contentspage}

\titlecontents{subsection}[2.5\ccwd]
  {\vspace{1bp} \xiaosi}
  {\S\,\thecontentslabel\hspace*{0.5em}}
  {}
 {\titlerule*[0.5pc]{$\cdot$}\contentspage}

\DeclareRobustCommand{\ArtKeywordsCN}[1]{
  \vspace{3.5ex}\noindent{\textbf{关键词：~}} #1
}

\DeclareRobustCommand{\ArtKeywordsEN}[1]{
  \vspace{3.5ex}\noindent{\textbf{Keywords:~}} #1}

\newenvironment{AbstractCN}{
    \setcounter{secnumdepth}{-2}
    \chapter{摘\hspace{1em}要}
}{\setcounter{secnumdepth}{2}}

\newenvironment{AbstractEN}{
    \setcounter{secnumdepth}{-2}
    \chapter{Abstract}
}{\setcounter{secnumdepth}{2}}

\renewenvironment{thanks}{
    \setcounter{secnumdepth}{-2}
    \chapter{致\hspace{1em}谢}
}
{\setcounter{secnumdepth}{2}}

\RequirePackage[labelsep=quad,justification=centering]{caption}

\captionsetup[figure]{font={bf,small}}
\captionsetup[table]{font={bf}}

\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

\endinput
