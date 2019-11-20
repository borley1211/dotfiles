#!bash
source ../install
echo ""
logging "INFO" "** RUNNING $(basename $0) **"

if can_use_sudo; then
    sudo apt-get install zsh chsh -y
else
    apt-get install zsh chsh -y
fi

logging "SUCCESS" "** FINISHED **"
exit 0
