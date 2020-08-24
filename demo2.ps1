$processes = Get-Process
foreach ($item in $processes) 
{
    if($item.ProcessName -like "*Chrome*"){
         Write-Host "Chrome >>",$item.ProcessName
    }
}
########### for loop ##################
[int]$i=0
for($i=0; $i -lt $processes.Length; $i++)
{
    if($processes[$i].ProcessName -like "*Chrome*"){
        Write-Host "Forloop >>",$processes[$i].ProcessName
   }
}
########## if else ##############
$exp =10
if($exp -le 5)
{
    "Junior Dev"
}
elseif ($exp -le 10) {
    "Senior Dev"
}
elseif ($exp -le 15) {
    "Tech Lead"
}
else 
{
    "Architect"
}

########## export csv #########
# Get-Process | Export-Csv processes.csv

$obj1 = [PSCustomObject]@{
    Name = "Java";
    Category = "Language"
}
$json = $obj1 | ConvertTo-Json
$json

######### Invoke web request/url - REST API
# $google = (Invoke-WebRequest http://httpbin.org/base64/SFRUUEJJTiBpcyBhd2Vzb21l)
# $google.RawContent

try{
    1/0
}
catch [System.DivideByZeroException]
{
    "Dont divide 0 - $_"
}
finally
{
    Write-Error "Test finally bharani"
}

# kudu log search
# select files based on compare date ,not older than 4 days
$compareDate = (Get-Date).AddDays(-4)
# Get-ChildItem -Recurse | Where-Object {$_.LastWriteTime -ge $compareDate}
# kudu select last modified file
# Get-ChildItem -Recurse | Sort-Object -Descending LastWriteTime | Select-Object -First 1
