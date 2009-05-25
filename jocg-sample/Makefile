
all: jocg-sample.pdf jocg-sample.ps

jocg-sample.pdf : jocg-sample.tex jocg.cls
	pdflatex jocg-sample.tex 

jocg-sample.ps : jocg-sample.dvi
	dvips -t letter -o jocg-sample.ps jocg-sample

jocg-sample.dvi : jocg-sample.tex jocg.cls
	latex jocg-sample

install : jocg-sample.pdf jocg.cls jocg-sample.tex
	scp jocg-sample.tex jocg-sample.pdf jocg.cls jocg@jocg.org:public_html

clean :
	rm -f jocg-sample.pdf jocg-sample.ps jocg-sample.dvi 

