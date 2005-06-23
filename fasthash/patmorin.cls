%
% This is my article class based on the latex article class
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{patmorin} 
		[2001/11/12 v0.1a
 Pat Morin's article class]

% Get rid of some article.cls options
\DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption{titlepage}{\OptionNotUsed}
\DeclareOption{onecolumn}{\OptionNotUsed}

% Use option ccfonts for concrete math fonts
\newif\if@ccfonts
\@ccfontsfalse
\DeclareOption{ccfonts}{\@ccfontstrue}

% Use option ccfonts for concrete math fonts
\newif\if@charterfonts
\@charterfontsfalse
\DeclareOption{charterfonts}{\@charterfontstrue}

% Use option lotsofwhite for lots of whitespace
\newif\if@lotsofwhite
\@lotsofwhitefalse
\DeclareOption{lotsofwhite}{\@lotsofwhitetrue}

% The default action is to pass options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Process the options
\ProcessOptions

% Read the article class
\LoadClass{article}

% Changes the fonts and get the blackboard bold font
\usepackage{bbold}
\if@ccfonts
	\usepackage{concmath}
	\usepackage{euler}
\fi
\if@charterfonts
	\usepackage{charter}
\fi

% Process whitespace option
\if@lotsofwhite
	\setlength{\parskip}{.5cm}
	\setlength{\parindent}{1.25cm}
\fi

% Page setup
\setlength{\oddsidemargin}{-0.125in}
\setlength{\evensidemargin}{-0.125in}
\setlength{\textwidth}{6.5in}
\setlength{\topmargin}{-1in}
\setlength{\headheight}{.3in}
\setlength{\headsep}{.3in}
\setlength{\textheight}{9.5in}


\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}


\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\newcommand{\patcomment}[1]{}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\large \@title \par}%
    \vskip 1.5em%
    {
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}


%\renewcommand{\maketitle}
%{
%\begin{center}
%{\large\MakeUppercase{\@title}} \\[1cm]
%\@author \\[.5cm]
%\today
%\end{center}
%}

\renewenvironment{abstract}
{\noindent\textsc{Abstract.}}{} 
