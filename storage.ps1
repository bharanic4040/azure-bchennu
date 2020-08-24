$resourceGroup = "bchennu-RG-Storage"
$location = "eastus"
$storageAccountName = "bchennustorageaccone"
$containerName = "bchennu-container-1"

Write-Host "====== Azure starts ==================="

#connect to azure 
#Connect-AzAccount

#get the storage account
$storageAccount = Get-AzStorageAccount `
-ResourceGroupName $resourceGroup `
-Name $storageAccountName 

$ctx = $storageAccount.Context

#Get list of all blobs
$blobList = Get-AzStorageBlob -Container $containerName `
-Context $ctx

$length = 0
$blobList | ForEach-Object {$length = $length + $_.Length}
Write-Host "=============================="
Write-Host $blobList | select Name 
Write-Host "=============================="
Write-Host "Total Length of all blobs = "$length


