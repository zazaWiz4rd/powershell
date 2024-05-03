if ($args.Length -ne 1) {
    Write-Host 'need 1 arg (csv txt).'
}

$csvfile = $args[0]

if (Test-Path $csvfile) {
    $csvdata = Import-Csv -Path $csvfile
    foreach ($row in $csvdata) {
        Write-Host "Username : $($row.Username), Role: $($row.Role), Email: $($row.Email)"
    }
}