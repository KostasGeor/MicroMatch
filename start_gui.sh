#!/usr/bin/env sh
# Starts the MicroMatch GUI on macOS or Linux:  sh start_gui.sh
set -e
cd "$(dirname "$0")"

if [ ! -x .venv/bin/python ]; then
  echo "First run: creating a Python environment in .venv ..."
  python3 -m venv .venv || {
    echo "Could not create the environment. On Ubuntu/Debian run: sudo apt install python3-venv"
    exit 1
  }
fi

echo "Checking the required packages ..."
.venv/bin/python -m pip install --disable-pip-version-check -q -r gui/requirements.txt
exec .venv/bin/python gui/server.py "$@"
