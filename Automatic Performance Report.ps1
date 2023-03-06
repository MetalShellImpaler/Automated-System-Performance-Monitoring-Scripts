echo "
Welcome to the Automatic Performance Report.
This script will allow you to quickly and easily generate performance reports for your system.
"

$cpuCounter = New-Object System.Diagnostics.PerformanceCounter("Processor","% Processor Time","_Total")
$memCounter = New-Object System.Diagnostics.PerformanceCounter("Memory","Available MBytes")
$diskCounter = New-Object System.Diagnostics.PerformanceCounter("LogicalDisk","% Free Space","C:")

$interval = 5

# The file path for the report
$filePath = "$env:USERPROFILE\Desktop\Performance_Report.txt"


New-Item -ItemType File -Path $filePath -Force

# The report template
$template = @"
=============================================================
Automatic Performance Report

| Time                          | CPU Usage  | Memory Usage | Disk Usage |
| -----------------------|:--------------:| -----------------:| -------------:|
"@

Add-Content -Path $filePath -Value $template

# Loop to continuously gather performance data
while($true) {
    
    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $cpuUsage = $cpuCounter.NextValue()

    $memUsage = $memCounter.NextValue()

    $diskUsage = $diskCounter.NextValue()

    $output = "$time    $cpuUsage%       $memUsage MB      $diskUsage%"
    Add-Content -Path $filePath -Value $output

    Start-Sleep -s $interval
}
