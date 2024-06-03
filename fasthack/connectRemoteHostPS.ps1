try {
    Enable-PSRemoting
}
catch {
    Write-Host "Error: $_"
}
try {
    Set-Item WSMan:\localhost\Client\TrustedHosts * -Force
}
catch {
    Write-Host "Error: $_"
}
try {
    Restart-Service winrm
}
catch {
    Write-Host "Error: $_"
}