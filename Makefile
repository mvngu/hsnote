###########################################################################
# Copyright (C) 2018 Minh Van Nguyen <mvngu at gmx dot com>
###########################################################################

# Ensure you have a proper and working LaTeX/TeX distribution.

FILE =
PLOT =
TEX_MASTER = $(FILE).tex
PLOT_MASTER = $(PLOT).tex

all:
	make latex
	make latex
	make clean

# Compile a document with solutions to the problems.
solution:
	sed -i s/'\\setboolean{showSolution}{false}'/'\\setboolean{showSolution}{true}'/g style/mystyle.sty
	make all
	sed -i s/'\\setboolean{showSolution}{true}'/'\\setboolean{showSolution}{false}'/g style/mystyle.sty

latex:
	(TEXINPUTS=.:style:${TEXINPUTS:-:}                                 \
	 && export TEXINPUTS                                               \
	 && pdflatex -shell-escape $(TEX_MASTER))
	(TEXINPUTS=.:style:${TEXINPUTS:-:}                                 \
	 && export TEXINPUTS                                               \
	 && pdflatex -shell-escape $(TEX_MASTER))

clean:
	rm -rfv *~
	rm -rfv *.aux
	rm -rfv *.log
	rm -rfv *.out
	rm -rfv style/*~

.PHONY: all clean latex solution
