function generateTestFiles {
    param (
        [Parameter(Mandatory=$true)] # Taille des fichiers
        [Int32]$taille,
        [Parameter(Mandatory=$true)] # Chemin de destination
        [String]$chemin,
        [Parameter(Mandatory=$true)] # Nombre de fichiers à créer
        [Int32]$nb
    )
    for ($i = 1; $i -le $nb; $i++) {
        fsutil.exe file createnew $chemin$i.txt $taille
    }
}

generateTestFiles -taille 10000000 -chemin "D:\" -nb 100