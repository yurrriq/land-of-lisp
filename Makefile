NW_SRCS   := $(wildcard src/*.nw)
LSP_SRCS  := ${NW_SRCS:.nw=.lisp}
LSP_SRCS  += $(foreach pkg,${LSP_SRCS},test/$(notdir ${pkg}))
TEX_SRCS  := ${NW_SRCS:.nw=.tex}
PDF_SRCS  := ${NW_SRCS:.nw=.pdf}
SRCS      := ${LSP_SRCS} ${TEX_SRCS} ${PDF_SRCS}
DOCS_SRCS := $(patsubst src/%,docs/%,${PDF_SRCS}) docs/index.html


# http://stackoverflow.com/a/17807510
dirname = $(patsubst %/,%,$(dir $1))
cpif   ?= | cpif



.SUFFIXES: .nw .lisp .pdf .tex
.nw.lisp: ; notangle $< ${cpif} $@
.nw.tex:    export FINDUSES_LISP=1
# .nw.tex:  ; noweave -filter noweb-minted -autodefs lisp -n -delay -index $< ${cpif} $@
# .nw.tex:  ; noweave -filter 'pp src/pp-translation.table' -autodefs lisp -n -delay -index $< ${cpif} $@
.nw.tex:  ; noweave -autodefs lisp -n -delay -index $< ${cpif} $@
.tex.pdf: ; latexmk -outdir=$(realpath $(call dirname,$<)) -cd -pdf $<


.PHONY: all check docs
all: ${SRCS} check docs
# TODO: test other files
check: ${LSP_SRCS} bin/runtests bin/coverage
	bin/coverage


test/%.lisp: src/%.nw
	notangle -R'$@' $< ${cpif} $@


docs: ${DOCS_SRCS}

# FIXME: separate file
bin/runtests: src/wizard5.nw
	notangle -R'$@' $< ${cpif} $@


docs/index.html: README.md
	pandoc -f markdown_github -t html5 -s $< -o $@


docs/%.pdf: src/%.lisp src/%.pdf
	@ mkdir -p $(dir $@)
	@ cp src/$*.pdf $@


.PHONY: clean clean-docs clobber
clean_keep_regex := '.*.[bib|eps|lisp|nw|tex|ttf]'

clean:
	@ find src -type f \! -regex ${clean_keep_regex} -delete


clean-docs:
	@ rm -fr docs


clobber_keep_regex := '.*.[bib|nw|eps|ttf]'

clobber:
	@ find src -type f \
		\! -regex ${clobber_keep_regex} \
		\! -name glossary.tex \
		\! -name preamble.tex \
		-delete
