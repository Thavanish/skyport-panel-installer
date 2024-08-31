#!/bin/bash

# Define the output file
OUTPUT_FILE="$(dirname "$0")/output"

# Function to log messages and errors
log_message() {
    echo "$1" >> "$OUTPUT_FILE"
}

# Install dialog if not already installed
log_message "Installing dialog..."
sudo apt install dialog -y >> "$OUTPUT_FILE" 2>&1

# Clear the screen for a fresh start
clear

# Define dialog window dimensions and titles
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="SkyPort Panel Installer"
TITLE="Main Menu"
MENU="Choose an option:"

# Define menu options
OPTIONS=(
    1 "Install Panel"
    2 "Install Daemon"
    3 "Install Both"
    4 "Remove Panel"
    5 "Remove Daemon"
    6 "Quit"
)

# Display the menu and capture user choice
CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

# Clear the screen for the next action
clear

# Function to display a message box
show_message() {
    local message=$1
    dialog --title "Information" --backtitle "$BACKTITLE" --msgbox "$message" 7 60
}

# Function to display a yes/no dialog
confirm_action() {
    local question=$1
    dialog --title "Confirmation" --backtitle "$BACKTITLE" --yesno "$question" 7 60
}

# Process user choice
case $CHOICE in
    1)
        if confirm_action "Are you sure you want to install the Panel?"; then
            log_message "Starting Panel Installation..."
            clear
            show_message "Installing Panel..."
            chmod +x scripts/installer/panel.sh
            bash scripts/installer/panel.sh >> "$OUTPUT_FILE" 2>&1
            show_message "Panel installation completed successfully."
        else
            show_message "Panel installation canceled."
        fi
        ;;
    2)
        if confirm_action "Are you sure you want to install the Daemon?"; then
            log_message "Starting Daemon Installation..."
            clear
            show_message "Installing Daemon..."
            chmod +x scripts/installer/daemon.sh
            bash scripts/installer/daemon.sh >> "$OUTPUT_FILE" 2>&1
            show_message "Daemon installation completed successfully."
        else
            show_message "Daemon installation canceled."
        fi
        ;;
    3)
        if confirm_action "Are you sure you want to install both Panel and Daemon?"; then
            log_message "Starting Installation of Panel and Daemon..."
            clear
            show_message "Installing Panel and Daemon..."
            chmod +x scripts/installer/panel.sh
            bash scripts/installer/panel.sh >> "$OUTPUT_FILE" 2>&1
            chmod +x scripts/installer/daemon.sh
            bash scripts/installer/daemon.sh >> "$OUTPUT_FILE" 2>&1
            show_message "Panel and Daemon installation completed successfully."
        else
            show_message "Installation canceled."
        fi
        ;;
    4)
        if confirm_action "Are you sure you want to remove the Panel?"; then
            log_message "Starting Panel Removal..."
            clear
            show_message "Removing Panel..."
            sudo rm -rf /etc/skyport/* >> "$OUTPUT_FILE" 2>&1
            show_message "Panel removal completed successfully."
        else
            show_message "Panel removal canceled."
        fi
        ;;
    5)
        if confirm_action "Are you sure you want to remove the Daemon?"; then
            log_message "Starting Daemon Removal..."
            clear
            show_message "Removing Daemon..."
            sudo rm -rf /etc/skyportd/* >> "$OUTPUT_FILE" 2>&1
            show_message "Daemon removal completed successfully."
        else
            show_message "Daemon removal canceled."
        fi
        ;;
    6)
        show_message "Exiting the installer. Goodbye!"
        exit
        ;;
    *)
        show_message "Invalid selection. Exiting..."
        exit 1
        ;;
esac
