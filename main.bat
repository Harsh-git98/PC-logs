@echo off
:: Specify the log file name
set logfile=process_log.txt

:: Notify the user
echo Logging processes to %logfile%. Press CTRL+C to stop.

:loop
:: Append the current date and time to the log file
echo ======================================== >> %logfile%
echo %date% %time% >> %logfile%
echo ======================================== >> %logfile%

:: Log the list of processes using PowerShell
powershell -Command "Get-Process | Out-File -Append -FilePath '%logfile%'"

:: Wait for a specified interval (e.g., 60 seconds)
ping -n 61 127.0.0.1 >nul

:: Repeat the loop
goto loop