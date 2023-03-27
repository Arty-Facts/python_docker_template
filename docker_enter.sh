#! /bin/bash

# find nvidia gpu
gpu=$(lspci | tr '[:upper:]' '[:lower:]' | grep -i nvidia)

printf '==============\n'

# if gpu available add --gpus all
if [[ $gpu == *' nvidia '* ]]; then
    docker build -t party_image \
        --build-arg WORK_DIR=$PWD \
        --build-arg USER_ID=$(id -u) \
        --build-arg GROUP_ID=$(id -g) \
        --build-arg USER_NAME=$USER \
        -f environment/dockerfile.gpu environment \
        || exit
    printf 'Nvidia GPU is present:  %s\n' "$gpu"
    docker run -ti --rm \
        -v ~:/home/$USER \
        --gpus all \
        -v /mnt:/mnt \
        -v /etc/localtime:/etc/localtime:ro \
        -u $(id -u):$(id -g) \
        --net=host \
        party_image bash 
else
    printf 'Nvidia GPU is not present cpu only!\n'
    docker build -t party_image_gpu \
        --build-arg WORK_DIR=$PWD \
        --build-arg USER_ID=$(id -u) \
        --build-arg GROUP_ID=$(id -g) \
        --build-arg USER_NAME=$USER \
        -f environment/dockerfile.gpu environment \
        || exit

    docker run -ti --rm \
        -v ~:/home/$USER \
        -v /mnt:/mnt \
        -v /etc/localtime:/etc/localtime:ro \
        -u $(id -u):$(id -g) \
        --net=host \
        party_image_gpu bash 
fi
