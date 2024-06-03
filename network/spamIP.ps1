# Define the IP address you want to ping
$ip = "10.110.12.120"

# Number of parallel jobs
$jobCount = 10000

# Create and start the jobs
$jobs = for ($i = 0; $i -lt $jobCount; $i++) {
    Start-Job -ScriptBlock {
        param($ip, $count)
        # Execute ping command
        Write-Output "Pinging $ip"
        ping $ip -t -l 65000
    } -ArgumentList $ip, $pingCount
}

# Wait for all jobs to complete
$jobs | Wait-Job

# Retrieve and display the output from each job
$results = $jobs | Receive-Job

# Display results
$results
