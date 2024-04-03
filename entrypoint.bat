@echo off
echo Farming Simulator 22 Server

if "%STEAMUSER%"=="" (
    echo Steam User is not set. Aborting.
    exit /b
) else (
    echo Steam User is: %STEAMUSER%
)

if "%STEAMPASS%"=="" (
    echo Steam Password is not set. Aborting.
    exit /b
)

steamcmd +login %STEAMUSER% %STEAMPASS% +force_install_dir c:/data +app_update 1248130 +quit
copy /Y c:\dedicatedServer.xml c:\data\dedicatedServer.xml

echo Starting Farming Simulator 22 Server
"c:\data\dedicatedServer.exe"
