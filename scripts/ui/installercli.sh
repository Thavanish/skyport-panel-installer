#/bin/bash
clear
echo "starting install......"
echo "1)install panel 2)install daemon 3)install both 4)remove panel 5)remove daemon 6)quit"
PS3='What do you want to do ?:
1)install panel 2)install daemon 3)install both 4)remove panel 5)remove daemon 6)quit'
options=("instal1 panel" "install daemon" "install both" "remove panel" "remove daemon" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "instal1 panel")
            clear
            echo "install panel....."
            chmod +x scripts/installer/panel
            bash scripts/installer/panel.sh
            
            ;;
        "install daemon")
            clear          
            echo "install daemon........"
            chmod +x scripts/installer/daemon.sh
            bash scripts/installer/daemon.sh
            
            ;;
        "install both")
            clear
            echo "installing panel and daemon......"
            clear
            echo "install panel....."
            chmod +x scripts/installer/panel.sh
            bash scripts/installer/panel.sh
            clear          
            echo "install daemon........"
            chmod +x scripts/installer/daemon.sh
            bash scripts/installer/daemon.sh
           
           ;;
        "remove panel")
            clear
            echo "removing panel.."
            sudo rm -rf /etc/skyport/*
            
            ;;
        "remove daemon")
            clear
            echo "removing daemon.."
            sudo rm -rf /etc/skyportd/*
            
            ;;
        "quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

