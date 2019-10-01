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
Log out and log back in (or reboot) so that your group membership is re-evaluated. You can type groups command in a terminal window after that and check if docker group is in its output.

# Install docker-compose (1.19.0 or newer). Compose is a tool for defining and running multi-container docker applications.

sudo apt-get install -y python3-pip
sudo pip3 install docker-compose

#Clone CVAT source code from the GitHub repository.

sudo apt-get install -y git
git clone https://github.com/opencv/cvat
cd cvat

#Build docker images by default. It will take some time to download public docker image ubuntu:16.04 and install all necessary ubuntu packages to run CVAT server.

docker-compose build

#Run docker containers. It will take some time to download public docker images like postgres:10.3-alpine, redis:4.0.5-alpine and create containers.

docker-compose up -d

#You can register a user but by default it will not have rights even to view list of tasks. Thus you should create a superuser. A superuser can use an admin panel to assign correct groups to the user. Please use the command below:

docker exec -it cvat bash -ic 'python3 ~/manage.py createsuperuser'
