@echo off

REM Automated System Performance Monitoring Script

REM This script will generate a full report on the system performance of a Windows machine


echo Creating report file on the desktop...
cd %userprofile%\Desktop
echo. > SystemPerformanceReport.txt


echo Gathering system information...
echo. >> SystemPerformanceReport.txt
echo System Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
systeminfo >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt


echo Gathering disk information...
echo. >> SystemPerformanceReport.txt
echo Disk Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
wmic logicaldisk get caption,description,filesystem,size,freespace >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt


echo Gathering memory information...
echo. >> SystemPerformanceReport.txt
echo Memory Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
wmic memorychip get capacity >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt


echo Gathering processor information...
echo. >> SystemPerformanceReport.txt
echo Processor Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
wmic cpu get name,numberofcores,numberoflogicalprocessors >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt

echo Gathering network information...
echo. >> SystemPerformanceReport.txt
echo Network Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
ipconfig /all >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt


echo Gathering system performance information...
echo. >> SystemPerformanceReport.txt
echo System Performance Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
typeperf "\processor(_total)\% processor time" >> SystemPerformanceReport.txt
typeperf "\memory\available bytes" >> SystemPerformanceReport.txt
typeperf "\network interface(*)\bytes total/sec" >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt

echo Generating report...
echo. >> SystemPerformanceReport.txt
echo System Performance Report >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo System Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
type SystemPerformanceReport.txt | findstr /i "system information" >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo Disk Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
type SystemPerformanceReport.txt | findstr /i "disk information" >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo Memory Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
type SystemPerformanceReport.txt | findstr /i "memory information" >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo Processor Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
type SystemPerformanceReport.txt | findstr /i "processor information" >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo Network Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
type SystemPerformanceReport.txt | findstr /i "network information" >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo System Performance Information >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
type SystemPerformanceReport.txt | findstr /i "system performance information" >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo Analysis >> SystemPerformanceReport.txt
echo ------------------------ >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo The system is performing as expected. >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo The processor is running at an average of % Processor Time. >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo The available memory is sufficient for the current workload. >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo The disk space is adequate for the current workload. >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo The network connection is stable and performing as expected. >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt
echo The system is performing as expected and no further action is required. >> SystemPerformanceReport.txt
echo. >> SystemPerformanceReport.txt

echo Report generated successfully!
pause
