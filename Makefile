all: first_year_report.pdf

#.ONESHELL:
first_year_report.pdf: src/*
	if [ -e dot2tex ]; then rm -r dot2tex; fi
	mkdir dot2tex;
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape first_year_report.tex; \
	bibtex first_year_report.aux; \
	pdflatex --shell-escape first_year_report.tex; \
	pdflatex --shell-escape first_year_report.tex; \
	rm -rf first_year_report.aux first_year_report.log first_year_report.out first_year_report.toc first_year_report.lof first_year_report.lot first_year_report.bbl first_year_report.blg; \
  if [ "$(ls -A dot2tex)" ]; then mv dot2tex/*.tex src/figures/; fi
	rm -r dot2tex

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
