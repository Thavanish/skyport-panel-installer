#/bin/bash
clear
echo "script by Thavanish"
PS3='select you prefered method:[GUI install | CLI install | Exit]'
options=("GUI install" "CLI install" "Exit" )
select opt in "${options[@]}"
do
    case $opt in
        "GUI install")
        chmod +x scripts/ui/installergui.sh
        bash scripts/ui/installergui.sh
        exit
        ;;
        "CLI install")
        chmod +x scripts/ui/installercli.sh
        bash scripts/ui/installercli.sh
        exit
        ;;
        "Exit")
        exit
        ;;
        *) echo "invalid option $REPLY";;
    esac
done
