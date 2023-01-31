Welcome to the Automatic Performance Report - with powershell!
This script will allow you to quickly and easily generate performance reports for your systems.

$cpuCounter = New-Object System.Diagnostics.PerformanceCounter("Processor","% Processor Time","_Total")
$memCounter = New-Object System.Diagnostics.PerformanceCounter("Memory","Available MBytes")
$diskCounter = New-Object System.Diagnostics.PerformanceCounter("LogicalDisk","% Free Space","C:")

# Set the sample interval (in seconds)
$interval = 5

# Set the file path for the report
$filePath = "$env:USERPROFILE\Desktop\Performance_Report.txt"

# Create a new file for the report
New-Item -ItemType File -Path $filePath -Force

# Define the report template
$template = @"
=============================================================
Automatic Performance Report

| Time                          | CPU Usage  | Memory Usage | Disk Usage |
| -----------------------|:--------------:| -----------------:| -------------:|
"@

# Add the template to the report file
Add-Content -Path $filePath -Value $template

# Loop to continuously gather performance data
while($true) {
    # Get the current time
    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Get the current CPU usage
    $cpuUsage = $cpuCounter.NextValue()

    # Get the current available memory
    $memUsage = $memCounter.NextValue()

    # Get the current disk usage
    $diskUsage = $diskCounter.NextValue()

    # Append the performance data to the report file
    $output = "$time    $cpuUsage%       $memUsage MB      $diskUsage%"
    Add-Content -Path $filePath -Value $output

    # Wait for the specified interval before gathering data again
    Start-Sleep -s $interval
}