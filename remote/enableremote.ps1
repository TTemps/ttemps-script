try {
    # Enable PowerShell Remoting
    Enable-PSRemoting -Force

    # Start the WinRM service and set it to start automatically
    Set-Service -Name WinRM -StartupType Automatic -Status Running

    # Create a firewall rule that allows incoming connections
    New-NetFirewallRule -Name "WinRM (HTTP-In)" -DisplayName "Windows Remote Management (HTTP-In)" -Enabled True -Profile Any -Action Allow -Direction Inbound -LocalPort 5985 -Protocol TCP

    # Add the client computer to the list of trusted hosts
    Set-Item WSMan:\localhost\Client\TrustedHosts -Value "10.110.12.100" -Force

    Write-Host "PowerShell Remoting has been enabled and the client computer has been added to the list of trusted hosts."
}
catch {
    Write-Host "Error: $_"
    exit 1
}