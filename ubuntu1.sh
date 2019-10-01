# SRC: https://github.com/opencv/cvat/blob/develop/cvat/apps/documentation/installation.md
# Type commands below into the terminal window to install docker. More instructions can be found here.

sudo apt-get update
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Perform post-installation steps to run docker without root permissions.

sudo groupadd docker
sudo usermod -aG docker $USER

# Log out and log back in (or reboot) so that your group membership is re-evaluated. You can type groups command in a terminal window after that and check if docker group is in its output.
echo "Now log out and log back in, then run curl -sSL https://github.com/zmpvn/cvat_install/raw/master/ubuntu2.sh | bash"
