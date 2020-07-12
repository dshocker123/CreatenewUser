# import required modules
Import-module ActiveDirectory
$exit = ""

while($exit -ne "q") {
$firstname = Read-Host -Prompt "Please enter your first name"
$lastname = Read-Host -Prompt "Please enter your last name"
$password = "Password1"
$username = Read-Host -Prompt "Please enter your username"

echo "Your full name is $firstname $lastname. Your password is $password"

#specify where to store user account
$OUpath = "OU=Letsdoit,DC=annieb,DC=com"

#Convert the password to a secure string
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

# Create the user account
New-ADUser -Name "$firstname $lastname" -GivenName $firstname -Surname $lastname -UserPrincipalName "$username" -Path $OUpath -Enabled $True -AccountPassword $securePassword -ChangePasswordAtLogon $True  

Add-ADGroupMember -Identity dshocker -Members "$firstname $lastname"

#exit the loop
$exit = Read-Host -Prompt "Type 'q' to stop creating user account."
}