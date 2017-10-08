NW_SRCS   := $(wildcard src/*.nw)
LSP_SRCS  := ${NW_SRCS:.nw=.lisp}
TEX_SRCS  := ${NW_SRCS:.nw=.tex}
PDF_SRCS  := ${NW_SRCS:.nw=.pdf}
SRCS      := ${LSP_SRCS} ${TEX_SRCS} ${PDF_SRCS}
DOCS_SRCS := $(patsubst src/%,docs/%,${PDF_SRCS})


# http://stackoverflow.com/a/17807510
dirname = $(patsubst %/,%,$(dir $1))
cpif   ?= | cpif

.SUFFIXES: .nw .lisp .pdf .tex
.nw.lisp: ; notangle -R'$@' $< ${cpif} $@
.nw.tex:    export FINDUSES_LISP=1
.nw.tex:  ; noweave -autodefs lisp -n -delay -index $< ${cpif} $@
.tex.pdf: ; latexmk -pdf -outdir=$(call dirname,$<) $<


.PHONY: all docs
all: ${SRCS} docs
docs: ${DOCS_SRCS}


docs/%.pdf: src/%.pdf
	@ mkdir -p $(dir $@)
	@ mv $< $@


.PHONY: clean clean-docs clobber
clean_keep_regex := '.*.[bib|lisp|nw|tex]'

clean:
	@ find src -type f \! -regex ${clean_keep_regex} -delete


clean-docs:
	@ rm -fr docs


clobber_keep_regex := '.*.[bib|nw]'

clobber:
	@ find src -type f \! -regex ${clobber_keep_reges} -delete
