echo off
set clean=%1
if %clean%==clean del environment\venv_win
echo on

@REM create venv if it dose not exists
if not exist "venv_win" python -m venv environment/venv_win

@REM assume that windows systems has a nvidia GPU
environment\venv_win\Scripts\pip install -r environment/requirements_gpu.txt
environment\venv_win\Scripts\pip install -r environment/requirements_base.txt

@REM enable sliders in notebooks
environment\venv_win\Scripts\python -m jupyter nbextension enable --py --sys-prefix widgetsnbextension

@REM start env
environment\venv_win\Scripts\Activate