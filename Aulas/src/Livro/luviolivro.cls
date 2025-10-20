\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{luviolivro}[2024/08/28 Apostila Luvita]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass{memoir}

\pagestyle{companion}
\chapterstyle{hangnum}

\usepackage[fontsize=11pt]{scrextend}
\settypeoutlayoutunit{mm}
\setstocksize{230mm}{160mm}
\settrimmedsize{\stockheight}{\stockwidth}{*}
\setlrmarginsandblock{18mm}{23mm}{*}
\setulmarginsandblock{25mm}{25mm}{*}
\setmarginnotes{0mm}{0mm}{0mm}
\setlength{\footskip}{1.5\baselineskip}
\checkandfixthelayout%

% Dependencies
\RequirePackage{ccicons}
\RequirePackage{amsmath}
\RequirePackage[defblank]{paralist}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{eso-pic}
\RequirePackage{longtable}
\RequirePackage{multicol}
\RequirePackage{tabto}
\RequirePackage[normalem]{ulem}
\RequirePackage{tikz} %for all basic options
\RequirePackage{tikz-qtree} %for simple tree syntax
\usepgflibrary{arrows} %for arrow endings
\usetikzlibrary{positioning,shapes.multipart} %for structured nodes
\usetikzlibrary{tikzmark}
\RequirePackage{tree-dvips}
\RequirePackage{multirow}
\RequirePackage{lipsum}


% Babel

\RequirePackage{csquotes}
\RequirePackage{fontspec}
\RequirePackage{hyphenat}
\RequirePackage[main=brazil, bidi=basic]{babel}
\defaultfontfeatures{Renderer=Harfbuzz}
\RequirePackage{babel-hierluwian}

\babelfont[brazil]{rm}[
	SmallCapsFont=Gentium Plus,
	SmallCapsFeatures={Letters=SmallCaps}]{Crimson Pro}
\babelfont[brazil]{sf}{Noto Sans}
\babelfont[brazil]{tt}[Scale=0.8]{Mononoki Nerd Font}

\babelfont[german]{rm}[
	SmallCapsFont=Gentium Plus,
	SmallCapsFeatures={Letters=SmallCaps}]{Crimson Pro}
\babelfont[brazil]{sf}{Noto Sans}
\babelfont[brazil]{tt}[Scale=0.8]{Mononoki Nerd Font}

\babelfont[english]{rm}[
	SmallCapsFont=Gentium Plus,
	SmallCapsFeatures={Letters=SmallCaps}]{Crimson Pro}
\babelfont[english]{sf}{Noto Sans}
\babelfont[english]{tt}[Scale=0.8]{Mononoki Nerd Font}

\babelfont[german]{rm}[
	SmallCapsFont=Gentium Plus,
	SmallCapsFeatures={Letters=SmallCaps}]{Crimson Pro}
\babelfont[german]{sf}{Noto Sans}
\babelfont[german]{tt}[Scale=0.8]{Mononoki Nerd Font}

\babelprovide[import, onchar=ids fonts letters]{ancientgreek}
\babelfont[ancientgreek]{rm}{Brill}
\babeltags{grc = ancientgreek}

\babelprovide[import]{hebrew}
\babelfont[hebrew]{rm}[Scale=0.8]{Ezra SIL}

\babelprovide{ipa}
\babelfont[ipa]{rm}{Gentium Plus}

\babelprovide{hittite}
\babelfont[hittite]{rm}{UllikummiA}

\babelprovide[import,onchar=ids fonts]{sanskrit}
\babelfont[sanskrit]{rm}[Scale=1]{Noto Serif Devanagari}
\babelfont[sanskrit]{sf}[Scale=1]{Noto Sans Devanagari}

% Linguex
\RequirePackage{linguex}
\setlength{\Exlabelsep}{0.5em}
\setlength{\SubExleftmargin}{1.5em}

\RequirePackage{hyperref}%
\hypersetup{%
	colorlinks=true, % false: boxed links; true: colored links
	linkcolor=green,  % color of internal links
	citecolor=green,  % color of links to bibliography
	filecolor=pink,  % color of file links
	urlcolor=green,
}

% Configurações para o autoref
\renewcommand{\figureautorefname}{Figura}
\renewcommand{\tableautorefname}{Tabela}
\renewcommand{\sectionautorefname}{Seção}
\renewcommand{\chapterautorefname}{Capítulo}
\renewcommand{\subsectionautorefname}{Subseção}


\RequirePackage[backend=biber,
	style=abnt,
	repeatfields,
	scbib,
	ittitles,
	indent,
	giveninits,
	justify,
	noslsn,
	natbib,
	extrayear,
]{biblatex}

% Hyperref
\hypersetup{%
	colorlinks=true, % false: boxed links; true: colored links
	linkcolor=green,  % color of internal links
	citecolor=green,  % color of links to bibliography
	filecolor=pink,  % color of file links
	urlcolor=green,
}
% Configurações para o autoref
\renewcommand{\figureautorefname}{Figura}
\renewcommand{\tableautorefname}{Tabela}
\renewcommand{\sectionautorefname}{Seção}
\renewcommand{\chapterautorefname}{Capítulo}
\renewcommand{\subsectionautorefname}{Subseção}

% Hyphenation

\IfFileExists{hífens.txt}{
	\input{hífens.txt}
}{
	\hyphenation{
		hi-e-ro-glí-fi-co
		HAL-PA
		Tar-hun-ta
		tex-to
		hie-ro-gly-phen
		lu-wi-schen
		Bo-ğaz-köy
		Lu-wian
		cha-ma-da
		Hier-o-gly-phs
		du-war-ni
	}
}

% Special citation
\DeclareCiteCommand*{\citeabbrev}
{\boolfalse{citetracker}%
	\boolfalse{pagetracker}%
	\usebibmacro{prenote}}
{\ifciteindex%
	{\indexfield{indextitle}}
	{}%
	\printtext[bibhyperref]{\printfield{shorttitle}}}%like \citetile, 
%only added \printtext[bibhyperref]{...} in this line
{\multicitedelim}
{}
\newcommand{\GrHL}[1]{\citeabbrev*{Hoffner2008} #1}

% Estilo

\setlength{\footmarkwidth}{0.5em}
\setlength{\footmarksep}{0em}
\setlength{\footparindent}{0em}
\footmarkstyle{\textsuperscript{#1}\hspace{0.5em}}

\makeoddfoot{plain}{}{}{\thepage}
\makeevenfoot{plain}{\thepage}{}{}
\makepagestyle{ruled}
\makeevenfoot{ruled}{\thepage}{}{} % page numbers at the outside
\makeoddfoot{ruled}{}{}{\thepage}
\makeheadrule{ruled}{\textwidth}{0.75pt}
\makeevenhead{ruled}{\scshape\leftmark}{}{}
\makeoddhead{ruled}{}{}{\scshape\rightmark}
\makepsmarks{ruled}{%
	\nouppercaseheads%
	\createmark{chapter}{left}{shownumber}{\scshape}{.\space}
	\createmark{part}{right}{shownumber}{}{.\space}
	\createmark{section}{right}{shownumber}{}{.\space}
	\createmark{subsection}{right}{shownumber}{}{.\space}
	\createplainmark{toc}{both}{\contentsname}
	\createplainmark{lof}{both}{\listfigurename}
	\createplainmark{lot}{both}{\listtablename}
	\createplainmark{bib}{both}{\bibname}
	\createplainmark{index}{both}{\indexname}
	\createplainmark{glossary}{both}{\glossaryname}
}

% Decorando divisões
\setsecnumdepth{subsection}
\setcounter{tocdepth}{3}
\newcommand\chap[1]{%
	\chapter*[#1]{#1}%
	\addcontentsline{toc}{chapter}{#1}}



\newcommand{\colofao}[0]{
	\pagestyle{empty}
	\cleartoevenpage%
	\hfill
	\vfill
	\begin{adjustwidth}{5em}{5em}
		\begin{center}
			\noindent Esse documento foi diagramado usando o sistema
			\href{https://lualatex.org}{Lua\TeX} mantido por Manuel
			Pégourié-Gonnard. Todos os \emph{softwares} utilizados na
			diagramação deste document são gratuitos e \emph{open source}.\par
			{\today.}
		\end{center}
	\end{adjustwidth}
	\bigskip
	\noindent
}

\newcommand{\thecoverpage}{
	{
			\thispagestyle{empty}
			\flushright%
			\AddToShipoutPictureFG*{\includegraphics[width=\paperwidth, height=\paperheight]{../../../Mídia/capa.png}}
			\vspace*{45mm}
			\noindent {\scalefont{10}\thetitle}
			\vfill


			\noindent\scalefont{1.7}Gramática e leitura

			\vspace{0.75\onelineskip}

			\noindent\theauthor%

			\vspace{0.5\onelineskip}

			\noindent\scalefont{0.8}\href{mailto:caio.geraldes@usp.br}{\texttt{<caio.geraldes@usp.br>}}


			\vfill{}
			2024\\
			\ccbyncsa%

		}
}


\newcommand{\thetitlepage}{
	{
			\thispagestyle{empty}
			\flushright%
			\vspace*{45mm}
			\noindent {\scalefont{10}\thetitle}
			\vfill


			\noindent\scalefont{1.7}Gramática e leitura

			\vspace{0.75\onelineskip}

			\noindent\theauthor%

			\vspace{0.5\onelineskip}

			\noindent\scalefont{0.8}\href{mailto:caio.geraldes@usp.br}{\texttt{<caio.geraldes@usp.br>}}


			\vfill{}
			2024\\
			\ccbyncsa%

		}
}


\RequirePackage[tracking=true]{microtype}
\RequirePackage{scalefnt}

% Paleta de cores
\RequirePackage{xcolor}
\definecolor{green}{RGB}{16,87,87} % rgb(16,87,87)
\definecolor{red}{RGB}{193, 11, 105} % rgb(193, 11, 105)
\definecolor{yellow}{RGB}{218,222,104} % rgb(218,222,104)
\definecolor{pink}{RGB}{243,179,145} % rgb(243,179,145)
\definecolor{blue}{RGB}{161,184,206} % rgb(161,184,206)


% Local Commands
\newcommand{\Prep}{{\footnotesize\textsc{Prep.}}}
\newcommand{\Det}{{\footnotesize\textsc{Det.}}}
\newcommand{\Clt}{{\footnotesize\textsc{Clt.}}}
\newcommand{\Nom}{{\footnotesize\textsc{Nom.}}}
\newcommand{\Acu}{{\footnotesize\textsc{Acu.}}}
\newcommand{\Dat}{{\footnotesize\textsc{Dat.}}}
\newcommand{\Gen}{{\footnotesize\textsc{Gen.}}}
\newcommand{\Abl}{{\footnotesize\textsc{Abl.}}}
\newcommand{\Sg}{{\footnotesize\textsc{Sg.}}}
\newcommand{\Pl}{{\footnotesize\textsc{Pl.}}}
\newcommand{\Com}{{\footnotesize\textsc{Com.}}}
\newcommand{\Neut}{{\footnotesize\textsc{Neut.}}}
\newcommand{\Rel}{{\footnotesize\textsc{Rel.}}}
\newcommand{\Conj}{{\footnotesize\textsc{Conj.}}}
\newcommand{\Pret}{{\footnotesize\textsc{Pret.}}}
\newcommand{\Pro}{{\footnotesize\textsc{Pro.}}}
\newcommand{\Refl}{{\footnotesize\textsc{Refl.}}}
\newcommand{\La}[1]{\textsc{l}.#1}
\newcommand{\logo}[1]{\textnormal{#1}}
\newcommand{\spac}{\textsuperscript{\textnormal{I}}}
\newcommand{\lmasc}{\textnormal{|}}
\newcommand{\Isep}{\textsuperscript{I}}
\newcommand{\luwmasc}{{\textsuperscript{𔖶}}}
\newcommand{\lbreak}{\hspace{2pt}\textnormal{||}\hspace{2pt}}
\newcommand{\ipa}[1]{\foreignlanguage{ipa}{#1}}
\newcommand{\pie}{\textsc{pie}}
\newcommand{\pac}{\textsc{pac}}
\newcommand{\parnumr}[2]{#1 \Roman{parcount}}
\newcommand{\parnuma}[2]{#1 \arabic{parcount}}
\newcounter{parcount}
\newenvironment{parnumbersa}[1][§]{%
	\par%
	\everypar{\hangpara{3em}{1}\stepcounter{parcount} \textnormal{\normalsize\parnuma{#1}}
		\tabto{2em}}%
}{}
\newenvironment{parnumbersr}[2][§]{%
	\par%
	\everypar{\hangpara{6em}{1}\stepcounter{parcount} \textnormal{\normalsize\parnumr{#1}}
		\tabto{5em}}%
}{}
\newcommand{\abreviacao}[2]{\noindent #1 \hspace{10pt}\hfill #2\\}
\newenvironment{abreviacoes}{
	\flushright%
	\setlength{\columnsep}{50pt}
	\small
	\begin{multicols}{2}
		}{
	\end{multicols}
}

% Lua
\ifluatex%
	\RequirePackage{pietex}
\fi


% set \clubpenalty, etc. to distinctive values for use
% in tracing page breaks. These values are chosen so that
% no single penalty will absolutely prohibit a page break, but
% certain combinations of two or more will.
\clubpenalty=9996
\widowpenalty=9999
\brokenpenalty=4991
% Reiterate the default value of \redisplaypenalty, for
% completeness.
% Set postdisplaypenalty to a fairly high value to discourage a
% page break between a display and a widow line at the end of a
% paragraph.
\predisplaypenalty=10000
\postdisplaypenalty=1549
% And then \displaywidowpenalty should be at least as high as
% \postdisplaypenalty, otherwise in a situation where two displays
% are separated by two lines, TeX will prefer to break between the
% two lines, rather than before the first line.
\displaywidowpenalty=1602
