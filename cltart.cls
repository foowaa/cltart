%---------------------------------------------------------------------------%
%-                                                                         -%
%-                           Document Class                                -%
%-                                                                         -%
%---------------------------------------------------------------------------%
%- Copyright (C) Chunlin Tian <tianchunlin123@gmail.com> 
%- This is free software: you can redistribute it and/or modify it
%- under the terms of the GNU General Public License as published by
%- the Free Software Foundation, either version 3 of the License, or
%- (at your option) any later versions.
%---------------------------------------------------------------------------%
%->> Identification
%---------------------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{cltart}[2018/05/01 v1.0 LaTeX document class]%

%---------------------------------------------------------------------------%
%->> Declare options
%---------------------------------------------------------------------------%
%-
%-> Citation and reference style
%-
\newif\iftarticle@numbers \tarticle@numberstrue
\newif\iftarticle@super \tarticle@superfalse
\newif\iftarticle@authoryear \tarticle@authoryearfalse

\DeclareOption{numbers}{%
    \tarticle@numberstrue
    \tarticle@superfalse
    \tarticle@authoryearfalse
}
\DeclareOption{super}{%
    \tarticle@numberstrue
    \tarticle@supertrue
    \tarticle@authoryearfalse
}
\DeclareOption{authoryear}{%
    \tarticle@numbersfalse
    \tarticle@superfalse
    \tarticle@authoryeartrue
}
\newif\iftarticle@bibieee \tarticle@bibieeefalse
\DeclareOption{bibieee}{%
     \tarticle@bibieeetrue
}
%-
%-> Header and footer
%-
\newif\iftarticle@myhdrone \tarticle@myhdronefalse
\newif\iftarticle@myhdrtwo \tarticle@myhdrtwofalse
\newif\iftarticle@myhdrthree \tarticle@myhdrthreefalse
\newif\iftarticle@myhdrfour \tarticle@myhdrfourfalse
\newif\iftarticle@myhdrfive \tarticle@myhdrfivefalse


\DeclareOption{myhdrone}{%
    \tarticle@myhdronetrue
    \tarticle@myhdrtwofalse
    \tarticle@myhdrthreefalse
    \tarticle@myhdrfourfalse
    \tarticle@myhdrfivefalse
}
\DeclareOption{myhdrtwo}{%
    \tarticle@myhdronefalse
    \tarticle@myhdrtwotrue
    \tarticle@myhdrthreefalse
    \tarticle@myhdrfourfalse
    \tarticle@myhdrfivefalse
}
\DeclareOption{myhdrthree}{%
    \tarticle@myhdronefalse
    \tarticle@myhdrtwofalse
    \tarticle@myhdrthreetrue
    \tarticle@myhdrfourfalse
    \tarticle@myhdrfivefalse
}
\DeclareOption{myhdrfour}{%
    \tarticle@myhdronefalse
    \tarticle@myhdrtwofalse
    \tarticle@myhdrthreefalse
    \tarticle@myhdrfourtrue
    \tarticle@myhdrfivefalse
}
\DeclareOption{myhdrfive}{%
    \tarticle@myhdronefalse
    \tarticle@myhdrtwofalse
    \tarticle@myhdrthreefalse
    \tarticle@myhdrfourfalse
    \tarticle@myhdrfivetrue
}
%-
%-> Color support
%-
\newif\iftarticle@color \tarticle@colorfalse
\DeclareOption{color}{%
    \tarticle@colortrue
}
%-
%-> figure support
%-
\newif\iftarticle@figure \tarticle@figurefalse
\DeclareOption{figure}{%
    \tarticle@figuretrue
}
%-
%-> Complex diagrams support
%-
\newif\iftarticle@tikz \tarticle@tikzfalse
\DeclareOption{tikz}{%
    \tarticle@colortrue
    \tarticle@tikztrue
}
%-
%-> Complex tables support
%-
\newif\iftarticle@table \tarticle@tablefalse
\DeclareOption{table}{%
    \tarticle@tabletrue
}
%-
%-> Enhanced list
%-
\newif\iftarticle@list \tarticle@listfalse
\DeclareOption{list}{%
    \tarticle@colortrue
    \tarticle@listtrue
}
%-
%-> Extra math support
%-
\newif\iftarticle@math \tarticle@mathfalse
\DeclareOption{math}{%
    \tarticle@mathtrue
}
%-
%-> hyper link support
%-
\newif\iftarticle@nohref \tarticle@nohreffalse
\DeclareOption{nohref}{%
    \tarticle@nohreftrue
}
%-
%-> special chars
%-
\newif\iftarticle@chars \tarticle@charsfalse
\DeclareOption{chars}{%
    \tarticle@charstrue
}
%-
%-> syntax only
%-
\newif\iftarticle@syntaxonly \tarticle@syntaxonlyfalse
\DeclareOption{syntaxonly}{%
    \tarticle@syntaxonlytrue
}
%-
%-> Handle non-implemented options
%-
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{ctexart}%
}
%-
%-> Terminates all options processing
%-
\ProcessOptions\relax%
%---------------------------------------------------------------------------%

%---------------------------------------------------------------------------%
%->> Process options
%---------------------------------------------------------------------------%
%-
%-> font family
%-     
\LoadClass[UTF8,a4paper,oneside,zihao=-4]{ctexart}
\RequirePackage{fontspec}
\setCJKmainfont[AutoFakeBold,AutoFakeSlant]{SimSun}%
\setCJKsansfont[AutoFakeBold]{SimHei}%
\setCJKmonofont{KaiTi}%
\xeCJKsetup{CJKmath=true}
\setCJKmathfont{KaiTi}  % 数学环境中使用楷体
\setmainfont{Times New Roman}
%-
%-> Math packages
%-
\iftarticle@math% extra math packages
    \RequirePackage{amsmath}% math packages
    \RequirePackage{mathdots} % 数学省略号，会重定义 dddot 和 ddddot
    \RequirePackage{amsmath}  
    \RequirePackage{amssymb}
    \RequirePackage{mathrsfs} % 线性代数字体
    \RequirePackage{yhmath} % \wideparen命令：弧AB
    \RequirePackage{mathtools} % dcases环境，prescript命令
    \RequirePackage{amsthm} % 定理环境
    \theoremstyle{definition}\newtheorem{laws}{Law}[section]
    \theoremstyle{plain}\newtheorem{ju}[laws]{Jury}
    \theoremstyle{remark}\newtheorem*{marg}{Margaret}
    \RequirePackage{esint} % 多重积分，需放在amsmath后
    % 箭头与长等号
    \RequirePackage{extarrows}
\fi
%-
%-> Citations
%-
\iftarticle@numbers% enable numbered citation style
    \iftarticle@super% enable superscripted citation style
        \RequirePackage[square,comma,super,sort&compress]{natbib}% superscripted square bracket
    \else
        \RequirePackage[square,comma,numbers,sort&compress]{natbib}% square bracket
    \fi
    \iftarticle@bibieee
        \bibliographystyle{bib/IEEEbib}% numbered scheme
    \else
         \bibliographystyle{bib/gbt7714-unsrt}% numbered scheme
    \fi
\fi
\iftarticle@authoryear% enable author year citation style
    \RequirePackage{natbib}% author year citation mode
    \iftarticle@bibieee
          \bibliographystyle{bib/IEEEbib}% numbered scheme
    \else
          \bibliographystyle{bib/gbt7714-plain}% author year scheme
    \fi
\fi

\setlength{\bibsep}{0.0ex plus 0.2ex minus 0.2ex}% set distance between entries
\renewcommand*{\bibfont}{\small}% set font size for bibliography


\providecommand*{\citens}[2][]{% text embedded \citep in superscripted mode
    \begingroup%
        \let\NAT@mbox=\mbox%
        \let\@cite\NAT@citenum%
        \let\NAT@space\NAT@spacechar%
        \let\NAT@super@kern\relax%
        \renewcommand\NAT@open{[}%
        \renewcommand\NAT@close{]}%
        \citep[#1]{#2}%
    \endgroup%
}

%-
%-> Figure environment support
%-

\iftarticle@figure
    \RequirePackage{graphicx}% packages for including graphics
    \RequirePackage{caption}
    \setlength{\abovecaptionskip}{6pt}
    \setlength{\belowcaptionskip}{0pt}
    \captionsetup{font={footnotesize,bf}}
    \RequirePackage[font={footnotesize,bf}]{subcaption}% package for subfigures
    \RequirePackage[list=off]{bicaption}% package for binary captions
    \captionsetup[figure][bi-first]{format=hang,hangindent=-0.5em}%
    \captionsetup[figure][bi-second]{format=hang,hangindent=-2em,name=Figure}%
    \captionsetup[table][bi-first]{format=hang,hangindent=-0.5em}%
    \captionsetup[table][bi-second]{format=hang,hangindent=-2em,name=Table}%
    \RequirePackage[section]{placeins}% prevent floats from being moved over section
    \RequirePackage{overpic} %图上标记
    \RequirePackage{float} %禁止浮动
\else
    \RequirePackage{graphicx}% packages for including graphics
    \RequirePackage{caption}
    \setlength{\abovecaptionskip}{6pt}
    \setlength{\belowcaptionskip}{0pt}
    \captionsetup{font={footnotesize,bf}}
\fi
%-
%-
\RequirePackage{geometry}% page layout
%-
%-> Color
%-
\iftarticle@color% enable color package to use color
    %\RequirePackage{color}%
    \RequirePackage[usenames,dvipsnames,table]{xcolor}%
\fi
%-
%-> Draw graphics directly with TeX commands
%-
\iftarticle@tikz%
    \RequirePackage{tikz}% automatically load pgf package
    \usetikzlibrary{% load libraries
        positioning,
        arrows,
        calc,
        trees
    }%
\fi
%-
%-> Complex tables
%-
\iftarticle@table%
    \RequirePackage{ctable}% imports the array, tabularx and booktabs packages
    \RequirePackage{longtable} %长表格
    \RequirePackage{multirow} %通行表格
    \RequirePackage{array}
    \RequirePackage{booktabs} %三线表
\fi
%-
%-> List structures
%-
\iftarticle@list% enable enhanced list and verbatim structures
    \RequirePackage{verbatim}% improve verbatim environment
    \RequirePackage{etoolbox}
    \preto{\@verbatim}{\topsep=0pt \partopsep=0pt }
    \patchcmd{\@verbatim}
     {\verbatim@font}
     {\verbatim@font\small}
     {}{}
    \RequirePackage{enumitem}% configure the enumerate environment
    \setlist[enumerate]{wide=\parindent}% only indent the first line
    \setlist[itemize]{wide=\parindent}% only indent the first line
    \setlist{nosep}% default text spacing
    \RequirePackage{listings}% source code
    \lstset{extendedchars=false}
    \RequirePackage{algpseudocode,algorithm,algorithmicx}% algorithm
    \RequirePackage{tcolorbox}
\fi
%-
%-> Links support
%-
\iftarticle@nohref

\else
    \RequirePackage{hyperref}%
        \hypersetup{% set hyperlinks
            %bookmarks=true,% show bookmarks bar
            pdfencoding=auto,% allows non-Latin based languages in bookmarks
            %pdftitle={},% title
            %pdfauthor={},% author
            %pdfsubject={},% subject
            %pdftoolbar=true,% show toolbar
            %pdfmenubar=true,% show menu
            pdffitwindow=false,% window fit to page when opened
            pdfstartview={FitH},% fits the width of the page to the window
            %pdfnewwindow=true,% links in new window
            %backref=true,% do bibliographical back references
            %pagebackref=true,% backreference by page number
            colorlinks=true,% false: boxed links; true: colored links
            linkcolor=black,% color of internal links
            citecolor=blue,% color of links to bibliography
            %filecolor=magenta,% color of file links
            urlcolor=red,% color of external links
            bookmarksnumbered=true,% put section numbers in bookmarks
            %hidelinks% remove link color and border
        }
    \RequirePackage{url} %url
\fi

%-
%-> include special chars packages
%-
\iftarticle@chars
    \RequirePackage{textcomp} 
    \RequirePackage{pifont} 
    \RequirePackage[misc,clock,geometry,weather,electronic]{ifsym} 
\fi
%-
%-> Page layout and spacing
%-
\iftarticle@syntaxonly% enable geometry to redefine page layout
    \RequirePackage{syntonly}% page layout
    \syntaxonly
\fi

%---------------------------------------------------------------------------%
%-
%-> Page header and footer Style
%-
\iftarticle@myhdrone% user defined header and footer style
    \RequirePackage{fancyhdr}
    \pagestyle{fancy}
    \fancyhf{}
    \lhead{\footnotesize \tarticle@value@headings}
    \rhead{\footnotesize \thepage}
    \chead{} \lfoot{} \cfoot{} \rfoot{}
\else
    \iftarticle@myhdrtwo% user defined header and footer style
        \RequirePackage{fancyhdr}
        \pagestyle{fancy}
        \fancyhf{}
        \lhead{} \rhead{}
        \chead{\footnotesize \tarticle@value@headings} \lfoot{} \rfoot{}
        \cfoot{\footnotesize \thepage} 
    \else
        \iftarticle@myhdrthree
            \RequirePackage{fancyhdr}
            \pagestyle{fancy}
            \fancyhf{}
            \lhead{\footnotesize \rightmark}
            \rhead{\footnotesize \thepage}
            \chead{} \lfoot{} \cfoot{} \rfoot{}
        \else
            \iftarticle@myhdrfour
                \RequirePackage{fancyhdr}
                \pagestyle{fancy}
                \fancyhf{}
                \fancyhf{}
                \lhead{} \rhead{}
                \chead{\footnotesize \rightmark} \lfoot{} \rfoot{}
                \cfoot{\footnotesize \thepage} 
            \else
                \iftarticle@myhdrfive
                    \pagestyle{empty}
                \else
                     \renewcommand\thepage{{\footnotesize \arabic{page}}}
                     \pagestyle{plain}
                \fi
            \fi
        \fi
    \fi
\fi

%---------------------------------------------------------------------------%
%-
%-> Lstings settings
%-
\iftarticle@list% enable enhanced list
    \lstset{%
        %basicstyle=\linespread{0.8},
        numberbychapter=false,% numbered sequentially or by chapter
        backgroundcolor=\color{white},% background color;
        basicstyle=\linespread{0.8}\small\ttfamily,% font size for code
        breakatwhitespace=false,% sets if automatic breaks should only happen at whitespace
        breaklines=true,% sets automatic line breaking
        captionpos=b,% caption-position to bottom
        commentstyle=\color{green!50!black},% comment style
        columns=fullflexible,  % Avoid too sparse word spaces
        %deletekeywords={...},% delete keywords from the given language
        frame=single,% adds a frame around the code
        keepspaces=true,% keeps spaces in text for keeping indentation of code
        keywordstyle=\color{blue},% keyword style
        %otherkeywords={*,...},% add more keywords to the set
        numbers=left,% where to put the line-numbers; possible values are (none, left, right)
        numbersep=5pt,% how far the line-numbers are from the code
        numberstyle=\tiny\color{red!75!black},% the style that is used for the line-numbers
        rulecolor=\color{black},% if not set, the frame-color may be changed on line-breaks
        showspaces=false,% show spaces everywhere adding particular underscores;
        showstringspaces=false,% underline spaces within strings only
        showtabs=false,% show tabs within strings adding particular underscores
        stepnumber=2,% the step between two line-numbers. If it's 1, each line will be numbered
        stringstyle=\color{mymauve},% string literal style
        tabsize=2,% sets default tabsize to 2 spaces
        title=\lstname% show the filename of files
    }
\newtcbox{\boxone}[1][green]{on line,before upper=\ttfamily,
  arc=0pt,outer arc=0pt,colback=#1!10!white,colframe=#1!50!black,
  boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt,
  boxrule=0pt,bottomrule=1pt,toprule=1pt}
\newtcbox{\boxtwo}[1][violet!70!cyan]{on line,before upper=\ttfamily,
  arc=0pt,outer arc=0pt,colback=#1!10!white,colframe=#1!50!black,
  boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt,
  boxrule=0pt,bottomrule=1pt,toprule=1pt}
% pkg
\newtcbox{\boxthree}[1][orange!70!red]{on line,before upper={\rule[-0.2ex]{0pt}{1ex}\ttfamily},
  arc=0.8ex,colback=#1!30!white,colframe=#1!50!black,
  boxsep=0pt,left=1.5pt,right=1.5pt,top=1pt,bottom=1pt,
  boxrule=1pt}
\fi
%---------------------------------------------------------------------------%
%->> Layout
%---------------------------------------------------------------------------%
\RequirePackage{indentfirst} %去除LaTex默认的section首不空格
\setlength{\parindent}{2em}
\RequirePackage[normalem]{ulem}% 下划线宏包
%- part one -- horizontal widths
%- left side width + textwidth + right side width = paperwidth
%- binding side width + textwidth + nonbinding side width = paperwidth
%- binding side width of [odd, even] page = [left, right] side width
%- left side width of [odd, even] page = 1.0in (fixed) + hoffset + [odd, even]sidemargin
%- assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{146.6mm}% set required text width first
\setlength{\hoffset}{0mm}% set horizontal offset
\setlength{\oddsidemargin}{6.3mm}% left side margin
\setlength{\evensidemargin}{6.3mm}% ensure uniform left side width for EThesis
\setlength{\marginparwidth}{35pt}% width of margin notes
\setlength{\marginparsep}{10pt}% width of space between body text and margin notes
%- part two -- vertical heights
%- top height + textheight + bottom height = paperheight
%- top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep 
\setlength{\textheight}{246.2mm}% set required text height first
\setlength{\voffset}{-17.4mm}% set vertical offset
\setlength{\topmargin}{20pt}% vertical margin above header
\setlength{\headheight}{12pt}% header height
\setlength{\headsep}{17.5pt}% vertical margin between header and body text
\setlength{\footskip}{29.5pt}% vertical margin between footer and body text
%- specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%- line spacing
%\linespread{1.5}% line space setting
\RequirePackage{setspace} %设置行间距
\onehalfspacing
\raggedbottom% prevent adding vertical white space in strange places
%
%- default pagestyle is page number at bottom without headers and footers
%-
%-
\renewcommand{\textfraction}{0.15}%页面中必须用来排放文本的最小比例。缺省值为 0.2，即一页中浮动对象所占的比例不得超过 80%。
\renewcommand{\topfraction}{0.85}%页面顶部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.7，即放置在页顶部的浮动对象所占 的高度不得超过整个页面高度 70%。同样地，如果多个 使用了选项 t 的浮动对象的高度和超过了 整个页面高度的 60%，即使它们的数目没有超过  topnumber 的值，仍将一个也不会被放置 在页面顶部。
\renewcommand{\bottomfraction}{0.65}%页面底部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.3，这使得如果浮动对象的高度 不超过整个页面高度的 40%，可以允许放置在页面底部。
\renewcommand{\floatpagefraction}{0.60}%浮动页中必须由浮动对象占用的最小比例。因此 在一浮动页中空白所占的比例不会超过 1 - \floatpagefraction。 缺省值为 0.5。
%---------------------------------------------------------------------------%
%->> Structure elements configuration
%---------------------------------------------------------------------------%
%- section
\ctexset {
    section = {
        format = \linespread{1.0}\zihao{-4}\sffamily \raggedright,
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    }
}
%- subsection
\ctexset {
    subsection = {
        format = \linespread{1.0}\zihao{-4} \sffamily\raggedright,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%- subsubsection
\ctexset {
    subsubsection = {
        format = \linespread{1.0}\zihao{-4}\sffamily\raggedright,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%---------------------------------------------------------------------------%
%->> New environments
%---------------------------------------------------------------------------%
%- define chinese keywords
\newcommand{\clttitle}[1]{%
               \begin{center}\zihao{3}\textbf{\sffamily #1}\end{center}}
\newcommand{\cltinfo}[1]{%
               \begin{center}\zihao{5}\textbf{\sffamily #1}\end{center}}  
\newcommand{\cltheading}[1]{%
               \def\tarticle@value@headings {#1}}  
\RequirePackage{pgffor}              
\newcommand{\smallblank}[1]{%
               \foreach \n in {1,...,#1}{\hspace{0.33em}}}
\newcommand{\bigblank}[1]{%
               \hspace{#1em}}
\newcommand{\nextline}[1]{%
               \foreach \n in {1,...,#1}{\newline}}
\newcommand{\nextlineindent}[1]{%
               \foreach \n in {1,...,#1}{\newline \indent}}  
\newcommand{\blankline}[1]{%
               \foreach \n in {1,...,#1}{\mbox{}}}            
\newcommand{\blankpage}[1]{%
               \foreach \n in {1,...,#1}{\vfill \clearpage \mbox{} \clearpage}}
\newcommand{\nextpage}{%
               \vfill \clearpage}
\newcommand{\nofake}{
	\setCJKmainfont[BoldFont=SimHei,ItalicFont=KaiTi]{SimSun}%
    \setCJKsansfont{SimHei}%
    \setCJKmonofont{KaiTi}%
    \xeCJKsetup{CJKmath=true}
    \setCJKmathfont{KaiTi}  % 数学环境中使用楷体
    \setmainfont{Times New Roman}
}
% famousquote
\newenvironment{famousquote}[2]
    {\newcommand\Qauthor{#1}\newcommand\Qref{#2}}
    {\medskip\begin{flushright}\small ——~\Qauthor\\
    \emph{\Qref}\end{flushright}}
