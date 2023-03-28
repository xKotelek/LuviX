@ECHO OFF
echo LuviX install script v1.0
echo. 
cd C:\Windows\System32
echo Installing LuviX, LuvitX and LitX...
echo.
PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://github.com/xKotelek/LuviX/raw/main/installer/install/get-all.ps1'))"
pause
exit