rootdir := `pwd`
aulassrc := "Aulas/src/"
aulaspdfs := "Aulas/PDFS/"

default:
    just --list

all: (build "Apostila") (build "00_Introdução") (build "01") (build "02") (build "Signário") biblio

build target:
    cd {{aulassrc}}{{target}} && lualatex main.tex --interaction=nonstopmode >> /dev/null && biber main >> /dev/null && lualatex main.tex --interaction=nonstopmode >> /dev/null && lualatex main.tex --interaction=nonstopmode >> /dev/null
    mv {{aulassrc}}{{target}}"/main.pdf"  {{aulaspdfs}}{{target}}".pdf"

debug target:
    cd {{aulassrc}}{{target}} && lualatex main.tex --interaction=nonstopmode && biber main && lualatex main.tex --interaction=nonstopmode && lualatex main.tex --interaction=nonstopmode
    mv {{aulassrc}}{{target}}"/main.pdf"  {{aulaspdfs}}{{target}}".pdf"

biblio:
    cd "Bibliografia/" && lualatex main.tex --interaction=nonstopmode >> /dev/null && biber main >> /dev/null && lualatex main.tex --interaction=nonstopmode >> /dev/null && lualatex main.tex --interaction=nonstopmode >> /dev/null
    mv "Bibliografia/main.pdf" "Bibliografia/Bibliografia.pdf" 

mapa:
    cd "Scripts/R/" && R CMD BATCH mapa.R
