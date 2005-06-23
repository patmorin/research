\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{njcarticle}
              [1998/09/27 v1.1]
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
%\DeclareOption{draft}{\setlength\overfullrule{5pt}} could be allowed
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{openbib}{\@openbibtrue} % !!! consider
\ExecuteOptions{a4paper,11pt,twoside,onecolumn,final}
\DeclareOption*
    {\ClassError{njcarticle}{Option `\CurrentOption' not supported}{}}
\ProcessOptions
\LoadClass{article}

\newif\if@openbib
\@openbibfalse

\usepackage{latexsym,ifthen}
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xipt{13.6}%
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\renewcommand\small{%
   \@setfontsize\small\@xpt\@xiipt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@ixpt{11}%
   \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\renewcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\renewcommand\large{\@setfontsize\large\@xiipt{14}}
\renewcommand\Large{\@setfontsize\Large\@xivpt{18}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

\setlength\parindent{9\p@}
\setlength\headheight{12\p@}
\setlength\headsep   {25\p@}
%% \topskip not in njcarticle.sty
%%\setlength\topskip   {11\p@}
\setlength\footskip{30\p@}
\if@compatibility
  \setlength\maxdepth{4\p@}
\else
  \setlength\maxdepth{.5\topskip}
\fi
\setlength\@maxdepth\maxdepth
\setlength\textwidth{360\p@}
\setlength\textheight{208mm}
\setlength\oddsidemargin   {41.9\p@}
\setlength\evensidemargin  {46.1\p@}
\setlength\marginparwidth {100\p@}
\setlength\marginparsep{10\p@}
\setlength\marginparpush{5\p@}
\setlength\topmargin{27pt}
\setlength\footnotesep{7.7\p@}
\setlength{\skip\footins}{10\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{3\p@ \@plus 1\p@ \@minus 1\p@}

\def\@listI{\leftmargin\leftmargini
            \parsep 4.5\p@ \@plus2\p@ \@minus\p@
            \topsep 9\p@   \@plus3\p@ \@minus5\p@
            \itemsep4.5\p@ \@plus2\p@ \@minus\p@}
\def\@listInjc{\leftmargin\leftmargini
            \parsep 2\p@ \@plus2\p@ \@minus\p@
            \topsep 2\p@   \@plus2\p@ \@minus1\p@
            \itemsep2\p@ \@plus2\p@ \@minus\p@
            \partopsep0pt}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus2\p@ \@minus\p@
              \parsep    0pt \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%% end of font

\renewcommand\baselinestretch{0.95}
\renewcommand\bottomfraction{.5}
\renewcommand\textfraction{.1}
\renewcommand\floatpagefraction{.8}

%% added
\def\draft{\overfullrule 5pt}

\mark{{}{}}
\let\pagestyle\@gobble

\def\ps@njcheadings{\let\@mkboth\@gobbletwo
\def\@oddhead{\hbox{}\hfil{\scriptsize \rightmark} \hfil \rm\thepage}
\def\@oddfoot{}
\def\@evenhead{\rm \thepage\hfil{\scriptsize\leftmark}\hfil\hbox {}}
\def\@evenfoot{}\def\sectionmark##1{}\def\subsectionmark##1{}}
%Special layout of first page
\def\ps@njcfirstpage{\let\@mkboth\@gobbletwo
\def\@oddhead{\scriptsize\@njcinfo\hfill\putlogo} 
\def\@oddfoot{\scriptsize\@dates\hfill}
\let\@evenhead\@oddhead\let\@evenfoot\@oddfoot
\def\sectionmark##1{}\def\subsectionmark##1{}}  

\def\njcinfo#1{\gdef\@njcinfo{Nordic Journal of Computing\ #1}}
\njcinfo{}
\def\dates#1{\gdef\@dates{#1}}
\dates{Received \today.}

\newcommand\putlogo{\relax}
%%\newcommand\putlogo{\raisebox{-10bp}[25bp][0bp]{\special{psfile=njc2.eps}%
%%\kern97bp}}

\def\authorhead#1{\xdef\leftmark{\uppercase{#1}}}
\def\titlehead#1{\xdef\rightmark{\uppercase{#1}}}

\ps@njcheadings\pagenumbering{arabic} \onecolumn
\@twosidetrue

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \thispagestyle{njcfirstpage}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \let\thanks\relax
  \let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\Large \@title \par}%
    \vskip 1.5em%
    {\small\it
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \small\rm\@author
      \end{tabular}\par}%
  \end{center}%
  \vskip 1.5em}
\def\@part[#1]#2{\@warning{Do not use command `\string\part'.}}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\centering\reset@font\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\raggedright\reset@font\normalsize\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\raggedright\reset@font\normalsize\itshape}}
\renewcommand\paragraph{\par}
\renewcommand\subparagraph{\par}
\renewcommand\labelenumi{(\theenumi)}
\renewcommand\labelitemi{$\circ$}
\renewcommand\labelitemii{\normalfont\bfseries --}
\def\enumerate{\ifnum \@enumdepth >1 \@toodeep\else
      \advance\@enumdepth \@ne \let\@listi\@listInjc
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\def\makelabel##1{\hss\llap{##1}}}\fi}

\def\itemize{\ifnum \@itemdepth >1 \@toodeep\else
	\advance\@itemdepth \@ne \let\@listi\@listInjc
	\edef\@itemitem{labelitem\romannumeral\the\@itemdepth}\list
	{\csname\@itemitem\endcsname}{\def\makelabel##1{\hss\llap{##1}}}\fi}

\renewenvironment{abstract}{%
       \noindent\small {\bf Abstract.\ }\ignorespaces\rm}
      {\par\normalsize}
\newenvironment{subject}{%
       \vskip1em \noindent\small{\bf ACM CCS Categories and Subject Descriptors:\ }\ignorespaces\rm}
      {\par\normalsize}

\newenvironment{keywords}{\vskip1em%
       \noindent\small{\bf Key words:\ }\ignorespaces}
      {\par\normalsize}
\newenvironment{acknowledgements}{\section*{Acknowledgements}}{}


\def\and{%%                             % \begin{tabular}
\end{tabular}\hskip 1em plus .17fil\begin{tabular}[t]{c}%
\small\rm%% \end{tabular}
}

\def\AND{%%                             % \begin{tabular}
\end{tabular}\vskip 12pt plus 6pt minus 4pt\begin{tabular}[t]{c}%
\small\rm%% \end{tabular} 
}

\renewenvironment{verse}
               {\let\\=\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\renewenvironment{titlepage}
    {\@warning{Do not use environment `\string\titlepage'.}}
    {\relax}
\renewcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand\thesection{Appendix \Alph{section}}}
\let\njcfloatsize\footnotesize
\def\fnum@figure{{\bf \figurename~\thefigure}}
\renewenvironment{figure}
               {\njcfloatsize\@float{figure}}
               {\end@float}
\renewenvironment{figure*}
               {\njcfloatsize\@dblfloat{figure}}
               {\end@dblfloat}
\def\fnum@table{{\sc \tablename~\thetable}}
\renewenvironment{table}
               {\njcfloatsize\@float{table}}
               {\end@float}
\renewenvironment{table*}
               {\njcfloatsize\@dblfloat{table}}
               {\end@dblfloat}

\def\continued{\@makecaption{\csname fnum@\@captype\endcsname}{{\em (cont.)}}}

\setlength\belowcaptionskip{10\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \setbox\@tempboxa\hbox{\njcfloatsize#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
   {\def\baselinestretch{0.85}\njcfloatsize#1: #2\par}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\setcounter{tocdepth}{0}

\def\tableofcontents{\@warning{Do not use command `\string\tableofcontents'.}}
\def\listoffigures{\@warning{Do not use command `\string\listoffigures'.}}
\def\listoftables{\@warning{Do not use command `\string\listoftables'.}}

\def\thebibliography#1{\section*{References}\footnotesize\list
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
  \advance\leftmargin\labelsep\itemsep=0pt \parsep=0pt
  \usecounter{enumi}}
  \def\newblock{\hskip .11em plus .33em minus -.07em}
  \sloppy
  \sfcode`\.=1000\relax
}
\let\endthebibliography=\endlist
\def\@lbibitem[#1]#2{\item\if@filesw \immediate\write\@auxout
	{\string\bibcite{#2}{\the\c@enumi}}\fi\ignorespaces}

\def\njccitationstyle{
 \def\thebibliography##1{\section*{References}%\vskip-\lastskip
    \topsep=0pt \parskip=0pt \partopsep=0pt \parindent=0pt
    \hangindent=7mm \hangafter=1
    \def\newblock{\hskip .11em plus .33em minus -.07em}
    \sloppy
    \sfcode`\.=1000\relax
    \footnotesize
 }
 \def\endthebibliography{\par}
 \def\@lbibitem{\njc@lbibitem} \let\@internalcite\cite
 \def\@citeseppen{-1000}
 \def\cite{\let\@cite\njc@cite@one%
	\@ifnextchar [{\@tempswatrue\njc@cite}{\@tempswafalse\njc@cite[]}}
 \def\bracketcite{\let\@cite\njc@cite@two%
	\@ifnextchar [{\@tempswatrue\njc@cite}{\@tempswafalse\njc@cite[]}}
 \def\shortcite{\let\@cite\njc@cite@three%
	\@ifnextchar [{\@tempswatrue\njc@cite}{\@tempswafalse\njc@cite[]}}
 \def\citeauthor{\let\@cite\njc@cite@four\@tempswafalse%
	\@ifnextchar [{\@warning
	  {Do not use an optional argument in \string\citeauthor'.}\njc@cite}%
	{\njc@cite[]}}
 \def\citeyear{\let\@cite\njc@cite@five\@tempswafalse%
	\@ifnextchar [{\@warning
	  {Do not use an optional argument in \string\citeyear'.}\njc@cite}%
	{\njc@cite[]}}
 \def\citemul{\@ifnextchar [{\@warning
	  {Do not use an optional argument in \string\citemul'.}\njc@citemul}%
	{\njc@citemul[]}}
 \let\mulcite\citemul
 \def\bibcite##1##2{\global\@namedef{b@##1}{##2}}
}

\def\njc@lbibitem[#1]#2{\par\hangindent=7mm \hangafter=1\if@filesw
	{ \def\protect##1{\string ##1\space}\def\etal{\string\etal}\immediate
	  \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}
\def\njc@cite[#1]#2{\njc@citex[#1]#2,\@\@}
\def\njc@citex[#1]#2,#3\@\@{\def\tempa{#3}%
	\ifx\tempa\@empty \else \@warning
	  {Use multiple arguments only in `\string\mulcite'.}\fi%
	\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi%
	\@ifundefined{b@#2}{\@cite{{\bf ?}}{{\bf ?}}{#1}\@warning
        {Citation `#2' on page \thepage \space undefined}}%
 	{\edef\@tempa{\@nameuse{b@#2}}\@cite{\expandafter
            \@car\@tempa \@nil\null}{\expandafter
            \@cdr\@tempa\@nil\null}{#1}}%
% 	{\@cite{\@nameuse{ba@#2}}{\@nameuse{by@#2}}{#1}}%
}
\def\njc@cite@one#1#2#3{#1\ [#2\ifthenelse{\boolean{@tempswa}}{, #3}{}]}
\def\njc@cite@two#1#2#3{[#1\ #2\ifthenelse{\boolean{@tempswa}}{, #3}{}]}
\def\njc@cite@three#1#2#3{#1\ #2\ifthenelse{\boolean{@tempswa}}{, #3}{}}
\def\njc@cite@four#1#2#3{#1}
\def\njc@cite@five#1#2#3{#2}

\def\njc@citemul[#1]#2{\njc@mcite #2\@\@}
\def\njc@mcite#1,#2\@\@{%
 	\if@filesw\immediate\write\@auxout{\string\citation{#1,#2}}\fi%
	\@ifundefined{b@#1}{{\bf ?}\@warning
        {Citation `#1' on page \thepage \space undefined}}%
 	{\edef\@tempa{\@nameuse{b@#1}}\expandafter
	 \@car\@tempa\@nil\ }\def\@citea{[}\@for\@citeb:=#1,#2\do
        {\@citea\def\@citea{,\penalty\@citeseppen\ }\@ifundefined
	{b@\@citeb}{{\bf ?}\@warning
	{Citation `\@citeb' on page \thepage \space undefined}}%
	{\edef\@tempa{\@nameuse{b@\@citeb}}\expandafter
	 \@cdr\@tempa\@nil}}]%
}

\newcommand\etal{{\noexpand\textsl{et al.}}}

\def\eqnref#1{Eq.~(\ref{#1})}
\def\figref#1{Fig.~\ref{#1}}
\def\tableref#1{Table~\ref{#1}}

\def\usenjcepsmacros{\makeatletter\@input{njcepsmacros.sty}%
	\makeatother\global\let\usenjcepsmacros=\relax}

\def\makeepsbox{\@ifnextchar[{\@makeepsbox}{\@makeepsbox[c]}}
\def\@makeepsbox[#1]#2{\@ifnextchar[{\@@makeepsbox[#1]#2}{%
	\@@makeepsbox[#1]#2[scale=1000]}}
\def\@@makeepsbox[#1]#2[#3]{%
	\@warning{njcepsmacros not initialized: use command %
     `\string\usenjcepsmacros' in the preamble}}
\newif\ifnjcputspecial \global\njcputspecialtrue
\def\epsdraft{\global\njcputspecialfalse}
 
\newif\if@restonecol 
\def\theindex{\@warning{Do not use environment `\string\theindex'.}}
\def\endtheindex{\relax} 

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule width 0.5in
  \kern 2.6\p@}

\long\def\@makefntext#1{\parindent 0pt\noindent$^{\@thefnmark}$\enspace#1}

\renewcommand\figurename{Fig.}

\def\@startsection#1#2#3#4#5#6{\if@noskipsec\gdef\@period{} \leavevmode
  \gdef\@period{.} \fi
   \par \@tempskipa #4\relax
   \@afterindenttrue
   \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
   \if@nobreak \everypar{}\else
     \addpenalty{\@secpenalty}\addvspace{\@tempskipa}\fi \@ifstar
     {\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \def\@svsec{}\else 
     \refstepcounter{#1}\edef\@svsec{\csname the#1\endcsname\ifnum
	#2=1.\fi\hskip 0.5em }\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@ 
        \begingroup #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}%
        \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
                    #7}\else
        \def\@svsechd{#6\hskip #3\relax  %% \relax added 2 May 90
                   \@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                             \protect\numberline{\csname the#1\endcsname}\fi
                       #7}}\fi
     \@xsect{#5}}

\def\@xsect#1{\@tempskipa #1\relax
      \ifdim \@tempskipa>\z@
       \par \nobreak
       \vskip \@tempskipa
       \@afterheading
    \else \global\@nobreakfalse \global\@noskipsectrue
       \everypar{\if@noskipsec \global\@noskipsecfalse
                   \clubpenalty\@M \hskip -\parindent
                   \begingroup \@svsechd \endgroup \unskip
                   \hskip -#1\relax  % relax added 14 Jan 91
                  \else \clubpenalty \@clubpenalty
                    \everypar{}\fi}\fi\ignorespaces}


\def\twolevelnumbering#1{\@for \njc@countername :=#1\do{
	\@namedef{njc@\njc@countername}{\relax}\relax}\relax
}

% \njcnewtheorem{BODYSTYLE}{NAME}{TEXT}
\def\njcnewtheorem#1#2#3{\expandafter\@ifdefinable\csname #2\endcsname
{\@definecounter{#2}\@ifundefined{njc@#2}{%
\expandafter\xdef\csname the#2\endcsname{\@thmcounter{#2}}%
\global\@namedef{#2}{\@thm{#1}{#2}{#3}}\global\@namedef{end#2}{\@endtheorem}}{%
\@addtoreset{#2}{section}%
\expandafter\xdef\csname the#2\endcsname{\expandafter\noexpand
  \thesection \@thmcountersep \@thmcounter{#2}}%
\global\@namedef{#2}{\@thm{#1}{#2}{#3}}\global\@namedef{end#2}{\@endtheorem}}
\global\@namedef{#2*}{\@starthm{#1}{#3}}%
      \global\@namedef{end#2*}{\@endstartheorem}
}}

\def\@starthm#1#2{%
	\@ifnextchar[{\@starythm{#1}{#2}}{\@starxthm{#1}{#2}}}
\def\@starxthm#1#2{\@beginstartheorem{#2}\ignorespaces#1}
\def\@starythm#1#2[#3]{\@opargbeginstartheorem{#2}{#3}\ignorespaces#1}
\def\@beginstartheorem#1{\trivlist \item[\hskip \labelsep{\sc #1.}]}
\def\@opargbeginstartheorem#1#2{\trivlist
      \item[\hskip \labelsep{\sc #1.\ (#2)}]}
\def\@endstartheorem{\endtrivlist}

\def\@thm#1#2#3{\refstepcounter
    {#2}\@ifnextchar[{\@ythm{#1}{#2}{#3}}{\@xthm{#1}{#2}{#3}}}

\def\@xthm#1#2#3{\@begintheorem{#3}{\csname the#2\endcsname.}\ignorespaces#1}
\def\@ythm#1#2#3[#4]{\@opargbegintheorem{#3}{\csname
       the#2\endcsname.}{#4}\ignorespaces#1}
\def\@begintheorem#1#2{\trivlist \item[\hskip \labelsep{\sc #1\ #2}]}
\def\@opargbegintheorem#1#2#3{\trivlist
      \item[\hskip \labelsep{\sc #1\ #2\ (#3)}]}
\def\@endtheorem{\endtrivlist}

% !!! problem: relies on article.cls to `newcounter', has no
% `[section]'; probably does not work with section based numbering.
\def\njc@environments{
\@ifundefined{njc@figure}{%\newcounter{figure}% !!!
         \gdef\thefigure{\@arabic\c@figure}}
	{%\newcounter{figure}[section]% !!!
        \gdef\thefigure{\@arabic\c@section.\@arabic\c@figure}}
\@ifundefined{njc@table}{%\newcounter{table}% !!!
        \gdef\thetable{\@Roman\c@table}}
	{%\newcounter{table}[section]% !!!
        \gdef\thetable{\@arabic\c@section.\@arabic\c@table}}

\@ifundefined{njc@equation}{\gdef\theequation{\@arabic\c@equation}}{%
\@addtoreset{equation}{section}\gdef\theequation{%
        \@arabic\c@section.\@arabic\c@equation}}

\njcnewtheorem{\it}{theorem}{Theorem}
\njcnewtheorem{\it}{lemma}{Lemma}
\njcnewtheorem{\it}{corollary}{Corollary}
\njcnewtheorem{\it}{proposition}{Proposition}
\njcnewtheorem{\it}{definition}{Definition}
\njcnewtheorem{\it}{conjecture}{Conjecture}
\njcnewtheorem{\it}{claim}{Claim}

\njcnewtheorem{\rm}{problem}{Problem}
\njcnewtheorem{\rm}{example}{Example}
\njcnewtheorem{\rm}{fact}{Fact}
\njcnewtheorem{\rm}{remark}{Remark}
\njcnewtheorem{\rm}{observation}{Observation}

\gdef\proof{\relax{\noindent\sc Proof.\ \ }}
\gdef\endproof{\ifhmode\nobreak\qed\par\fi\medskip}
\gdef\qed{\raisebox{-.2ex}{$\Box$}}
}

\def\document{\njc@environments\endgroup 
  \ifx \@unusedoptionlist \@empty \else 
  \@latex@warning@no@line {Unused global option(s):
    \@spaces [\@unusedoptionlist ]}\fi 
  \@colht \textheight \@colroom \textheight \vsize \textheight 
    \columnwidth \textwidth \@clubpenalty \clubpenalty 
    \if@twocolumn \advance \columnwidth -\columnsep 
       \divide \columnwidth \tw@ \hsize \columnwidth \@firstcolumntrue 
    \fi 
    \hsize \columnwidth \linewidth \hsize 
    \begingroup \@floatplacement \@dblfloatplacement 
     \makeatletter \let \@writefile \@gobbletwo 
       \global \let \@multiplelabels \relax 
     \@input {\jobname .aux}\endgroup 
    \if@filesw \immediate \openout \@mainaux \jobname .aux 
      \immediate \write \@mainaux {\relax}\fi 
    \process@table 
    \let \glb@currsize \@empty 
  \gdef\twolevelnumbering##1{\@warning{Command %
        `\string\twolevelnumering' can only be used in the preamble.}}
  \gdef\draft{\@warning{Command `\string\draft' %
         can only be used in the preamble.}}
  \gdef\njccitationstyle{\@warning{Command `\string\njccitationstyle' %
         can only be used in the preamble.}}
  \normalsize \everypar {}\ifx \normalsfcodes \@empty 
  \ifnum \sfcode `\.=\@m \let \normalsfcodes \frenchspacing 
  \else \let \normalsfcodes \nonfrenchspacing \fi \fi 
  \@noskipsecfalse \let \@refundefined \relax \let 
  \AtBeginDocument \@firstofone \@begindocumenthook \ifdim 
  \topskip <1sp\global \topskip 1sp\relax 
  \fi 
  \global \@maxdepth 
  \maxdepth \global \let \@begindocumenthook \@undefined 
  \ifx \@listfiles \@undefined \global \let \@filelist \relax \global 
  \let \@addtofilelist \@gobble \fi 
  \gdef \do ##1{\global \let ##1\@notprerr }
  \@preamblecmds \global \let \@nodocument \relax \global 
  \let \do \noexpand \ignorespaces}

\newbox\@tabbingstrutbox

\def\@startline{\global\@curtabmar\@nxttabmar\relax
   \global\@curtab\@curtabmar\global\setbox\@curline\hbox % missing \global
    {}\@startfield\@tabbingstrut}                         % added 17 Jun 86

\def\tabbingstretch{1}
\def\tabbing{\setbox\@tabbingstrutbox=\hbox{\vrule
     height \tabbingstretch \ht\strutbox
     depth \tabbingstretch \dp\strutbox
     width\z@}\lineskip \z@\let\>\@rtab\let\<\@ltab\let\=\@settab
     \let\+\@tabplus\let\-\@tabminus\let\`\@tabrj\let\'\@tablab
     \let\\=\@tabcr
     \global\@hightab\@firsttab
     \global\@nxttabmar\@firsttab
     \dimen\@firsttab\@totalleftmargin
     \global\@tabpush0 \global\@rjfieldfalse
     \trivlist \item[]\if@minipage\else\vskip\parskip\fi
     \setbox\@tabfbox\hbox{\rlap{\indent\hskip\@totalleftmargin
       \the\everypar}}\def\@itemfudge{\box\@tabfbox}\@startline\ignorespaces}

\def\@tabbingstrut{\relax\ifmmode\copy\@tabbingstrutbox\else%
    \unhcopy\@tabbingstrutbox\fi}

%%
%% End of file `njcarticle.cls'.
