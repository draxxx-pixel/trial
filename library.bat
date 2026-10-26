
@echo off
setlocal EnableExtensions EnableDelayedExpansion
title PDF Library
color 0A

set "FOLDER=%~dp0documents"

:MENU
cls
echo ====================================
echo             PDF LIBRARY
echo ====================================
echo.

if not exist "%FOLDER%" mkdir "%FOLDER%"

set /a COUNT=0
for %%F in ("%FOLDER%\*.pdf") do (
    if exist "%%~fF" (
        set /a COUNT+=1
        echo !COUNT!. %%~nxF
    )
)

if !COUNT! EQU 0 echo No PDF files found.

echo.
echo [R] Refresh
echo [0] Exit
echo.
set "CHOICE="
set /p "CHOICE=Enter PDF number: "

if /i "!CHOICE!"=="0" exit /b
if /i "!CHOICE!"=="R" goto MENU

set /a COUNT=0
set "SELECTED="
for %%F in ("%FOLDER%\*.pdf") do (
    if exist "%%~fF" (
        set /a COUNT+=1
        if "!COUNT!"=="!CHOICE!" set "SELECTED=%%~fF"
    )
)

if not defined SELECTED (
    echo Invalid selection.
    pause
    goto MENU
)

start "" "!SELECTED!"
goto MENU
