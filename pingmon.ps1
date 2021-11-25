$date = (Get-Date).ToString('dd/MM/yyyy')
$logname = $date + "pingmonitor.csv"
"Timestamp;MS" | Out-File -FilePath $logname

do {

[string]$timestamp = ((Get-Date).ToString('dd/MM/yyyy HH:mm:ss')) 
[string]$ms = ((test-connection google.com -Count 1 | Select-Object -Property ResponseTime).ResponseTime)  
[string]$outfile = $timestamp + ";" + $ms 

$outfile | Out-File -FilePath $logname -Append

#Sleep for 2 seconds
Start-Sleep -s 2

#Set the Time variable for the end while condition
$Time = (Get-Date).Hour

}

while ($Time -gt 3)
