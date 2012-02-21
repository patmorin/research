ipes=$(wildcard *.ipe)
figs=$(ipes:.ipe=.pdf)

iud.pdf : iud.tex $(figs) iud.bib
	pdflatex iud
	bibtex iud
	pdflatex iud
	pdflatex iud

%.pdf : %.ipe
	ipetoipe -pdf $<

install : iud.pdf
	scp iud.pdf morin@cg.scs.carleton.ca:public_html/publications/drafts/iud/iud-`date +"%Y-%m-%d"`.pdf
