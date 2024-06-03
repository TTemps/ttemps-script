#check the ip range for the network
$iprange = 1..254
$computerName = "10.110.12."
$login = "ais2024"
$login2 = "troll"
$password = "P@ssw0rd"

$cred = New-Object System.Management.Automation.PSCredential ($login, (ConvertTo-SecureString $password -AsPlainText -Force))
$cred2 = New-Object System.Management.Automation.PSCredential ($login2, (ConvertTo-SecureString $password -AsPlainText -Force))
foreach ($ip in $iprange) {
    # Test if PowerShell Remoting is enabled on the remote machine
    $localComputerName = $computerName + $ip
    #Write-Host "Checking if PowerShell Remoting is enabled on $localComputerName..."
    try {
        $session = New-PSSession -ComputerName $localComputerName -Credential $cred -ErrorAction Stop
        Remove-PSSession $session
        Write-Host "PowerShell Remoting is enabled on $localComputerName."
    }
    catch {
        #Write-Host "PowerShell Remoting is not enabled on $localComputerName. Please enable it by running the following commands on the remote machine:"
    }
    #Write-Host "Checking if PowerShell Remoting is enabled on $localComputerName... 2"
    try {
        $session = New-PSSession -ComputerName $localComputerName -Credential $cred2 -ErrorAction Stop
        Remove-PSSession $session
        Write-Host "PowerShell Remoting is enabled on $localComputerName."
    }
    catch {
        #Write-Host "PowerShell Remoting is not enabled on $localComputerName. Please enable it by running the following commands on the remote machine:"
    }
    
}

