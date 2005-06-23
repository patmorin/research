target : MorinWood-OneBendDrawing.pdf

???.eps: ???.tex
	latex ???
	dvips -Ppdf -E  -o ???.eps ???.dvi
	epstopdf ???.eps

CutwidthConstruction.eps: CutwidthConstruction.tex
	latex CutwidthConstruction
	dvips -Ppdf -E  -o CutwidthConstruction.eps CutwidthConstruction.dvi
	epstopdf CutwidthConstruction.eps

VertexLayout.eps: VertexLayout.tex
	latex VertexLayout
	dvips -Ppdf -E  -o VertexLayout.eps VertexLayout.dvi
	epstopdf VertexLayout.eps

############################################

MorinWood-OneBendDrawing.ps: CutwidthConstruction.eps VertexLayout.eps ~/latex/myLabels.tex ~/bib/myBibliography.bib ~/bib/myConferences.bib MorinWood-OneBendDrawing.tex
	latex MorinWood-OneBendDrawing.tex
	bibtex MorinWood-OneBendDrawing
	latex MorinWood-OneBendDrawing.tex
	latex MorinWood-OneBendDrawing.tex
	dvips -t a4 -o MorinWood-OneBendDrawing.ps MorinWood-OneBendDrawing.dvi

MorinWood-OneBendDrawing.pdf: MorinWood-OneBendDrawing.ps
	pdflatex MorinWood-OneBendDrawing
	bibtex MorinWood-OneBendDrawing
	pdflatex MorinWood-OneBendDrawing
	pdflatex MorinWood-OneBendDrawing

MorinWood-OneBendDrawing.ps2: MorinWood-OneBendDrawing.ps
	a2ps --medium=letter --landscape -o MorinWood-OneBendDrawing.ps2 MorinWood-OneBendDrawing.ps

clean:
	rm -f *.log
	rm -f *.dvi
	rm -f *.aux
	rm -f *.blg
	chmod go-rwx *

force: 
	touch *.tex
	make 

james:
	make clean
	cp -pr ../MorinWood-OneBendDrawing /mnt/removable/

prague:
	make clean
	cp -pr ../MorinWood-OneBendDrawing /mnt/usbflash/

carleton:
	make clean
	scp -pr * davidw@cg.scs.carleton.ca:submitted/MorinWood-OneBendDrawing/JGAA/

spell:	MorinWood-OneBendDrawing.pdf
	ispell -t -d british MorinWood-OneBendDrawing.tex

