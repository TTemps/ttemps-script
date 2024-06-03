# Get the Windows Temp directory of the current user
$windowsTemp = $env:TEMP
# Remove every item in the Windows Temp directory of the user
Remove-Item -Path $windowsTemp -Recurse -Force -ErrorAction Ignore
# Get the Windows Temp directory of the computer
$windowsTemp = $env:windir + "\Temp"
# Remove every item in the Windows Temp directory of the computer
Remove-Item -Path $windowsTemp -Recurse -Force -ErrorAction Ignore



