# ML-toolkit-installer
shell script that install python nvidia-driver cuda

# Pre-action
git clone https://github.com/mingyen066/ML-toolkit-installer.git
cd ML-toolkit-installer
sudo +x *.sh

# Python 
You need to add module names( what you want to install) to requirements.txt, then run ./python3Pip3.sh
After that, you can use python3 and pip3 by just typing python and pip.
Furthermore, The python packages that you choose in requirements.txt are installed.

# Nvidia Driver
Go to Nvidia website below, choose the driver corespondding to you GPU, and run it.
https://www.nvidia.com/Download/index.aspx?lang=en-us

For example:
wget http://us.download.nvidia.com/tesla/418.87/NVIDIA-Linux-x86_64-418.87.00.run
chmod +x NVIDIA-Linux-x86_64-418.87.00.run 
sudo ./NVIDIA-Linux-x86_64-418.87.00.run 

# Cuda driver
https://www.tensorflow.org/install/gpu

# Add Cuda to Path
./cudaPath.sh

# verify cudnn is already is installed 
CUDNN_H_PATH=/usr/include/cudnn.h
cat ${CUDNN_H_PATH} | grep CUDNN_MAJOR -A 2