aulassrc := "Aulas/src/"
aulaspdfs := "Aulas/PDFS/"

default:
    just --list

all: (build "Apostila") (build "00_Introdução") (build "01") (build "02") (build "03") (build "04") (build "Signário") biblio

build target:
    cd {{aulassrc}}{{target}} && lualatex --interaction=batchmode --draftmode main.tex 
    cd {{aulassrc}}{{target}} && biber --quiet main
    cd {{aulassrc}}{{target}} && lualatex --interaction=batchmode --draftmode main.tex 
    cd {{aulassrc}}{{target}} && lualatex --interaction=batchmode main.tex
    mv {{aulassrc}}{{target}}"/main.pdf"  {{aulaspdfs}}{{target}}".pdf"

debug target:
    cd {{aulassrc}}{{target}} && rm -f main.aux main.bbl main.bcf *.log main.blg main.log main.out main.run.xml main.lof main.synctex.gz main.toc
    cd {{aulassrc}}{{target}} && lualatex --halt-on-error --draftmode main.tex
    rm -rdf debug/
    mkdir -p debug/
    cp -r {{aulassrc}}{{target}}/main.pdf debug/.
    cp -r {{aulassrc}}{{target}}/main.log debug/.
    cd {{aulassrc}}{{target}} && biber main
    cd {{aulassrc}}{{target}} && lualatex --halt-on-error --draftmode main.tex
    rm -rdf debug/
    mkdir -p debug/
    cp -r {{aulassrc}}{{target}}/main.pdf debug/.
    cp -r {{aulassrc}}{{target}}/main.log debug/.
    cd {{aulassrc}}{{target}} && lualatex --halt-on-error main.tex
    rm -rdf debug/
    mkdir -p debug/
    cp -r {{aulassrc}}{{target}}/main.pdf debug/.
    cp -r {{aulassrc}}{{target}}/main.log debug/.

biblio:
    cd "Bibliografia/" && rm -f main.aux main.bbl main.bcf *.log main.blg main.log main.out main.run.xml main.lof main.synctex.gz main.toc
    cd "Bibliografia/" && lualatex --interaction=batchmode --draftmode main.tex 
    cd "Bibliografia/" && biber --quiet main 
    cd "Bibliografia/" && lualatex --interaction=batchmode --draftmode main.tex 
    cd "Bibliografia/" && lualatex --interaction=batchmode main.tex
    mv "Bibliografia/main.pdf" "Bibliografia/Bibliografia.pdf" 

mapa:
    cd "Scripts/R/" && R CMD BATCH mapa.R

clean target:
    cd {{aulassrc}}{{target}} && rm -f main.aux main.bbl main.bcf *.log main.blg main.log main.out main.run.xml main.lof main.synctex.gz main.toc

clean-all: (clean "Apostila") (clean "00_Introdução") (clean "01") (clean "02") (clean "Signário")
