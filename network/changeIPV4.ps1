param (
    [Parameter(Mandatory=$true)] # Parameter is mandatory
    [string]$NewIPAddress,
    [Parameter(Mandatory=$true)]
    [string]$AdapterName
)
#Verify if the ip already exists
$ip = Test-Connection -ComputerName $NewIPAddress -Count 1 -Quiet
if ($ip) {
    Write-Host "IP address already exists"
    exit 1
}
#Verify if the adapter exists
if ($AdapterName) {
    $ipAddress = Get-NetIPAddress -InterfaceAlias $AdapterName -AddressFamily IPv4
    if ($ipAddress) {
        Remove-NetIPAddress -InterfaceAlias $AdapterName -AddressFamily IPv4 -Confirm:$false
        New-NetIPAddress -InterfaceAlias $AdapterName -IPAddress $NewIPAddress -AddressFamily IPv4 -Confirm:$false -PrefixLength 24
        Write-Host "IPv4 address changed to $NewIPAddress"
    } else {
        Write-Host "No matching IP address found for $AdapterName"
        exit 1
    }
} else {
    Write-Host "Network adapter not found"
    exit 1
}