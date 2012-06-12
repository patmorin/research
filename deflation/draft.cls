\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{draft}

%-------------------- This is based on the article class ----------------

\LoadClass{article}

\RequirePackage[paperwidth=130mm,paperheight=170mm,
  left=10mm, right=10mm, bottom=15mm, top=15mm]{geometry}

%------------------ Defining the most common environments ---------------

\newtheorem{theorem}{Theorem}
\newtheorem{invar}{Invariant}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{cor}[theorem]{Corollary}
\newtheorem{obs}{Observation}
\newtheorem{conj}{Conjecture}
\newtheorem{prop}[theorem]{Proposition}

\def\QED{\ensuremath{{\square}}}
\def\markatright#1{\leavevmode\unskip\nobreak\quad\hspace*{\fill}{#1}}
\newenvironment{proof}
  {\begin{trivlist}\item[\hskip\labelsep{\bf Proof.}]}
  {\markatright{\QED}\end{trivlist}}

%------------------------------------------------------------------------

\flushbottom

\date{Draft---\today}
