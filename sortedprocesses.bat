
@echo off

cd Desktop 

tasklist > processes.txt

sort processes.txt /o sortedprocesses.txt 

echo All processes have been arranged and saved in the text file named "sortedprocesses.txt" on Desktop!

pause