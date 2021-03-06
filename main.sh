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
## Script principal
## Desde aquí se llamaran a todos los demás scripts separando
## funciones para cada uno de ellos.
##
## Ten en cuenta que este script hace modificaciones en el equipo a mi gusto
## Puede no funcionar correctamente si usas software de repositorios externo
## Probablemente no funcionará en otras distribuciones distintas
## a Debian rama Stable.

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
AZ="\033[1;34m"  ## Color Azul
BL="\033[1;37m"  ## Color Blanco
CY="\033[1;36m"  ## Color Cyan
GR="\033[0;37m"  ## Color Gris
MA="\033[1;35m"  ## Color Magenta
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script
VERSION='0.8.0'  ## Versión en desarrollo
LOGERROR="$WORKSCRIPT/errores.log"  ## Archivo donde almacenar errores
DEBUG=false      ## Establece si está el script en modo depuración

############################
##     IMPORTACIONES      ##
############################
source "$WORKSCRIPT/funciones.sh"
source "$WORKSCRIPT/configuraciones.sh"
source "$WORKSCRIPT/limpiador.sh"

source "$WORKSCRIPT/Apps/0_Main.sh"
source "$WORKSCRIPT/Personalizar/0_Main.sh"
source "$WORKSCRIPT/Servidores/0_Main.sh"
source "$WORKSCRIPT/Repositorios/0_Main.sh"
source "$WORKSCRIPT/Lenguajes-Programacion/0_Main.sh"
source "$WORKSCRIPT/Desktops/0_Main.sh"
source "$WORKSCRIPT/Usuario/0_Main.sh"
source "$WORKSCRIPT/Root/0_Main.sh"
source "$WORKSCRIPT/VPS/0_Main.sh"

###########################
##       VARIABLES       ##
###########################
errores=()

###########################
##       FUNCIONES       ##
###########################
menuPrincipal() {
    while true :; do
        clear

        local descripcion='Menú Principal
            1) Repositorios
            2) Aplicaciones
            3) Configuraciones
            4) Personalización
            5) Servidores
            6) Lenguajes de Programación
            7) Configurar este Usuario
            8) Todos los pasos anteriores a la vez

            9) Desktops
            10) Configurar root
            11) Configurar VPS

            0) Salir
        '
        echo -e "$AZ Versión del script →$RO $VERSION$CL"
        opciones "$descripcion"

        echo -e "$RO"
        read -p '    Acción → ' entrada
        echo -e "$CL"

        case ${entrada} in

            1) menuRepositorios;;          ## Menú de Repositorios
            2) menuAplicaciones;;          ## Menú de Aplicaciones
            3) instalar_configuraciones;;  ## Menú de Configuraciones
            4) menuPersonalizacion;;       ## Menú de Personalización
            5) menuServidores;;            ## Menú de Servidores
            6) menuLenguajes;;
            7) menuUsuario;;
            8) menuRepositorios -a         ## Todos los pasos
               menuAplicaciones -a
               instalar_configuraciones
               menuPersonalizacion -a
               menuServidores -a
               menuLenguajes -a;;
            9) menuDesktops;;
            10) menuRoot;;
            11) menuVPS;;

            0) ## SALIR
              clear
              echo -e "$RO Se sale del menú$CL"
              echo ''
              exit 0;;

            *)  ## Acción ante entrada no válida
              clear
              echo ""
              echo -e "                   $RO ATENCIÓN: Elección no válida$CL";;
        esac
    done
}

###########################
##       EJECUCIÓN       ##
###########################
menuPrincipal
