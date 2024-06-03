. .\checkrunningservice.ps1
function Send-Email {
    param(
        [string]$smtpServer = "mail.ais2024.edu",
        [string]$from = "tristan@ais2024.edu",
        [string]$to = "denis@ais2024.edu",
        [string]$subject = "Arrêt du service SQL Server Agent !",
        [string]$body = "Le service SQL AGENT sur $env:COMPUTERNAME s'est stoppé.",
        [string]$password = "tristan"
    )

    $pwd = ConvertTo-SecureString $password -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential ($from, $pwd)

    # Send the email
    Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body -Credential $cred -Encoding utf8
}

Send-Email