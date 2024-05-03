param (
    [Parameter(Mandatory=$true)]
    [string]$carpetaOrigen,
    
    [Parameter(Mandatory=$true)]
    [string]$directorioDestino
)

# Verificar si la carpeta de origen existe
if (-not (Test-Path -Path $carpetaOrigen -PathType Container)) {
    Write-Error "La carpeta de origen '$carpetaOrigen' no existe. Error 1."
    exit 1
}

# Verificar si el directorio de destino existe, si no existe, crearlo
if (-not (Test-Path -Path $directorioDestino -PathType Container)) {
    Write-Host "El directorio de destino '$directorioDestino' no existe."
    exit 2
}

# Obtener la fecha actual en formato YYYYMMDD
$fecha = Get-Date -Format "yyyyMMdd"

# Construir el nombre del archivo de copia de seguridad
$nombreArchivo = "backup_$(Split-Path -Leaf $carpetaOrigen)_$fecha.zip"

# Verificar si ya existe un archivo con el mismo nombre
if (Test-Path -Path (Join-Path -Path $directorioDestino -ChildPath $nombreArchivo)) {
    Write-Error "Ya existe un archivo de copia de seguridad con el nombre '$nombreArchivo'. Error 2."
    exit 3
}

# Comprimir la carpeta de origen en un archivo .zip
try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::CreateFromDirectory($carpetaOrigen, (Join-Path -Path $directorioDestino -ChildPath $nombreArchivo))
    Write-Output "Copia de seguridad creada correctamente en '$directorioDestino\$nombreArchivo'."
}
catch {
    Write-Error "Error al crear la copia de seguridad: $_"
    exit 4
}
