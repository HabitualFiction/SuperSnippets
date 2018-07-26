## Find admin password
# Don't just give this out...actually reset the password instead
sqlite3 /fsscale0/lib/cluster_stor.db "select * from users;"

#UI Password reset
#2.x, UI will ask if you're sure and will then reset password to 'scale'
scpasswordreset

#3.x to 4.1.9 - no prompt, the password is now 'scale'
sqlite3 /fsscale0/lib/cluster_stor.db "update users set password= 'scale' where username='admin';"

#4.2+
sc update user name <username> password <password>
