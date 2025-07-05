% mytemplate.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mytemplate}[2023/07/03 Custom Template]
\LoadClass{easybook} % 基于easybook文档类
\RequirePackage{ragged2e} % 添加两端对齐支持
\setCJKmainfont{SimSun}% 中文字体，数字使用比例字体
\setmainfont{Times New Roman} % 西文和数字使用Times New Roman
% 正文基本设置
\RequirePackage{indentfirst} % 首行缩进支持
\AtBeginDocument{%
  \fontsize{12}{18}\selectfont % 正文12pt字号，18pt行距（1.5倍）
  \setlength{\parindent}{0.74cm} % 首行缩进0.74cm
  \setlength{\parskip}{0pt} % 段落间距为0
  \justifying % 两端对齐
  \frenchspacing % 标准间距设置
}

% 三号标题命令
\newcommand{\mytitle}[1]{%
  \par\vspace{13pt}% 段前13磅
  \begin{center}
  \fontsize{18}{18}\selectfont% 三号字体
  \bfseries\sffamily% 加粗，等线字体
  \setCJKfamilyfont{zhsans}{等线}[BoldFont=等线 Bold]
  \fontspec[BoldFont=Arial Bold]{Arial}% 西文等线字体加粗
  \CJKfamily{zhsans}% 中文等线字体
  \bfseries% 确保中西文均加粗
  #1%
  \end{center}
  \par\vspace{13pt}% 段后13磅
  \nopagebreak[4]% 段中不分页
}



% 设置页边距
\RequirePackage{geometry}
\geometry{top=3.34cm, % 图片距顶端1.5cm + 图片高度1.84cm = 3.34cm
          bottom=3.5cm, % 页脚距离底端1.75cm + 页脚空间1.75cm = 3.5cm
          left=3.18cm,
          right=3.18cm,
          headheight=1.84cm, % 页眉高度（图片高度）
          headsep=0.5cm, % 页眉与正文间距
          footskip=1.75cm} % 页脚高度

% 插入图片支持
\RequirePackage{graphicx}

% 页眉页脚设置
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}

% 设置页眉
\fancypagestyle{plain}{%
  \fancyhf{} % 清除所有页眉页脚
  \fancyhead[C]{\raisebox{0pt}[1.84cm][0pt]{\includegraphics[height=1.84cm, width=3.7cm]{pic/test.png}}}
  \ebhdrset{headrule = \markrule(Black){0.7pt}}
  \fancyfoot[C]{\fontsize{9}{11}\selectfont\sffamily\rmfamily \thepage} % 页码正常显示在页脚
} % 图片顶部对齐页眉顶部
\pagestyle{plain}


% 确保页眉位置正确
\patchcmd{\chapter}{\thispagestyle{chapter}}{\thispagestyle{plain}}{}{}
\patchcmd{\part}{\thispagestyle{chapter}}{\thispagestyle{plain}}{}{}

% 设置页眉顶端距离
\setlength{\voffset}{0cm}

\newcommand{\myabstract}[1]{%
  \par\vspace{13pt}%
  \fontsize{14}{14}\selectfont% 14pt字体，1.5倍行距(21bp)
  \setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}% 使用SimSun
  \CJKfamily{zhsong}%
  \noindent\bfseries 摘要\normalfont% 只有"摘要"加粗
  \par\vspace{13pt}%
  \fontsize{12}{12}\selectfont% 12pt字体，1.5倍行距(18bp)
  \setCJKfamilyfont{zhsong}{SimSun}% 正文宋体
  \setmainfont{Times New Roman}% 西文和数字Times New Roman
  \CJKfamily{zhsong}%
  \setlength{\parindent}{0.74cm}% 左缩进0.74cm
  \justifying% 两端对齐
  #1%

  \par\nopagebreak[4]%
}
\newcounter{mypart}
\renewcommand{\themypart}{\chinese{mypart}}
\newcommand{\my@part}[1]{%
    \refstepcounter{mypart}%
    \refstepcounter{section}%
    \par\vspace{1.5\baselineskip}%
    \setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}
    \CJKfamily{zhsong}%
    {\noindent\fontsize{14}{14}\selectfont\bfseries 第\themypart 部分\quad}%
    {\fontsize{12}{12}\selectfont\bfseries #1\par}%
    \addcontentsline{toc}{part}{第\themypart 部分 #1}%
    \vspace{0.5\baselineskip}%
}

\newcommand{\mypart}[1]{\my@part{#1}}

% 自定义subsection命令，保持与标准subsection相同
\newcommand{\mysubsection}[1]{%
  \refstepcounter{subsection}% 增加subsubsection计数器
  \par% 确保在新段落开始
  \vspace{\baselineskip}% 添加标准段前间距
  \noindent
  \fontspec{Times New Roman}\thesubsection\quad\fontspec{SimSun}#1
  \par% 结束标题段落
  \vspace{0.5\baselineskip}% 标题后间距
}

% 自定义subsubsection命令，继承标准subsubsection样式并添加缩进
\newcommand{\mysubsubsection}[1]{%
  \refstepcounter{subsubsection}% 增加subsubsection计数器
  \par% 确保在新段落开始
  \vspace{\baselineskip}% 添加标准段前间距
  \noindent\hspace{0.74cm}% 缩进0.74cm
  \fontspec{Times New Roman}\thesubsubsection\quad\fontspec{SimSun}#1
  \par% 结束标题段落
  \vspace{0.5\baselineskip}% 标题后间距
}
