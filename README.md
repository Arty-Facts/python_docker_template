# Docker project template

## Setup and enter the docker image environment 

In linux

```
source ./docker_enter.sh
```

In windows (buggy with GPU not recommended)

```
docker_enter.bat
```

## Setup and enter the virtual environment 

In windows

```
env_enter.bat
```


In linux

```
source ./env_enter.sh
```

In docker

```
source ./env_enter.sh
```

## Update docker environment

In the docker file (environment/dockerfile) under install dependencies add apt packages that you need in your project

note that a newline will brake the RUN command and thus "\" should be used when adding dependencies. More information on how docker works can be found on https://docs.docker.com/get-started/


## Update pip environment

Due to some packages accelerator dependencies like Nvidia GPU'S and pytorch
its nice to split packages into three files

*environment\requirements_base.txt* - accelerator independent packages

*environment\requirements_gpu.txt* - accelerator dependent GPU packages

*environment\requirements_base.txt* - accelerator dependent CPU alternatives packages

