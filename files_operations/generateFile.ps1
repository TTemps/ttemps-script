# Description: This script will generate a number of files with random names and content
function GenerateFilesNamed {
    param (
        [Parameter(Mandatory=$true)]
        [int]$number,
        [string]$path = "C:\generatedFiles\"
    )
    for ($i = 1; $i -le $number; $i++) {
        $random = Get-Random -Minimum 100000000000 -Maximum 9999999999999999
        $file = New-Item -Path "$path\file$random.txt" -ItemType File
        # Add content to the file
        Add-Content -Path $file.FullName -Value "This is the content of file $random"
        # add content 
        Write-Progress -Activity "Generating Files" -Status "Generating File $i/$number" -PercentComplete (($i/$number) * 100)
    }
}
GenerateFilesNamed -number 100 