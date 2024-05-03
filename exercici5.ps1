# Verificar si se pasó al menos un argumento
if ($args.Count -eq 0) {
    Write-Host "Error: Debes proporcionar una ruta como argumento."
    exit
}

# Obtener la primera ruta pasada como argumento
$ruta = $args[0]

# Verificar si la ruta especificada existe
if (-not (Test-Path $ruta)) {
    Write-Host "La ruta especificada no existe."
}
elseif (Test-Path $ruta -PathType Container) {
    Write-Host "El contingut del directori $ruta és:"
    Get-ChildItem -Path $ruta -Force
}
else {
    Write-Host "El argument no es ningún directorio."
}
