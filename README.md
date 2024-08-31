# SkyPort Panel Installer

Welcome to the SkyPort Panel Installer! This tool is designed to help you set up and manage your game servers efficiently through a user-friendly panel.

## Features

- Easy installation and setup.
- Supports multiple game servers.
- User-friendly web interface for server management.
- Automated updates and backups.
- Resource monitoring and alerts.

## Prerequisites

Before you begin, ensure you have the following:

- A server running a Debian-based Linux distribution (e.g., Ubuntu 20.04+).
- Root or sudo access to the server.
- Internet access for downloading dependencies.
- Basic knowledge of Linux command line.

## Installation

Follow these steps to install the SkyPort Panel:

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
    chmod +x install.sh
    ```

5. **Run the installer script:**
    ```bash
    sudo bash install.sh
    ```

6. **Follow the on-screen instructions** to complete the setup.

## Usage

Once the installation is complete, you can access the SkyPort Panel through your web browser:

1. **Open your browser and navigate to:**
    ```
    http://your-server-ip:port
    ```
    Replace `your-server-ip` with your server's IP address and `port` with the port number specified during installation.

2. **Login with the credentials** provided during the installation process.

3. **Manage your game servers**:
   - Add new game servers.
   - Start, stop, or restart servers.
   - Monitor server performance.
   - Configure server settings.

## Updating the Panel

To update the SkyPort Panel, run the following commands:

```bash
cd skyport-panel-installer
git pull origin main
chmod +x update.sh
sudo bash update.sh
```

## Contributing

We welcome contributions! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch-name`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch-name`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have any questions, feel free to open an issue on GitHub or contact us via email at support@example.com.

---

Thank you for using the SkyPort Panel Installer!
```

Let me know if there's anything else you'd like to adjust!
