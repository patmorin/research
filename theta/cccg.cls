\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cccg}[2000/05/15  CCCG conference class]

\DeclareOption{onecolumn}{\OmitOption}

\newlength{\hshift}
\newlength{\vshift}


% there is no bottommargin in TeX, but I invent one for consistency
\newlength{\bottommargin}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}


\ProcessOptions\relax

\LoadClass[twocolumn,twoside]{article}

% parameters, all margins  have one inch subtracted from
% them to convert into TeXthink
\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{-0.4in}
\setlength{\topmargin}{0pt}
\setlength{\bottommargin}{-0.25in}
\setlength{\columnsep}{0.3in}



% rest of the parameters we computer, or set to zero 

\addtolength{\topmargin}{\vshift}
\addtolength{\bottommargin}{-\vshift}

%  pretend to be on letter paper, even if we are not.

\setlength{\textwidth}{8.5in}
\addtolength{\textwidth}{-\oddsidemargin}
\addtolength{\textwidth}{-\evensidemargin}
\addtolength{\textwidth}{-2in}
\addtolength{\textwidth}{-2\hoffset}

\setlength{\textheight}{11in}
\addtolength{\textheight}{-\topmargin}
\addtolength{\textheight}{-\bottommargin}
\addtolength{\textheight}{-2in}
%\addtolength{\textheight}{-2\voffset}

\setlength{\columnwidth}{0.5\textwidth}
\addtolength{\columnwidth}{-0.5\columnsep}


\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\marginparwidth}{0pt}

% Die, page numbers, die!

\let\ps@plain=\ps@empty
\pagestyle{empty}


\endinput
% Local Variables:
% TeX-master: "procrules.tex"
% End:
