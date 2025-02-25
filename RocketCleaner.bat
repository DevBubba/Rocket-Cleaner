@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set CURRENT_VERSION=1.0
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

    goto WaitForFlag
)

set "counter=0"

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
        goto exit
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
echo  ║ 2 - Disk Clean                             ║
echo  ║ 3 - Disk Check                             ║
echo  ║ 4 - Disk Defragmenter                      ║
echo  ║                                            ║
echo  ║ 0 - Exit                                   ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p option=

if %option% == 0 goto exit
if %option% == 1 goto SystemClean
if %option% == 2 goto DiskClean
if %option% == 3 goto DiskCheck
if %option% == 4 goto DiskDefragmenter

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

if %verifySystemClean% == 1 goto UserPromptCloseChrome
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

:UserPromptCloseChrome
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
echo  ║ It Is Recommended That Chrome Is Closed    ║
echo  ║                                            ║
echo  ║ This Includes, History, Cookies,           ║
echo  ║ Cache, And User Data                       ║
echo  ║ Would You Like To Close It?                ║
echo  ║                                            ║
echo  ║ 1 - Yes, Close Chrome                      ║
echo  ║ 2 - No, Skip Chrome Cleanup                ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p closechrome=
if %closechrome% == 1 goto StartSystemClean
if %closechrome% == 2 goto StartSystemClean

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

:: Cleaning Temp Files
for %%D in ("%WinDir%\Temp" "%WinDir%\Prefetch" "%Temp%" "%AppData%\Temp" "%HomePath%\AppData\LocalLow\Temp") do (
    if exist "%%D" (
        del /s /f /q "%%D\*.*"
        rd /s /q "%%D"
        md "%%D"
    )
)

:: Cleaning System Drive GPU Drivers
for %%D in ("%SYSTEMDRIVE%\AMD" "%SYSTEMDRIVE%\NVIDIA" "%SYSTEMDRIVE%\INTEL") do (
    if exist "%%D" (
        del /s /f /q "%%D\*.*"
        rd /s /q "%%D"
    )
)

:: Empty Recycle Bin
rd /s /q "%SYSTEMDRIVE%\$Recycle.bin"

:: Remove Windows Update Cache
for /d %%D in ("%SystemRoot%\SoftwareDistribution\Download\*.*") do (
    if exist "%%D" rmdir /q /s "%%D"
)

:: Clean Up Windows Components
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

:: Internet Explorer Cleanup
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

:: Chrome Cleanup (Only if chosen)
echo.
if "%closechrome%"=="1" (
	taskkill /F /IM "chrome.exe"

    set ChromeDataDir="C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default"
    if exist "%ChromeDataDir%" (
        del /q /s /f "%ChromeDataDir%\Cache\*.*"
        del /q /f "%ChromeDataDir%\*Cookies*.*"
        del /q /f "%ChromeDataDir%\*History*.*"
    )

    set ChromeDataDir="C:\Users\%USERNAME%\Local Settings\Application Data\Google\Chrome\User Data\Default"
    if exist "%ChromeDataDir%" (
        del /q /s /f "%ChromeDataDir%\Cache\*.*"
        del /q /f "%ChromeDataDir%\*Cookies*.*"
        del /q /f "%ChromeDataDir%\*History*.*"
    )

    set ChromeDir="C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data"
    if exist "%ChromeDir%" (
        del /q /s /f "%ChromeDir%\*.*"
        rd /s /q "%ChromeDir%"
    )
)

echo.
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
goto UserPromptCloseChrome

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

echo.

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
            chkdsk /scan /perf /forceofflinefix %%a
            sfc /scannow
        ) else (
            fsutil dirty set %%a
        )
    ) else if "%%b" == "NTFS" (
        if %CHKDSK_NG% == 1 (
            chkdsk /scan /perf /forceofflinefix %%a
            chkdsk /X /offlinescanandfix %%a
        ) else (
            chkdsk /F /X %%a
            chkdsk /F /X /R /B %%a
        )
    ) else if "%%b" == "FAT32" (
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

echo.
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
