$resourceGroup = "bchennu-RG"
$location = "eastus"
$vmName = "bchennu-VM"
$vnetName = "bchennu-vnet-1"
$subnetName = "bchennu-subnet-1"

Write-Host "====== Azure provisioning starts ==================="

#create a resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

#create a subnet
$subnetConfig = New-AzVirtualNetworkSubnetConfig -Name $subnetName `
-AddressPrefix 192.168.1.0/24

#create a virtual network - vnet
$vnet = New-AzVirtualNetwork -ResourceGroupName $resourceGroup `
-Location $location `
-Name $vnetName `
-AddressPrefix 192.168.0.0/16 `
-Subnet $subnetConfig

#create a public IP
$pip = New-AzPublicIpAddress `
-ResourceGroupName $resourceGroup `
-Location $location `
-Name "bchennu-public-ip" `
-AllocationMethod Static `
-IdleTimeoutInMinutes 4

#creates NSG Rules Config
$nsgRuleSSH = New-AzNetworkSecurityRuleConfig `
-Name "bchennu-nsg-1" `
-Protocol Tcp `
-Direction Inbound `
-Priority 1000 `
-SourceAddressPrefix * `
-SourcePortRange * `
-DestinationAddressPrefix * `
-DestinationPortRange 22 `
-Access Allow

#creates NSG
$nsg = New-AzNetworkSecurityGroup `
-ResourceGroupName $resourceGroup `
-Location $location `
-Name "bchennu-nsg-1"  `
-SecurityRules $nsgRuleSSH

#create a NIC , associate with Public IP and NSG
$nic = New-AzNetworkInterface `
-Name 'bchennu-nic-1' `
-ResourceGroupName $resourceGroup `
-Location $location `
-SubnetId $vnet.Subnets[0].Id `
-PublicIpAddressId $pip.Id `
-NetworkSecurityGroupId $nsg.Id

#create a VM config
$vmConfig = New-AzVMConfig `
-VMName $vmName -VMSize Standard_B1ls |
Set-AzVMOperatingSystem -Linux -ComputerName $vmName -Credential $cred -DisablePasswordAuthentication |
Set-AzVMSourceImage -PublisherName Canonical -Offer UbuntuServer -Skus 14.04.2-LTS -Version latest |
Add-AzVMNetworkInterface -Id $nic.Id

#create a VM
New-AzVM `
-ResourceGroupName $resourceGroup `
-Location $location `
-VM $vmConfig




