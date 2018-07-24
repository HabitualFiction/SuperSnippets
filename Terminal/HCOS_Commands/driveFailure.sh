###Condition Show

#Shows all currently set conditions
sc condition show display set

#Shows all conditions possible
sc condition show



###Drive & Node Data

#Show drive condition and information
sc drive show

#Show node condition and information
sc node show

#Smart data lookup
smartctl /dev/sd<enumerator of the drive>


###Logs

#Messages
less /var/log/Messages

#scaled
less /var/scale/scaled.log



