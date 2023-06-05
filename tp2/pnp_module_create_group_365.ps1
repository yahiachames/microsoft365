  
Connect-MsolService
$users = Get-MsolUser
$array_of_userprincipalnames_and_departments = $users | Select UserPrincipalName , Department

$array_of_users_in_hr = $array_of_userprincipalnames_and_departments | Where-Object {  $_.Department -eq "Sales"  }
$array_of_users_in_hr_userpprincipalname =  $array_of_users_in_hr | Select -ExpandProperty UserPrincipalName
$array_of_users_in_hr_userpprincipalname 
Connect-PnPOnline -Url https://cdymodulecorp-admin.sharepoint.com -Interactive
New-PnPMicrosoft365Group -DisplayName "Sales Emails" -Description "Sales Email" -MailNickname "SE" -Owners "admin-cdy@cdymodulecorp.onmicrosoft.com" -Members $array_of_users_in_hr_userpprincipalname -IsPrivate  -CreateTeam