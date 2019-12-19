#Script para importar unos usuarios desde un csv
#Iñigo Briñas Pascual
#SI2

# Imprtar el modulo de active directory
Import-Module activedirectory

#Guarda los datos del csv en la variable $ADUsers
$ADUsers = Import-csv C:\Users\Administrador\Desktop\csv.csv

#Hace un loop por cada usuario que encuentre 
foreach ($User in $ADUsers)
{
	#Lee lo que hay en el archivo y lo mete en una variable
		
	$Username 	= $User.username
	$Password 	= $User.password
	$Firstname 	= $User.firstname
	$Lastname 	= $User.lastname
	$OU 		= $User.ou 
    	$email      = $User.email
    	$streetaddress = $User.streetaddress
    	$city       = $User.city
    	$zipcode    = $User.zipcode
    	$state      = $User.state
    	$country    = $User.country
    	$telephone  = $User.telephone
    	$jobtitle   = $User.jobtitle
   	$company    = $User.company
   	$department = $User.department



	#Comprueba si el usuario ya existe
	if (Get-ADUser -F {SamAccountName -eq '$Username'})
	{
	#Si existe te muestra un mensaje de advertencia
		 Write-Warning "A user account with username $Username already exist in Active Directory."
	}
	else
	{
	#Si no existe crea el usuario
	New-ADUser
            -SamAccountName = $Username 
            -UserPrincipalName = "$Username@inigo.com"
            -Name $Firstname $Lastname
            -GivenName $Firstname
            -Surname $Lastname
            -Enabled $True
            -DisplayName $Lastname, $Firstname
            -Path $OU
            -City $city
            -Company $company
            -State $state
            -StreetAddress $streetaddress
            -OfficePhone $telephone
            -EmailAddress $email
            -Title $jobtitle
            -Department $department
            -AccountPassword (convertto-securestring $Password -AsPlainText -Force) -ChangePasswordAtLogon $True        
	}
}