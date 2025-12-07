@echo off
git pull origin main

REM Verificar si hay cambios pendientes
git diff --quiet
if errorlevel 1 (
    git add .
    git commit -m "Actualizacion automatica"
    git push

    echo.
    echo ============================================
    echo   Deploy completado correctamente
    echo   Los cambios ya estan en GitHub y Netlify
    echo ============================================
) else (
    echo.
    echo ============================================
    echo   No hay cambios para subir
    echo ============================================
)

pause