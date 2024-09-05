#!/bin/bash
salida="patente_out.png"
if ! [ -z "$1" ]; then
    patente=$1
    if ! [ -z "$2" ]; then
        salida=$2
    fi
else
    echo "Uso: $0 [patente, como ABCD12 [archivo destino (por defecto patente_out.png)]]"
    exit 1
fi

primer_par=${patente:0:2}
segundo_par=${patente:2:2}
tercer_par=${patente:4:2}

convert -fill black \
        -font FE-Font \
        -pointsize 115 \
        -gravity center \
        -kerning -0 -annotate -192-55 "$primer_par" \
        -kerning -0 -annotate +0-55 "$segundo_par" \
        -kerning 0 -annotate +192-55 "$tercer_par" \
        -pointsize 28 \
        -kerning 22 -annotate +0+66 'CHILE' \
        fondo_patente_abcd.png \
        -draw "image over 100,-30 35,35 'escudo_patente.png'" "$salida"
