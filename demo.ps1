Write-Host "Testing Az"

# Get-Command *Process*
# Get-Command Get-Process
# Get-Help Get-Process -Examples

# Get-Process |Select Id | Sort-Object -Descending Id
# Get-Process -Id 617 | Out-File process.txt
# Get-Process | Where-Object {$_.ProcessName -like "*Chrome*" }
# Get-Process | Where-Object Id -gt 50000 | Sort-Object Id
# (or) >>>  ? is alias for Where-Object
# Get-Process | ? Id -eq 633 | Format-List *

# Start-Sleep 3

# env variables
# Get-ChildItem env:
# $env:PWD
# Arrays and foreach
[int32[]]$myArr = 1,2,3,4,5
[int]$sum = 0
$myArr | ForEach-Object { $sum+=$_}
$sum
# .NET Objects
$gen = New-Object System.Random
$gen.NextDouble()
$str = "bhar`tani`nchennu"
# $str | Get-Member -MemberType Method -Static
-join ("A","B","C")
("A","B","C") -join ":"

[Math]::Abs(-10.22)
[Math]::Pow(2,3)

###################### Vector types ######################

$arr = New-Object string[] 10
$arr[2]="Hello"

$arrList = New-Object System.Collections.ArrayList
[void] $arrList.Add("One")

# Hashtable
$myMap = @{Name="bharani";Hobby="Games"}


