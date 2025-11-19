@echo off
echo 📦 Adding all changes...
git add .

echo 🤖 Generating commit message with Copilot...
for /f "delims=" %%a in ('gh copilot suggest commit 2^>nul') do set msg=%%a

if "%msg%"=="" set msg=Auto commit %date% %time%

echo 📝 Commit message: %msg%
git commit -m "%msg%"

echo 🚀 Pushing to GitHub...
git push origin main

echo ✅ All done!
pause
