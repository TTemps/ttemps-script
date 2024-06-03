$ipAddress = "10.110.12."
$portRange = 3389..3390

foreach ($port in $portRange) {
    $socket = New-Object System.Net.Sockets.TcpClient
    $result = $socket.BeginConnect($ipAddress, $port, $null, $null)

    # Wait for the connection to complete or timeout after 1 second
    $waitResult = $result.AsyncWaitHandle.WaitOne(10000, $false)

    if ($waitResult -eq $true -and $socket.Connected) {
        Write-Host "Port $port is open"
    } else {
        Write-Host "Port $port is closed"
    }

    $socket.Close()
}