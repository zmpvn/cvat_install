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
