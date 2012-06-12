PAGER ?= less
EDITOR ?= vi

PDFLATEX = pdflatex
BIBTEX = bibtex
MPOST = mpost

PDFLATEXFLAGS = -interaction=nonstopmode
BIBTEXFLAGS =
MPOSTFLAGS = -interaction=nonstopmode

SRC-tex = poly-defl.tex
SRC-bib = poly-defl.bib
SRCS-mp = ${shell find figs -name '*.mp' -a ! -name '.\#*' }

JOB-tex = ${SRC-tex:.tex=}
JOB-bib = ${SRC-bib:.bib=}
JOBS-mp = ${SRCS-mp:.mp=}

SRCS-all = ${SRC-tex} ${SRCS-mp}
PDF = ${SRC-tex:.tex=.pdf}
MPSS = ${SRCS-mp:.mp=.mps}

HEXTEX=hexagons.tex

CLEANFILES = ${shell find . -name '*.log' -o -name '*.mpx' -o -name '*.mps' \
			-o -name '*.aux' -o -name '*.pdf' -o -name '*.bbl' \
			-o -name '*.blg' -o -name '*.dvi' \
			-o -name 'mpxerr.tex' -o -name 'otypes*.txt' \
			-o -name '*.gen'} ${HEXTEX} poly-defl.tar.gz

all: pdf

# Keep intermediates
.SECONDARY:

.PHONY: all pdf figs edit page clean arxiv

pdf: ${HEXTEX} ${SRC-tex} ${SRC-bib}
	${PDFLATEX} ${PDFLATEXFLAGS} ${JOB-tex}
	${BIBTEX} ${BIBTEXFLAGS} ${JOB-bib}
	${PDFLATEX} ${PDFLATEXFLAGS} ${JOB-tex}
	${PDFLATEX} ${PDFLATEXFLAGS} ${JOB-tex}

figs: figs/prfpolys.gen figs/prfarrows.gen figs/otypes06.txt ${SRCS-mp}
	rm -f figs/*.mps
	for mpjob in ${JOBS-mp} ; do \
	    ( \
		cd `dirname $${mpjob}` ; \
		${MPOST} ${MPOSTFLAGS} `basename $${mpjob}` ; \
	    ) ; \
	    if [ "$$?" -ne "0" ] ; then exit 1 ; fi ; \
	done

figs/prfpolys.gen: genprfpolys figs/prfpolys.db
	./genprfpolys < figs/prfpolys.db > figs/prfpolys.gen

figs/prfarrows.gen: genprfarrows figs/prfarrows.db
	./genprfarrows < figs/prfarrows.db > figs/prfarrows.gen

figs/otypes06.txt: otypes06.b08
	hexdump -e '1/1 "(%u, " 1/1 "%u)\n"' otypes06.b08 > figs/otypes06.txt

${HEXTEX}: figs genhextex
	./genhextex > ${HEXTEX}

edit: ${SRCS-all}
	${EDITOR} $^

page: ${SRCS-all}
	${PAGER} $^

poly-defl.tar.gz: pdf
	rm -rf poly-defl.tar.gz
	tar czf poly-defl.tar.gz poly-defl.tex hexagons.tex poly-defl.bbl \
		pat.sty patmorin.cls figs/*.mps

arxiv: poly-defl.tar.gz

clean:
	-rm -f ${CLEANFILES}
