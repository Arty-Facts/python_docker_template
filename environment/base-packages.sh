#!/bin/bash

# Install base packages
apt update
apt install -y --no-install-recommends --fix-missing\
    python3.10\
    python3.10-venv\
    software-properties-common\
    vim\
    emacs\
    git\
    libgl1\
    pciutils\
    sudo\
    openssh-client