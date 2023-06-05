  
# Connect-MsolService
$users = Get-MsolUser
$array_of_userprincipalnames_and_departments = $users | Select UserPrincipalName , Department

$array_of_users_in_hr = $array_of_userprincipalnames_and_departments | Where-Object {  $_.Department -eq "Training"  }
$array_of_users_in_hr_userpprincipalname =  $array_of_users_in_hr | Select -ExpandProperty UserPrincipalName
$array_of_users_in_hr_userpprincipalname 
# Connect-PnPOnline -Url https://cdymodulecorp-admin.sharepoint.com -Interactive
# New-PnPAzureADGroup -DisplayName "Training" -Description "Training analytics tools" -MailNickname "Training" -Owners "admin-cdy@cdymodulecorp.onmicrosoft.com" -Members $array_of_users_in_hr_userpprincipalname -GroupTypes "DynamicMembership"
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All" ,"Application.Read.All"

Import-Module Microsoft.Graph.Users



$training_users = Get-MgUser -Search "department:Training" -ConsistencyLevel eventual 
$training_users
$users_ids = $training_users  | Select -ExpandProperty Id 
$users_ids
$members_arr = [System.Collections.ArrayList]@()
foreach ($currentUser in $users_ids) {
   $members_arr.Add("https://graph.microsoft.com/v1.0/users/" + $currentUser) 
}
$members_arr
$owner_user = Get-MgUser -Search "userprincipalname:admin-cdy@cdymodulecorp.onmicrosoft.com" -ConsistencyLevel eventual | Select -ExpandProperty Id 
$owner_array = [System.Collections.ArrayList]@("https://graph.microsoft.com/v1.0/users/"+$owner_user)
$owner_array
Import-Module Microsoft.Graph.Groups

$params = @{
	Description = "Training"
	DisplayName = "Training"
	GroupTypes = @(
		"DynamicMembership"
	)
    "Members@odata.bind" = $members_arr
	MailEnabled = $true
    "Owners@odata.bind" = $owner_array
	MailNickname = "Training"
	SecurityEnabled = $false
}
Connect-MgGraph -Scopes "Group.ReadWrite.All","Directory.ReadWrite.All" Interactive
New-MgGroup  -BodyParameter $params