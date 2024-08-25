#/bin/bash
clear
echo "script by Thavanish"
PS3='select you prefered method:[GUI install | CLI install]'
options=("GUI install" "CLI install" )
select opt in "${options[@]}"
do
    case $opt in
        "GUI install")
        chmod +x scripts/ui/installergui.sh
        bash scripts/ui/installergui.sh
        ;;
        "CLI install")
        chmod +x scripts/ui/installercli.sh
        bash scripts/ui/installercli.sh
        ;;
        *) echo "invalid option $REPLY";;
    esac
done
