#/bin/bash
echo "starting install......"
PS3='select you prefered method:'
options=("GUI install" "CLI install" )
select opt in "${options[@]}"
do
    case $opt in
        "GUI install..")
        chmod +x installergui.sh
        ./installergui
        ;;
        "CLI install...")
        chmod +x installercli.sh
        ./installercli.sh
        ;;
        *) echo "invalid option $REPLY";;
    esac
done
