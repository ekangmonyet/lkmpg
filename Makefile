diagrams := $(patsubst %.tex,%.png,$(wildcard diagrams/*.tex))


all: lkmpg.tex $(diagrams)
	pdflatex -shell-escap lkmpg.tex

html: lkmpg.tex $(diagrams)
	make4ht -suf html5 -c html.cfg -d html lkmpg.tex

diagrams/%.png: diagrams/%.pdf
	pdftoppm -png $^ > $@

diagrams/%.pdf: diagrams/%.tex
	pdflatex -output-directory=diagrams $^

clean:
	rm -f *.dvi *.aux *.log *.ps *.pdf *.out lkmpg.bbl lkmpg.blg lkmpg.lof lkmpg.toc *.xref *.svg *.tmp *.html *.css *.4ct *.4tc *.dvi *.lg *.idv
	rm -rf _minted-lkmpg html
	rm -f diagrams/*.png diagrams/*.pdf diagrams/*.log diagrams/*.aux

.PHONY: html
