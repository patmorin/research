#!/bin/bash

pdflatex tkapprox && bibtex tkapprox && pdflatex tkapprox && pdflatex tkapprox && rm -f tkapprox.lo* *.aux tkapprox.bbl tkapprox.blg tkapprox.toc

