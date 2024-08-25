sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
sudo echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt update
sudo apt install -y nodejs git
sleep 1
cd /etc
sudo git clone --branch v0.2.1 https://github.com/skyportlabs/panel
sudo mv panel skyport
cd skyport
sleep 2
sudo npm install
sleep2
clear
sudo npm run seed
sleep 2
sudo npm run createUser
sleep 2 

echo "use 'node .' to start the panel!"
echo "sleeping for 5 sec"
sleep 5
clear
