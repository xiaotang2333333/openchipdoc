% mytemplate.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mytemplate}[2023/07/03 Custom Template]
\LoadClass{easybook} % 基于easybook文档类
\RequirePackage{ragged2e} % 添加两端对齐支持
\setCJKmainfont{SimSun}
\setmainfont{Times New Roman}
% 正文基本设置
\RequirePackage{indentfirst} % 首行缩进支持
\AtBeginDocument{%
  \fontsize{12}{16}\selectfont % 正文12pt字号，16pt行距
  \setlength{\parindent}{0.74cm} % 首行缩进0.74cm
  \justifying % 两端对齐
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
\geometry{top=3.76cm, % 页眉+
          bottom=2.385cm, % 页脚+页脚距离
          left=3.18cm,
          right=3.18cm,
          footskip=1.75cm} % 页脚高度

% 插入图片支持
\RequirePackage{graphicx}

% 页眉页脚设置
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}

% 设置页眉
\fancypagestyle{plain}{%
  \fancyhf{} % 清除所有页眉页脚
  \fancyhead[C]{\raisebox{0pt}[1.84cm][0pt]{\includegraphics[height=1.84cm, width=3.7cm]{test.png}}}
  \ebhdrset{headrule = \markrule(Black){0.7pt}}
  \fancyfoot[C]{\raisebox{1.75cm}[0pt][0pt]{\fontsize{9}{11}\selectfont\sffamily\rmfamily \thepage}\\ \fontsize{9}{11}\selectfont\phantom{空行}} % 页码距离底部1.75cm，下方生成同样高度空行
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
  \subsection{#1}%
}

% 自定义subsubsection命令，继承标准subsubsection样式并添加缩进
\newcommand{\mysubsubsection}[1]{%
  \begingroup
  \setlength{\leftskip}{0.74cm}% 整体缩进0.74cm
  \subsubsection{#1}% 使用标准subsubsection样式
  \endgroup
}
