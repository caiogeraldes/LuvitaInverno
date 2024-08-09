rootdir := `pwd`
aulassrc := "Aulas/src/"
aulaspdfs := "Aulas/PDFS/"

default:
    just --list

all: (build "Apostila") (build "00_Introdução") (build "01") (build "02") (build "Signário") biblio

build target:
    cd {{aulassrc}}{{target}} && lualatex --interaction=batchmode --draftmode main.tex 
    cd {{aulassrc}}{{target}} && biber main
    cd {{aulassrc}}{{target}} && lualatex --interaction=batchmode --draftmode main.tex 
    cd {{aulassrc}}{{target}} && lualatex --interaction=batchmode main.tex
    mv {{aulassrc}}{{target}}"/main.pdf"  {{aulaspdfs}}{{target}}".pdf"

debug target:
    cd {{aulassrc}}{{target}} && rm -f main.aux main.bbl main.bcf *.log main.bgl main.log main.out main.run.xml main.lof main.synctex.gz main.toc
    cd {{aulassrc}}{{target}} && lualatex --interaction=nonstopmode --draftmode main.tex
    cd {{aulassrc}}{{target}} && biber main
    cd {{aulassrc}}{{target}} && lualatex --interaction=nonstopmode --draftmode main.tex
    cd {{aulassrc}}{{target}} && lualatex --interaction=nonstopmode main.tex

biblio:
    cd "Bibliografia/" && rm -f main.aux main.bbl main.bcf *.log main.bgl main.log main.out main.run.xml main.lof main.synctex.gz main.toc
    cd "Bibliografia/" && lualatex --interaction=batchmode --draftmode main.tex 
    cd "Bibliografia/" && biber main 
    cd "Bibliografia/" && lualatex --interaction=batchmode --draftmode main.tex 
    cd "Bibliografia/" && lualatex --interaction=batchmode main.tex
    mv "Bibliografia/main.pdf" "Bibliografia/Bibliografia.pdf" 

mapa:
    cd "Scripts/R/" && R CMD BATCH mapa.R

clean target:
    cd {{aulassrc}}{{target}} && rm -f main.aux main.bbl main.bcf *.log main.bgl main.log main.out main.run.xml main.lof main.synctex.gz main.toc

clean-all: (clean "Apostila") (clean "00_Introdução") (clean "01") (clean "02") (clean "Signário")
