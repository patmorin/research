
all: proxdegree.pdf proxdegree-aap.pdf

proxdegree.pdf : proxdegree.ps
	ps2pdf proxdegree.ps

proxdegree.ps : proxdegree.dvi
	dvips -o proxdegree.ps proxdegree

proxdegree.dvi : proxdegree.bbl proxdegree.tex empty.xml staircase-a.xml staircase-b.xml t-shape-a.xml t-shape-b.xml t-shape-c.xml yaodef.xml
	latex proxdegree
	latex proxdegree

proxdegree.bbl : proxdegree.tex proxdegree.bib
	latex proxdegree
	bibtex proxdegree

proxdegree-aap.pdf : proxdegree-aap.ps
	ps2pdf proxdegree-aap.ps

proxdegree-aap.ps : proxdegree-aap.dvi
	dvips -o proxdegree-aap.ps proxdegree-aap

proxdegree-aap.dvi : proxdegree-aap.bbl proxdegree-aap.tex empty.xml staircase-a.xml staircase-b.xml t-shape-a.xml t-shape-b.xml t-shape-c.xml yaodef.xml
	latex proxdegree-aap
	latex proxdegree-aap

proxdegree-aap.bbl : proxdegree-aap.tex proxdegree.bib
	latex proxdegree-aap
	bibtex proxdegree-aap

