Connect-ExchangeOnline
Get-ManagementRoleEntry "Reset Password\*"
Get-ManagementRole -Cmdlet New-Mailbox
New-ManagementRole -Name "MailBox handler" -Description "Allows creating mailbox but not deletion." -Parent "Mail Recipient Creation"