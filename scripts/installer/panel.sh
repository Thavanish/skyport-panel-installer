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
sudo touch /etc/skyport/package.json
#!/bin/bash

#!/bin/bash

# Overwrite the existing /etc/skyport/package.json with new content
sudo tee /etc/skyport/package.json > /dev/null <<EOF
{
  "name": "skyport",
  "version": "0.2.1",
  "description": "Skyport is an open source panel for managing and operating game servers and applications built using Node.js with Express and Dockerode.",
  "main": "index.js",
  "bin": {
    "skyport": "./exec/bin/index.js"
  },
  "scripts": {
    "start": "node index.js",
    "start:dev": "nodemon index.js",
    "dev": "concurrently \"npm run start\" \"npm run watch\"",
    "watch": "browser-sync start --config bs-config.js",
    "seed": "node exec/seed.js",
    "createUser": "node exec/createUser.js",
    "build:css": "npx tailwindcss -i ./public/tw.conf -o ./public/assets/tailwind.css --watch"
  },
  "author": "skyportlabs",
  "license": "ISC",
  "dependencies": {
    "@keyv/sqlite": "^3.6.7",
    "@tailwindcss/forms": "^0.5.7",
    "axios": "^1.7.2",
    "bcrypt": "^5.1.1",
    "better-sqlite3": "^11.1.2",
    "better-sqlite3-session-store": "^0.1.0",
    "body-parser": "^1.20.2",
    "cat-loggr": "^1.2.2",
    "chalk": "^4.1.2",
    "commander": "^12.1.0",
    "cookie-parser": "^1.4.6",
    "ejs": "^3.1.10",
    "express": "^4.19.2",
    "express-basic-auth": "^1.2.1",
    "express-rate-limit": "^7.4.0",
    "express-session": "^1.18.0",
    "express-ws": "^5.0.2",
    "form-data": "^4.0.0",
    "fs": "^0.0.1-security",
    "keyv": "^4.5.4",
    "multer": "^1.4.5-lts.1",
    "nodemailer": "^6.9.14",
    "passport": "^0.7.0",
    "passport-local": "^1.0.0",
    "qrcode": "^1.5.3",
    "readline": "^1.3.0",
    "speakeasy": "^2.0.0",
    "tailwindcss": "^3.4.6",
    "uuid": "^10.0.0"
  },
  "devDependencies": {
    "browser-sync": "^3.0.2",
    "concurrently": "^8.2.2",
    "nodemon": "^3.1.4"
  }
}
EOF

echo "/etc/skyport/package.json has been updated."

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
