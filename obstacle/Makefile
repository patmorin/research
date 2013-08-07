ipes=$(wildcard *.ipe)
xmls=$(wildcard *.xml)
figs=$(ipes:.ipe=.pdf) $(xmls:.xml=.pdf)
burstfigs=$(ipes:.ipe=-1.pdf) $(xmls:.xml=-1.pdf)
basename=$(notdir $(CURDIR))

LATEX=pdflatex
LFLAGS=-interaction=nonstopmode -halt-on-error

$(basename).pdf : $(basename).tex $(figs) $(burstfigs) $(basename).bib
	latexmk -pdf $(basename)

%-1.pdf : %.pdf
	pdftk $< burst output $(<:.pdf=-%d.pdf)

%.pdf : %.ipe
	ipetoipe -pdf $<

%.pdf : %.xml
	ipetoipe -pdf $<

arxiv : 
	~/git/bin/arxbundle $(basename)

install : $(basename).pdf
	scp $(basename).pdf morin@cg.scs.carleton.ca:public_html/publications/drafts/$(basename)/$(basename)-`date +"%Y-%m-%d"`.pdf

