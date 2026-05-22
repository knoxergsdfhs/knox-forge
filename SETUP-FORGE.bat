@echo off
REM ============================================================
REM  Knox Forge — first-time local git setup
REM  Run this ONCE after creating an empty GitHub repo.
REM  Prompts for the repo URL, then inits + commits + pushes.
REM ============================================================
setlocal
cd /d "%~dp0"

echo.
echo === Knox Forge — first-time setup ===
echo.
echo Before running this: create an empty repo on GitHub (no README, no license).
echo Suggested name: knox-forge
echo Copy the HTTPS URL (looks like: https://github.com/knoxergsdfhs/knox-forge.git)
echo.

set /p REPO_URL=Paste the GitHub repo URL:

if "%REPO_URL%"=="" (
    echo No URL given. Aborting.
    pause
    exit /b 1
)

echo.
echo === git init ===
git init
git branch -M main

echo.
echo === git config ===
git config user.email "ken.grover@acadianasystems.com"
git config user.name "Ken Grover"

echo.
echo === git remote ===
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo.
echo === git add + commit ===
git add -A
git commit -m "Knox Forge v0.1 - AI prompt to 3D model + assistant"

echo.
echo === git push ===
git push -u origin main

echo.
echo === DONE ===
echo.
echo Next steps:
echo   1. Go to https://vercel.com  -^>  Add New Project  -^>  Import this repo
echo   2. Click Deploy (no build settings needed - it's static)
echo   3. Vercel gives you a URL like https://knox-forge.vercel.app
echo.
echo From then on, just double-click DEPLOY-FORGE.bat to ship updates.
echo.
pause
endlocal
