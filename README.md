# Docker project template

## How to use the template

```
git clone https://github.com/Arty-Facts/docker_template.git

git remote remove origin

git remote add origin <new remote>

git push --set-upstream origin main
```

## Setup and enter the docker image environment 

In linux

```
./docker.sh [clean]
```

## Setup and enter the virtual environment 

In windows

```
env.bat 
```


In linux

```
source ./env.sh [clean]
```

In docker

```
source ./env_enter.sh
```

## Update docker environment

In the file (environment/base-packeges.sh) add apt packages that you need in your project

note that a newline will brake the RUN command and thus "\\" should be used when adding dependencies. More information on how docker works can be found on https://docs.docker.com/get-started/


## Update pip environment

Due to some packages accelerator dependencies like Nvidia GPU'S and pytorch
its nice to split packages into three files

*environment\requirements_base.txt* - accelerator independent packages

*environment\requirements_gpu.txt* - accelerator dependent GPU packages

*environment\requirements_base.txt* - accelerator dependent CPU alternatives packages

