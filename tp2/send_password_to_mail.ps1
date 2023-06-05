$array_of_userprincipalnames = Get-MsolUser
$array_of_userprincipalnames
$SmtpServer = 'smtp.office365.com'
$SmtpUser = cat C:\Users\spider\Desktop\email.txt
$smtpPassword = cat C:\Users\spider\Desktop\password.txt
$MailFrom = cat C:\Users\spider\Desktop\email.txt
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SmtpUser, $($smtpPassword | ConvertTo-SecureString -AsPlainText -Force) 

 
$array_of_userprincipalnames | ForEach-Object -Process { $password = Set-MsolUserPassword -UserPrincipalName $_.UserPrincipalName -ForceChangePassword $true
    Send-MailMessage -To $_.UserPrincipalName -from "$MailFrom" -Subject $password -SmtpServer $SmtpServer -UseSsl -Credential $Credentials

}
