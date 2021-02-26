##### By: Kevin Sample
##### Download Latest Talos BlockList and set Variable
Invoke-WebRequest -Uri "https://www.talosintelligence.com/documents/ip-blacklist" -OutFile "C:\TMP\TalosBlockList.txt"
$IPBlock = Get-Content -Path "C:\TMP\TalosBlockList.txt"

##### Creates or Updates the firewall rules with latest block list

### If the firewall rule already exists
if (Get-NetFirewallRule -DisplayName TalosBlockList*) {
Set-NetFirewallRule -DisplayName TalosBlockListInbound  -RemoteAddress $IPBlock
Set-NetFirewallRule -DisplayName TalosBlockListOutbound -RemoteAddress $IPBlock
echo "Firewall Rule has been Updated."
}else {
New-NetFirewallRule -DisplayName TalosBlockListInbound -Direction Inbound -RemoteAddress $IPBlock -Action Block -Protocol Any -LocalPort Any
New-NetFirewallRule -DisplayName TalosBlockListOutbound -Direction Outbound -RemoteAddress $IPBlock -Action Block -Protocol Any -LocalPort Any
echo "Firewall Rule has been Created."
}
