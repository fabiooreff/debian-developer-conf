#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
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

sqlite_descargar() {
    echo -e "$VE Descargando$RO sqlite$CL"
}

sqlite_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO sqlite$CL"
}

sqlite_instalar() {
    echo -e "$VE Instalando$RO sqlite$CL"
    instalarSoftware 'sqlite sqlite3'

    echo -e "$VE Instalando paquetes complementarios de$RO sqlite$CL"
    local complementarios=''
    instalarSoftware "$complementarios"
}

sqlite_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones de$RO sqlite$CL"
}

sqlite_instalador() {
    sqlite_descargar
    sqlite_preconfiguracion
    sqlite_instalar
    sqlite_postconfiguracion
}
