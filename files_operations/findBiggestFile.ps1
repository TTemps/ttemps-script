function findBiggestFiles {
    param (
        [Parameter(Mandatory=$true)] # Chemin de recherche
        [string]$path,
        [Parameter(Mandatory=$true)] # Nombre de fichiers à retourner
        [Int32]$int
    )
    Get-ChildItem -Path $path -Recurse -File -ErrorAction Ignore | Sort-Object -Property Length -Descending | Select-Object -First $int Name, @{Name="Size(GB)"; Expression={$_.Length / 1GB}}

}
