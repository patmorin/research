ipes=$(wildcard *.ipe)
figs=$(ipes:.ipe=.pdf)
epsfigs=$(ipes:.ipe=.eps)
burstepsfigs=$(ipes:.ipe=-1.eps)
burstfigs=$(ipes:.ipe=-1.pdf)

LATEX=pdflatex
LFLAGS=-interaction=nonstopmode -halt-on-error


giant-socg.pdf : giant.pdf giant-socg.tex
	latexmk -pdf giant-socg

giant-socg.eps : giant-socg.tex $(epsfigs) $(burstepsfigs) giant.bib
	latexmk giant-socg

giant.pdf : giant.tex $(figs) $(burstfigs) giant.bib
	latexmk -pdf giant

%.pdf : %.ipe
	ipetoipe -pdf $<

%-1.pdf : %.pdf
	pdftk $< burst output $(<:.pdf=-%d.pdf)

%.pdf : %.eps
	ipetoipe -eps $<

arxiv : 
	~/bin/arxbundle giant

install : giant.pdf
	scp giant.pdf morin@cg.scs.carleton.ca:public_html/publications/drafts/giant/giant-`date +"%Y-%m-%d"`.pdf
