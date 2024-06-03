function addLocalUser {
    param (
        [Parameter(Mandatory=$true)] # Parameter is mandatory
        [string]$Username
    )
    $user = New-LocalUser -Name $Username -Password (Read-Host -AsSecureString "Enter password") -FullName $Username -Description "Local user account"
    Return $user
}
