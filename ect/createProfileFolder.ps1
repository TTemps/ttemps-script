function createProfileFolder {
    param (
    [Parameter(Mandatory=$true)] 
    [string]$userFullName
)
    # Create the folder path
    $folderPath = "C:\$userFullName"

    # Create the folder if it doesn't exist
    if (-not (Test-Path -Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath | Out-Null
    Write-Host "Folder created successfully at $folderPath"
    } else {
    Write-Host "Folder already exists at $folderPath"
    }
    Return $folderPath
}