@REM create venv if it dose not exists
if not exist "venv_win" python -m venv venv_win

@REM assume that windows systems has a nvidia GPU
venv_win\Scripts\pip install -r environment/requirements_gpu.txt
venv_win\Scripts\pip install -r environment/requirements_base.txt

@REM enable sliders in notebooks
venv_win\Scripts\python -m jupyter nbextension enable --py --sys-prefix widgetsnbextension

@REM start env
venv_win\Scripts\Activate