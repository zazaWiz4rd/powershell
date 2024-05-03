#Crear el directori scripts a l'escriptori de l'usuari
New-Item -ItemType Directory -Path "$env:USERPROFILE\Desktop\scripts"
#Moure l'script al directori scripts
Move-Item -Path "$env:USERPROFILE\Desktop\exercici1.ps1" -Destination "$env:USERPROFILE\Desktop\scripts"
#Afegir el directori scripts al PATH del sistema
$Env:PATH += ";$env:USERPROFILE\Desktop\scripts"