$wsl = Get-NetIPInterface -InterfaceAlias "vEthernet (WSL)" -AddressFamily IPv4
$vpn = Get-NetIPInterface -InterfaceAlias "イーサネット 2" -AddressFamily IPv4
$ip = Get-NetIPAddress -InterfaceAlias "vEthernet (WSL)" -AddressFamily IPv4
$networkIp = "$($ip.IPAddress -replace "\.\d+$", ".0")"
route delete $networkIp IF $vpn.ifIndex
route add $networkIp mask 255.255.240.0 0.0.0.0 IF $wsl.ifIndex
