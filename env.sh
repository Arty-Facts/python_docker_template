#! /bin/bash
__banner()
{
    echo "============================================================"
    echo $*
    echo "============================================================"
}

if [[ $1 == "clean" ]]; then 
    __banner Remove old env...
    rm -rf environment/venv/ 
fi

python3 -m venv environment/venv
# find GPU
gpu=$(lspci | tr '[:upper:]' '[:lower:]' | grep -i nvidia)

# if nvidia is pressent assume that we can install requirements_gpu deps
if [[ $gpu == *' nvidia '* ]]; then
    __banner 'Nvidia GPU is present:  %s\n instaling deps' "$gpu"
    ./environment/venv/bin/pip install -r environment/requirements_gpu.txt
else
    __banner 'Nvidia GPU is not present instaling cpu deps only!'
    # No gpu!? install requirements_cpu deps
    ./environment/venv/bin/pip install -r environment/requirements_cpu.txt
fi

__banner Instaling base packages... 
./environment/venv/bin/pip install -r environment/requirements_base.txt

# enable sliders in notebooks
./environment/venv/bin/python3 -m jupyter nbextension enable --py --sys-prefix widgetsnbextension

chmod +x environment/venv/bin/activate

# start env
source ./environment/venv/bin/activate
