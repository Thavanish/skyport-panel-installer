#/bin/bash
clear
echo "moving"
mv start-paneld.sh ~/
ls
echo "script by Topg"
PS3='select you prefered method:[GUI install | CLI install | Exit] : '
options=("GUI install" "CLI install" "Exit" )
select opt in "${options[@]}"
do
    case $opt in
        "GUI install")
        sudo chmod +x scripts/ui/installergui.sh
        sudo bash scripts/ui/installergui.sh
        exit
        ;;
        "CLI install")
        sudo chmod +x scripts/ui/installercli.sh
        sudo bash scripts/ui/installercli.sh
        exit
        ;;
        "Exit")
        exit
        ;;
        *) echo "invalid option $REPLY";;
    esac
done
