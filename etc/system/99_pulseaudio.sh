#!bash
source "../install"

init_pulse() {
    if can_use_sudo; then
        sudo apt-get install libsndfile1-dev libportaudio19-dev -y
        if type "snap" >/dev/null; then
            sudo snap install pulseaudio
            sudo snap connect pulseaudio:home core
        else
            sudo apt-get -o APT::Install-Suggests=true install pulseaudio -y
            sudo gpasswd -a ${USER} audio
            sudo gpasswd -a ${USER} pulse
            sudo gpasswd -a ${USER} pulse-access
            sudo systemctl daemon-reload
            systemctl enable --now pulseaudio
        fi
}

logexec init_pulse