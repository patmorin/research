journal.pdf: journal.ps
		ps2pdf journal.ps
journal.ps: journal.dvi
		dvips -P cmz -t letter -o journal.ps journal.dvi
journal.dvi: journal.tex
		latex journal.tex
