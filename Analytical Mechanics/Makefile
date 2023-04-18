
PDFLATEX = texfot pdflatex
TEX = latexmk
SH 		 = /bin/bash
ASCRIPT  = /usr/bin/osascript

TEXFORMAT = .tex
FIGFORMAT = .png .jpg .jpeg .heic .svg .pdf

SRCDIR 		= src
SUBSRCDIR 	= src/subsrc
FIGDIR 		= figs
SHDIR		= sh
LITDIR		= lit
OUTDIR		= out

PDFLATEXFLAGS =  -interaction=batchmode -file-line-error -synctex=1 
PDFLATEXFLAGSEXTRA = -no-shell-escape
OPTFLAG = --interaction=nonstopmode -file-line-error -synctex=1
TEXFLAGS = -pdf -pvc -output-directory=$(OUTDIR) -recorder -use-make -pdflatex="pdflatex $(OPTFLAG) $(PDFLATEXFLAGSEXTRA)"

MAIN 	 = Mechanics

SRC   	 = $(SRCDIR)/$(MAIN)$(TEXFORMAT)
BASE     = "$(basename $(SRC))"

MAINSRC	 = $(wildcard $(SRCDIR)/*$(TEXFORMAT))
MAINSRC -= $(SRC)  
SUBSRC 	 = $(wildcard $(SUBSRCDIR)/*$(TEXFORMAT))
FIGS	 = $(wildcard $(FIGURESDIR)/*$(FIGFORMAT))

TEXSRC	 = Makefile \
				$(SRC) \
					$(MAINSRC) \
						$(SUBSRC)

all: pdf

.PHONY: pdf
pdf: $(TEXSRC) $(FIGS)
	$(TEX) $(TEXFLAGS) $(SRC)

.PHONY: view
view:
	$(SH) pdf-view.sh $(BASE)

.PHONY: once
once:
	$(PDFLATEX) $(PDFLATEXFLAGS) $(PDFLATEXFLAGSEXTRA) $(SRC)

.PHONY: print-%
print-%  : ; @echo $* = $($*)

.PHONY: clean
clean :
	$(RM) -f -- *.aux *.bak *.bbl *.blg *.log *.out *.toc *.tdo _region.* *.idx *.bcf *.run.xml *.ind *.ilg *.fls *.fdb_latexmk *.pdfsync *.synctex.gz *.synctex* *.pdf ._* $(SRCDIR)/._* $(SUBSRCDIR)/._* $(FIGSDIR)/._* $(PDFDIR)/._* $(OUTDIR)/*.aux $(OUTDIR)/*.bak $(OUTDIR)/*.bbl $(OUTDIR)/*.blg $(OUTDIR)/*.log $(OUTDIR)/*.out $(OUTDIR)/*.toc $(OUTDIR)/*.tdo _region.$(OUTDIR)/* $(OUTDIR)/*.idx $(OUTDIR)/*.bcf $(OUTDIR)/*.run.xml $(OUTDIR)/*.ind $(OUTDIR)/*.ilg $(OUTDIR)/*.fls $(OUTDIR)/*.fdb_latexmk $(OUTDIR)/*.pdfsync $(OUTDIR)/*.synctex.gz $(OUTDIR)/*.synctex$(OUTDIR)/* ._$(OUTDIR)/*  




