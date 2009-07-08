
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

proxdegree-conf.pdf : proxdegree-conf.ps
	ps2pdf proxdegree-conf.ps

proxdegree-conf.ps : proxdegree-conf.dvi
	dvips -o proxdegree-conf.ps proxdegree-conf

proxdegree-conf.dvi : proxdegree-conf.bbl proxdegree-conf.tex empty.xml staircase-a.xml staircase-b.xml t-shape-a.xml t-shape-b.xml t-shape-c.xml yaodef.xml
	latex proxdegree-conf
	latex proxdegree-conf

proxdegree-conf.bbl : proxdegree-conf.tex proxdegree.bib
	latex proxdegree-conf
	bibtex proxdegree-conf
