HW := $(subst .md,.pdf,$(wildcard hw/*.md))

.PHONY: default all notes clean
default:
	$(MAKE) -j4 all
all: $(HW) notes

notes:
	cd notes; pandoc -d ../pandoc.yml -o ../notes.pdf $(sort $(notdir $(wildcard notes/*.md)))

clean:
	rm -rf notes/*.pdf hw/*.pdf

%.pdf: %.md
	pandoc -d pandoc.yml -o $@ $<
