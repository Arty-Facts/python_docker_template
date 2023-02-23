docker build -t party_image --build-arg WORK_DIR=/home/docker --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 --build-arg=docker environment || exit

docker run -ti --rm -v %cd%:/home/docker --gpus all -v /etc/localtime:/etc/localtime:ro --net=host party_image bash 
