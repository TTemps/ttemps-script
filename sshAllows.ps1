# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Start the OpenSSH Server service
Start-Service sshd

# Set the OpenSSH Server service to start automatically
Set-Service -Name sshd -StartupType 'Automatic'

# Allow connections from the local subnet
# Note: Replace "192.168.1.0/24" with your local subnet
New-NetFirewallRule -DisplayName 'OpenSSH SSH Server (sshd)' -LocalPort 22 -Protocol TCP -Action Allow -RemoteAddress 10.110.12.0/24

# Create a user
# Note: Replace "Username" and "Password" with the desired username and password
New-LocalUser -Name "sshL" -Password (ConvertTo-SecureString -String "P@$$w0rd" -AsPlainText -Force) -FullName "Full Name" -Description "Description"

# Add the user to the Administrators group
Add-LocalGroupMember -Group "Administrateurs" -Member "sshL"

# Remove the newly created user
# Note: Replace "Username" with the desired username
# Remove-LocalUser -Name "sshL"

# # Remove the OpenSSH Server service
# Stop-Service sshd
# Set-Service -Name sshd -StartupType 'Manual'
# Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
# Remove-NetFirewallRule -DisplayName 'OpenSSH SSH Server (sshd)'
