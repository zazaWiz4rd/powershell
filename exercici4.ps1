param (
    [string]$ruta
)

# Verificar si la ruta especificada existe
if (-not (Test-Path $ruta)) {
    Write-Host "La ruta especificada no existe."
}
else {
    # Verificar si la ruta es un archivo regular
    if (Test-Path $ruta -PathType Leaf) {
        Write-Host "$ruta és un fitxer regular."
    }
    # Verificar si la ruta es un directorio
    elseif (Test-Path $ruta -PathType Container) {
        Write-Host "$ruta és un directori."
    }
    else {
        Write-Host "No es pot determinar si $ruta és un fitxer regular o un directori."
    }
}
