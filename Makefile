all: lkmpg.tex
	pdflatex -shell-escap lkmpg.tex

html: 
	make4ht -suf html5 -c html.cfg -d html lkmpg.tex

clean:
	rm -f *.dvi *.aux *.log *.ps *.pdf *.out lkmpg.bbl lkmpg.blg lkmpg.lof lkmpg.toc *.xref *.svg *.tmp *.html *.css *.4ct *.4tc *.dvi *.lg *.idv
	rm -rf _minted-lkmpg

.PHONY: html
