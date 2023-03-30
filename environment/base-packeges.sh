#!/bin/bash

# Install base packages
apt-get update
apt-get install -y --no-install-recommends --fix-missing\
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