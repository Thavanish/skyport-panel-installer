echo "checking dependencies"
sudo apt install tmux -y > /dev/null 2>&1
 clear
 #!/bin/bash

# Define paths to the directories containing the Node.js applications
APP1_DIR="/etc/skyport"
APP2_DIR="/etc/skyportd"

# Define the tmux session name
SESSION_NAME="node_apps"

# Define the key binding and tmux config file
KEY_BINDING="bind-key K kill-session"
TMUX_CONF="$HOME/.tmux.conf"

# Function to add the key binding to .tmux.conf
add_key_binding() {
    if grep -Fxq "$KEY_BINDING" "$TMUX_CONF"; then
        echo "Key binding already exists in $TMUX_CONF"
    else
        echo "$KEY_BINDING" >> "$TMUX_CONF"
        echo "Key binding added to $TMUX_CONF"
    fi
}

# Add the key binding to .tmux.conf and reload tmux configuration
add_key_binding
tmux source-file "$TMUX_CONF"

# Check if a tmux session already exists and exit if it does
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Tmux session '$SESSION_NAME' already exists. Please kill it manually or choose another session name."
    exit 1
fi

# Create a new tmux session and start the first application
tmux new-session -d -s "$SESSION_NAME" "cd $APP1_DIR && sudo node ."

# Split the window horizontally and start the second application
tmux split-window -h "cd $APP2_DIR && sudo node ."

# Attach to the tmux session
tmux attach-session -t "$SESSION_NAME"
