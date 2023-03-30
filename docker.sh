#! /bin/bash
__banner()
{
    echo "============================================================"
    echo $*
    echo "============================================================"
}
clean=""
all_gpus=""
file=""
if [[ $1 == "clean" ]]; then 
    __banner docker images will be rebuilt
    clean = "--no-cache"
fi

# find nvidia gpu
gpu=$(lspci | tr '[:upper:]' '[:lower:]' | grep -i nvidia)

# if gpu available add --gpus all
if [[ $gpu == *' nvidia '* ]]; then
    
    __banner 'Nvidia GPU is present:  %s\n' "$gpu"
    all_gpus="--gpus all"
    file=dockerfile.gpu
else
    __banner 'Nvidia GPU is not present cpu only!\n'  
    file=dockerfile
fi

docker build -t party_image \
        $clean \
        --build-arg WORK_DIR=$PWD \
        --build-arg USER_ID=$(id -u) \
        --build-arg GROUP_ID=$(id -g) \
        --build-arg USER_NAME=$USER \
        -f environment/$file environment \
        || exit

docker run -ti --rm \
        -v ~:/home/$USER \
        $all_gpus \
        -v /mnt:/mnt \
        -v /etc/localtime:/etc/localtime:ro \
        -u $(id -u):$(id -g) \
        --net=host \
        party_image bash 