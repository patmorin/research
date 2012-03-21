ipes=$(wildcard *.ipe)
figs=$(ipes:.ipe=.pdf)
burstfigs=$(ipes:.ipe=-1.pdf)
basename=$(notdir $(CURDIR))

LATEX=pdflatex
LFLAGS=-interaction=nonstopmode -halt-on-error

$(basename).pdf : $(basename).tex $(figs) $(burstfigs) $(basename).bib
	$(LATEX) $(LFLAGS) $(basename)
	bibtex $(basename)
	$(LATEX) $(LFLAGS) $(basename)
	$(LATEX) $(LFLAGS) $(basename)

%.pdf : %.ipe
	ipetoipe -pdf $<

%-1.pdf : %.pdf
	pdftk $< burst output $(<:.pdf=-%d.pdf)


arxiv : 
	~/bin/arxbundle $(basename)

install : $(basename).pdf
	scp $(basename).pdf morin@cg.scs.carleton.ca:public_html/publications/drafts/$(basename)/$(basename)-`date +"%Y-%m-%d"`.pdf
