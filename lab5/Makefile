IN = $(wildcard *.md)
IMG = $(wildcard img/*)
OUT = $(patsubst %.md, %.pdf, $(IN))

all: $(OUT)

%.pdf: %.md $(IMG)
	pandoc $< -s -t latex --pdf-engine=xelatex -o $@

.PHONY: all
