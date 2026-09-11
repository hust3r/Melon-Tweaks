@echo off
setlocal EnableExtensions EnableDelayedExpansion

title Melon Tweaks v2.1
color 0A
mode con cols=90 lines=32

:: =========================================================
:: MELON TWEAKS v2.1
:: by siersciuch
:: =========================================================

:: ---------------------------------------------------------
:: CHECK ADMINISTRATOR
:: ---------------------------------------------------------

fltmc >nul 2>&1

if errorlevel 1 (
    if /i not "%~1"=="ADMIN" (
        cls
        echo.
        echo  =========================================================
        echo                 MELON TWEAKS v2.1
        echo  =========================================================
        echo.
        echo  [!] Administrator privileges are required.
        echo      Uprawnienia administratora sa wymagane.
        echo.
        echo  Requesting administrator access...
        echo.

        powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -ArgumentList 'ADMIN' -Verb RunAs"

        exit /b
    )
)

:: =========================================================
:: LANGUAGE
:: =========================================================

:language
cls

echo.
echo  =========================================================
echo                 MELON TWEAKS v2.1
echo  =========================================================
echo.
echo                  SELECT LANGUAGE
echo.
echo                  [1] English
echo                  [2] Polski
echo.
echo  =========================================================
echo.

set "lang="
set /p "lang=  Select / Wybierz: "

if "%lang%"=="1" set "LANGUAGE=EN"
if "%lang%"=="2" set "LANGUAGE=PL"

if defined LANGUAGE goto menu

goto language



:: =========================================================
:: MAIN MENU
:: =========================================================

:menu
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   [1]  DRIVE TOOLS
    echo   [2]  SYSTEM TOOLS
    echo   [3]  NETWORK TOOLS
    echo   [4]  CLEANING
    echo   [5]  TWEAKS
    echo   [6]  SYSTEM INFO
    echo   [7]  MAINTENANCE
    echo.
    echo   [K]  K-TWEAKS / BETA
    echo   [L]  CHANGE LANGUAGE
    echo   [X]  EXIT
    echo.
    echo  ---------------------------------------------------------
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo.
    echo   [1]  NARZEDZIA DYSKOWE
    echo   [2]  NARZEDZIA SYSTEMOWE
    echo   [3]  NARZEDZIA SIECIOWE
    echo   [4]  CZYSZCZENIE
    echo   [5]  TWEAKI
    echo   [6]  INFORMACJE O SYSTEMIE
    echo   [7]  KONSERWACJA
    echo.
    echo   [K]  K-TWEAKS / BETA
    echo   [L]  ZMIEN JEZYK
    echo   [X]  WYJSCIE
    echo.
    echo  ---------------------------------------------------------
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto drive_menu
if /i "%choice%"=="2" goto system_menu
if /i "%choice%"=="3" goto network_menu
if /i "%choice%"=="4" goto cleaning_menu
if /i "%choice%"=="5" goto tweaks_menu
if /i "%choice%"=="6" goto info_menu
if /i "%choice%"=="7" goto maintenance_menu
if /i "%choice%"=="k" goto ktweaks
if /i "%choice%"=="l" goto language
if /i "%choice%"=="x" goto exit_script

goto menu


:: =========================================================
:: DRIVE MENU
:: =========================================================

:drive_menu
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo   DRIVE TOOLS
    echo.
    echo   [1]  Check Disk C: /scan
    echo   [2]  Repair Windows Image
    echo   [3]  System File Checker
    echo   [4]  Full Windows Repair
    echo   [5]  Drive Information
    echo.
    echo   [B]  Back
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo   NARZEDZIA DYSKOWE
    echo.
    echo   [1]  Sprawdz dysk C: /scan
    echo   [2]  Napraw obraz Windows
    echo   [3]  Sprawdz pliki systemowe
    echo   [4]  Pelna naprawa Windows
    echo   [5]  Informacje o dyskach
    echo.
    echo   [B]  Powrot
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto chkdsk_scan
if /i "%choice%"=="2" goto dism_restore
if /i "%choice%"=="3" goto sfc_scan
if /i "%choice%"=="4" goto full_repair
if /i "%choice%"=="5" goto drive_info
if /i "%choice%"=="b" goto menu

goto drive_menu


:: =========================================================
:: SYSTEM MENU
:: =========================================================

:system_menu
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo   SYSTEM TOOLS
    echo.
    echo   [1]  Windows Version
    echo   [2]  Power Plan
    echo   [3]  Enable High Performance
    echo   [4]  Startup Programs
    echo   [5]  Running Processes
    echo   [6]  Windows Services
    echo.
    echo   [B]  Back
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo   NARZEDZIA SYSTEMOWE
    echo.
    echo   [1]  Wersja Windows
    echo   [2]  Plan zasilania
    echo   [3]  Wlacz High Performance
    echo   [4]  Programy startowe
    echo   [5]  Uruchomione procesy
    echo   [6]  Uslugi Windows
    echo.
    echo   [B]  Powrot
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto windows_version
if /i "%choice%"=="2" goto power_plan
if /i "%choice%"=="3" goto high_performance
if /i "%choice%"=="4" goto startup_apps
if /i "%choice%"=="5" goto processes
if /i "%choice%"=="6" goto services
if /i "%choice%"=="b" goto menu

goto system_menu


:: =========================================================
:: NETWORK MENU
:: =========================================================

:network_menu
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo   NETWORK TOOLS
    echo.
    echo   [1]  IP Configuration
    echo   [2]  Flush DNS
    echo   [3]  Reset Winsock
    echo   [4]  Reset TCP/IP
    echo   [5]  Ping Test
    echo.
    echo   [B]  Back
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo   NARZEDZIA SIECIOWE
    echo.
    echo   [1]  Konfiguracja IP
    echo   [2]  Wyczysc DNS
    echo   [3]  Reset Winsock
    echo   [4]  Reset TCP/IP
    echo   [5]  Test Ping
    echo.
    echo   [B]  Powrot
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto ipconfig
if /i "%choice%"=="2" goto flush_dns
if /i "%choice%"=="3" goto winsock_reset
if /i "%choice%"=="4" goto tcp_reset
if /i "%choice%"=="5" goto ping_test
if /i "%choice%"=="b" goto menu

goto network_menu


:: =========================================================
:: CLEANING MENU
:: =========================================================

:cleaning_menu
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo   CLEANING
    echo.
    echo   [1]  User TEMP
    echo   [2]  Windows TEMP
    echo   [3]  DirectX Shader Cache
    echo   [4]  Windows Update Cache
    echo   [5]  Clean All Safe Caches
    echo.
    echo   [B]  Back
    echo.
    echo   ------------------------------------------------------
    echo   Only temporary/cache files are removed.
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo   CZYSZCZENIE
    echo.
    echo   [1]  TEMP uzytkownika
    echo   [2]  Windows TEMP
    echo   [3]  DirectX Shader Cache
    echo   [4]  Cache Windows Update
    echo   [5]  Wyczysc wszystkie bezpieczne cache
    echo.
    echo   [B]  Powrot
    echo.
    echo   ------------------------------------------------------
    echo   Usuwane sa tylko pliki tymczasowe/cache.
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto clean_user_temp
if /i "%choice%"=="2" goto clean_windows_temp
if /i "%choice%"=="3" goto clean_shader
if /i "%choice%"=="4" goto clean_update_cache
if /i "%choice%"=="5" goto clean_all
if /i "%choice%"=="b" goto menu

goto cleaning_menu


:: =========================================================
:: TWEAKS MENU
:: =========================================================

:tweaks_menu
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo   SAFE TWEAKS
    echo.
    echo   [1]  Disable Hibernation
    echo   [2]  Enable Hibernation
    echo   [3]  Flush DNS Cache
    echo   [4]  Component Store Cleanup
    echo   [5]  High Performance Power Plan
    echo   [6]  Balanced Power Plan
    echo.
    echo   [B]  Back
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo   BEZPIECZNE TWEAKI
    echo.
    echo   [1]  Wylacz hibernacje
    echo   [2]  Wlacz hibernacje
    echo   [3]  Wyczysc cache DNS
    echo   [4]  Czyszczenie komponentow Windows
    echo   [5]  Plan High Performance
    echo   [6]  Plan Balanced
    echo.
    echo   [B]  Powrot
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto disable_hibernate
if /i "%choice%"=="2" goto enable_hibernate
if /i "%choice%"=="3" goto flush_dns
if /i "%choice%"=="4" goto component_cleanup
if /i "%choice%"=="5" goto high_performance
if /i "%choice%"=="6" goto balanced_plan
if /i "%choice%"=="b" goto menu

goto tweaks_menu


:: =========================================================
:: INFO MENU
:: =========================================================

:info_menu
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo   SYSTEM INFORMATION
    echo.
    echo   [1]  Full System Information
    echo   [2]  CPU Information
    echo   [3]  RAM Information
    echo   [4]  GPU Information
    echo   [5]  Drive Information
    echo   [6]  Network Information
    echo.
    echo   [B]  Back
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo   INFORMACJE O SYSTEMIE
    echo.
    echo   [1]  Pelne informacje
    echo   [2]  Informacje CPU
    echo   [3]  Informacje RAM
    echo   [4]  Informacje GPU
    echo   [5]  Informacje o dyskach
    echo   [6]  Informacje sieciowe
    echo.
    echo   [B]  Powrot
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto system_info
if /i "%choice%"=="2" goto cpu_info
if /i "%choice%"=="3" goto ram_info
if /i "%choice%"=="4" goto gpu_info
if /i "%choice%"=="5" goto drive_info
if /i "%choice%"=="6" goto network_info
if /i "%choice%"=="b" goto menu

goto info_menu


:: =========================================================
:: MAINTENANCE MENU
:: =========================================================

:maintenance_menu
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo   MAINTENANCE
    echo.
    echo   [1]  DISM CheckHealth
    echo   [2]  DISM ScanHealth
    echo   [3]  DISM RestoreHealth
    echo   [4]  SFC ScanNow
    echo   [5]  Full DISM + SFC Repair
    echo.
    echo   [B]  Back
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo   KONSERWACJA
    echo.
    echo   [1]  DISM CheckHealth
    echo   [2]  DISM ScanHealth
    echo   [3]  DISM RestoreHealth
    echo   [4]  SFC ScanNow
    echo   [5]  Pelna naprawa DISM + SFC
    echo.
    echo   [B]  Powrot
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto dism_check
if /i "%choice%"=="2" goto dism_scan
if /i "%choice%"=="3" goto dism_restore
if /i "%choice%"=="4" goto sfc_scan
if /i "%choice%"=="5" goto full_repair
if /i "%choice%"=="b" goto menu

goto maintenance_menu


:: =========================================================
:: CHKDSK
:: =========================================================

:chkdsk_scan
cls
call :header
echo.
echo   CHKDSK C: /SCAN
echo.
chkdsk C: /scan
echo.
call :done
goto drive_menu


:: =========================================================
:: DISM
:: =========================================================

:dism_check
cls
call :header
echo.
DISM /Online /Cleanup-Image /CheckHealth
echo.
call :done
goto maintenance_menu


:dism_scan
cls
call :header
echo.
DISM /Online /Cleanup-Image /ScanHealth
echo.
call :done
goto maintenance_menu


:dism_restore
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Repairing Windows image...
    echo.
) else (
    echo.
    echo   Naprawianie obrazu Windows...
    echo.
)

DISM /Online /Cleanup-Image /RestoreHealth
echo.
call :done
goto drive_menu


:: =========================================================
:: SFC
:: =========================================================

:sfc_scan
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Scanning system files...
    echo.
) else (
    echo.
    echo   Skanowanie plikow systemowych...
    echo.
)

sfc /scannow
echo.
call :done
goto maintenance_menu


:full_repair
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   STEP 1/2 - DISM RestoreHealth
    echo.
) else (
    echo.
    echo   KROK 1/2 - DISM RestoreHealth
    echo.
)

DISM /Online /Cleanup-Image /RestoreHealth

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   STEP 2/2 - SFC ScanNow
    echo.
) else (
    echo.
    echo   KROK 2/2 - SFC ScanNow
    echo.
)

sfc /scannow

echo.
call :done
goto drive_menu


:: =========================================================
:: DRIVE INFO
:: =========================================================

:drive_info
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   DRIVE INFORMATION
    echo.
) else (
    echo.
    echo   INFORMACJE O DYSKACH
    echo.
)

powershell -NoProfile -Command "Get-CimInstance Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3} | Select-Object DeviceID,VolumeName,@{N='Size GB';E={[math]::Round($_.Size/1GB,2)}},@{N='Free GB';E={[math]::Round($_.FreeSpace/1GB,2)}} | Format-Table -AutoSize"

echo.
call :done
goto info_menu


:: =========================================================
:: WINDOWS INFO
:: =========================================================

:windows_version
cls
call :header

echo.
ver
echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"

echo.
call :done
goto system_menu


:: =========================================================
:: POWER
:: =========================================================

:power_plan
cls
call :header
echo.
powercfg /getactivescheme
echo.
powercfg /list
echo.
call :done
goto system_menu


:high_performance
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Enabling High Performance...
    echo.
) else (
    echo.
    echo   Wlaczanie High Performance...
    echo.
)

powercfg /setactive SCHEME_MIN

echo.
call :done
goto system_menu


:balanced_plan
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Restoring Balanced power plan...
    echo.
) else (
    echo.
    echo   Przywracanie planu Balanced...
    echo.
)

powercfg /setactive SCHEME_BALANCED

echo.
call :done
goto tweaks_menu


:: =========================================================
:: HIBERNATION
:: =========================================================

:disable_hibernate
cls
call :header
powercfg /hibernate off

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Hibernation disabled.
) else (
    echo.
    echo   Hibernacja zostala wylaczona.
)

echo.
call :done
goto tweaks_menu


:enable_hibernate
cls
call :header
powercfg /hibernate on

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Hibernation enabled.
) else (
    echo.
    echo   Hibernacja zostala wlaczona.
)

echo.
call :done
goto tweaks_menu


:: =========================================================
:: STARTUP
:: =========================================================

:startup_apps
cls
call :header
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_StartupCommand | Select-Object Name,Command,Location | Format-Table -Wrap -AutoSize"
echo.
call :done
goto system_menu


:: =========================================================
:: PROCESSES
:: =========================================================

:processes
cls
call :header
echo.
powershell -NoProfile -Command "Get-Process | Sort-Object CPU -Descending | Select-Object -First 25 ProcessName,Id,@{N='RAM MB';E={[math]::Round($_.WorkingSet64/1MB,1)}} | Format-Table -AutoSize"
echo.
call :done
goto system_menu


:: =========================================================
:: SERVICES
:: =========================================================

:services
cls
call :header
echo.
powershell -NoProfile -Command "Get-Service | Sort-Object Status,DisplayName | Format-Table Status,Name,DisplayName -AutoSize"
echo.
call :done
goto system_menu


:: =========================================================
:: CPU / RAM / GPU
:: =========================================================

:cpu_info
cls
call :header
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed | Format-List"
echo.
call :done
goto info_menu


:ram_info
cls
call :header
echo.
powershell -NoProfile -Command "$r=Get-CimInstance Win32_ComputerSystem; Write-Host ('Total RAM: ' + [math]::Round($r.TotalPhysicalMemory/1GB,2) + ' GB'); Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer,PartNumber,@{N='Capacity GB';E={[math]::Round($_.Capacity/1GB,2)}},Speed | Format-Table -AutoSize"
echo.
call :done
goto info_menu


:gpu_info
cls
call :header
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_VideoController | Select-Object Name,@{N='VRAM GB';E={[math]::Round($_.AdapterRAM/1GB,2)}},DriverVersion | Format-Table -AutoSize"
echo.
call :done
goto info_menu


:system_info
cls
call :header
echo.
systeminfo
echo.
call :done
goto info_menu


:network_info
cls
call :header
echo.
ipconfig /all
echo.
call :done
goto info_menu


:: =========================================================
:: NETWORK
:: =========================================================

:ipconfig
cls
call :header
echo.
ipconfig /all
echo.
call :done
goto network_menu


:flush_dns
cls
call :header
echo.
ipconfig /flushdns
echo.
call :done
goto network_menu


:winsock_reset
cls
call :header
echo.
netsh winsock reset

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Restart may be required.
) else (
    echo.
    echo   Moze byc wymagany restart komputera.
)

echo.
call :done
goto network_menu


:tcp_reset
cls
call :header
echo.
netsh int ip reset

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Restart may be required.
) else (
    echo.
    echo   Moze byc wymagany restart komputera.
)

echo.
call :done
goto network_menu


:ping_test
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    set "host="
    set /p "host=  Enter host (e.g. 1.1.1.1): "
) else (
    echo.
    set "host="
    set /p "host=  Podaj adres (np. 1.1.1.1): "
)

if "%host%"=="" goto network_menu

echo.
ping "%host%"
echo.
call :done
goto network_menu


:: =========================================================
:: CLEANING
:: =========================================================

:clean_user_temp
cls
call :header
echo.
call :clean_folder "%TEMP%"
echo.
call :done
goto cleaning_menu


:clean_windows_temp
cls
call :header
echo.
call :clean_folder "C:\Windows\Temp"
echo.
call :done
goto cleaning_menu


:clean_shader
cls
call :header
echo.
call :clean_folder "%LOCALAPPDATA%\D3DSCache"
echo.
call :done
goto cleaning_menu


:clean_update_cache
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Windows Update cache will be cleaned.
    echo.
    choice /C YN /N /M "  Continue? [Y/N]: "
) else (
    echo.
    echo   Cache Windows Update zostanie wyczyszczony.
    echo.
    choice /C YN /N /M "  Kontynuowac? [Y/N]: "
)

if errorlevel 2 goto cleaning_menu

net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1

call :clean_folder "C:\Windows\SoftwareDistribution\Download"

net start bits >nul 2>&1
net start wuauserv >nul 2>&1

echo.
call :done
goto cleaning_menu


:clean_all
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Cleaning safe temporary files...
    echo.
) else (
    echo.
    echo   Czyszczenie bezpiecznych plikow tymczasowych...
    echo.
)

call :clean_folder "%TEMP%"
call :clean_folder "C:\Windows\Temp"
call :clean_folder "%LOCALAPPDATA%\D3DSCache"

echo.
call :done
goto cleaning_menu


:: =========================================================
:: COMPONENT CLEANUP
:: =========================================================

:component_cleanup
cls
call :header
echo.
DISM /Online /Cleanup-Image /StartComponentCleanup
echo.
call :done
goto tweaks_menu


:: =========================================================
:: K-TWEAKS
:: =========================================================

:ktweaks
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   [1] Launch Melon Tweaks v2.1B
    echo   [2] Information
    echo   [B] Back
    echo.
    set "choice="
    set /p "choice=  Select option: "
) else (
    echo.
    echo   [1] Uruchom Melon Tweaks v2.1B
    echo   [2] Informacje
    echo   [B] Powrot
    echo.
    set "choice="
    set /p "choice=  Wybierz opcje: "
)

if /i "%choice%"=="1" goto launch_beta
if /i "%choice%"=="2" goto beta_info
if /i "%choice%"=="b" goto menu

goto ktweaks


:launch_beta
cls
call :header

set "BETA_FILE=%USERPROFILE%\Desktop\Melon Tweaks v2.1B.bat"

if exist "%BETA_FILE%" (
    if /i "%LANGUAGE%"=="EN" (
        echo.
        echo   Launching beta...
        echo.
    ) else (
        echo.
        echo   Uruchamianie wersji beta...
        echo.
    )

    start "" "%BETA_FILE%"
) else (
    echo.
    echo   [!] Beta file not found:
    echo.
    echo   %BETA_FILE%
)

echo.
pause
goto ktweaks


:beta_info
cls
call :header

if /i "%LANGUAGE%"=="EN" (
    echo.
    echo   Melon Tweaks v2.1 Beta
    echo.
    echo   This option launches the beta BAT file from Desktop.
) else (
    echo.
    echo   Melon Tweaks v2.1 Beta
    echo.
    echo   Ta opcja uruchamia plik BAT beta z pulpitu.
)

echo.
pause
goto ktweaks


:: =========================================================
:: CLEAN FOLDER FUNCTION
:: =========================================================

:clean_folder
set "TARGET=%~1"

if not exist "%TARGET%" (
    if /i "%LANGUAGE%"=="EN" (
        echo   [SKIP] Not found: %TARGET%
    ) else (
        echo   [POMIN] Nie znaleziono: %TARGET%
    )
    exit /b
)

echo   [CLEAN] %TARGET%

del /f /s /q "%TARGET%\*" >nul 2>&1

for /d /r "%TARGET%" %%D in (*) do (
    rd /s /q "%%D" >nul 2>&1
)

exit /b


:: =========================================================
:: HEADER
:: =========================================================

:header
echo.
echo  =========================================================
echo                   MELON TWEAKS v2.1
echo  =========================================================

if /i "%LANGUAGE%"=="EN" (
    echo                   LANGUAGE: ENGLISH
) else (
    echo                   JEZYK: POLSKI
)

echo  =========================================================
echo.
exit /b


:: =========================================================
:: DONE
:: =========================================================

:done
echo.
echo  ---------------------------------------------------------

if /i "%LANGUAGE%"=="EN" (
    echo   Operation completed.
) else (
    echo   Operacja zakonczona.
)

echo  ---------------------------------------------------------
echo.
pause
exit /b


:: =========================================================
:: EXIT
:: =========================================================

:exit_script
cls
echo.
echo  =========================================================
echo                  MELON TWEAKS v2.1
echo  =========================================================
echo.

if /i "%LANGUAGE%"=="EN" (
    echo   Thanks for using Melon Tweaks!
) else (
    echo   Dzieki za korzystanie z Melon Tweaks!
)

echo.
timeout /t 2 /nobreak >nul
exit /b
