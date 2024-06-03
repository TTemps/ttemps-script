# Import the CSV file
$OuADPath = "C:\Users\Administrateur.TRISTAN-SERVEUR.000\Desktop\Import-OuAD.csv" 
$GroupsADPath = "C:\Users\Administrateur.TRISTAN-SERVEUR.000\Desktop\Import-GroupsAD.csv"
$UsersADPath = "C:\Users\Administrateur.TRISTAN-SERVEUR.000\Desktop\Import-UsersFrAD.csv"

$dataOuAD = Import-Csv $OuADPath -Delimiter ";"
$dataGroupsAD = Import-Csv $GroupsADPath -Delimiter ";"
$dataUsersAD = Import-Csv $UsersADPath -Delimiter ";"

foreach ($ou in $dataOuAD) {
    New-ADOrganizationalUnit  -Name $ou.Name -Path $ou.DistinguishedName -WhatIf
}
foreach ($group in $GroupsADPath) {
    New-ADGroup -Name $group.Name -Path $group.DistinguishedName -WhatIf
}
foreach ($user in $UsersADPath) 
{
    #Prenom;Nom;SamAccount;Mail;Adresse;Ville;CP;Pays;Service;Password;Tel;Titre;Ou;Groupe
    $user = New-ADUser -Name $user.Prenom -Surname $user.Nom -SamAccountName $user.SamAccount -EmailAddress $user.Mail -StreetAddress $user.Adresse -City $user.Ville -PostalCode $user.CP -Country $user.Pays -Department $user.Service -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) -OfficePhone $user.Tel -Title $user.Titre -WhatIf

}
