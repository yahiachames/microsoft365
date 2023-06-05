Connect-MsolService
Get-MsolUser
Write-Host "Congratulations! Your first script executed successfully"
New-MsolUser -DisplayName "David Smith" -FirstName David -LastName Smith -UserPrincipalName "ds-user@cdymodulecorp.onmicrosoft.com" -UsageLocation US -LicenseAssignment cdymodulecorp:DEVELOPERPACK_E5