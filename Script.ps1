# Automated System Performance Monitoring PowerShell Script

# Introduction
#This PowerShell script is designed to monitor the performance of a system and generate a report in a text file on the desktop. The report will include information about the system's CPU, memory, disk, and network usage.

# Administrator privileges

# Get System Information
$SystemInfo = Get-WmiObject -Class Win32_ComputerSystem

# Get CPU Information
$CPUInfo = Get-WmiObject -Class Win32_Processor

# Get Memory Information
$MemoryInfo = Get-WmiObject -Class Win32_PhysicalMemory

# Get Disk Information
$DiskInfo = Get-WmiObject -Class Win32_LogicalDisk

# Get Network Information
$NetworkInfo = Get-WmiObject -Class Win32_NetworkAdapterConfiguration

# Generate Report
$Report = @"

System Performance Report

System Information

#Computer Name: 
$($SystemInfo.Name)
# Manufacturer: 
$($SystemInfo.Manufacturer)
# Model: 
$($SystemInfo.Model)

CPU Information

# Name: 
$($CPUInfo.Name)
# Number of Cores: 
$($CPUInfo.NumberOfCores)
# Number of Logical Processors: 
$($CPUInfo.NumberOfLogicalProcessors)

# Memory Information

#Total Physical Memory: 
$([Math]::Round(($MemoryInfo.Capacity/1GB),2)) GB

# Disk Information

# Drive: 
$($DiskInfo.DeviceID)
# Size: 
$([Math]::Round(($DiskInfo.Size/1GB),2)) GB
#Free Space: 
$([Math]::Round(($DiskInfo.FreeSpace/1GB),2)) GB

# Network Information

#IP Address: 
$($NetworkInfo.IPAddress)
# Subnet Mask: 
$($NetworkInfo.IPSubnet)
# Default Gateway: 
$($NetworkInfo.DefaultIPGateway)

"@

# Save Report
$Report | Out-File -FilePath "$env:USERPROFILE\Desktop\SystemPerformanceReport.txt" -Encoding UTF8

# Conclusion
# This PowerShell script will generate a report on the system's performance in a text file on the desktop. The report will include information about the system's CPU, memory, disk, and network usage.
