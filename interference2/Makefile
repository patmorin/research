ipes=$(wildcard *.ipe)
figs=$(ipes:.ipe=.pdf)
psfigs=$(ipes:.ipe=.eps)

LATEX=pdflatex
LFLAGS=-interaction=nonstopmode -halt-on-error

iud.pdf : iud.tex $(figs) iud.bib
	$(LATEX) $(LFLAGS) iud
	bibtex iud
	$(LATEX) $(LFLAGS) iud
	$(LATEX) $(LFLAGS) iud

%.pdf : %.ipe
	ipetoipe -pdf $<

arxiv : 
	~/bin/arxbundle iud

iud.ps : iud.dvi
	dvips -t letter -o iud.ps $<

iud.dvi : iud.tex $(psfigs) iud.bib
	latex $(LFLAGS) iud
	bibtex iud
	latex $(LFLAGS) iud
	latex $(LFLAGS) iud

%.eps : %.ipe
	ipetoipe -eps $<

install : iud.pdf
	scp iud.pdf morin@cg.scs.carleton.ca:public_html/publications/drafts/iud/iud-`date +"%Y-%m-%d"`.pdf
