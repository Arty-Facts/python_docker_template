python3 -m venv venv
# find GPU
gpu=$(lspci | tr '[:upper:]' '[:lower:]' | grep -i nvidia)

# if nvidia is pressent assume that we can install requirements_gpu deps
if [[ $gpu == *' nvidia '* ]]; then
    printf 'Nvidia GPU is present:  %s\n' "$gpu"
    ./venv/bin/pip install -r environment/requirements_gpu.txt
else
    printf 'Nvidia GPU is not present cpu only!\n'
    # No gpu!? install requirements_cpu deps
    ./venv/bin/pip install -r environment/requirements_cpu.txt
fi

./venv/bin/pip install -r environment/requirements_base.txt

# enable sliders in notebooks
./venv/bin/python3 -m jupyter nbextension enable --py --sys-prefix widgetsnbextension

chmod +x venv/bin/activate

# start env
source ./venv/bin/activate
