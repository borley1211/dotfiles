#!bash
source ../install
echo ""
logging "INFO" "** RUNNING $(basename $0) **"

if can_use_sudo; then
    sudo apt-get update
    sudo apt-get upgrade -y
else
    apt-get update
    apt-get upgrade -y
fi

logging "SUCCESS" "** FINISHED **"
exit 0
