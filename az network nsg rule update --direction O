#Download the Talos Threat Feed and save file name as blocklist.txt
wget -O blocklist.txt https://www.talosintelligence.com/documents/ip-blacklist

#set variable $blocklist using file contents from Talos list
#you can test the variable using "echo $blocklist"
blocklist=`cat blocklist.txt`

#Finally update an existing NSG outbound rule with a new list of destination IP addresses
az network nsg rule update --direction Outbound --name TalosThreatFeed-Block --nsg-name ServerSubnetIn --resource-group Azure_Site_Recovery --destination-address-prefixes $blocklist

