Write-Host "Testing Az"

Write-Host "==============================="

#Arrays
$array = @("item1", "item2")

[int32[]]$arr = 100,300
#hashtables
$map1 = [ordered]@{ID=1;Shape="Square"}

function Get-First{
    param (
      [Parameter(Mandatory)]
      [string[]]$Params
    )
   foreach ($item in $Params) {
      Write-Verbose -Message "Verbose output test"
      Write-Output $item
   }
}

Get-First -Params one,two,three 
#Importing a module
Import-Module /Users/bharani/power-shell/MyScriptModule/MyScriptModule.psm1
#Get-MrPSVersion






