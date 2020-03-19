.PHONY: default clear

default: output/exercises.pdf

output/exercises.tex: src/exercises.Rnw $(wildcard src/chapter_*.Rnw)
	mkdir -p $(@D)
	Rscript --no-save --no-restore -e "library(knitr); knitr::render_latex(); knitr::knit('$<', '$@')"

output/exercises.pdf: output/exercises.tex
	mkdir -p $(@D)
	latexmk -f -pdf -outdir=$(@D) $<

data/spam.info.txt:
	mkdir -p $(@D)
	wget "https://web.stanford.edu/~hastie/ElemStatLearn/datasets/spam.info.txt" -O $@

data/spam.data:
	mkdir -p $(@D)
	wget "https://web.stanford.edu/~hastie/ElemStatLearn/datasets/spam.data" -O $@

data/zip.info.txt:
	mkdir -p $(@D)
	wget "https://web.stanford.edu/~hastie/ElemStatLearn/datasets/zip.info.txt" -O $@

data/zip.train.gz:
	mkdir -p $(@D)
	wget "https://web.stanford.edu/~hastie/ElemStatLearn/datasets/zip.train.gz" -O $@

data/zip.test.gz:
	mkdir -p $(@D)
	wget "https://web.stanford.edu/~hastie/ElemStatLearn/datasets/zip.test.gz" -O $@

data/zip.digits:
	mkdir -p $(@D)
	wget "https://web.stanford.edu/~hastie/ElemStatLearn/datasets/zip.digits" -O $@

clear:
	rm -rf output
