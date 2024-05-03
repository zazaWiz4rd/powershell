# Definimos una tupla con los números del 0 al 10
$rangosPermitidos = 0..10

# Bucle para asegurarse de que se introduzca un número válido
do {
    # Demanem a l'usuari que introdueixi la nota
    $nota = Read-Host "Introdueix la nota (un nombre enter entre 0 y 10)"

    # Convertir la nota a un número entero
    $nota = [int]$nota

    # Comprobamos si la nota está dentro del rango permitido
    if ($rangosPermitidos -notcontains $nota) {
        Write-Host "La nota introduïda està fora del rang permès (0 a 10). Si us plau, torna a intentar-ho."
    }
    else {
        # Determinamos la calificación correspondiente
        if ($nota -ge 0 -and $nota -le 2) {
            $qualificacio = "D"
        }
        elseif ($nota -ge 3 -and $nota -le 4) {
            $qualificacio = "C-"
        }
        elseif ($nota -ge 5 -and $nota -le 6) {
            $qualificacio = "C+"
        }
        elseif ($nota -ge 7 -and $nota -le 8) {
            $qualificacio = "B"
        }
        elseif ($nota -ge 9 -and $nota -le 10) {
            $qualificacio = "A"
        }
        else {
            $qualificacio = "Nota fora de rang"
        }

        # Mostramos la calificación
        Write-Output "La nota introduïda correspon a la qualificació: $qualificacio"
    }
} while ($rangosPermitidos -notcontains $nota) # El bucle continua hasta que se introduce un número dentro del rango
