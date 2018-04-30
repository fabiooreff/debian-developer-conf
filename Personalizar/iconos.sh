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
## Instala los iconos en el sistema de forma global

############################
##       FUNCIONES        ##
############################
instalar_iconos() {
    if [[ -d '/usr/share/icons/fryntiz' ]]; then
        rm -Rf '/usr/share/icons/fryntiz'
    fi

    cp -r '$WORKSCRIPT/conf/usr/share/icons/fryntiz' '/usr/share/icons/fryntiz'
}
