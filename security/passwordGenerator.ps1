<#
.SYNOPSIS
Generates a new password.

.DESCRIPTION
This function generates a new password using a random combination of characters.

.PARAMETER Length
Specifies the length of the password to be generated.

.PARAMETER IncludeUppercase
Specifies whether the password should include uppercase letters.

.PARAMETER IncludeLowercase
Specifies whether the password should include lowercase letters.

.PARAMETER IncludeNumbers
Specifies whether the password should include numbers.

.PARAMETER IncludeSpecialChars
Specifies whether the password should include special characters.

.PARAMETER ExcludeChars
Specifies any characters that should be excluded from the password.

.EXAMPLE
New-Password -Length 10
Generates a new password with a length of 10 characters.

.EXAMPLE
New-Password -Length 10 -IncludeUppercase $false -IncludeLowercase $true -IncludeNumbers $true -IncludeSpecialChars $true
Generates a new password with a length of 10 characters, excluding uppercase letters.
#>
function New-Password {
    param (
        [int]$Length = 8,  # Default password length is 8
        [bool]$IncludeUppercase = $true,  # Include uppercase letters
        [bool]$IncludeLowercase = $true,  # Include lowercase letters
        [bool]$IncludeNumbers = $true,  # Include numbers
        [bool]$IncludeSpecialChars = $true,  # Include special characters
        [string]$ExcludeChars = ""  # Exclude specific characters [optional]
    )

    $UppercaseChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    $LowercaseChars = "abcdefghijklmnopqrstuvwxyz"
    $NumberChars = "0123456789"
    $SpecialChars = "!@#$%^&*()_+-=[]{}|;':,.<>/?`~"

    $Password = ""

    $CharSet = ""
    if ($IncludeUppercase) { $CharSet += $UppercaseChars }
    if ($IncludeLowercase) { $CharSet += $LowercaseChars }
    if ($IncludeNumbers) { $CharSet += $NumberChars }
    if ($IncludeSpecialChars) { $CharSet += $SpecialChars }
    if ($ExcludeChars) { $CharSet = $CharSet -replace "[$ExcludeChars]" } 
    # Generate the password
    for ($i = 1; $i -le $Length; $i++) {
        $RandomChar = Get-Random -Minimum 0 -Maximum $CharSet.Length
        $Password += $CharSet[$RandomChar]
    }

    # Output the generated password
    $Password
}
