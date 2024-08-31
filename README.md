# SkyPort Panel Installer

[![GitHub issues](https://img.shields.io/github/issues/Thavanish/skyport-panel-installer)](https://github.com/Thavanish/skyport-panel-installer/issues)
[![GitHub stars](https://img.shields.io/github/stars/Thavanish/skyport-panel-installer)](https://github.com/Thavanish/skyport-panel-installer/stargazers)
[![License](https://img.shields.io/github/license/Thavanish/skyport-panel-installer)](https://github.com/Thavanish/skyport-panel-installer/blob/main/LICENSE)
[![Development Status](https://img.shields.io/badge/development%20status-early%20stage-yellow)](https://github.com/Thavanish/skyport-panel-installer) 

Welcome to the SkyPort Panel Installer! This Bash script simplifies the installation of the SkyPort Panel, originally created by the SkyPort Labs team. The SkyPort Panel provides an intuitive web interface for managing game servers.

## Features

- **Effortless Installation:** Streamlined setup with a few simple commands.
- **Comprehensive Management:** Control multiple game servers from a single interface.
- **User-Friendly Interface:** Easy access through a web browser.
- **Automated Maintenance:** Includes features for updates and backups.
- **Resource Monitoring:** Track server performance effectively.

## Prerequisites

Ensure you have the following before starting:

- A Debian-based Linux server (e.g., Ubuntu 20.04+).
- Root or sudo privileges.
- Internet access to download necessary dependencies.
- Basic knowledge of the Linux command line.

## Installation

To install the SkyPort Panel, follow these steps:

1. **Update your system:**
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

2. **Install required dependencies:**
    ```bash
    sudo apt install -y curl git
    ```

3. **Clone the repository:**
    ```bash
    git clone https://github.com/Thavanish/skyport-panel-installer.git
    cd skyport-panel-installer
    ```

4. **Make the installer script executable:**
    ```bash
    chmod +x installer.sh
    ```

5. **Run the installer script:**
    ```bash
    sudo bash installer.sh
    ```

6. **Follow the on-screen instructions** to complete the installation.

## Starting the Panel

To start the SkyPort Panel, use these commands:

1. **Navigate to the SkyPort directory:**
    ```bash
    cd /etc/skyport
    ```

2. **Start the panel using Node.js:**
    ```bash
    sudo node .
    ```

3. **Repeat the process for the SkyPort daemon directory:**
    ```bash
    cd /etc/skyportd
    sudo node .
    ```

4. **Access the panel through your web browser:**
    ```
    http://your-server-ip:port
    ```
    Replace `your-server-ip` with your server's IP address and `port` with the port number specified during installation.

## Usage

After installation and starting the panel, you can:

- **Log in** with the credentials provided during installation.
- **Manage game servers**:
   - Add, start, stop, or restart servers.
   - Monitor server performance.
   - Configure server settings.

## Updating the Panel

To update the SkyPort Panel, execute:

```bash
cd skyport-panel-installer
git pull origin main
chmod +x update.sh
sudo bash update.sh
```
Contributing

We welcome contributions! If you’d like to contribute:

    Fork the repository.
    Create a new branch (git checkout -b feature-branch-name).
    Make your changes and commit them (git commit -am 'Add new feature').
    Push to the branch (git push origin feature-branch-name).
    Create a Pull Request.

Support

For any issues or questions, please open an issue on GitHub or contact us at thegreenflame1507@gmail.com.

Thank you for using the SkyPort Panel Installer!
A Little Joke to Brighten Your Day

Why did the server break up with the network?

Because it had too many "issues"!

The SkyPort Panel Installer is a Bash script for installing the SkyPort Panel created by the SkyPort Labs team. This project is currently in its early stages of development.

```

Feel free to adjust any details or let me know if there’s anything else you’d like to include!
