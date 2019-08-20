echo >> ~/.bashrc '
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/64:$LD_LIBRARY_PATH'
source ~/.bashrc