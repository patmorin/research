target : pixels.ps

?.eps: ?.tex 
	latex ?
	dvips -E -Ppdf  -o ?.eps ?.dvi
	epstopdf ?.eps

pixels.ps: pat.tex pixels.bib pixels.tex 
	xml2p
	latex pixels.tex
	bibtex pixels
	latex pixels.tex
	latex pixels.tex
	dvips -t letter -o pixels.ps pixels.dvi

pixels.pdf: pixels.ps
	pdflatex pixels

clean:
	rm -f *.log
	rm -f *.dvi
	rm -f *.bck
	rm -f *.bak
	rm -f *.aux
	rm -f *.blg
	chmod go-rwx *

force: 
	touch *.tex
	make 

backup:
	make clean
	scp -pr * vida@cgm-2.cs.mcgill.ca:~/CGM/pixels/
