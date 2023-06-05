$SmtpServer = 'smtp.office365.com'
$SmtpUser = cat C:\Users\spider\Desktop\email.txt
$smtpPassword = cat C:\Users\spider\Desktop\password.txt
$MailFrom = cat C:\Users\spider\Desktop\email.txt
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SmtpUser, $($smtpPassword | ConvertTo-SecureString -AsPlainText -Force) 
$MailFrom 

Send-MailMessage -To "$MailFrom" -from "$MailFrom" -Subject "3HELLO" -SmtpServer $SmtpServer -UseSsl -Credential $Credentials
