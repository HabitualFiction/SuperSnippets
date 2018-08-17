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

#Serial and Asset of the node
dmidecode -t 1,3 | egrep " 00|Serial"


###Logs
#Messages
less /var/log/Messages

#scaled
less /var/scale/scaled.log

###Raid Array
#Check on the status of the array, useful when receiving "incomplete" or "Recovering" conditions
watch cat /proc/mdstat

###Note Prompts
Drive Replacement: 
Drive: 6SL6FQSH 
Node: CK277Y1 
Asset: 004-130817-000704 

Drive: 
172.16.0.116 35000c50068599b5f 3 sas 6SL6FQSH (errors) OUT OUT

Node:
f985e954-0735-42a1-8ebe-847d4eb76d14 192.168.10.116 172.16.0.116

Smart Data: 
Product: ST3600057SS 
User Capacity: 600,127,266,816 bytes [600 GB] 
Serial number: 6SL6FQSH 
Current Drive Temperature: 47 C 
Number of hours powered up = 24782.65

Error Log: 