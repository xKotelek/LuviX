@ECHO OFF
echo LuviX repair script v1.0
echo. 
cd C:\Windows\System32
echo Uninstalling LuviX, LuvitX and LitX...
del luvitx.exe
del luvix.exe 
del litx.exe
echo Uninstalled!
echo Installing LuviX, LuvitX and LitX...
echo.
PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://github.com/xKotelek/LuviX/raw/main/installer/install/get-all.ps1'))"
pause
exit