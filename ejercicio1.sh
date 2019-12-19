#!/bin/bash
#Script que te pide mediante un dialog unos parametros para la 
#interfaz de red y te los pone a la maquina
#Iñigo Briñas Pascual
#SI2

#VARIABLES GOLBALES
#Declararemos la variables globales de nuestro script
#Adaptador de red que queremos modificar
interfaz=""
#Direccion IP
ip=""
#Puerta de enlace
gateway=""
#Mascara de red
mask=""
#Primer DNS
dns1=""
#Segundo DNS
dns2=""
#Configuracion del adaptador de red
configuracion="auto $interfaz iface $interfaz inet static address $IP netmask $mask gateway $gateway dns-nameservers $dns1 $dns2"

#variable donde se guarda el archivo temporal
#que se genera para guardar la salida de los dialogs
OUTPUT="/tmp/input.txt"

#FUNCIONES
#Declararemos las funciones que se ejecutaran en nuestro script
#Funcion que nos pedira por pantalla la interfaz que queremos cambiar
function pedirinterfaz {
	dialog --title "Adpatador de red" \
	--backtitle "Gestion de los adaptadores de red"
	-inputbox "Nombre del adaptador que queremos modificar" 8 60 2>$OUTPUT
	interfaz=$(<$OUTPUT)
rm /tmp/input.txt
}

#Funcion que nos pedira por pantalla la IP que queremos que tenga el adaptador
function pedirip {
        dialog --title "Direccion IP" \
        --backtitle "Gestion de los adaptadores de red"
        -inputbox "IP que queremos que tenga el adaptador seleccionado" 8 60 2>$OUTPUT
        ip=$(<$OUTPUT)
rm /tmp/input.txt
}

#Funcion que nos pedira por pantalla la puerta de enlace que queremos que tenga el adaptador
function pedirgateway {
        dialog --title "Puerta de enlace" \
        --backtitle "Gestion de los adaptadores de red"
        -inputbox "Puerta de enlace que queremos que tenga el adaptador seleccionado" 8 60 2>$OU$
        gateway=$(<$OUTPUT)
rm /tmp/input.txt
}

#Funcion que nos pedira por pantalla la mascara de red que queremos que tenga el adaptador
function pedirmascara {
        dialog --title "Mascara de red" \
        --backtitle "Gestion de los adaptadores de red"
        -inputbox "Mascara de red que queremos que tenga el adaptador seleccionado" 8 60 2>$OU$
        mask=$(<$OUTPUT)
rm /tmp/input.txt
}

#Funcion que nos pedira por pantalla el primer DNS que queremos que tenga el adaptador
function pedirdns1 {
        dialog --title "Primer DNS" \
        --backtitle "Gestion de los adaptadores de red"
        -inputbox "Primer DNS que queremos que tenga el adaptador seleccionado" 8 60 2>$OU$
        dns1=$(<$OUTPUT)
rm /tmp/input.txt
}

#Funcion que nos pedira por pantalla el segundo dns que queremos que tenga el adaptador
function pedirdns2 {
        dialog --title "Segundo DNS" \
        --backtitle "Gestion de los adaptadores de red"
        -inputbox "Segundo DNS que queremos que tenga el adaptador seleccionado" 8 60 2>$OU$
        dns2=$(<$OUTPUT)
rm /tmp/input.txt
}

#Funcion que nos mostrara la configuracion del adaptador de red que se quiere configurar
function mostrarconfig {
	echo $configuracion
}

#Funcion añadir configuracion, que cambiara el archivo /etc/network/interfaces
function guardarconfig {
	echo $configuracion > /etc/network/interfaces
	exit 0
} 

#Funcion que dibujara el dialogo principal
function dibujardialogoprincipal {
	dialog --menu "Gestion de los adaptadores de red" 20 0 20 Interfaz "Seleccionar interfaz" IP "Configurar IP" Mascara "Configurar mascara de red" Gateway "Configurar puerta de enlace" DNS1 "Primer DNS" DNS2 "Segundo DNS" Configuracion "Mostrar configuracion" Terminar "Sale y guarda la configuracion"
}

#Funcion que leera lo que elija el usuario y lo guardara
function leeropcionusuario {
case $loquedevuelevedialogo in
	Interfaz)
		pedirinterfaz
		;;
	IP)
		pedirip
		;;
	Mascara)
		pedirmascara
		;;
	Gateway)
		pedirgateway
		;;
	DNS1)
		pedirdns1
		;;
	DNS2)
		pedirdns2
		;;
	Configuracion)
		mostrarconfig
		;;
	Terminar)
		guardarconfig
		;;
esac
}

while :
do
	loquedevuelvedialogo=$(dibujardialogoprincipal)
	echo $loquedevuelvedialogo
	leeropcionusuario
done
