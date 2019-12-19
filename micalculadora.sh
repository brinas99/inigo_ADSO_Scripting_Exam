#!/bin/bash
#Script para hacer una clculadora desde la linea de comandos
#Iñigo Briñas Pascual
#SI2

#DECLARAMOS LAS VARIABLES
#Iniciamos la variable num1
let num1
#Leemos por pantalla un valor y lo introducimos a la variable num1
read -p "Primer numero: " num1
#Iniciamos la variable num2
let num2
#Leemos por pantalla un valor y lo introducimos a la variable num2
read -p "Segundo numero: " num2
#Iniciamos la variable resultado
resultado=""
#Iniciamos la variable resto
resto=""

#MENU PRINCIPAL
#Mostramos el menu principal que tendra nuestra calculadora
while :
do
	echo "¿Que opercion quieres hacer?"
	echo "Da al 1 para hacer la suma"
	echo "Da al 2 para hacer la resta"
	echo "Da al 3 para hacer el producto"
	echo "Da al 4 para hacer la division"
	echo "Da al 5 para hacer el porcentaje"
	echo "Da al 0 para salir"

#FUNCIONES
#Lee lo que el usuario le mete por pantalla
read -p "Calculadora " eleccion
	case $eleccion in
		#si le dan al 0 salen del programa
		0)
			exit 0
			;;
		#si le dan al 1 hace la suma
		1)
			resultado=$(($num1 + $num2))
			echo "El resultado de la suma de los operadores $num1 y $num2 es: $resultado"
			echo suma > operaciones.txt
			;;
		#si le dan al 2 hace la resta
		2)
			resultado=$(($num1 - $num2))
			echo "El resultado de la resta de los operadores $num1 y $num2 es: $resultado"
			echo resta >> operaciones.txt
			;;
		#si le dan al 3 hace el producto
		3)
			resultado=$(($num1 * $num2))
			echo "El resultado del producto de los operadores $num1 y $num2 es: $resultado"
			echo producto >> operaciones.txt
			;;
		#si le dan al 4 compruba si se esta dividiendo por 0, sino, saca el cociente y el resto
		4)
			if [ $num2 -eq 0 ]
			then
				echo "No se puede dividir por 0"
			else
				resultado=$(($num1 / $num2))
				resto=$(($num1 % $num2))
				echo "El resultado de la division de los operadores $num1 y $num2 es: $resultado y el resto es $resto"
				echo division >> operaciones.txt
			fi
			;;
		#si le dan al 5 saca el porcentaje
		5)
			resultado=$(($num1 * $num2 / 100))
			echo "$num1 respecto a $num2 supone un porcentaje de $resultado"
			echo porcentaje >> operaciones.txt
			;;
		#Si le dan a una opcion no valida muestra este mensaje
		*)
			echo "Error: No es una opcion " ;;
	esac
done
echo "Eres de los pocos que veran esto jajasalu2"

