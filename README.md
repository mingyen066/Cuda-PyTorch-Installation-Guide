# ML-toolkit-installer
set up guide for installing python3, pip3, nvidia-driver, cuda, and cuDNN from the new installed ubuntu

# Prerequisite
```bash
git clone https://github.com/mingyen066/ML-toolkit-installer.git
cd ML-toolkit-installer
sudo chmod +x *.sh
```
* [Python](#Python) 
* [Nvidia driver](#Nvidia-driver) 
* [Cuda](#Cuda)
    * [(Optional) Remove Cuda](#(Optional)-Remove-Cuda)
    * [Install Cuda](#Install-Cuda)
    * [Install Cudnn](#Install-Cudnn)

# Python 
You need to add module names (that you want to install) to requirements.txt, then run 
```bash
./install_python_pip.sh
```
After that, you can use python3 and pip3 by directly typing python and pip respectively. \
Furthermore, the python packages that you want to get in requirements.txt are already installed.


# Nvidia driver
https://www.geforce.com.tw/drivers \
Choose the driver which corresponding to you gpu, then install it.
you can type
```bash
nvidia-smi
```
```bash
Fri Sep  6 00:38:04 2019
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 435.21       Driver Version: 435.21       CUDA Version: 10.1     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce RTX 2070    Off  | 00000000:01:00.0 Off |                  N/A |
| 38%   39C    P0    42W / 185W |      0MiB /  7979MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   1  GeForce RTX 2070    Off  | 00000000:02:00.0 Off |                  N/A |
| 38%   36C    P0     1W / 185W |      0MiB /  7982MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```
to check whether you have already installed graphic driver
# Cuda 
# (Optional) Remove Cuda
```bash
sudo apt-get remove cuda
```
```bash
sudo apt-get remove cuda-XX-YY
sudo apt-get autoremove
```
for example if you installed cuda 10.1, then you type
```bash
sudo apt-get remove cuda-10-1
```
maybe there are some other versions of cuda in /usr/local/
you can remove totally it by
```bash
sudo rm -r /usr/local/cuda*
```
# Install Cuda 
https://developer.nvidia.com/cuda-toolkit-archive \
Choose the cuda version that you want to install (say, 10.0), and assume the machine environment is Ubuntu18.04.\
I recommend install cuda by local runfile because it has good command-line prompts that can help you to install install cuda, and set PATH environment for cuda automatically. \
**DO NOT INSTALL nvidia driver via cuda debian file because it usually leads installation problem.**


## Add Cuda to Path
you can **either** append two lines of code below into ~/.bashrc
```bash
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
```
then type the command below in the bash
```bash
source ~/.bashrc
```
**or** directly run the shell script which does the same thing.
```bash
./cudaPath.sh
```

## Verify Cuda is already is installed 
By just type command below 
```bash
nvcc -V
```
you can see the response:
```bash
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2018 NVIDIA Corporation
Built on Sat_Aug_25_21:08:01_CDT_2018
Cuda compilation tools, release 10.0, V10.0.130
```

# Install Cudnn
https://developer.nvidia.com/rdp/cudnn-download \
After you download all three files, you can install them via: \
(You cannot download these files by curl or wget because nvidia needs users to login)
```bash
sudo dpkg -i libcudnn7_7.6.2.24-1+cuda10.0_amd64.deb
sudo dpkg -i libcudnn7-dev_7.6.2.24-1+cuda10.0_amd64.deb
sudo dpkg -i libcudnn7-doc_7.6.2.24-1+cuda10.0_amd64.deb # not requirement, doc is for verify installation
```

## Verify Cudnn is already is installed 
type in command below
```bash
CUDNN_H_PATH=/usr/include/cudnn.h
cat ${CUDNN_H_PATH} | grep CUDNN_MAJOR -A 2
```
you can see the response:
```bash
#define CUDNN_MAJOR 7
#define CUDNN_MINOR 6
#define CUDNN_PATCHLEVEL 1
--
#define CUDNN_VERSION (CUDNN_MAJOR * 1000 + CUDNN_MINOR * 100 + CUDNN_PATCHLEVEL)

#include "driver_types.h"
```
which means you are using CuDNN 7.6.1.

## Test Cudnn via mnist training example
If you installed libcudnn-doc, you can exploit mnist examples from doc to verify whether cudnn is installed correctly.
```bash
cd /usr/src/cudnn_samples_v7/mnistCUDNN
make clean
sudo make 
./mnistDNN
```

