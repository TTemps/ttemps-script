SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Script directory: $SCRIPT_DIR"
write-host "Current location: $currentLocation"
Write-Host "Choose a folder to navigate to: 
1 - Automation
2 - Data Processing
3 - Files Operations
4 - Network
5 - Security
6 - System Maintenance"
$folderNumber = Read-Host "Enter the folder number (1-6) "

switch ($folderNumber) {
    1 {
        $scripts = Get-ChildItem -Path ".\automation" -Filter "*.ps1"
    }
    2 {
        $scripts = Get-ChildItem -Path ".\data_processing" -Filter "*.ps1"
        $scripts | ForEach-Object {
            Write-Host $_.Name
        }
        Set-Location -Path ".\data_processing"
    }
    3 {
        $scripts = Get-ChildItem -Path ".\files_operations" -Filter "*.ps1"
        $scripts | ForEach-Object {
            Write-Host $_.Name
        }
        Set-Location -Path ".\files_operations"
    }
    4 {
        $scripts = Get-ChildItem -Path ".\network" -Filter "*.ps1"
        $scripts | ForEach-Object {
            Write-Host $_.Name
        }
        Set-Location -Path ".\network"
    }
    5 {
        $scripts = Get-ChildItem -Path ".\security" -Filter "*.ps1"
        $scripts | ForEach-Object {
            Write-Host $_.Name
        }
        Set-Location -Path ".\security"
    }
    6 {
        $scripts = Get-ChildItem -Path ".\system_maintenance" -Filter "*.ps1"
        $scripts | ForEach-Object {
            Write-Host $_.Name
        }
        Set-Location -Path ".\system_maintenance"
    }
    default {
        Write-Host "Invalid folder number. Please enter a number between 1 and 6."
    }
}
$scriptName = Read-Host "Enter the script name you want to run (without the .ps1 extension)" 
write-host "Running script: $scriptName.ps1"
