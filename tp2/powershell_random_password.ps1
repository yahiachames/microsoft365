Get-MsolUser | Select -ExpandProperty UserPrincipalName
$users = Get-MsolUser 
$users | ForEach-Object -Process { Set-MsolUserPassword -UserPrincipalName $_.UserPrincipalName -ForceChangePassword $true }