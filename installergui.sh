#/bin/bash
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="script by Thavanish"
TITLE="Skyport panel installer"
MENU="what do you want to do?:"

OPTIONS=(1 "install panel"
         2 "install daemon"
         3 "install both"
         4 "remove panel"
         5 "remove daemon"
         6 "quit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "installing panel......."
            clear
            echo "install panel....."
            chmod +x panel
            ./panel.sh
            ;;
        2)
            echo "installing daemon......"
            clear          
            echo "install daemon........"
            chmod +x daemon.sh
            ./daemon.sh
            ;;
        3)
            echo "installing panel and dameon........."
             clear
            echo "installing panel and daemon......"
            clear
            echo "install panel....."
            chmod +x panel.sh
            ./panel.sh
            clear          
            echo "install daemon........"
            chmod +x daemon.sh
           ./daemon.sh
            ;;
        4)
            echo "removing panel....."
            clear
            echo "removing panel.."
            sudo rm -rf /etc/skyport/*
            ;;
        5)
            echo "removing daemon......"
            clear
            echo "removing daemon.."
            sudo rm -rf /etc/skyportd/*
            ;;
        6)
            echo "exiting...."
            exit
            ;;   
            
esac
