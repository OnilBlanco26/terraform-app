# echo $@ | sudo echo hola
while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
   sleep 1
done
sudo apt-get update

systemctl stop firewalld
systemctl disable firewalld

snap install docker
sudo systemctl start docker
sudo systemctl enable docker

sudo apt-get update 
#este comando es para que se instale el docker-ce y Git
setenforce 0
sudo apt-get install -y git-all
git clone https://github.com/OnilBlanco26/dockerwebapp.git
cd /root/dockerwebapp && docker-compose up -d --build