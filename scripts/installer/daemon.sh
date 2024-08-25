echo "the files will be deleted at the destination of install......"
sleep 10
sudo rm -rf /etc/skyportd/*
sudo rm -rf /etc/skyportd/*
sudo rm -rf /etc/skyportd/*
sudo rm -rf /etc/skyportd/*


curl -sSL https://get.docker.com/ | CHANNEL=stable bash

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt update
sudo apt install -y nodejs git
cd /etc
sudo git clone --branch v0.2.2 https://github.com/skyportlabs/skyportd
cd skyportd
sudo npm install
clear
echo "use 'node .' to start the panel!"
echo "sleeping for 5 sec"
sleep 5
clear
