echo "the files will be deleted at the destination of install......"
sleep 10
sudo rm -rf /etc/skyport/*
sudo rm -rf /etc/skyport/*
sudo rm -rf /etc/skyport/*
sudo rm -rf /etc/skyport/*

sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
sudo echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt update
sudo apt install -y nodejs git
cd /etc
git clone --branch v0.2.1 https://github.com/skyportlabs/panel
mv panel skyport
cd skyport
npm install
npm run seed
npm run createUser


echo "use 'node .' to start the panel!"
echo "sleeping for 5 sec"
sleep 5
clear
