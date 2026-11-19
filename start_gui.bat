@echo off
setlocal
cd /d "%~dp0"
title MicroMatch

set "PY=.venv\Scripts\python.exe"
if not exist "%PY%" (
  echo First run: creating a Python environment in .venv ...
  py -3 -m venv .venv 2>nul || python -m venv .venv
)
if not exist "%PY%" (
  echo.
  echo Python was not found. Install Python 3.10 or newer from https://www.python.org/downloads/
  echo and tick "Add python.exe to PATH" during installation. Then run this file again.
  pause
  exit /b 1
)

echo Checking the required packages ...
"%PY%" -m pip install --disable-pip-version-check -q -r gui\requirements.txt
if errorlevel 1 (
  echo.
  echo Installing the packages failed. Check your internet connection and run this file again.
  pause
  exit /b 1
)

"%PY%" gui\server.py
pause
