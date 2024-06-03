# Create the PowerShell script to launch Firefox
$scriptContent = @'
# Path to Firefox executable
$firefoxPath = "C:\\Program Files\\Mozilla Firefox\\firefox.exe"

# Additional commands or actions can be added here
# For example, logging or setting environment variables

# Launch Firefox
Start-Process -FilePath $firefoxPath
'@

# Path to save the new PowerShell script
$ps1Path = "C:\Scripts\launch_firefox.ps1"

# Ensure the directory exists
if (-Not (Test-Path -Path (Split-Path $ps1Path))) {
    New-Item -Path (Split-Path $ps1Path) -ItemType Directory -Force
}

# Save the script content to the file
Set-Content -Path $ps1Path -Value $scriptContent

# Path to the Firefox desktop shortcut
$shortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "Mozilla Firefox.lnk")

# Create a new WScript.Shell COM object
$shell = New-Object -ComObject WScript.Shell

# Load the existing shortcut
$shortcut = $shell.CreateShortcut($shortcutPath)

# Modify the TargetPath to point to PowerShell with the script as an argument
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-NoLogo -NoProfile -ExecutionPolicy Bypass -File `"$ps1Path`""

# Save the modified shortcut
$shortcut.Save()

Write-Output "The Firefox shortcut has been modified to run the PowerShell script."