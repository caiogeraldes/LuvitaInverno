rootdir := `pwd`
aulassrc := "Aulas/src/"
aulaspdfs := "Aulas/PDFS/"

default:
    just --list

all: (build "Apostila") (build "00_Introdução") (build "01") biblio

build target:
    cd {{aulassrc}}{{target}} && lualatex main.tex --interaction=nonstopmode >> /dev/null && biber main >> /dev/null && lualatex main.tex --interaction=nonstopmode >> /dev/null && lualatex main.tex --interaction=nonstopmode >> /dev/null
    mv {{aulassrc}}{{target}}"/main.pdf"  {{aulaspdfs}}{{target}}".pdf"

biblio:
    cd "Bibliografia/" && lualatex main.tex --interaction=nonstopmode >> /dev/null && biber main >> /dev/null && lualatex main.tex --interaction=nonstopmode >> /dev/null && lualatex main.tex --interaction=nonstopmode >> /dev/null
    mv "Bibliografia/main.pdf" "Bibliografia/Bibliografia.pdf" 
