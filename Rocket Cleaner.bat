@echo off
chcp 65001 >nul

title Rocket Cleaner
color a

mode con lines=21 cols=70 >nul

goto Perms

:Perms
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto Main
    ) else (
        echo.
        echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
        echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
        echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
        echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
        echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
        echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
        echo.
		echo       Please Allow Administrator Perms!
		echo.
        timeout 10 >nul
		exit
    )
	cls

:Main

mode con lines=21 cols=70 >nul

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo                 Welcome %USERNAME%!
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ 1 - Oilchange                              ║
echo  ║ 2 - Disk Clean                             ║
echo  ║ 3 - Disk Check                             ║
echo  ║ 4 - Disk Defragmenter                      ║
echo  ║ 5 - Desktop File Fixer                     ║
echo  ║                                            ║
echo  ║ 0 - Exit                                   ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p option=

if %option% == 1 goto Oilchange
if %option% == 2 goto DiskClean
if %option% == 3 goto DiskCheck
if %option% == 4 goto DiskDefragmenter
if %option% == 5 goto DesktopFileFixer

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo            Incorrect Input Try Again!
echo.
timeout 4 >nul
goto Main

:Oilchange

mode con lines=21 cols=70 >nul

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  Are You Sure You Would Like To Clean Your Pc
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ 1 - Yes                                    ║
echo  ║ 2 - No                                     ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifyoilchange=

if %verifyoilchange% == 1 goto StartOilchange
if %verifyoilchange% == 2 goto Main

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo            Incorrect Input Try Again!
echo.
timeout 4 >nul
goto Oilchange

:StartOilchange

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo                     Cleaning...
echo.

cls

timeout 4 >nul

del /s /f /q %WinDir%\Temp\*.* 
del /s /f /q %WinDir%\Prefetch\*.*
del /s /f /q %Temp%\*.* 
del /s /f /q %AppData%\Temp\*.*
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*

del /s /f /q %SYSTEMDRIVE%\AMD\*.* 
del /s /f /q %SYSTEMDRIVE%\NVIDIA\*.*
del /s /f /q %SYSTEMDRIVE%\INTEL\*.*

rd /s /q %WinDir%\Temp
rd /s /q %WinDir%\Prefetch 
rd /s /q %Temp% 
rd /s /q %AppData%\Temp
rd /s /q %HomePath%\AppData\LocalLow\Temp 

rd /s /q %SYSTEMDRIVE%\AMD 
rd /s /q %SYSTEMDRIVE%\NVIDIA 
rd /s /q %SYSTEMDRIVE%\INTEL 

md %WinDir%\Temp 
md %WinDir%\Prefetch 
md %Temp% 
md %AppData%\Temp 
md %HomePath%\AppData\LocalLow\Temp 
 
rd /s /q %systemdrive%\$Recycle.bin 

for %%i in (VBoxGuestAdditions.iso windows.iso) do if exist "%USERPROFILE%\%%~i" del /f "%USERPROFILE%\%%~i"
for /d %%i in ("%SystemRoot%\SoftwareDistribution\Download\*.*") do rmdir /q /s "%%~i"  

Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase 

taskkill /F /IM "chrome.exe" 

set ChromeDataDir="C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default" 
set ChromeCache=%ChromeDataDir%\Cache 
del /q /s /f "%ChromeCache%\*.*"   
del /q /f "%ChromeDataDir%\*Cookies*.*"  
del /q /f "%ChromeDataDir%\*History*.*"   


set ChromeDataDir="C:\Users\%USERNAME%\Local Settings\Application Data\Google\Chrome\User Data\Default" 
set ChromeCache=%ChromeDataDir%\Cache 
del /q /s /f "%ChromeCache%\*.* "    
del /q /f "%ChromeDataDir%\*Cookies*.*"     
del /q /f "%ChromeDataDir%\*History*.*"      

set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data 

del /q /s /f "%ChromeDir%" 
rd /s /q "%ChromeDir%" 

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

goto Done

:DiskClean

mode con lines=21 cols=70 >nul

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  Are You Sure You Would Like To Run Disk Clean
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ 1 - Yes                                    ║
echo  ║ 2 - No                                     ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifydiskclean=

if %verifydiskclean% == 1 goto StartDiskClean
if %verifydiskclean% == 2 goto Main

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo            Incorrect Input Try Again!
echo.
timeout 4 >nul
goto DiskClean

:StartDiskClean

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo               Running Disk Clean...
echo.
timeout 4 >nul
c:\windows\system32\cleanmgr.exe /dc /sagerum: 1
goto Done

:DiskCheck

mode con lines=21 cols=70 >nul

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  Are You Sure You Would Like To Run Disk Check
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ 1 - Yes                                    ║
echo  ║ 2 - No                                     ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifydiskcheck=

if %verifydiskcheck% == 1 goto StartDiskCheck
if %verifydiskcheck% == 2 goto Main

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo            Incorrect Input Try Again!
echo.
timeout 4 >nul
goto DiskCheck

:StartDiskCheck

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo                Running Disk Check...
echo.
timeout 4 >nul

cls

FOR /f "tokens=4,5,6 delims=[]. " %%a IN ('ver') DO (
	SET WVer=%%a.%%b.%%c
	SET WMajor=%%a
	SET WMinor=%%b
	SET WRev=%%c
)

if "%systemdrive%" == "" (SET SYSTEM_DRIVE=C:) else (SET SYSTEM_DRIVE=%systemdrive%)

if 62 LEQ %WMajor%%WMinor% (set CHKDSK_NG=1) else (set CHKDSK_NG=0)
if %CHKDSK_NG% == 1 (echo Info chkdsk: new capabilities enabled)

for /f "skip=1 tokens=1,2 delims= " %%a in ('wmic logicaldisk get caption^,filesystem') do (
	echo.
	echo ________________________________________
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

goto Done

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo      Press Enter To Restart Your Computer!
echo.
pause > nul

shutdown /s

goto Done

:DiskDefragmenter

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  Are You Sure You Would Like To Run Disk Defrag
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ 1 - Yes                                    ║
echo  ║ 2 - No                                     ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifydiskdefragmenter=

if %verifydiskdefragmenter% == 1 goto StartDiskDefragmenter
if %verifydiskdefragmenter% == 2 goto Main

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo            Incorrect Input Try Again!
echo.
timeout 4 >nul
goto DiskDefragmenter

:StartDiskDefragmenter

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo              Running Disk Defragmenter...
echo.
timeout 4 >nul

cls

defrag C: -f
defrag D: -f

goto Done

:DesktopFileFixer

mode con lines=21 cols=70 >nul

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo  Are You Sure You Would Like To Fix Desktop Files
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ 1 - Yes                                    ║
echo  ║ 2 - No                                     ║
echo  ╚════════════════════════════════════════════╝
echo.
set /p verifydesktopfilefixer=

if %verifydesktopfilefixer% == 1 goto StartDesktopFileFixer
if %verifydesktopfilefixer% == 2 goto Main

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo            Incorrect Input Try Again!
echo.
timeout 4 >nul
goto DesktopFileFixer

:StartDesktopFileFixer

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo                Fixing Desktop Files...
echo.
timeout 4 >nul

cls

set urPictures=C:/Users/%username%/Pictures/
set urMusic=C:/Users/%username%/Music/
set urVideos=C:/Users/%username%/Videos/
set urDocuments=C:/Users/%username%/Documents/

cd C:\Users\%USERNAME%\Desktop

move *.png %urPictures%
move *.jpg %urPictures%
move *.jpeg %urPictures%
move *.gif %urPictures%
move *.xcf %urPictures%

move *.mp3 %urMusic%
move *.wav %urMusic%
move *.flac %urMusic%
move *.ogg %urMusic%

move *.wmv %urVideos%
move *.mp4 %urVideos%
move *.flv %urVideos%
move *.mov %urVideos%
move *.mkv %urVideos%
move *.avi %urVideos%

move *.txt %urDocuments%
move *.docx %urDocuments%
move *.doc %urDocuments%
move *.xls %urDocuments%
move *.doc %urDocuments%
move *.pdf %urDocuments%
move *.epub %urDocuments%
move *.torrent %urDocuments%
move *.vcf %urDocuments%
move *.py %urDocuments%
move *.htm %urDocuments%
move *.html %urDocuments%
move *.php %urDocuments%
move *.ovpn %urDocuments%
move *.ppt %urDocuments%
move *.pptx %urDocuments%
move *.dotx %urDocuments%

cd %HOMEPATH%

goto Done

:Done

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo          Succsesfully Finished Task!
echo.
echo  ╔════════════════════════════════════════════╗
echo  ║ 1 - Home                                   ║
echo  ║                                            ║
echo  ║ 0 - Exit                                   ║
echo  ╚════════════════════════════════════════════╝

set /p done=

if %done% == 1 goto Main
if %done% == 0 goto Exit

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo            Incorrect Input Try Again!
echo.
timeout 4 >nul
goto Done

:Exit

cls

echo.
echo ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
echo ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
echo ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
echo ██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
echo ██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
echo ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
echo.
echo                   Exiting...
echo.
timeout 4 >nul
exit