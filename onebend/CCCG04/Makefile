target : MorinWood-OneBendDrawing-CCCG04.pdf

???.eps: ???.tex
	latex ???
	dvips -Ppdf -E  -o ???.eps ???.dvi
	epstopdf ???.eps

BigCutwidthConstruction.eps: BigCutwidthConstruction.tex
	latex BigCutwidthConstruction
	dvips -Ppdf -E  -o BigCutwidthConstruction.eps BigCutwidthConstruction.dvi
	epstopdf BigCutwidthConstruction.eps

CutwidthConstruction.eps: CutwidthConstruction.tex
	latex CutwidthConstruction
	dvips -Ppdf -E  -o CutwidthConstruction.eps CutwidthConstruction.dvi
	epstopdf CutwidthConstruction.eps

VertexLayout.eps: VertexLayout.tex
	latex VertexLayout
	dvips -Ppdf -E  -o VertexLayout.eps VertexLayout.dvi
	epstopdf VertexLayout.eps

############################################

MorinWood-OneBendDrawing-CCCG04.ps: CutwidthConstruction.eps VertexLayout.eps ~/latex/myLabels.tex ~/bib/myBibliography.bib ~/bib/myConferences.bib MorinWood-OneBendDrawing-CCCG04.tex
	latex MorinWood-OneBendDrawing-CCCG04.tex
	bibtex MorinWood-OneBendDrawing-CCCG04
	latex MorinWood-OneBendDrawing-CCCG04.tex
	latex MorinWood-OneBendDrawing-CCCG04.tex
	dvips -t letter -o MorinWood-OneBendDrawing-CCCG04.ps MorinWood-OneBendDrawing-CCCG04.dvi

MorinWood-OneBendDrawing-CCCG04.pdf: MorinWood-OneBendDrawing-CCCG04.ps
	pdflatex MorinWood-OneBendDrawing-CCCG04
	bibtex MorinWood-OneBendDrawing-CCCG04
	pdflatex MorinWood-OneBendDrawing-CCCG04
	pdflatex MorinWood-OneBendDrawing-CCCG04

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
	scp -pr * davidw@cg.scs.carleton.ca:submitted/MorinWood-OneBendDrawing/CCCG04/

spell:	MorinWood-OneBendDrawing-CCCG04.pdf
	ispell -t -d british MorinWood-OneBendDrawing-CCCG04.tex

