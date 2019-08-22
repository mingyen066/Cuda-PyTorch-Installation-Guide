# ML-toolkit-installer
shell script that install python nvidia-driver cuda

# Pre-action
git clone https://github.com/mingyen066/ML-toolkit-installer.git
cd ML-toolkit-installer \
sudo +x *.sh \

# Python 
You need to add module names (that you want to install) to requirements.txt, then run ./python3Pip3.sh \
After that, you can use python3 and pip3 by directly typing python and pip respectively. \
Furthermore, the python packages that you want to get in requirements.txt are already installed.
<!-- 
# Nvidia Driver
Go to Nvidia website below, choose the driver corespondding to you GPU, and run it.
https://www.nvidia.com/Download/index.aspx?lang=en-us

For example:
wget http://us.download.nvidia.com/tesla/418.87/NVIDIA-Linux-x86_64-418.87.00.run
chmod +x NVIDIA-Linux-x86_64-418.87.00.run 
sudo ./NVIDIA-Linux-x86_64-418.87.00.run  -->

# Cuda 
https://developer.nvidia.com/cuda-toolkit-archive \
Choose the cuda version that you want to install(Let's say 10.0), and assume the machine environment is Ubuntu18.04.
I recommend install cuda by local runfile because it has good command-line prompts that can help you to install nvidia driver, install cuda, and set PATH environment for cuda automatically.

# Add Cuda to Path
./cudaPath.sh

# verify cudnn is already is installed 
CUDNN_H_PATH=/usr/include/cudnn.h \
cat ${CUDNN_H_PATH} | grep CUDNN_MAJOR -A 2