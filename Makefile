all: jhpoelen_cv.pdf

%.pdf: %.tex MyPubs.bib
	latex $* && latex $* && bibtex $* && latex $* && pdflatex $*

clean:
	rm *.aux *.bbl *.log *.out *.blg *.dvi

%.yaml: %.bib
	./bib2yaml.pl $< > $@

refs-%.html: refs-%.md
	pandoc --bibliography MyPubs.bib -o $@ -s $<

out-%.md: refs-%.md
	pandoc --bibliography MyPubs.bib -o $@ -w markdown -s $<
