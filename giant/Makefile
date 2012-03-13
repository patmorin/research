ipes=$(wildcard *.ipe)
figs=$(ipes:.ipe=.pdf)
burstfigs=$(ipes:.ipe=-1.pdf)

LATEX=pdflatex
LFLAGS=-interaction=nonstopmode -halt-on-error

giant.pdf : giant.tex $(figs) $(burstfigs) giant.bib
	$(LATEX) $(LFLAGS) giant
	bibtex giant
	$(LATEX) $(LFLAGS) giant
	$(LATEX) $(LFLAGS) giant

%.pdf : %.ipe
	ipetoipe -pdf $<

%-1.pdf : %.pdf
	pdftk $< burst output $(<:.pdf=-%d.pdf)


arxiv : 
	~/bin/arxbundle giant

install : giant.pdf
	scp giant.pdf morin@cg.scs.carleton.ca:public_html/publications/drafts/giant/giant-`date +"%Y-%m-%d"`.pdf
