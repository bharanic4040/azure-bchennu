
$random = (New-Guid).ToString().Substring(0,8)

$resourceGroup = "bchennu-RG"
$location = "eastus"
$appName="AppServiceManualScale$random"
$appServicePlan = "bchennu-app-svc-plan-1"

#create a Resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

#create app service plan
New-AzAppServicePlan -Name $appServicePlan `
-ResourceGroupName $resourceGroup `
-Location $location `
-Tier Basic

#create an webapp in app service
New-AzWebApp -Name $appName -ResourceGroupName $resourceGroup `
-Location $location `
-AppServicePlan $appServicePlan

