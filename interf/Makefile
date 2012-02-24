ipes=$(wildcard *.ipe)
figs=$(ipes:.ipe=.pdf)

LATEX=pdflatex
LFLAGS=-interaction=nonstopmode -halt-on-error
 
iud.pdf : iud.tex $(figs) iud.bib
	$(LATEX) $(LFLAGS) iud
	bibtex iud
	$(LATEX) $(LFLAGS) iud
	$(LATEX) $(LFLAGS) iud

%.pdf : %.ipe
	ipetoipe -pdf $<

install : iud.pdf
	scp iud.pdf morin@cg.scs.carleton.ca:public_html/publications/drafts/iud/iud-`date +"%Y-%m-%d"`.pdf
