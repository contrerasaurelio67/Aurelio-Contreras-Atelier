@echo off
git pull origin main
git add .
git commit -m "Actualizacion automatica"
git push

echo.
echo ============================================
echo   Deploy completado correctamente
echo   Los cambios ya estan en GitHub y Netlify
echo ============================================
pause