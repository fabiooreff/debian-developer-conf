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

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color AM
AZ="\033[1;34m"  ## Color Azul
BL="\033[1;37m"  ## Color Blanco
CY="\033[1;36m"  ## Color Cyan
GR="\033[0;37m"  ## Color CL
MA="\033[1;35m"  ## Color Magenta
RO="\033[1;31m"  ## Color RO
VE="\033[1;32m"  ## Color VE
CL="\e[0m"       ## Limpiar colores

#############################
##   Variables Generales   ##
#############################

############################
##     IMPORTACIONES      ##
############################

###########################
##       FUNCIONES       ##
###########################

function configurar_iconos(){
    echo -e "$verde Configurando pack de iconos$gris"
    if [ -f "./Paper_Icon.deb" ]
    then
        echo -e "$verde Ya esta$rojo Paper_Icon.deb$verde descargado, omitiendo paso$gris"
    else
        REINTENTOS=5
        echo -e "$verde Descargando$rojo Paper_Icon.deb$gris"
        for (( i=1; i<=$REINTENTOS; i++ ))
        do
            rm ./Paper_Icon.deb 2>> /dev/null
            wget "https://snwh.org/paper/download.php?owner=snwh&ppa=pulp&pkg=paper-icon-theme,16.04" -O Paper_Icon.deb && break
        done
        echo -e "$verde Preparando para instalar$rojo Iconos Paper_Icon$gris"
        sudo dpkg -i Paper_Icon.deb && sudo apt install -f -y
    fi

    #TODO → Establecer "Paper_Icon" como iconos activos
}

function configurar_cursores(){
    echo -e "$verde Configurando pack de cursores$gris"
    sudo apt install -y crystalcursors
    sudo update-alternatives --set x-cursor-theme /etc/X11/cursors/crystalblue.theme 2>> /dev/null
}

function configurar_temas(){
    echo -e "$verde Configurando temas GTK$gris"

    if [ -f "./Paper_Theme.deb" ]
    then
        echo -e "$verde Ya esta$rojo Paper_Theme.deb$verde descargado, omitiendo paso$gris"
    else
        REINTENTOS=5
        echo -e "$verde Descargando$rojo Paper_Theme.deb$gris"
        for (( i=1; i<=$REINTENTOS; i++ ))
        do
            rm ./Paper_Theme.deb 2>> /dev/null
            wget "https://snwh.org/paper/download.php?owner=snwh&ppa=pulp&pkg=paper-gtk-theme,16.04" -O Paper_Theme.deb && break
        done
        echo -e "$verde Preparando para instalar$rojo Iconos Paper_Theme$gris"
        sudo dpkg -i Paper_Theme.deb && sudo apt install -f -y
    fi

    # Instalar Flat-Plat
    if [ -f "./materia-theme-20170605/install.sh" ]
    then
        echo -e "$verde Ya esta$rojo Flat-Plat$verde descargado, omitiendo paso$gris"
    else
        REINTENTOS=5
        echo -e "$verde Descargando$rojo Flat-Plat$gris"
        for (( i=1; i<=$REINTENTOS; i++ ))
        do
            rm -r ./materia-theme-20170605 2>> /dev/null
            curl -sL https://github.com/nana-4/Flat-Plat/archive/v20170605.tar.gz | tar xz && break
        done
        echo -e "$verde Preparando para instalar$rojo Tema Flat-Plat$gris"
        sudo ./materia-theme-20170605/install.sh #2>> /dev/null
    fi

    #TODO → Establecer Flat-Plat como tema activos

    #echo -e "$verde Configurando temas QT$gris"
}

function configurar_grub() {
    echo -e "$verde Configurando fondo del grub$gris"
    #Realmente se hace al copiar fondos en la función "configurar_fondos"
}

function configurar_fondos {
    echo -e "$verde Configurando fondo de pantalla$gris"
    sudo cp -r ./usr/share/desktop-base/softwaves-themes/* /usr/share/desktop-base/softwaves-theme/
    echo -e "$verde Configurando plymouth$gris"
    sudo cp -r ./usr/share/plymouth/themes/softwaves/* /usr/share/plymouth/themes/softwaves/
}

function personalizar() {
    echo -e "$verde Iniciando configuracion de estética general y GTK$gris"
    configurar_iconos
    configurar_cursores
    configurar_temas
    configurar_grub
    configurar_fondos
}
