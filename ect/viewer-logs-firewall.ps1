Clear-Host
$pathlog='C:\Windows\System32\LogFiles\Firewall\pfirewall.log'
$filecontent=Get-Content -Path $pathlog
$newcontentfile=''
$count=0
ForEach($row in $filecontent)
{
    $count+=1
    If($count -eq 4)
    {
        $row=$row.Replace('#Fields: ','')
        $newcontentfile+=$row+"`n"
    }
    If($count -gt 6)
    {
        $newcontentfile+=$row+"`n"

    }
}
$tempfile="$($env:TEMP)\test.csv"
Set-content -Path $tempfile -Value $newcontentfile
Import-CSV -Delimiter ' ' -Path $tempfile |Out-GridView
