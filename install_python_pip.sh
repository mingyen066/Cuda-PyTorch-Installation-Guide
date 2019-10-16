sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git vim gcc g++
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.7
sudo python3.7 -m pip install --upgrade pip
sudo apt-get update

echo >> ~/.bashrc 'alias python=python3.7'
echo >> ~/.bashrc 'alias pip=pip3.7'
source ~/.bashrc
echo "now you can use python3.7 and pip3 by directly typing python and pip repectively"

pip install --user -r requirements.txt


