# determine the names of the source files
MD:=$(wildcard de-RSE-e.V._*.md)
# from that, determine the names of the target files
PDF:=$(patsubst %.md,%.pdf,${MD})

# make sure we don't break if ever files called 'all' or 'clean' exist
.PHONY: all clean

# the default target: build everything
all: ${PDF}

# determine how to build:
# 1. try to find pandoc
#  2. if found: use it
#  3. if not found: use a docker command (and hope for the best)
PANDOC:= $(shell which pandoc >/dev/null && echo "pandoc" || echo "docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc")
# pandoc options
PANDOCOPTS=--number-sections --pdf-engine=pdflatex -V papersize=a4paper -V geometry:margin=3cm -V lang=de-DE -V fontsize=12pt -V breakurl -V hyphens=URL -V colorlinks

# the single build command to convert .md files into pdf
%.pdf: %.md Makefile
	${PANDOC} ${PANDOCOPTS} -o $@ $<

# a target to remove all built files
clean:
	rm ${PDF}
