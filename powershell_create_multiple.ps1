# Connect-MsolService
Get-MsolUser
$users = Get-MsolUser
$array_of_userprincipalnames = $users | Select -ExpandProperty UserPrincipalName 
$array_of_displaynames = $users | Select -ExpandProperty DisplayName 
Import-Csv -Path C:\Users\spider\Desktop\HEXAGONE\M365\msonline_add_users.csv  |  ForEach-Object {
If (!($_.UserPrincipalNames -in  $array_of_userprincipalnames) -and ($_.DisplayName -in  $array_of_displaynames))
{
    New-MsolUser -DisplayName $_.DisplayName -FirstName $_.FirstName -LastName $_.LastName -UserPrincipalName $_.UserPrincipalName -UsageLocation $_.UsageLocation -LicenseAssignment $_.AccountSkuId -Department $_.Department -Title $_.JobTitle -MobilePhone $_.MobilePhone
 }
}| Export-Csv -Path C:\Users\spider\Desktop\HEXAGONE\M365\new_msonline_add_users.csv
