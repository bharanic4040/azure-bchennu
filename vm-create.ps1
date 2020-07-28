$resourceGroup = "bchennu-RG"
$location = "eastus"
$vmName = "bchennu-VM"
$vnetName = "bchennu-vnet-1"

Write-Host "====== Azure provisioning starts ==================="


#Connect-AzAccount
Get-AzContext
$cred = Get-Credential -Message "username/password for the virtual machine."

New-AzResourceGroup -Name $resourceGroup -Location $location

#create a VM
New-AzVM `
 -ResourceGroupName $resourceGroup `
 -Name $vmName `
  -Location $location `
   -Image "UbuntuLTS" `
   -VirtualNetworkName $vnetName `
   -SubnetName "bchennu-subnet-1" `
   -PublicIpAddressName "bchennu-vm-ip-1" `
   -OpenPorts 22 `
   -Credential $cred

