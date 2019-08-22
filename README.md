# ML-toolkit-installer
set up guide for installing python3, pip3, nvidia-driver, cuda, and cuDNN

## Pre-action
```bash
git clone https://github.com/mingyen066/ML-toolkit-installer.git
cd ML-toolkit-installer
sudo chmod +x *.sh
```

## Python 
You need to add module names (that you want to install) to requirements.txt, then run 
```bash
./python3Pip3.sh
```
After that, you can use python3 and pip3 by directly typing python and pip respectively. \
Furthermore, the python packages that you want to get in requirements.txt are already installed.


## Cuda 
https://developer.nvidia.com/cuda-toolkit-archive \
Choose the cuda version that you want to install (say, 10.0), and assume the machine environment is Ubuntu18.04.\
I recommend install cuda by local runfile because it has good command-line prompts that can help you to install nvidia driver, install cuda, and set PATH environment for cuda automatically.

## Cudnn
https://developer.nvidia.com/rdp/cudnn-download\
After you download all three files, you can use for example:
```bash
sudo -i dpkg libcudnn7_7.6.2.24-1+cuda10.0_amd64.deb
sudo -i dpkg libcudnn7-dev_7.6.2.24-1+cuda10.0_amd64.deb
sudo -i dpkg libcudnn7-doc_7.6.2.24-1+cuda10.0_amd64.deb
```

## Add Cuda to Path
./cudaPath.sh

## verify cudnn is already is installed 
```bash
CUDNN_H_PATH=/usr/include/cudnn.h
cat ${CUDNN_H_PATH} | grep CUDNN_MAJOR -A 2
```
## Test Cudnn from libcudnn-doc
If you installed libcudnn-doc, you can exploit mnist examples from doc to verify whether cudnn is installed correctly.
```bash
cd /usr/src/cudnn_samples_v7/mnistCUDNN
make clean
sudo make 
./mnistDNN
```

