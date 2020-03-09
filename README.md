# ML-toolkit-installer
A setup guide for installing python3, pip3, nvidia-driver, cuda, and cuDNN from the new installed ubuntu

# Prerequisite (If Python3 is not installed yet)
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
You may want to add additional module names that will be installed to requirements.txt, then run 
```bash
./install_python_pip.sh
```
**After restarting your shell**, you can use python3 and pip3 by directly typing python and pip respectively. \
Furthermore, the python packages added to requirements.txt are already installed.
If you want to make a hard link to make sure there is no python path problem in shell script, you can type the command:
```bash
ln /usr/bin/python /usr/bin/python3.7
```

# Nvidia Graphics Driver
https://www.geforce.com.tw/drivers \
Choose the driver which corresponding to your gpu, then install it.
You can type
```bash
nvidia-smi
```
to check whether you have already installed graphic driver. \
You can see the response, like this:
```bash
Thu Feb 13 13:45:42 2020       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 440.33.01    Driver Version: 440.33.01    CUDA Version: 10.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce GTX 1080    Off  | 00000000:01:00.0 Off |                  N/A |
| 32%   49C    P5     9W / 180W |    629MiB /  8119MiB |     18%      Default |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|    0      1256      G   /usr/lib/xorg/Xorg                           371MiB |
|    0      1740      G   ...quest-channel-token=4107256176665617484    92MiB |
|    0      2424      G   compiz                                       162MiB |
+-----------------------------------------------------------------------------+
```

# Cuda 
# (Optional) Remove Cuda
```bash
sudo apt-get remove cuda
```
```bash
sudo apt-get remove cuda-XX-YY
sudo apt-get autoremove
```
For example, if you installed cuda 10.1, then you type
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
Choose the cuda version that you want to install (say, 10.1), and assume the machine environment is Ubuntu18.04.\
I recommend install cuda by **runfile (local)** because it has good command-line prompts that can help you to install cuda, and set PATH environment for cuda automatically. \
For example:
```bash
chmod u+x cuda_10.2.89_440.33.01_linux.run
sudo ./cuda_10.2.89_440.33.01_linux.run
```
While you are installing cuda, a prompt will be displayed, asking you whether to install "Driver", "CUDA Toolkit", "CUDA Samples",... \
The "Driver" here means "Nvidia Graphics Driver" \
Since we have already installed Driver in the previous step, \
**do NOT install Driver (i.e., unselect Driver) while running cuda installation runfile.** \
(I have tried to install Driver via cuda installation runfile but it usually leads to installation problem.)


## Add Cuda to Path
Type the command into bash which appends two lines of code into ~/.bashrc to get cuda path
```bash
echo >> ~/.bashrc '
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64'
```
then type the command which will source ~/.bashrc
```bash
source ~/.bashrc
```


## Verify Cuda is already is installed 
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

# Install Cudnn
https://developer.nvidia.com/rdp/cudnn-download \
After you download all three files, you can install them via: \
(You cannot download these files by curl or wget because nvidia needs users to login)
```bash
sudo dpkg -i libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb
sudo dpkg -i libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb
sudo dpkg -i libcudnn7-doc_7.6.5.32-1+cuda10.2_amd64.deb # not requirement, doc is for verify installation
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
#define CUDNN_PATCHLEVEL 5
--
#define CUDNN_VERSION (CUDNN_MAJOR * 1000 + CUDNN_MINOR * 100 + CUDNN_PATCHLEVEL)

#include "driver_types.h"
```
which means you are using CuDNN 7.6.5

## Test Cudnn via mnist training example
If you installed libcudnn-doc, you can exploit mnist examples from doc to verify whether cudnn is installed correctly.
```bash
cd /usr/src/cudnn_samples_v7/mnistCUDNN
sudo make clean
sudo make 
./mnistCUDNN
```

