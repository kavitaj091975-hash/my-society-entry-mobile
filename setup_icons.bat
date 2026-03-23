@echo off
REM MySociety Entry - App Icon Setup Script (Windows)
REM This script automates the icon generation process

echo.
echo ========================================
echo MySociety Entry - App Icon Setup
echo ========================================
echo.

REM Step 1: Check if logo exists
if not exist "assets\logo\mysociety_logo.png" (
    echo [!] ERROR: Logo file not found!
    echo.
    echo Please place your logo file at: assets\logo\mysociety_logo.png
    echo.
    echo Recommended: 512x512 pixels or larger
    echo Supported formats: PNG (best), SVG (will be converted to PNG)
    echo.
    pause
    exit /b 1
)

echo [✓] Logo file found: assets\logo\mysociety_logo.png
echo.

REM Step 2: Get dependencies
echo [1/3] Getting dependencies...
echo Running: flutter pub get
call flutter pub get
if %ERRORLEVEL% NEQ 0 (
    echo [!] Error getting dependencies
    pause
    exit /b 1
)
echo [✓] Dependencies updated
echo.

REM Step 3: Generate icons
echo [2/3] Generating app icons...
echo Running: flutter pub run flutter_launcher_icons
call flutter pub run flutter_launcher_icons
if %ERRORLEVEL% NEQ 0 (
    echo [!] Error generating icons
    pause
    exit /b 1
)
echo [✓] Icons generated successfully!
echo.

REM Step 4: Clean and prepare
echo [3/3] Cleaning and preparing...
echo Running: flutter clean
call flutter clean
echo Running: flutter pub get
call flutter pub get
echo [✓] Project cleaned and ready
echo.

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Your app icons are now configured for:
echo   ✓ Android (all screen densities)
echo   ✓ iOS (all required sizes)
echo   ✓ Splash Screen (logo in header)
echo.
echo Next step: Run your app
echo   flutter run
echo.
pause
