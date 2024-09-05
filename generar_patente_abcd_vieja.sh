#!/bin/bash
salida="patente_out.png"
if ! [ -z "$1" ]; then
    patente=$1
    if ! [ -z "$2" ]; then
        salida=$2
    fi
else
    echo "Uso: $0 [patente, como ABCD12]"
    exit 1
fi

primer_par=${patente:0:2}
segundo_par=${patente:2:2}
tercer_par=${patente:4:2}

convert -fill black \
        -font Helvetica-Condensed \
        -pointsize 150 \
        -stroke black \
        -strokewidth 4 \
        -gravity center \
        -kerning -7 -annotate -192-15 "$primer_par" \
        -kerning -0 -annotate +0-15 "$segundo_par" \
        -kerning 0 -annotate +192-15 "$tercer_par" \
        -fill black \
        -pointsize 34 \
        -font Helvetica \
        -strokewidth 0 \
        -kerning 22 -annotate +0+68 'CHILE' \
        fondo_patente_abcd.png \
        -draw "image over 100,-30 35,35 'escudo_patente.png'" "$salida"
