#Script de una secuencia de fibonacci
#Iñigo Briñas Pascual
#SI2

#VARIABLES
#Pedimos al usuario por pantalla que nos de el valor del primer numero
Write-Output "Dime el primer elemento "
[int]$num1 = Read-Host
#Pedimos al usuario por pantalla que nos de el valor del segundo numero
Write-Output "Dime el segundo elemento "
[int]$num2 = Read-Host
#Declaramos la variable contador que utilizaremos para que no pase de 20 vece
[int]$contador = 0
#Declaramos la variable que nos servira como ayuda para cambiar el valor de $num1 y $num2
[int]$numtemp = 0

#Iniciamos las comprobaciones necesarias para el correcto fincionamiento del script
#Comprobamos que ni el primer numero ni el segundo sean igual a 0
if ($num1 -eq 0) {
    Write-Host 'El primer numero no puede ser 0'
} elseif ($num2 -eq 0){
    Write-Host 'El segundo numero no puede ser 0'
} else {
#El siguiente if se utiliza para cambiar el valor de las variables en caso de que el primer numero sea mayor que el numero
if ($num1 -gt $num2) {
    $numtemp = $num1
    $num1 = $num2
    $num2 = $numtemp
}
#MEmpezamos a sacar por pantalla la secuencia de numeros
Write-Host $num1
Write-Host $num2
#Creamos un bucle para que se vaya ejecutando la secuencia con un limite de 20 veces
while ($contador -lt 20){
    $numtemp = (($num1) + ($num2))
    $num1 = $num2
    $num2 = $numtemp
    $contador = $contador + 1
    Write-Host $numtemp
}
}