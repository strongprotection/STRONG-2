THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

# echo the color
gray() {
  printf '\e[1;30m%s\n\e[0;39;49m' "$@"
}
red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
brown() {
  printf '\e[1;33m%s\n\e[0;39;49m' "$@"
}
blue() {
  printf '\e[1;34m%s\n\e[0;39;49m' "$@"
}
pink() {
  printf '\e[1;35m%s\n\e[0;39;49m' "$@"
}
paleblue() {
  printf '\e[1;36m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}

function logo() {
green "          ___  ____  ____   ____          ____   ____   ____   ____  ____  ____  ____  ____  0   ____        "
green "         |___   ||  |____| |    | | \  | |  __  |____| |____| |    |  ||  |____ |       ||  ||  |    | | \  |"           
white "          ___|  ||  |  \   |____| |  \ | |_ __| |      |  \   |____|  ||  |____ |____   ||  ||  |____| |  \ |"
red   "         STRONGPROTECTION ROBOT BY BEHNAM MARZJI"
}
function logo1() {
green "          ___  ____  ____   ____          ____   ____   ____   ____  ____  ____  ____  ____  0   ____        "
green "         |___   ||  |____| |    | | \  | |  __  |____| |____| |    |  ||  |____ |       ||  ||  |    | | \  |"           
white "          ___|  ||  |  \   |____| |  \ | |_ __| |      |  \   |____|  ||  |____ |____   ||  ||  |____| |  \ |"
red   "         STRONGPROTECTION ROBOT "
red   "         STRONGPROTECTION ROBOT BY BEHNAM MARZJI"
}
update() {
  git pull
  install 
}

install() {
green 'Do you want me to install? (Yy/Nn): '
  read -rp ' ' install
  case "$install" in
    Y|y)
      echo 'Installing update and updating'
        sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 -y c++-4.7 -y
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
		sudo apt-get install screen -y
		sudo apt-get install tmux -y
		sudo apt-get install libstdc++6 -y
		sudo apt-get install lua-lgi -y
		sudo apt-get install libnotify-dev
      echo ''
  esac
}

telegram-cli() {
red 'Do you want me to install the telegram-cli? (Yy/Nn): '
  read -rp ' ' install
  case "$install" in
    Y|y)
 echo "telegram-cli-1222 has been downloading..."
 mkdir -p "$THIS_DIR"/tg
echo "Creat folder tg"
 cd tg
 wget "https://valtman.name/files/telegram-cli-1222"
 mv telegram-cli-1222 tgcli
 echo "Chmoded tgcli"
 sudo chmod +x tgcli
 cd ..
 esac
}

commands() {
  cat <<EOF

  Usage: $0 [options]

    Options:
      install           Install ${0##*/}
      update            Update ${0##*/}
      start             Start ${0##*/}
	  on                Dont off your bot

EOF
}

if [ "$1" = "install" ]; then
logo
logo1
install
telegram-cli
elif [ "$1" = "update" ]; then
logo
logo1
update
elif [[ "$1" = "on" ]]; then
if [ ! -f ./tg/tgcli ]; then
echo "tg not found"
echo "Run $0 install"
exit 1
fi
logo
logo1
while true; do
screen ./tg/tgcli -s ./bot/bot.lua 
done
elif [[ "$1" = "start" ]]; then
if [ ! -f ./tg/tgcli ]; then
echo "tg not found"
echo "Run $0 install"
exit 1
fi
logo
logo1
./tg/tgcli -s ./bot/bot.lua 
else
logo
logo1
commands
fi
