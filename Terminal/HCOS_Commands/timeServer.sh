###Time Source

#Check the system time source
sc timesource show

#Change the system timesource from the commandline where <name> is the DNS name of the new time source.
sc timesource update host <name>

##Manually Set the Node(s') Time
#This command will sync all system nodes to the local nodes' time (right or wrong)
#in order to clear any conditions that may be set due to a time skew.
scdoall "date --set='$(date)'"


#This command will attempt to reach out to a time server (such as time.nist.gov in the example) 
#and sync the nodes' time to the time server.  Replace time.nist.gov with any public or internal 
#NTP server the customer may request and remove the scdoall if you want to attempt this on only one node
scdoall service ntpd stop; scdoall ntpdate time.nist.gov; scdoall service ntpd start
