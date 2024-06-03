function Check-SQLAgentService {
    # Get the SQL Server Agent service
    $sqlAgentService = Get-Service | Where-Object { $_.Name -eq 'SQLSERVERAGENT' }

    # Check if the service is running
    if ($sqlAgentService.Status -eq 'Running') {
        return $true
    } else {
        return $false
    }
}