# Ruta del archivo CSV
$csvFile = "C:\Users\Administrador\Desktop\scripts\csv.txt"

# Comprueba si el archivo CSV existe
if (Test-Path $csvFile) {
    # Define el archivo donde se escribirá la información de los usuarios
    $outputFile = "usuaris.txt"

    # Lee el archivo CSV y recorre cada línea
    Get-Content $csvFile | ForEach-Object {
        # Divide la línea por la coma para obtener los valores
        $userData = $_ -split ','

        # Obtiene los datos de la línea actual
        $username = $userData[0]
        $organizationalUnit = $userData[1]
        $email = $userData[2]

        # Muestra la información del usuario en pantalla
        Write-Host "Usuari $username que pertany a la UO $organizationalUnit i correu electrònic $email"

        # Escribe la información del usuario en el archivo de salida
        Add-Content -Path $outputFile -Value "Usuari $username que pertany a la UO $organizationalUnit i correu electrònic $email"
    }
} else {
    # Si el archivo CSV no existe, muestra un mensaje de error
    Write-Host "Error: El archivo $csvFile no existe."
}

