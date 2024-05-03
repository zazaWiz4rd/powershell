# Definimos una función para mostrar el mensaje de error cuando se introduce una nota fuera de rango
function MostrarError {
    Write-Host "La nota introduïda està fora del rang permès (0 a 10). Si us plau, torna a intentar-ho."
}

# Bucle para asegurarse de que se introduzca un número válido
do {
    # Pedimos al usuario que introduzca la nota
    $nota = Read-Host "Introdueix la nota (un nombre enter entre 0 i 10)"

    # Convertimos la entrada a un número entero
    $nota = [int]$nota

    # Comprobamos si la nota está dentro del rango permitido
    if ($nota -ge 0 -and $nota -le 10) {
        # Utilizamos la estructura switch para determinar la calificación correspondiente
        switch ($nota) {
            {$_ -ge 0 -and $_ -le 2} { $qualificacio = "D" }
            {$_ -ge 3 -and $_ -le 4} { $qualificacio = "C-" }
            {$_ -ge 5 -and $_ -le 6} { $qualificacio = "C+" }
            {$_ -ge 7 -and $_ -le 8} { $qualificacio = "B" }
            {$_ -ge 9 -and $_ -le 10} { $qualificacio = "A" }
            default { $qualificacio = "Nota fora de rang" }
        }

        # Mostramos la calificación
        Write-Output "La nota introduïda correspon a la qualificació: $qualificacio"
        break
    } else {
        MostrarError
    }
} until ($nota -ge 0 -and $nota -le 10)
