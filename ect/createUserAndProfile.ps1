# Import the required functions from the other scripts
. ".\addLocalUser.ps1"
. ".\createProfileFolder.ps1"

# Call the functions from both scripts
try {
    $user = addLocalUser -Username "TestUser10" -ErrorAction Stop
}
catch {
    Write-Host "Error creating user: $_"
    exit 1
}
$folderPath = createProfileFolder -userFullName $user.FullName

$userFullName = $user.FullName

$acl = Get-Acl $folderPath
$inheritanceFlags = [System.Security.AccessControl.InheritanceFlags]"ContainerInherit, ObjectInherit" # This applies the rule to both folders and files
$propagationFlags = [System.Security.AccessControl.PropagationFlags]::None # This makes the rule apply to all child objects
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule($userFullName, "FullControl", $inheritanceFlags, $propagationFlags, "Allow")
$acl.SetAccessRule($rule)
Set-Acl -Path $folderPath -AclObject $acl