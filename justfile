rootdir := `pwd`
aulassrc := "Aulas/src/"
aulaspdfs := "Aulas/PDFS/"

default: (build "Apostila") (build "00_Introdução") (build "01") biblio

build target:
    #!/usr/bin/env bash
    cd {{aulassrc}}{{target}}
    lualatex main.tex
    biber main
    lualatex main.tex
    lualatex main.tex
    cd {{rootdir}}
    mv {{aulassrc}}{{target}}"/main.pdf"  {{aulaspdfs}}{{target}}".pdf"

biblio:
    #!/usr/bin/env bash
    cd "Bibliografia/"
    lualatex main.tex
    biber main
    lualatex main.tex
    lualatex main.tex
    cd {{rootdir}}
    mv "Bibliografia/main.pdf" "Bibliografia/Bibliografia.pdf" 
