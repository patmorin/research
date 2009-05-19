

jocg-sample.dvi : jocg-sample.tex jocg.cls
	latex jocg-sample

jocg-sample.ps : jocg-sample.dvi
	dvips -o jocg-sample.ps jocg-sample

jocg-sample.pdf : jocg-sample.ps
	ps2pdf jocg-sample.ps

install : jocg-sample.pdf jocg.cls jocg-sample.tex
	scp jocg-sample.tex jocg-sample.pdf jocg.cls jocg@jocg.org:public_html
