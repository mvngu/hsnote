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
	sed -i s/'\\setbool{showSolution}{false}'/'\\setbool{showSolution}{true}'/g style/mystyle.sty
	make all
	sed -i s/'\\setbool{showSolution}{true}'/'\\setbool{showSolution}{false}'/g style/mystyle.sty

latex:
	(TEXINPUTS=.:style:${TEXINPUTS:-:}                                 \
	 && export TEXINPUTS                                               \
	 && pdflatex -shell-escape $(TEX_MASTER))
	(TEXINPUTS=.:style:${TEXINPUTS:-:}                                 \
	 && export TEXINPUTS                                               \
	 && pdflatex -shell-escape $(TEX_MASTER))

plot:
	make pdf-plot
	make pdf-plot
	make clean
	mv $(PLOT)-figure0.pdf $(PLOT).pdf
	pdfcrop $(PLOT).pdf $(PLOT).pdf.tmp && mv $(PLOT).pdf.tmp $(PLOT).pdf

pdf-plot:
	(TEXINPUTS=.:style:style/tex/:style/tex/generic:style/tex/generic/pgf:style/tex/generic/pgf/lua:style/tex/generic/pgf/lua/pgf:style/tex/generic/pgf/lua/pgf/manual:style/tex/generic/pgf/systemlayer:style/tex/generic/pgf/basiclayer:style/tex/generic/pgf/libraries:style/tex/generic/pgf/libraries/shapes:style/tex/generic/pgf/libraries/shapes/circuits:style/tex/generic/pgf/libraries/luamath:style/tex/generic/pgf/libraries/luamath/pgf:style/tex/generic/pgf/libraries/luamath/pgf/luamath:style/tex/generic/pgf/libraries/decorations:style/tex/generic/pgf/libraries/datavisualization:style/tex/generic/pgf/graphdrawing:style/tex/generic/pgf/graphdrawing/lua:style/tex/generic/pgf/graphdrawing/lua/LUA_CODING_STYLE:style/tex/generic/pgf/graphdrawing/lua/pgf:style/tex/generic/pgf/graphdrawing/lua/pgf/gd:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/ogdf:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/layered:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/misclayout:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/energybased:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/energybased/multilevelmixer:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/planarity:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/module:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/layered:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/deprecated:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/control:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/routing:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/trees:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/pedigrees:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/circular:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/tools:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/interface:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/lib:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/bindings:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi/base:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi/initialpositioning:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi/forcetypes:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi/algorithms:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/model:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/examples:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/phylogenetics:style/tex/generic/pgf/graphdrawing/tex:style/tex/generic/pgf/modules:style/tex/generic/pgf/utilities:style/tex/generic/pgf/math:style/tex/generic/pgf/frontendlayer:style/tex/generic/pgf/frontendlayer/tikz:style/tex/generic/pgf/frontendlayer/tikz/libraries:style/tex/generic/pgf/frontendlayer/tikz/libraries/datavisualization:style/tex/generic/pgf/frontendlayer/tikz/libraries/circuits:style/tex/generic/pgf/frontendlayer/tikz/libraries/graphs:style/tex/plain:style/tex/plain/pgf:style/tex/plain/pgf/systemlayer:style/tex/plain/pgf/basiclayer:style/tex/plain/pgf/utilities:style/tex/plain/pgf/math:style/tex/plain/pgf/frontendlayer:style/tex/context:style/tex/context/third:style/tex/context/third/pgf:style/tex/context/third/pgf/systemlayer:style/tex/context/third/pgf/basiclayer:style/tex/context/third/pgf/utilities:style/tex/context/third/pgf/math:style/tex/context/third/pgf/frontendlayer:style/tex/latex:style/tex/latex/pgf:style/tex/latex/pgf/doc:style/tex/latex/pgf/systemlayer:style/tex/latex/pgf/basiclayer:style/tex/latex/pgf/utilities:style/tex/latex/pgf/math:style/tex/latex/pgf/compatibility:style/tex/latex/pgf/frontendlayer:style/tex/latex/pgf/frontendlayer/libraries:style/tex/context/third/pgfplots/:style/tex/generic/pgfplots/:style/tex/generic/pgfplots/lua:style/tex/generic/pgfplots/lua/pgfplots:style/tex/generic/pgfplots/lua/pgfplotsoldpgfsupp:style/tex/generic/pgfplots/lua/pgfplotsoldpgfsupp/luamath:style/tex/generic/pgfplots/util:style/tex/generic/pgfplots/numtable:style/tex/generic/pgfplots/sys:style/tex/generic/pgfplots/test:style/tex/generic/pgfplots/pgfcontrib:style/tex/generic/pgfplots/oldpgfplotscompatib:style/tex/generic/pgfplots/liststructure:style/tex/generic/pgfplots/libs:style/tex/generic/pgfplots/oldpgfcompatib:style/tex/latex/pgfplots/:style/tex/latex/pgfplots/libs:style/tex/plain/pgfplots:${TEXINPUTS:-:} && export TEXINPUTS && \
	 pdflatex -shell-escape $(PLOT_MASTER))
	(TEXINPUTS=.:style:style/tex/:style/tex/generic:style/tex/generic/pgf:style/tex/generic/pgf/lua:style/tex/generic/pgf/lua/pgf:style/tex/generic/pgf/lua/pgf/manual:style/tex/generic/pgf/systemlayer:style/tex/generic/pgf/basiclayer:style/tex/generic/pgf/libraries:style/tex/generic/pgf/libraries/shapes:style/tex/generic/pgf/libraries/shapes/circuits:style/tex/generic/pgf/libraries/luamath:style/tex/generic/pgf/libraries/luamath/pgf:style/tex/generic/pgf/libraries/luamath/pgf/luamath:style/tex/generic/pgf/libraries/decorations:style/tex/generic/pgf/libraries/datavisualization:style/tex/generic/pgf/graphdrawing:style/tex/generic/pgf/graphdrawing/lua:style/tex/generic/pgf/graphdrawing/lua/LUA_CODING_STYLE:style/tex/generic/pgf/graphdrawing/lua/pgf:style/tex/generic/pgf/graphdrawing/lua/pgf/gd:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/ogdf:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/layered:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/misclayout:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/energybased:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/energybased/multilevelmixer:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/planarity:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/doc/ogdf/module:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/layered:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/deprecated:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/control:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/routing:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/trees:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/pedigrees:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/circular:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/tools:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/interface:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/lib:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/bindings:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi/base:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi/initialpositioning:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi/forcetypes:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/force/jedi/algorithms:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/model:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/examples:style/tex/generic/pgf/graphdrawing/lua/pgf/gd/phylogenetics:style/tex/generic/pgf/graphdrawing/tex:style/tex/generic/pgf/modules:style/tex/generic/pgf/utilities:style/tex/generic/pgf/math:style/tex/generic/pgf/frontendlayer:style/tex/generic/pgf/frontendlayer/tikz:style/tex/generic/pgf/frontendlayer/tikz/libraries:style/tex/generic/pgf/frontendlayer/tikz/libraries/datavisualization:style/tex/generic/pgf/frontendlayer/tikz/libraries/circuits:style/tex/generic/pgf/frontendlayer/tikz/libraries/graphs:style/tex/plain:style/tex/plain/pgf:style/tex/plain/pgf/systemlayer:style/tex/plain/pgf/basiclayer:style/tex/plain/pgf/utilities:style/tex/plain/pgf/math:style/tex/plain/pgf/frontendlayer:style/tex/context:style/tex/context/third:style/tex/context/third/pgf:style/tex/context/third/pgf/systemlayer:style/tex/context/third/pgf/basiclayer:style/tex/context/third/pgf/utilities:style/tex/context/third/pgf/math:style/tex/context/third/pgf/frontendlayer:style/tex/latex:style/tex/latex/pgf:style/tex/latex/pgf/doc:style/tex/latex/pgf/systemlayer:style/tex/latex/pgf/basiclayer:style/tex/latex/pgf/utilities:style/tex/latex/pgf/math:style/tex/latex/pgf/compatibility:style/tex/latex/pgf/frontendlayer:style/tex/latex/pgf/frontendlayer/libraries:style/tex/context/third/pgfplots/:style/tex/generic/pgfplots/:style/tex/generic/pgfplots/lua:style/tex/generic/pgfplots/lua/pgfplots:style/tex/generic/pgfplots/lua/pgfplotsoldpgfsupp:style/tex/generic/pgfplots/lua/pgfplotsoldpgfsupp/luamath:style/tex/generic/pgfplots/util:style/tex/generic/pgfplots/numtable:style/tex/generic/pgfplots/sys:style/tex/generic/pgfplots/test:style/tex/generic/pgfplots/pgfcontrib:style/tex/generic/pgfplots/oldpgfplotscompatib:style/tex/generic/pgfplots/liststructure:style/tex/generic/pgfplots/libs:style/tex/generic/pgfplots/oldpgfcompatib:style/tex/latex/pgfplots/:style/tex/latex/pgfplots/libs:style/tex/plain/pgfplots:${TEXINPUTS:-:} && export TEXINPUTS && \
	 pdflatex -shell-escape $(PLOT_MASTER))

clean:
	rm -rfv *~
	rm -rfv *.aux
	rm -rfv *.auxlock
	rm -rfv *.dpth
	rm -rfv .gitignore~
	rm -rfv *.log
	rm -rfv *.md5
	rm -rfv *.out
	rm -rfv style/*~

.PHONY: all clean latex pdf-plot plot solution
