#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2017 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Instala el editor de Base de Datos Dbeaver

############################
##     IMPORTACIONES      ##
############################

###########################
##       FUNCIONES       ##
###########################

function dbeaver_descargar() {
    descargar 'dbeaver.deb' 'https://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb'
}

function dbeaver_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO DBeaver$CL"
}

function dbeaver_instalar() {
    echo -e "$VE Instalando$RO DBeaver$CL"
    sudo dpkg -i "$WORKSCRIPT/tmp/dbeaver.deb" && sudo apt install -f -y
}

function dbeaver_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones$RO DBeaver$CL"
}

function dbeaver_instalador() {
    echo -e "$VE Comenzando instalación de$RO DBeaver$CL"

    dbeaver_preconfiguracion

    if [[ -f '/usr/bin/dbeaver' ]]; then
        echo -e "$VE Ya esta$RO Dbeaver$VE instalado en el equipo, omitiendo paso$CL"
    else
        if [[ -f "$WORKSCRIPT/tmp/dbeaver.deb" ]]; then
            dbeaver_instalar
        else
            dbeaver_descargar
            dbeaver_instalar
        fi
    fi

    dbeaver_postconfiguracion
}
