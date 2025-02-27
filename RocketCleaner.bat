@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set CURRENT_VERSION=1.1
set REPO_URL=https://raw.githubusercontent.com/DevBubba/Rocket-Cleaner/main/RocketCleaner.bat
set VERSION_URL=https://raw.githubusercontent.com/DevBubba/Rocket-Cleaner/main/version.txt
set TEMP_UPDATE_FILE=%TEMP%\RocketCleaner_Update.bat
set TEMP_VERSION_FILE=%TEMP%\version.txt

title Rocket Cleaner V%CURRENT_VERSION%
color a

:AdminCheck
net session >nul 2>&1
if %errorLevel% == 0 (
    goto CheckForUpdates
) else (
    cls
    echo.
    echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
    echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
    echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
    echo.
    echo  ╔════════════════════════════════════════════╗
    echo  ║ [+] Requesting Admin Rights                ║
    echo  ╚════════════════════════════════════════════╝
    echo.
    timeout 3 >nul
    
    if exist "%temp%\elevated.flag" del "%temp%\elevated.flag" >nul 2>&1

    powershell -Command "Start-Process '%~f0' -Verb RunAs"

    set "counter=0"
    goto WaitForFlag
)

:WaitForFlag
    if exist "%temp%\elevated.flag" exit

    ping 127.0.0.1 -n 1 -w 500 >nul
    set /a counter+=1
    if %counter% GEQ 10 (
        cls
        echo.
        echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
        echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
        echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
        echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
        echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
        echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
        echo.
        echo  ╔════════════════════════════════════════════╗
        echo  ║ [-] Error Gaining Rights, Run As Admin     ║
        echo  ╚════════════════════════════════════════════╝
        echo.
        timeout 5 >nul
        goto CheckForUpdates
    )
    goto WaitForFlag

:CheckForUpdates
type nul > "%temp%\elevated.flag"

curl -s -o "%TEMP_VERSION_FILE%" %VERSION_URL%
if not exist "%TEMP_VERSION_FILE%" (
    cls
    echo.
    echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
    echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
    echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
    echo.
    echo  ╔════════════════════════════════════════════╗
    echo  ║ [-] Failed To Check For Updates            ║
    echo  ╚════════════════════════════════════════════╝
    echo.
    timeout 5 >nul
    goto Main
)

set /p LATEST_VERSION=<"%TEMP_VERSION_FILE%"
del "%TEMP_VERSION_FILE%"

if "%CURRENT_VERSION%" == "%LATEST_VERSION%" (
    cls
    echo.
    echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
    echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
    echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
    echo.
    echo  ╔════════════════════════════════════════════╗
    echo  ║ [?] Rocket Cleaner Is Up To Date           ║
    echo  ╚════════════════════════════════════════════╝
    echo.
    timeout 3 >nul
    goto Main
) else (
    cls
    echo.
    echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
    echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
    echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
    echo.
    echo  ╔════════════════════════════════════════════╗
    echo  ║ [?] New Version Available                  ║
    echo  ╚════════════════════════════════════════════╝
    echo.
    timeout 3 >nul
    cls
    echo.
    echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
    echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
    echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
    echo.
    echo  ╔════════════════════════════════════════════╗
    echo  ║ [+] Downloading Update...                  ║
    echo  ╚════════════════════════════════════════════╝
    echo.

    curl -s -o "%TEMP_UPDATE_FILE%" %REPO_URL%

    if not exist "%TEMP_UPDATE_FILE%" (
        cls
        echo.
        echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
        echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
        echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
        echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
        echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
        echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
        echo.
        echo  ╔════════════════════════════════════════════╗
        echo  ║ [-] Failed To Download Update              ║
        echo  ╚════════════════════════════════════════════╝
        echo.
        timeout 5 >nul
        goto Main
    )

    cls
    echo.
    echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
    echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
    echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
    echo.
    echo  ╔════════════════════════════════════════════╗
    echo  ║ [+] Applying New Update...                 ║
    echo  ╚════════════════════════════════════════════╝
    echo.

    copy /Y "%TEMP_UPDATE_FILE%" "%~f0"
    del "%TEMP_UPDATE_FILE%"

    cls
    echo.
    echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
    echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
    echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
    echo.
    echo  ╔════════════════════════════════════════════╗
    echo  ║ [+] Succsesfully Updated, Restarting...    ║
    echo  ╚════════════════════════════════════════════╝
    echo.
    timeout 3 >nul
    start "" "%~f0"
    exit
)

:Main
cls
echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ A Lightweight Yet Powerful Batch Script.   ║
echo  ║ Automates Temp File Cleanup,               ║
echo  ║ Disk Maintenance, And System Optimization  ║
echo  ║                                            ║
echo  ║ 1 - Clean System                           ║
echo  ║ 2 - System Optimization                    ║
echo  ║ 3 - Disk Clean                             ║
echo  ║ 4 - Disk Check                             ║
echo  ║ 5 - Disk Defragmenter                      ║
echo  ║                                            ║
echo  ║ 0 - Exit                                   ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p option=

if %option% == 0 goto exit
if %option% == 1 goto SystemClean
if %option% == 2 goto SystemOptimization
if %option% == 3 goto DiskClean
if %option% == 4 goto DiskCheck
if %option% == 5 goto DiskDefragmenter

cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto Main

:SystemClean
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ Are You Sure You Would Like To,            ║
echo  ║ Clean Your Pc?                             ║
echo  ║                                            ║
echo  ║ This May Take A While Aswell Depending On, ║
echo  ║ Your Cache And Windows Components Cleanup  ║
echo  ║                                            ║
echo  ║ 1 - Yes, Clean Now                         ║
echo  ║ 2 - No, Back                               ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifySystemClean=

if %verifySystemClean% == 1 goto UserPromptCleanBrowsers
if %verifySystemClean% == 2 goto Main

cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul

goto SystemClean

:UserPromptCleanBrowsers
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ Would You Like To Clean All Browser Data?  ║
echo  ║                                            ║
echo  ║ This Will Clean All Browsers:              ║
echo  ║ - Chrome, Edge, Firefox, Opera, Brave      ║
echo  ║ - History, Cookies, Cache, User Data       ║
echo  ║ - Saved Passwords, AutoFill Data           ║
echo  ║                                            ║
echo  ║ 1 - Yes, Clean All Browser Data            ║
echo  ║ 2 - No, Only Clean Cache                   ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p cleanbrowsers=
if %cleanbrowsers% == 1 goto StartSystemClean
if %cleanbrowsers% == 2 goto StartSystemClean

cls
echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto UserPromptCloseChrome

:StartSystemClean
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [+] Starting Deep System Clean...          ║
echo  ╚════════════════════════════════════════════╝
echo.

:: First stop services that might interfere with cleaning
echo Stopping services...
net stop wuauserv
net stop bits
net stop FontCache
net stop FontCache3.0.0.0
net stop DiagTrack
net stop dmwappushservice
net stop MapsBroker
net stop wscsvc

:: Set common paths
set "LOCALAPPDATA=%UserProfile%\AppData\Local"
set "APPDATA=%UserProfile%\AppData\Roaming"
set "TEMP=%SystemDrive%\Windows\Temp"
set "TMP=%SystemDrive%\Windows\Temp"

:: Clean System and User Temp Directories
echo Cleaning temporary files...
for %%D in (
    "%SystemRoot%\TEMP"
    "%SystemRoot%\Prefetch"
    "%TEMP%"
    "%TMP%"
    "%APPDATA%\Temp"
    "%LOCALAPPDATA%\Temp"
    "%USERPROFILE%\AppData\LocalLow\Temp"
    "%USERPROFILE%\Local Settings\Temp"
    "%PROGRAMDATA%\Temp"
) do (
    if exist "%%~D" (
        echo Cleaning: %%~D
        del /f /s /q "%%~D\*.*"
        for /d %%p in ("%%~D\*.*") do rmdir /s /q "%%p"
    )
)

:: Clean Windows Update Cache
echo Cleaning Windows Update cache...
if exist "%windir%\SoftwareDistribution\Download" (
    del /f /s /q "%windir%\SoftwareDistribution\Download\*.*"
    for /d %%p in ("%windir%\SoftwareDistribution\Download\*.*") do rmdir /s /q "%%p"
)

:: Clean Package Cache
echo Cleaning package cache...
if exist "%windir%\Installer\$PatchCache$" (
    del /f /s /q "%windir%\Installer\$PatchCache$\*.*"
    for /d %%p in ("%windir%\Installer\$PatchCache$\*.*") do rmdir /s /q "%%p"
)

:: Clean User Profile Caches
echo Cleaning user profile caches...
for %%D in (
    "%LOCALAPPDATA%\Microsoft\Windows\Explorer\ThumbCacheToDelete"
    "%LOCALAPPDATA%\Microsoft\Windows\Explorer\IconCacheToDelete"
    "%LOCALAPPDATA%\Microsoft\Windows\INetCache"
    "%LOCALAPPDATA%\Microsoft\Windows\INetCookies"
    "%LOCALAPPDATA%\Microsoft\Windows\WebCache"
    "%LOCALAPPDATA%\Microsoft\Windows\History"
    "%APPDATA%\Microsoft\Windows\Recent"
    "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations"
    "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations"
) do (
    if exist "%%~D" (
        echo Cleaning: %%~D
        del /f /s /q "%%~D\*.*"
        for /d %%p in ("%%~D\*.*") do rmdir /s /q "%%p"
    )
)

:: Clean Game Related Caches
echo Cleaning game caches...
for %%D in (
    "%LOCALAPPDATA%\Microsoft\XboxLive"
    "%LOCALAPPDATA%\Microsoft\OneDrive\games"
    "%PROGRAMDATA%\Microsoft\XboxLive"
    "%LOCALAPPDATA%\Steam\htmlcache"
    "%LOCALAPPDATA%\NVIDIA\DXCache"
    "%LOCALAPPDATA%\NVIDIA\GLCache"
    "%LOCALAPPDATA%\Microsoft\Windows\GameDVR"
    "%PROGRAMDATA%\Epic\UnrealEngineLauncher\Common\Backup"
) do (
    if exist "%%~D" (
        echo Cleaning: %%~D
        del /f /s /q "%%~D\*.*"
        for /d %%p in ("%%~D\*.*") do rmdir /s /q "%%p"
    )
)

:: Clean Browser Caches (if not in use)
echo Cleaning browser caches...
for %%D in (
    "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
    "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Code Cache"
    "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\GPUCache"
    "%LOCALAPPDATA%\Mozilla\Firefox\Profiles"
    "%LOCALAPPDATA%\Opera Software\Opera Stable\Cache"
    "%LOCALAPPDATA%\Opera Software\Opera GX Stable\Cache"
    "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache"
) do (
    if exist "%%~D" (
        echo Cleaning: %%~D
        del /f /s /q "%%~D\*.*"
        for /d %%p in ("%%~D\*.*") do rmdir /s /q "%%p"
    )
)

:: Clean Windows System Caches
echo Cleaning system caches...
for %%D in (
    "%windir%\System32\winevt\Logs"
    "%ProgramData%\Microsoft\Windows\WER"
    "%ProgramData%\Microsoft\Windows\SystemData"
    "%ProgramData%\Microsoft\Search\Data\Applications\Windows"
    "%ProgramData%\Microsoft\Diagnosis"
    "%ProgramData%\Microsoft\Windows Defender\Scans\History"
    "%ProgramData%\Microsoft\Windows Defender\Scans\MetaStore"
    "%SystemRoot%\System32\LogFiles"
    "%SystemRoot%\System32\config\systemprofile\AppData\Local\Temp"
    "%SystemRoot%\Logs"
    "%SystemRoot%\debug"
    "%SystemRoot%\Minidump"
    "%SystemRoot%\Panther"
) do (
    if exist "%%~D" (
        echo Cleaning: %%~D
        del /f /s /q "%%~D\*.*"
        for /d %%p in ("%%~D\*.*") do rmdir /s /q "%%p"
    )
)

:: Clean Font Cache
echo Cleaning font cache...
if exist "%windir%\ServiceProfiles\LocalService\AppData\Local\FontCache" (
    del /f /s /q "%windir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*"
)
if exist "%windir%\System32\FNTCACHE.DAT" (
    del /f /s /q "%windir%\System32\FNTCACHE.DAT"
)

:: Clean Windows Store Cache
echo Cleaning Windows Store cache...
if exist "%LOCALAPPDATA%\Packages" (
    for /d %%p in ("%LOCALAPPDATA%\Packages\*.*") do (
        if exist "%%p\AC\INetCache" (
            del /f /s /q "%%p\AC\INetCache\*.*"
        )
        if exist "%%p\AC\INetHistory" (
            del /f /s /q "%%p\AC\INetHistory\*.*"
        )
        if exist "%%p\AC\Temp" (
            del /f /s /q "%%p\AC\Temp\*.*"
        )
    )
)

:: Clean GPU Driver Caches
echo Cleaning GPU caches...
for %%D in (
    "%SYSTEMDRIVE%\AMD"
    "%SYSTEMDRIVE%\NVIDIA"
    "%SYSTEMDRIVE%\INTEL"
    "%PROGRAMDATA%\NVIDIA Corporation\Downloader"
    "%PROGRAMDATA%\NVIDIA Corporation\NetService"
    "%PROGRAMDATA%\AMD\PPC"
) do (
    if exist "%%~D" (
        echo Cleaning: %%~D
        del /f /s /q "%%~D\*.*"
        for /d %%p in ("%%~D\*.*") do rmdir /s /q "%%p"
    )
)

:: Clean Delivery Optimization Files
echo Cleaning delivery optimization files...
if exist "%SystemRoot%\SoftwareDistribution\DeliveryOptimization" (
    del /f /s /q "%SystemRoot%\SoftwareDistribution\DeliveryOptimization\*.*"
)

:: Clean Windows Defender
echo Cleaning Windows Defender...
if exist "%ProgramData%\Microsoft\Windows Defender\Scans" (
    del /f /s /q "%ProgramData%\Microsoft\Windows Defender\Scans\*.*"
)

:: Clean System Restore Points (if requested)
echo Cleaning old system restore points...
vssadmin delete shadows /for=C: /all /quiet 2>nul

:: Empty Recycle Bin
echo Emptying Recycle Bin...
if exist "%SystemDrive%\$Recycle.bin" (
    rd /s /q "%SystemDrive%\$Recycle.bin"
)

:: Clean Windows Components
echo Cleaning Windows components...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

:: Restart necessary services
echo Restarting services...
net start wuauserv
net start bits
net start FontCache
net start FontCache3.0.0.0

:: Browser Cleanup Section
if "%cleanbrowsers%"=="1" (
    echo Cleaning all browser data...
    
    :: Kill all browser processes
    taskkill /F /IM "chrome.exe"
    taskkill /F /IM "msedge.exe"
    taskkill /F /IM "firefox.exe"
    taskkill /F /IM "opera.exe"
    taskkill /F /IM "brave.exe"
    taskkill /F /IM "vivaldi.exe"
    taskkill /F /IM "ieplore.exe"
    taskkill /F /IM "UCBrowser.exe"
    taskkill /F /IM "browser.exe"
    taskkill /F /IM "chromium.exe"
    taskkill /F /IM "maxthon.exe"
    taskkill /F /IM "palemoon.exe"
    taskkill /F /IM "iron.exe"
    taskkill /F /IM "epicprivacybrowser.exe"
    taskkill /F /IM "waterfox.exe"
    taskkill /F /IM "dragon.exe"
    taskkill /F /IM "midori.exe"
    taskkill /F /IM "qutebrowser.exe"
    taskkill /F /IM "falkon.exe"
    taskkill /F /IM "dooble.exe"
    taskkill /F /IM "basilisk.exe"
    taskkill /F /IM "blisk.exe"

    :: Chrome and Chromium-based browsers common paths
    set "ChromiumPaths=Cache^
        Code Cache^
        GPUCache^
        Media Cache^
        Service Worker^
        Login Data^
        History^
        Cookies^
        Web Data^
        Bookmarks^
        Sessions^
        Extensions^
        IndexedDB^
        Local Storage^
        Session Storage^
        Sync Data^
        Download Metadata^
        Preferences^
        Favicons^
        Top Sites^
        Visited Links^
        Last Tabs^
        Last Session^
        Current Tabs^
        Current Session"

    :: Clean Google Chrome
    for %%P in (%ChromiumPaths%) do (
        if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\%%P" (
            echo Cleaning Chrome: %%P
            del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\%%P\*.*"
            for /d %%d in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\%%P\*.*") do rmdir /s /q "%%d"
        )
    )

    :: Clean Chrome Beta/Dev/Canary
    for %%V in (Beta Dev Canary) do (
        for %%P in (%ChromiumPaths%) do (
            if exist "%LOCALAPPDATA%\Google\Chrome %%V\User Data\Default\%%P" (
                echo Cleaning Chrome %%V: %%P
                del /f /s /q "%LOCALAPPDATA%\Google\Chrome %%V\User Data\Default\%%P\*.*"
                for /d %%d in ("%LOCALAPPDATA%\Google\Chrome %%V\User Data\Default\%%P\*.*") do rmdir /s /q "%%d"
            )
        )
    )

    :: Clean Microsoft Edge
    for %%P in (%ChromiumPaths%) do (
        if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\%%P" (
            echo Cleaning Edge: %%P
            del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\%%P\*.*"
            for /d %%d in ("%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\%%P\*.*") do rmdir /s /q "%%d"
        )
    )

    :: Clean Firefox and Firefox-based browsers
    set "FirefoxPaths=^
        cache^
        cache2^
        cookies.sqlite^
        places.sqlite^
        formhistory.sqlite^
        key4.db^
        logins.json^
        permissions.sqlite^
        webappsstore.sqlite^
        chromeappsstore.sqlite^
        storage^
        storage-sync^
        saved-telemetry-pings^
        sessionstore-backups^
        crashes^
        minidumps^
        datareporting"

    :: Clean Firefox profiles
    for /d %%p in ("%APPDATA%\Mozilla\Firefox\Profiles\*.*") do (
        for %%F in (%FirefoxPaths%) do (
            if exist "%%p\%%F" (
                echo Cleaning Firefox Profile: %%F
                del /f /s /q "%%p\%%F\*.*"
                for /d %%d in ("%%p\%%F\*.*") do rmdir /s /q "%%d"
            )
        )
    )

    :: Clean Waterfox, Pale Moon, and Basilisk (Firefox-based)
    for %%B in (Waterfox "Pale Moon" Basilisk) do (
        for /d %%p in ("%APPDATA%\%%B\Profiles\*.*") do (
            for %%F in (%FirefoxPaths%) do (
                if exist "%%p\%%F" (
                    echo Cleaning %%B Profile: %%F
                    del /f /s /q "%%p\%%F\*.*"
                    for /d %%d in ("%%p\%%F\*.*") do rmdir /s /q "%%d"
                )
            )
        )
    )

    :: Clean Opera and Opera-based
    for %%P in (%ChromiumPaths%) do (
        if exist "%APPDATA%\Opera Software\Opera Stable\%%P" (
            echo Cleaning Opera: %%P
            del /f /s /q "%APPDATA%\Opera Software\Opera Stable\%%P\*.*"
            for /d %%d in ("%APPDATA%\Opera Software\Opera Stable\%%P\*.*") do rmdir /s /q "%%d"
        )
        if exist "%APPDATA%\Opera Software\Opera GX Stable\%%P" (
            echo Cleaning Opera GX: %%P
            del /f /s /q "%APPDATA%\Opera Software\Opera GX Stable\%%P\*.*"
            for /d %%d in ("%APPDATA%\Opera Software\Opera GX Stable\%%P\*.*") do rmdir /s /q "%%d"
        )
    )

    :: Clean Brave and Brave Beta
    for %%V in ("" Beta Dev Nightly) do (
        for %%P in (%ChromiumPaths%) do (
            if exist "%LOCALAPPDATA%\BraveSoftware\Brave-Browser%%V\User Data\Default\%%P" (
                echo Cleaning Brave%%V: %%P
                del /f /s /q "%LOCALAPPDATA%\BraveSoftware\Brave-Browser%%V\User Data\Default\%%P\*.*"
                for /d %%d in ("%LOCALAPPDATA%\BraveSoftware\Brave-Browser%%V\User Data\Default\%%P\*.*") do rmdir /s /q "%%d"
            )
        )
    )

    :: Clean Vivaldi
    for %%P in (%ChromiumPaths%) do (
        if exist "%LOCALAPPDATA%\Vivaldi\User Data\Default\%%P" (
            echo Cleaning Vivaldi: %%P
            del /f /s /q "%LOCALAPPDATA%\Vivaldi\User Data\Default\%%P\*.*"
            for /d %%d in ("%LOCALAPPDATA%\Vivaldi\User Data\Default\%%P\*.*") do rmdir /s /q "%%d"
        )
    )

    :: Clean Internet Explorer
    echo Cleaning Internet Explorer...
    RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
    del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files\*.*"
    del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\INetCache\*.*"
    del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\INetCookies\*.*"
    del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\WebCache\*.*"

    :: Clean UC Browser
    if exist "%LOCALAPPDATA%\UCBrowser" (
        echo Cleaning UC Browser...
        del /f /s /q "%LOCALAPPDATA%\UCBrowser\*.*"
        for /d %%d in ("%LOCALAPPDATA%\UCBrowser\*.*") do rmdir /s /q "%%d"
    )

    :: Clean Yandex Browser
    for %%P in (%ChromiumPaths%) do (
        if exist "%LOCALAPPDATA%\Yandex\YandexBrowser\User Data\Default\%%P" (
            echo Cleaning Yandex: %%P
            del /f /s /q "%LOCALAPPDATA%\Yandex\YandexBrowser\User Data\Default\%%P\*.*"
            for /d %%d in ("%LOCALAPPDATA%\Yandex\YandexBrowser\User Data\Default\%%P\*.*") do rmdir /s /q "%%d"
        )
    )

    :: Clean Chromium
    for %%P in (%ChromiumPaths%) do (
        if exist "%LOCALAPPDATA%\Chromium\User Data\Default\%%P" (
            echo Cleaning Chromium: %%P
            del /f /s /q "%LOCALAPPDATA%\Chromium\User Data\Default\%%P\*.*"
            for /d %%d in ("%LOCALAPPDATA%\Chromium\User Data\Default\%%P\*.*") do rmdir /s /q "%%d"
        )
    )

    :: Clean Other Chromium-based browsers
    for %%B in (
        "SRWare Iron"
        "Epic Privacy Browser"
        "Comodo Dragon"
        "Blisk"
    ) do (
        for %%P in (%ChromiumPaths%) do (
            if exist "%LOCALAPPDATA%\%%B\User Data\Default\%%P" (
                echo Cleaning %%B: %%P
                del /f /s /q "%LOCALAPPDATA%\%%B\User Data\Default\%%P\*.*"
                for /d %%d in ("%LOCALAPPDATA%\%%B\User Data\Default\%%P\*.*") do rmdir /s /q "%%d"
            )
        )
    )

    :: Clean Maxthon
    if exist "%APPDATA%\Maxthon5" (
        echo Cleaning Maxthon...
        del /f /s /q "%APPDATA%\Maxthon5\Users\*.*"
        for /d %%d in ("%APPDATA%\Maxthon5\Users\*.*") do rmdir /s /q "%%d"
    )

) else (
    :: Only clean browser caches if full cleanup not selected
    echo Cleaning browser caches only...    
    for %%B in (
        "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache"
        "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
        "%LOCALAPPDATA%\Mozilla\Firefox\Profiles"
        "%LOCALAPPDATA%\Opera Software\Opera Stable\Cache"
        "%LOCALAPPDATA%\Opera Software\Opera GX Stable\Cache"
        "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\User Data\Default\Cache"
        "%LOCALAPPDATA%\Vivaldi\User Data\Default\Cache"
        "%LOCALAPPDATA%\Chromium\User Data\Default\Cache"
        "%LOCALAPPDATA%\Yandex\YandexBrowser\User Data\Default\Cache"
        "%LOCALAPPDATA%\UCBrowser\Cache"
        "%APPDATA%\Maxthon5\Users\*\Cache"
        "%LOCALAPPDATA%\Epic Privacy Browser\User Data\Default\Cache"
        "%LOCALAPPDATA%\Comodo\Dragon\User Data\Default\Cache"
        "%LOCALAPPDATA%\Blisk\User Data\Default\Cache"
    ) do (
        if exist "%%~B" (
            echo Cleaning: %%~B
            del /f /s /q "%%~B\*.*"
            for /d %%p in ("%%~B\*.*") do rmdir /s /q "%%p"
        )
    )
)

pause

goto Done

:SystemOptimization
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ Are You Sure You Would Like To,            ║
echo  ║ Run System Optimization?                   ║
echo  ║                                            ║
echo  ║ This Will:                                 ║
echo  ║ - Optimize Windows Services                ║
echo  ║ - Clean Registry                           ║
echo  ║ - Disable Telemetry                        ║
echo  ║ - Remove Bloatware                         ║
echo  ║ - Improve System Performance               ║
echo  ║                                            ║
echo  ║ 1 - Yes, Optimize System                   ║
echo  ║ 2 - No, Back                               ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifyoptimization=

if %verifyoptimization% == 1 goto StartOptimization
if %verifyoptimization% == 2 goto Main

cls
echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto SystemOptimization

:StartOptimization
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [+] Starting System Optimization...        ║
echo  ╚════════════════════════════════════════════╝
echo.

:: Configure and optimize services
echo Configuring services...
sc config WSearch start= auto
sc config AppIDSvc start= auto
sc config UserManager start= auto
sc config StateRepositorySvc start= auto
sc config TileDataModelSvc start= auto
sc config WpnService start= auto
sc config BrokerInfrastructure start= auto

:: Enable PowerShell execution
echo Configuring PowerShell...
powershell Set-ExecutionPolicy RemoteSigned
reg add "HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v ExecutionPolicy /t REG_SZ /d RemoteSigned /f

:: Clean Windows Defender related registry keys
echo Cleaning registry...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /f 2>nul
reg delete "HKEY_CLASSES_ROOT\Folder\shell\WindowsDefender" /f 2>nul
reg delete "HKEY_CLASSES_ROOT\DesktopBackground\Shell\WindowsSecurity" /f 2>nul

:: Clean Autorun entries
echo Cleaning autorun entries...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /va /f
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /va /f

:: Disable telemetry
echo Disabling telemetry...
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f

:: Remove Cortana
echo Removing Cortana...
powershell "Get-AppxPackage -AllUsers Microsoft.549981C3F5F10 | Remove-AppxPackage"

:: Clean icon cache
echo Cleaning icon cache...
del /f /s /q "%localappdata%\IconCache.db"
ie4uinit.exe -show
ie4uinit.exe -ClearIconCache

:: Clean event logs
echo Clearing event logs...
for /f "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G")

:: Optimize system performance
echo Optimizing system performance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemCacheDirtyPageThreshold" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d 1 /f

:: Restart Explorer
echo Restarting Explorer...
taskkill /f /im explorer.exe
start explorer.exe

pause

goto Done

:DiskClean
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ Are You Sure You Would Like To,            ║
echo  ║ Run Disk Clean?                            ║
echo  ║                                            ║
echo  ║ 1 - Yes, Run Windows Disk Cleaning App     ║
echo  ║ 2 - No, Back                               ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifydiskclean=

if %verifydiskclean% == 1 goto StartDiskClean
if %verifydiskclean% == 2 goto Main

cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto DiskClean

cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto UserPromptCleanBrowsers

:StartDiskClean
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [+] Running Disk Clean...                  ║
echo  ║                                            ║
echo  ║ [?] Do Not Close Rocket Cleaner            ║
echo  ╚════════════════════════════════════════════╝
echo.
c:\windows\system32\cleanmgr.exe /dc /sagerum: 1
goto Done

:DiskCheck
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ Are You Sure You Would Like To,            ║
echo  ║ Run Disk Check?                            ║
echo  ║                                            ║
echo  ║ 1 - Yes, Run Windows Disk Check            ║
echo  ║ 2 - No, Back                               ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifydiskcheck=

if %verifydiskcheck% == 1 goto UserPromptAutoRestart
if %verifydiskcheck% == 2 goto Main

:UserPromptAutoRestart
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ It Is Recommended That Auto Restart Is On  ║
echo  ║                                            ║
echo  ║ This Is Because Your System Might Need To, ║
echo  ║ Restart To Complete A System Repair        ║
echo  ║                                            ║
echo  ║ 1 - Yes, Auto Restart                      ║
echo  ║ 2 - No, Ill Restart Myself                 ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p autorestart=
if %autorestart% == 1 goto StartDiskCheck
if %autorestart% == 2 goto StartDiskCheck

cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto UserPromptAutoRestart

:StartDiskCheck
cls

SET WVer=
SET WMajor=
SET WMinor=
SET WRev=

for /f "tokens=4,5,6 delims=[]. " %%a IN ('ver') DO (
    SET WVer=%%a.%%b.%%c
    SET WMajor=%%a
    SET WMinor=%%b
    SET WRev=%%c
)

if "%systemdrive%" == "" (
    SET SYSTEM_DRIVE=C:
) else (
    SET SYSTEM_DRIVE=%systemdrive%
)

if 62 LEQ %WMajor%%WMinor% (
    set CHKDSK_NG=1
) else (
    set CHKDSK_NG=0
)

if %CHKDSK_NG% == 1 (
    echo Info chkdsk: new capabilities enabled
)

for /f "skip=1 tokens=1,2 delims= " %%a in ('wmic logicaldisk get caption^,filesystem') do (
    if "%%a" == "%SYSTEM_DRIVE%" (
        if %CHKDSK_NG% == 1 (
            echo Running chkdsk scan on %%a...
            chkdsk /scan /perf /forceofflinefix %%a
            echo Running system file checker...
            sfc /scannow
        ) else (
            echo Setting dirty bit on %%a...
            fsutil dirty set %%a
        )
    ) else if "%%b" == "NTFS" (
        if %CHKDSK_NG% == 1 (
            echo Running chkdsk scan on %%a...
            chkdsk /scan /perf /forceofflinefix %%a
            chkdsk /X /offlinescanandfix %%a
        ) else (
            echo Running chkdsk on %%a...
            chkdsk /F /X %%a
            chkdsk /F /X /R /B %%a
        )
    ) else if "%%b" == "FAT32" (
        echo Running chkdsk on FAT32 drive %%a...
        chkdsk /F /X %%a
        chkdsk /F /X /R %%a
    )
)

if "%autorestart%"=="1" (
    echo.
    echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
    echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
    echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
    echo.
    echo  ╔════════════════════════════════════════════╗
    echo  ║ Your System Is Shutting Down Due To,       ║
    echo  ║ Automatically Restarting After Disk Clean  ║
    echo  ║ Shutting Down In: 15 Seconds               ║
    echo  ║                                            ║
    echo  ║ After Restart It Is Recommended To,        ║
    echo  ║ Run sfc /scannow In Your CMD Or,           ║
    echo  ║ Run Disk Check In Rocket Cleaner           ║ 
    echo  ╚════════════════════════════════════════════╝
    echo.
    shutdown /r /f /t 15
    echo.
    pause
)

pause

goto done


:DiskDefragmenter
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ Are You Sure You Would Like To,            ║
echo  ║ Run Disk Defrag?                           ║
echo  ║                                            ║
echo  ║ 1 - Yes, Run Windows Defragger             ║
echo  ║ 2 - No, Back                               ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifydiskdefragmenter=

if %verifydiskdefragmenter% == 1 goto StartDiskDefragmenter
if %verifydiskdefragmenter% == 2 goto Main

cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto DiskDefragmenter

:StartDiskDefragmenter
cls

defrag C: -f
defrag D: -f

pause

goto Done

:Done

cls
echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ Succsesfully Finished Task                 ║
echo  ║                                            ║
echo  ║ 1 - Home                                   ║
echo  ║ 0 - Exit                                   ║
echo  ╚════════════════════════════════════════════╝
echo.

set /p done=

if %done% == 1 goto Main
if %done% == 0 goto Exit

cls
echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [-] Incorrect Try Again                    ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto Done

:Exit
cls

echo.
echo  ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo  ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo  ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo  ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo  ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ [+] Exiting...                             ║
echo  ╚════════════════════════════════════════════╝
echo.
timeout 5 >nul
exit
