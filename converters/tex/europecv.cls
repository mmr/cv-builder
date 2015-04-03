% European curriculum vitae class
% Author: Nicola Vitacolonna (vitacolo@dimi.uniud.it)
% This material is subject to the LaTeX Project Public License.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{europecv}[2004/05/29 European curriculum vitae class]

% CV models and instructions:
%   http://www.cedefop.eu.int/transparency/cv.asp
% Recommendations:
%   http://europa.eu.int/scadplus/leg/en/cha/c11057.htm

% Set language
\DeclareOption{english}{\input{ecven.def}}
\DeclareOption{italian}{\input{ecvit.def}}
\DeclareOption{spanish}{\input{ecves.def}}
\DeclareOption{french}{\input{ecvfr.def}}
\DeclareOption{danish}{\input{ecvda.def}}
\DeclareOption{german}{\input{ecvde.def}}
\DeclareOption{finnish}{\input{ecvfi.def}}
\DeclareOption{portuges}{\input{ecvpt.def}}
%\DeclareOption{portuguese}{\input{ecvpt.def}}
\DeclareOption{brazil}{\input{ecvbr.def}}
\DeclareOption{swedish}{\input{ecvsv.def}}

% Set font
\DeclareOption{helvetica}{%                       
  \renewcommand{\rmdefault}{phv}
  \renewcommand{\sfdefault}{phv}
}
\DeclareOption{arial}{%                       
  \renewcommand{\rmdefault}{ma1} % (this font is NOT installed by default!)
  \renewcommand{\sfdefault}{ma1}
}
\DeclareOption{narrow}{
  \renewcommand{\seriesdefault}{mc} % Narrow
  \renewcommand{\bfdefault}{bc}  % Boldface narrow
}
% No title
\DeclareOption{notitle}{\renewcommand*\ecvtitle{}}

% Flag pictures of the EC can be found at 
%   http://europa.eu.int/abc/symbols/emblem/index_en.htm
\DeclareOption{noflag}{\renewcommand*\draweuropeflag{}}
\DeclareOption{flagWB}{%
  \providecommand*\draweuropeflag{%
    \includegraphics[width=\ecv@flagwidth]{EuropeFlagWB}}
}
\DeclareOption{flagBW}{%
  \renewcommand*\draweuropeflag{%
    \includegraphics[width=\ecv@flagwidth]{EuropeFlagBW}}
}
\DeclareOption{flagCMYK}{%
  \renewcommand*\draweuropeflag{%
    \includegraphics[width=\ecv@flagwidth]{EuropeFlagCMYK}}
}
\DeclareOption{flagBlueCMYK}{%
 \renewcommand*\draweuropeflag{%
   \includegraphics[width=\ecv@flagwidth]{EuropeFlagBlueCMYK}}
}

% Pass all other options (a4paper, 10pt, draft, openbib, etc...) to article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
} 

\ExecuteOptions{english,flagWB} % Default options

\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{fancyhdr} % For page numbering

\newcommand*{\ecvfirstname}[1]{\def\ecv@firstname{#1}}
\newcommand*{\ecvlastname}[1]{\def\ecv@lastname{#1}}
\newcommand*{\ecvaddress}[1]{\def\ecv@address{#1}}
\newcommand*{\ecvtelephone}[1]{\def\ecv@telephone{#1}}
\newcommand*{\ecvfax}[1]{\def\ecv@fax{#1}}
\newcommand*{\ecvemail}[1]{\def\ecv@email{#1}}
\newcommand*{\ecvnationality}[1]{\def\ecv@nationality{#1}}
\newcommand*{\ecvdateofbirth}[1]{\def\ecv@birth{#1}}
\newcommand*{\ecvcivilstate}[1]{\def\ecv@civilstate{#1}}

\ecvfirstname{}
\ecvlastname{}
\ecvaddress{}
\ecvtelephone{}
\ecvfax{}
\ecvemail{}
\ecvnationality{}
\ecvdateofbirth{}
\ecvcivilstate{}

\def\ecv@kern{\kern1.5pt}
\newcommand*{\ecvtitlekern}[1]{\def\ecv@kern{\kern#1}}
\newlength\ecv@rulewidth
\newlength\ecv@colsep
\newlength\ecv@leftcolwidth
\newlength\ecv@rightcolwidth
\newlength\ecv@extrarowheight
\newcommand*{\ecvRuleWidth}[1]{\setlength\ecv@rulewidth{#1}}
\newcommand*{\ecvColSep}[1]{%
  \addtolength{\ecv@leftcolwidth}{\ecv@colsep}
  \addtolength{\ecv@rightcolwidth}{\ecv@colsep}
  \setlength\ecv@colsep{#1}
  \addtolength{\ecv@leftcolwidth}{-\ecv@colsep}
  \addtolength{\ecv@rightcolwidth}{-\ecv@colsep}}
\newcommand*{\ecvLeftColumnWidth}[1]{\setlength\ecv@leftcolwidth{#1}%
             \setlength{\ecv@rightcolwidth}{\textwidth}
            \addtolength{\ecv@rightcolwidth}{-\ecv@leftcolwidth}
            \addtolength{\ecv@rightcolwidth}{-2\ecv@colsep}
            \addtolength{\ecv@rightcolwidth}{-\ecv@rulewidth}}
\newcommand*{\ecvExtraRowHeight}[1]{\setlength\ecv@extrarowheight{#1}}
\ecvRuleWidth{\arrayrulewidth}
\setlength\ecv@colsep{12pt}
\setlength\ecv@leftcolwidth{50mm}
\ecvExtraRowHeight{0pt}

% Flag size
\newlength\ecv@flagwidth
\newcommand*{\ecvFlagWidth}[1]{\setlength\ecv@flagwidth{#1}}
\ecvFlagWidth{10mm}

% Footnote or footer to be shown on every page
\newcommand\ecvfootnote[1]{%
  \rfoot{\begin{minipage}{60mm}
     \footnotesize #1%
  \end{minipage}}}

% Set layout
\pagestyle{fancy}
\lhead{}
\chead{}
\rhead{}
\lfoot{\ecvlfoot}
\cfoot{}
\rfoot{}
\renewcommand{\headrulewidth}{0pt}

% Text bullet
\newcommand{\ecvbullet}{\raisebox{.35ex}[0cm][0cm]{\tiny$\bullet$}}
                                            
\newenvironment{europecv}{%
  \ecvLeftColumnWidth{\ecv@leftcolwidth}
  \setlength\arrayrulewidth{\ecv@rulewidth}
  \setlength\extrarowheight{\ecv@extrarowheight}
  \setlength\LTleft{0pt}
  \setlength\LTright{0pt}
\begin{longtable}[l]{@{}>{\raggedleft}p{\ecv@leftcolwidth}@{\hspace{\ecv@colsep}}|@{\extracolsep{\ecv@colsep}}p{\ecv@rightcolwidth}@{}}
  \ifx\@empty\ecvtitle\else
    \ecvtitle\vspace{15pt} & \tabularnewline
  \fi
  \ifx\@empty\draweuropeflag\else
    \draweuropeflag\vspace{25pt} & \tabularnewline
  \fi
}
{\end{longtable}}


\newcommand{\ecvsection}[2][15pt]{%
  {\large{\par\medskip\textbf{\textsc{#2}}}}\vspace{#1} & \tabularnewline\nopagebreak
}
          
\newif\if@ecvitemstar
\newcommand\ecvitem{\@ifstar{\@ecvitemstartrue \@ecvitem}%
  {\@ecvitemstarfalse\@ecvitem}}
\newcommand\@ecvitem[3][2pt]{%
  \if@ecvitemstar \ecvbullet\ \fi #2\vspace{#1} & #3
    \vspace{#1}\tabularnewline}
  
