
all: winternitz.pdf

winternitz.dvi : winternitz.tex
	latex winternitz

winternitz.ps : winternitz.dvi
	\dvips -O -1in,-1in -T 5.5in,8.5in -o winternitz.ps winternitz

winternitz.pdf : winternitz.ps
	ps2pdf winternitz.ps winternitz.pdf
