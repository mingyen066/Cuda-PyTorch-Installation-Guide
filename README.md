# Cuda and Torch installation guide
A setup guide for installing python, nvidia-driver, cuda, cuDNN, and Pytorch from the new installed ubuntu


* [Python](#Python) 
* [Nvidia driver](#Nvidia-driver) 
* [Cuda](#Cuda)
    * [(Optional) Remove Cuda](#(Optional)-Remove-Cuda)
    * [Install Cuda](#Install-Cuda)
    * [Install Cudnn](#Install-Cudnn)
* [Pytorch](#Pytorch)
    * [Install PyTorch by pip](#Install-PyTorch-by-pip)
    * [Check whether PyTorch is installed](#Check-whether-PyTorch-is-installed)
    
# Python 
Make a hard link to ensure that you use python3 as a default python, and there is no python path problem while running shell script.
```
sudo rm -rf /usr/bin/python
sudo ln /usr/bin/python3 /usr/bin/python
```
## Get Python-pip
```bash
sudo apt-get install python3-pip
python3 -m pip install --upgrade pip
```

# Nvidia Graphics Driver
https://www.geforce.com.tw/drivers \
Choose and download the driver which corresponding to your gpu, then install it. \
For example:
```bash
sudo sh NVIDIA-Linux-x86_64-440.82.run
```
If you meet Nouveau kernel problem, please type these 2 command to blackout nouveau:
```bash
$ sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
$ sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
```
After you finish the installation process, you can type
```bash
nvidia-smi
```
to check whether you have already installed graphic driver. \
You can see the response, like this:
```bash
Tue Apr 28 15:24:34 2020       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 440.82       Driver Version: 440.82       CUDA Version: 10.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce GTX 1080    Off  | 00000000:01:00.0 Off |                  N/A |
| 26%   38C    P0    35W / 180W |      0MiB /  8119MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```

# Cuda 
## (Optional) Remove Cuda
```bash
sudo apt-get purge cuda
```
```bash
sudo apt-get purge cuda-XX-YY
sudo apt-get autoremove
```
For example, if you installed cuda 10.1, then you type
```bash
sudo apt-get purge cuda-10-1
```
maybe there are some other versions of cuda in /usr/local/
you can remove all of it by
```bash
sudo rm -r /usr/local/cuda*
```
## Install Cuda 
https://developer.nvidia.com/cuda-toolkit-archive \
Choose the cuda version that you want to install (say, 10.2), and assume the machine environment is Ubuntu 18.04.\
I recommend install cuda by **runfile (local)** because it has good command-line prompts that can help you to install cuda, and set PATH environment for cuda automatically. \
For example:
```bash
sudo sh cuda_10.2.89_440.33.01_linux.run
```
While you are installing cuda, a prompt will be displayed, asking you whether to install "Driver", "CUDA Toolkit", "CUDA Samples",... \
The "Driver" here means "Nvidia Graphics Driver" \
Since we have already installed Driver in the previous step, **do NOT install Driver (i.e., unselect Driver) while running cuda installation runfile.** \
(I have tried to install Driver via cuda installation runfile but it usually leads to installation problem.)


### Add Cuda to Path
Type the command below, which appends two lines of code into ~/.bashrc to get cuda path
```bash
echo >> ~/.bashrc '
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64'
```
then type the command which will source ~/.bashrc
```bash
source ~/.bashrc
```


### Check whether Cuda is installed
By just type command below 
```bash
nvcc -V
```
You can see the response:
```bash
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2019 NVIDIA Corporation
Built on Wed_Oct_23_19:24:38_PDT_2019
Cuda compilation tools, release 10.2, V10.2.89
```

## Install Cudnn
https://developer.nvidia.com/rdp/cudnn-download \
After you download all three files, you can install them via: \
(You cannot download these files by curl or wget because nvidia needs users to login)
```bash
sudo dpkg -i libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb
sudo dpkg -i libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb
sudo dpkg -i libcudnn7-doc_7.6.5.32-1+cuda10.2_amd64.deb # not requirement, doc is for verifying installation
```

### Check whether CuDNN is installed
type in command below
```bash
CUDNN_H_PATH=/usr/include/cudnn.h
cat ${CUDNN_H_PATH} | grep CUDNN_MAJOR -A 2
```
you can see the response:
```bash
#define CUDNN_MAJOR 7
#define CUDNN_MINOR 6
#define CUDNN_PATCHLEVEL 5
--
#define CUDNN_VERSION (CUDNN_MAJOR * 1000 + CUDNN_MINOR * 100 + CUDNN_PATCHLEVEL)

#include "driver_types.h"
```
which means you are using CuDNN 7.6.5

### Test Cudnn via mnist training example
If you installed libcudnn-doc, you can exploit mnist examples from doc to verify whether cudnn is installed correctly.
```bash
cd /usr/src/cudnn_samples_v7/mnistCUDNN
sudo make clean
sudo make 
./mnistCUDNN
```

# PyTorch
## Install PyTorch by pip
```bash
pip install torch torchvision
```

## Check whether PyTorch is installed
```bash
$ python
Python 3.6.9 (default, Apr 18 2020, 01:56:04) 
[GCC 8.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> torch.cuda.is_available()
True
```