% 告诉编译器这个宏包是属于LaTeX的哪个版本的
\NeedsTeXFormat{LaTeX2e}
% 描述必须以上述格式的日期开始
\ProvidesClass{NJUReport}[2023/06/18]
\LoadClass[UTF8, a4paper]{article}


\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage[UTF8]{ctex}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{CJK}
% \xeCJKsetup{underline={format = \color{black}, thickness=1pt}}
\RequirePackage{amsmath}
\RequirePackage{xcolor}
\usepackage[linesnumbered,ruled,vlined]{algorithm2e}    %引入算法包在文中可以导入算法
\bibliographystyle{plain}  %unsrt
\setmainfont{Times New Roman}

\RequirePackage{listings}
\lstset{                  %设置代码块
	basicstyle=\footnotesize\ttfamily,% 基本风格
	numbers=left,    % 行号
	numbersep=10pt,  % 行号间隔 
	tabsize=4,       % 缩进
	extendedchars=true, % 扩展符号
	backgroundcolor=\color[RGB]{245,245,244}, % 设定背景颜色
	keywordstyle=\color{blue}, % 设定关键字颜色
	numberstyle=\footnotesize\color{gray},  % 设定行号格式
	commentstyle=\it\color[RGB]{100, 200, 150}, % 设置代码注释的格式
	stringstyle=\color{red},
	breaklines=true, % 自动换行
	language=python,
	frame=leftline,  % 框架左边竖线
	xleftmargin=30pt,% 竖线左边间距
	showspaces=false,% 空格字符加下划线
	showstringspaces=false,% 字符串中的空格加下划线
	showtabs=false,  % 字符串中的tab加下划线
}

%页面设置 a4
\RequirePackage{geometry}
\geometry{
	a4paper,
	left=3.17cm,
	right=3.17cm,
	top=2.54cm,
	bottom=2.54cm,
	headsep=1.5cm,
	footskip=1.75cm
}

\newcommand{\cname}[1]{\def\@cname{#1}}
\newcommand{\cmajor}[1]{\def\@cmajor{#1}}
\newcommand{\cinstitute}[1]{\def\@cinstitute{#1}}
\newcommand{\cnum}[1]{\def\@cnum{#1}}
\newcommand{\cproject}[1]{\def\@cproject{#1}}
\newcommand{\ctime}[1]{\def\@ctime{#1}}

% 设置封面
\newcommand{\fillinblank}[2]{\underline{\makebox[#1]{#2}}}
\newcommand{\makecover}{
	\thispagestyle{empty}
	\begin{figure*}[htbp]
		\centering
		\includegraphics[height=4cm, width=13cm]{figure/nju_logo.jpg}
	\end{figure*}
	
	\vspace{20pt}
	\begin{center}
		{\heiti \zihao{1} \textbf{课程作业报告}}
	\end{center}
	\vfill
	
	\begin{center}
		{		
			\fillinblank{33em}{\zihao{3} \heiti \textbf{\@cproject}}
		}
	\end{center}
	\vfill
	
	\begin{flushleft}
		{
			\zihao{4}
			\renewcommand\arraystretch{1.5}
			\begin{tabular}{l@{\extracolsep{0.2em}}c}
				{\songti \bfseries \cover@cname}    & \fillinblank{23em}{\textbf{\@cname}}\\
				% {\songti \bfseries \cover@cmajor}     & \fillinblank{23em}{\textbf{\@cmajor}}\\
				% {\songti \bfseries \cover@cinstitute}    & \fillinblank{23em}{\textbf{\@cinstitute}}\\
				{\songti \bfseries \cover@cnum}    & 
				    \fillinblank{23em}{\textbf{\@cnum}}	
			\end{tabular}
		}
	\end{flushleft}	
	\vfill
	\begin{center}
		{
			\zihao{4}
			\textbf{\@ctime}
		}
	\end{center}
	\newpage	
}

%定制章节格式
\titleformat{\section}{\Large \bfseries}{\arabic{section} .}{1em}{}
\titlespacing{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

%定义页眉
\renewcommand{\headrule}{
	\vspace{10pt}
	\hrule width\headwidth height1.6pt \vspace{1.2pt}
	\hrule width\headwidth height0.4pt
}

\newcommand{\thisispagestyle}[3]{
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[C]{\zihao{#1}\songti #2}
	\fancyhead[LE, RO]{\zihao{#1}\songti #3}
	\fancyfoot[C]{\thepage}
	%\renewcommand{\headrulewidth}{0pt} 
	%\renewcommand{\footrulewidth}{0pt}
}

\AtEndOfClass{\input{NJUreport.cfg}}

\endinput
