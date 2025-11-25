@echo off
REM Démarre un serveur HTTP local sur le port 8000 pour tester le site sur téléphone

REM Définir le dossier racine du site
set SITE_DIR=%~dp0

REM Vérifier si Python est installé
python --version >nul 2>&1
if errorlevel 1 (
    echo Python n'est pas installé. Veuillez installer Python pour utiliser ce script.
    pause
    exit /b
)

REM Obtenir l'adresse IP locale
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    set IP_PC=%%a
)
REM Nettoyer l'espace au début et les espaces inutiles
for /f "tokens=* delims= " %%b in ("%IP_PC%") do set IP_PC=%%b

REM Démarrer le serveur HTTP dans une nouvelle fenêtre
cd /d "%SITE_DIR%"
start "Serveur HTTP" python -m http.server 8000

REM Afficher le message de confirmation
echo Serveur local demarre sur http://%IP_PC%:8000
echo Pour acceder au site sur votre telephone, utilisez l'adresse IP de votre PC : %IP_PC%
echo Le serveur est bien demarre !

pause