.PHONY: all clean

OUTDIR := out
AUXDIR := aux
TEX_COMPILER := latexmk
TEX_FLAGS := -pdflua -outdir=$(OUTDIR) -auxdir=$(AUXDIR) -shell-escape -silent
SLIDES := $(addprefix $(OUTDIR)/,workshop.pdf)

all: $(SLIDES)

clean:
	rm -rf $(OUTDIR) $(AUXDIR)

$(SLIDES): | $(OUTDIR) $(AUXDIR)

$(OUTDIR)/%.pdf: %.tex
	$(TEX_COMPILER) $(TEX_FLAGS) $<

$(OUTDIR):
	mkdir $(OUTDIR)

$(AUXDIR):
	mkdir $(AUXDIR)
