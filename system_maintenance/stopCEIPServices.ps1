# Script to disable telemetry and customer experience services on Windows

# Disable Connected User Experiences and Telemetry service
Write-Output "Disabling Connected User Experiences and Telemetry service..."
Stop-Service -Name "DiagTrack" -Force
Set-Service -Name "DiagTrack" -StartupType Disabled

# Disable Diagnostic Policy Service
Write-Output "Disabling Diagnostic Policy Service..."
Stop-Service -Name "DPS" -Force
Set-Service -Name "DPS" -StartupType Disabled

# Disable Windows Error Reporting Service
Write-Output "Disabling Windows Error Reporting Service..."
Stop-Service -Name "WerSvc" -Force
Set-Service -Name "WerSvc" -StartupType Disabled

# Disable Windows Update service
Write-Output "Disabling Windows Update service..."
Stop-Service -Name "wuauserv" -Force
Set-Service -Name "wuauserv" -StartupType Disabled

# Disable Windows Search service
Write-Output "Disabling Windows Search service..."
Stop-Service -Name "WSearch" -Force
Set-Service -Name "WSearch" -StartupType Disabled

# Disable Delivery Optimization service
Write-Output "Disabling Delivery Optimization service..."
Stop-Service -Name "DoSvc" -Force
Set-Service -Name "DoSvc" -StartupType Disabled

# Disable Update Orchestrator Service
Write-Output "Disabling Update Orchestrator Service..."
Stop-Service -Name "UsoSvc" -Force
Set-Service -Name "UsoSvc" -StartupType Disabled

# Disable Background Intelligent Transfer Service
Write-Output "Disabling Background Intelligent Transfer Service..."
Stop-Service -Name "BITS" -Force
Set-Service -Name "BITS" -StartupType Disabled

# Disable Program Compatibility Assistant Service
Write-Output "Disabling Program Compatibility Assistant Service..."
Stop-Service -Name "PcaSvc" -Force
Set-Service -Name "PcaSvc" -StartupType Disabled

# Disable Application Experience service
Write-Output "Disabling Application Experience service..."
Stop-Service -Name "AeLookupSvc" -Force
Set-Service -Name "AeLookupSvc" -StartupType Disabled

# Disable Compatibility Appraiser scheduled task
Write-Output "Disabling Compatibility Appraiser scheduled task..."
Get-ScheduledTask -TaskName "ProgramDataUpdater" | Disable-ScheduledTask
Get-ScheduledTask -TaskName "Microsoft Compatibility Appraiser" | Disable-ScheduledTask

# Disable Customer Experience Improvement Program scheduled tasks
Write-Output "Disabling Customer Experience Improvement Program scheduled tasks..."
Get-ScheduledTask -TaskName "Consolidator" | Disable-ScheduledTask
Get-ScheduledTask -TaskName "UsbCeip" | Disable-ScheduledTask
Get-ScheduledTask -TaskName "KernelCeipTask" | Disable-ScheduledTask

Write-Output "All specified services and scheduled tasks have been disabled."

# Optional: Restart the computer to apply changes
# Write-Output "Restarting the computer to apply changes..."
# Restart-Computer -Force
