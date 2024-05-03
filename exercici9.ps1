param(
    [Parameter(Mandatory=$true)]
    [string[]]$directorios
)

foreach ($directorio in $directorios) {
    if (Test-Path -Path $directorio -PathType Container) {
        $ocupacion = Get-ChildItem -Path $directorio -File -Recurse | Measure-Object -Property Length -Sum
        $ocupacionBytes = $ocupacion.Sum
        $ocupacionMB = $ocupacionBytes / 1MB  # Convertir bytes a megabytes
        Write-Host ("Ocupación de disco para el directorio " + $directorio + ": " + $ocupacionMB + " MB")
    }
    else {
        Write-Host ("El directorio " + $directorio + " no es válido o no existe.")
    }
}
