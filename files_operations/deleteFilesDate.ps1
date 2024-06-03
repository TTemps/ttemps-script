function Remove-OldFiles {
    param(
        [Parameter(Mandatory=$true)]
        [string]$path,

        [Parameter(Mandatory=$true)]
        [string]$dateString
    )

    # Convert the date string to a DateTime object
    $date = Get-Date $dateString

    # Get all files in the path that were last written to before the date
    $files = Get-ChildItem -Path $path -Recurse | Where-Object { $_.LastWriteTime -lt $date }

    # Delete the files
    $files | Remove-Item -Force -ErrorAction SilentlyContinue
}

Remove-OldFiles -path "C:\Program Files\Microsoft SQL Server\MSSQL16.BIMSSQL\MSSQL\Log\" -dateString "05/24/2024 10:00:00"