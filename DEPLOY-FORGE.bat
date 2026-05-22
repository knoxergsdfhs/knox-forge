@echo off
setlocal
cd /d "%~dp0"

set LOGFILE=..\forge-deploy-log.txt
echo. > "%LOGFILE%"
echo === FORGE DEPLOY STARTED at %DATE% %TIME% === >> "%LOGFILE%"
echo Now in: %CD% >> "%LOGFILE%"

echo === git config === >> "%LOGFILE%"
git config user.email "ken.grover@acadianasystems.com" >> "%LOGFILE%" 2>&1
git config user.name "Ken Grover" >> "%LOGFILE%" 2>&1

echo. >> "%LOGFILE%"
echo === git status === >> "%LOGFILE%"
git status --short >> "%LOGFILE%" 2>&1

echo. >> "%LOGFILE%"
echo === git add === >> "%LOGFILE%"
git add -A >> "%LOGFILE%" 2>&1

echo. >> "%LOGFILE%"
echo === git commit === >> "%LOGFILE%"
git commit -m "forge: deploy" >> "%LOGFILE%" 2>&1
echo commit exit code: %ERRORLEVEL% >> "%LOGFILE%"

echo. >> "%LOGFILE%"
echo === git push origin main === >> "%LOGFILE%"
git push origin main >> "%LOGFILE%" 2>&1
echo push exit code: %ERRORLEVEL% >> "%LOGFILE%"

echo. >> "%LOGFILE%"
echo === git log -1 === >> "%LOGFILE%"
git log -1 --oneline >> "%LOGFILE%" 2>&1

echo. >> "%LOGFILE%"
echo === DONE at %TIME% === >> "%LOGFILE%"

type "%LOGFILE%"
endlocal
