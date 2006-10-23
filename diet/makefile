#!/usr/local/bin/tcsh

# Original author: Jyrki Katajainen <jyrki@diku.dk>, February - June 2001
# Spell-checking was inspired by Steffen Nissen <lukesky@math-tech.dk>.

# Here are the ways how you could use this description file.

# Create a PostScript file of the text.
# Requirement: Files my-report.tex and my-report.bib must exist.
# gmake my-report.ps
# gmake my-report.pdf

# Spell-ckeck your text.
# gmake spell file=<your LaTeX-file>
#   or
# gmake spell

# Create a PostScript figure from a given fig file.
# Requirement: File my-figure.fig must exist.
# gmake my-figure.eps <scale=0.6>
#   or
# gmake my-figure <scale=0.6>
#   or
# Export the figure directly from xfig.

# Find a particular word in your files.
# gmake find word=<the-word-searched-for>

# Remove all useless files from the file directory.
# gmake clean
#   or
# gmake veryclean

# public:

language=english #dansk also possible

latex-files:= $(wildcard *.tex)
latex-bases:= $(basename $(latex-files))
ps-files:= $(addsuffix .ps, $(latex-bases))
pdf-files:= $(addsuffix .pdf, $(latex-bases))

default: clean $(pstex_t-files) $(ps-files) $(pdf-files) clean

figure-directory=.
report-directory=..
eps-scale = 1.00
pstex-scale = 0.50

# private:

dictionary-files:= $(addsuffix .dict, $(latex-bases))
aux-files:= $(addsuffix .aux, $(latex-bases))
dvi-files:= $(addsuffix .dvi, $(latex-bases))
bbl-files:= $(addsuffix .bbl, $(latex-bases))
figure-files:= $(wildcard $(figure-directory)/*.fig)
figure-bases:= $(basename $(figure-files))
pstex_t-files:= $(addsuffix .pstex_t, $(figure-bases))
eps-files:= $(addsuffix .eps, $(figure-bases))

.PHONY: clean find spell veryclean

$(aux-files): %.aux: %.tex
	latex $*.tex

$(dvi-files): %.dvi: %.tex
	latex $*.tex

$(bbl-files): %.bbl: %.aux
	bibtex $*
	latex $*.tex

# public:

$(eps-files): %.eps: %.fig
	-rm -f $*.eps 2>/dev/null
	fig2dev -L eps -m$(eps-scale) $< $@

# To use this, include the color package in your LaTeX file.

$(pstex_t-files): %.pstex_t: %.fig
	-rm -f $*.pstex $*.pstex_t 2>/dev/null
	fig2dev -Lpstex -m$(pstex-scale) $< > $*.pstex
	fig2dev -Lpstex_t -m$(pstex-scale) -p$*.pstex $< > $*.pstex_t	

$(ps-files): %.ps: $(eps-files) $(pstex_t-files) %.tex %.bbl
	latex $*.tex
	@cat $*.tex | ispell -d $(language) -p $*.dict -t -l | grep "" && echo "Above words were not in the dictionary. Run 'gmake spell' to correct the language, if necessary." || true
	dvips $*.dvi -o $*.ps

$(pdf-files): %.pdf: %.dvi
	dvips -Ppdf -G0 $*.dvi
	ps2pdf $*.ps $*.pdf

spell:
ifdef file
	ispell -d $(language) -p ./$(file:.tex=.dict) -t $(file)
else 
ifeq ($(words $(latex-files)), 1)
	ispell -d $(language) -p ./$(dictionary-files) -t $(latex-files)
else
	@echo "Usage: gmake spell file=<your LaTeX-file>"
endif
endif

find :
	find . -type f -print -exec grep $(word) {} \; | less #

clean :
	-rm -f core $(figure-directory)/*.pstex $(figure-directory)/*.pstex_t $(figure-directory)/*.eps a.out *.bak *.dvi *.log *.aux *.bbl *.blg *~ .nfs* 2>/dev/null

veryclean : clean
	rm -f *.ps *.pdf 2>/dev/null
