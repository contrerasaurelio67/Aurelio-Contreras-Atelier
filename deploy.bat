@echo off
REM ============================================
REM   Script de Deploy robusto con verificacion
REM ============================================

REM Sincronizar con el remoto antes de subir
git pull origin main
if errorlevel 1 (
    echo.
    echo [ERROR] No se pudo sincronizar con el remoto.
    pause
    exit /b
)

REM Verificar si hay cambios pendientes
git diff --quiet
if errorlevel 1 (
    set /p commitmsg=Ingrese el mensaje de commit: 
    if "%commitmsg%"=="" set commitmsg=Actualizacion automatica

    git add .
    git commit -m "%commitmsg%"
    git push

    if errorlevel 1 (
        echo.
        echo [ERROR] No se pudo hacer push al remoto.
    ) else (
        echo.
        echo ============================================
        echo   Deploy completado correctamente
        echo   Los cambios ya estan en GitHub y Netlify
        echo ============================================
    )
) else (
    echo.
    echo ============================================
    echo   No hay cambios para subir
    echo ============================================
)

pause