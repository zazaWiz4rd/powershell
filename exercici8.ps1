$usuarios = Get-ChildItem -Path "C:\Users" -Directory

foreach ($usuario in $usuarios) {
    $nombreUsuario = $usuario.Name
    $directorioUsuario = $usuario.FullName
    $ocupacion = Get-ChildItem -Path $directorioUsuario -File -Recurse | Measure-Object -Property Length -Sum
    $ocupacionBytes = $ocupacion.Sum
    $ocupacionMB = $ocupacionBytes / 1MB  # Convertir bytes a megabytes
    Write-Host ("Ocupación de disco para el usuario " + $nombreUsuario + ": " + $ocupacionMB + " MB")
}
