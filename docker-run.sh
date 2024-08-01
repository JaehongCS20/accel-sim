# Docker for building nvbit
docker run -it --name 'jhcho-accelsim' --gpus '"device=7"' --env CUDA_INSTALL_PATH=/usr/local/cuda-11.0 -v `pwd`:/home/runner/accel-sim/ docker.io/accelsim/ubuntu-18.04_cuda-11

# export PATH=$CUDA_INSTALL_PATH/bin:$PATH
# ./util/tracer_nvbit/install_nvbit.sh
# make -C ./util/tracer_nvbit/
# source ./gpu-app-collection/src/setup_environment

# install python 3.8
# apt update
# apt install software-properties-common
# add-apt-repository ppa:deadsnakes/ppa
# apt install python3.8

# symbolic link
# ls -l /usr/bin/python*
# rm /usr/bin/python
# rm /usr/bin/python3
# ln -s /usr/bin/python3.8 /usr/bin/python
# ln -s /usr/bin/python3.8 /usr/bin/python3

# install pytroch for 3090, cuda 11.0
# python -m pip install --upgrade pip
# python -m pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 -f https://download.pytorch.org/whl/torch_stable.html
# python -m pip install pyyaml plotly psutil

# add tests in accel-sim-framework/util/job_launching/apps/define-all-apps.yml
# generate trace 
./util/tracer_nvbit/run_hw_trace.py -B gpt3-attn -D 0

# python -m pip install -r requirements.txt
# source ./gpu-simulator/setup_environment.sh
# make -j -C ./gpu-simulator/


./util/job_launching/run_simulations.py -B gpt3-ln -C RTX3070 -N gpt3-7b-ln -T ./hw_run/traces/device-0/11.0/

./util/job_launching/monitor_func_test.py -v -N gpt3-7b-ln