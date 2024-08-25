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
sudo mkdir /etc/skyport/exec/
sudo touch /etc/skyport/exec/seed.js
sudo touch /etc/skyport/exec/createUser.js

#!/bin/bash

# Overwrite the existing /etc/skyport/exec/createUser.js with new content
sudo tee /etc/skyport/exec/createUser.js > /dev/null <<EOF
const readline = require('readline');
const { db } = require('../handlers/db.js');
const { v4: uuidv4 } = require('uuid');
const bcrypt = require('bcrypt');
const CatLoggr = require('cat-loggr');
const log = new CatLoggr();
const saltRounds = process.env.SALT_ROUNDS || 10;

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// 7gv.png
async function doesUserExist(username) {
    const users = await db.get('users');
    if (users) {
        return users.some(user => user.username === username);
    } else {
        return false;
    }
}

async function doesEmailExist(email) {
    const users = await db.get('users');
    if (users) {
        return users.some(user => user.email === email);
    } else {
        return false;
    }
}

async function initializeUsersTable(username, email, password) {
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    const userId = uuidv4();
    const users = [{ userId, username, email, password: hashedPassword, accessTo: [], admin: true, verified: true }];
    return db.set('users', users);
}

async function addUserToUsersTable(username, email, password) {
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    const userId = uuidv4();
    const users = await db.get('users') || [];
    users.push({ userId, username, email, password: hashedPassword, accessTo: [], admin: true, verified: true });
    return db.set('users', users);
}

async function createUser(username, email, password) {
    const users = await db.get('users');
    if (!users) {
        return initializeUsersTable(username, email, password);
    } else {
        return addUserToUsersTable(username, email, password);
    }
}

function askQuestion(question) {
    return new Promise((resolve) => {
        rl.question(question, (answer) => {
            resolve(answer);
        });
    });
}

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

async function main() {
    while (true) {
        log.init('Create a new *admin* user for the Skyport Panel:');
        log.init('You can make regular users from the admin -> users page.');
        
        const username = await askQuestion("Username: ");
        const email = await askQuestion("Email: ");

        if (!isValidEmail(email)) {
            log.error("Invalid email!");
            continue;
        }

        const password = await askQuestion("Password: ");

        const userExists = await doesUserExist(username);
        const emailExists = await doesEmailExist(email);
        if (userExists || emailExists) {
            log.error("User already exists!");
            continue;
        }

        try {
            await createUser(username, email, password);
            log.info("Done! User created.");
            rl.close();
            break;
        } catch (err) {
            log.error('Error creating user:', err);
        }
    }
}

main().catch(err => {
    console.error('Unexpected error:', err);
    rl.close();
});
EOF

echo "/etc/skyport/exec/createUser.js has been updated."

#!/bin/bash

# Overwrite the existing /etc/skyport/exec/seed.js with new content
sudo tee /etc/skyport/exec/seed.js > /dev/null <<EOF
const axios = require('axios');
const { db } = require('../handlers/db');
const CatLoggr = require('cat-loggr');
const log = new CatLoggr();
const readline = require('readline');
const { v4: uuidv4 } = require('uuid');
const config = require('../config.json');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// https://i.imgu
async function seed() {
  try {
    // First check if there are any images already in the database 
    const existingImages = await db.get('images');
    if (existingImages && existingImages.length > 0) {
      rl.question('\'images\' is already set in the database. Do you want to continue seeding? (y/n) ', async (answer) => {
        if (answer.toLowerCase() !== 'y') {
          log.info('seeding aborted by the user.');
          rl.close();
          process.exit(0);
        } else {
          await performSeeding();
          rl.close();
        }
      });
    } else {
      await performSeeding();
      rl.close();
    }
  } catch (error) {
    log.error(\`failed during seeding process: \${error}\`);
    rl.close();
  }
}

// r.com/uNob
async function performSeeding() {
  try {
    const imagesIndexResponse = await axios.get('https://raw.githubusercontent.com/skyportlabs/images_v2/main/seed/0.1.0-beta2.json');
    const imageUrls = imagesIndexResponse.data;
    let imageDataArray = [];

    for (let url of imageUrls) {
      log.init('fetching image data...');
      try {
        const imageDataResponse = await axios.get(url);
        let imageData = imageDataResponse.data;
        imageData.Id = uuidv4();

      
        log.init('seeding: ' + imageData.Name);
        imageDataArray.push(imageData);
      } catch (error) {
        log.error(\`failed to fetch image data from \${url}: \${error}\`);
      }
    }

    if (imageDataArray.length > 0) {
      await db.set('images', imageDataArray);
      log.info('seeding complete!');
    } else {
      log.info('no new images to seed.');
    }
  } catch (error) {
    log.error(\`failed to fetch image URLs or store image data: \${error}\`);
  }
}

seed();

process.on('exit', (code) => {
  log.info('exiting...');
});

process.on('unhandledRejection', (reason, promise) => {
  log.error('Unhandled Rejection at:', promise, 'reason:', reason);
  process.exit(1);
});
EOF

echo "/etc/skyport/exec/seed.js has been updated."


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
