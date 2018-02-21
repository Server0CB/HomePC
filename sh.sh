#Install des dépandance
echo "Instalation des dépandance"
apt-get -y install wget tar libevent-dev libncurses-dev build-essential zsh
#Install Oh-my-zsh
echo "install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
##Install tmux
echo "Install tmux"
VERSION=2.6
apt-get -y remove tmux
wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
tar xf tmux-${VERSION}.tar.gz
rm -f tmux-${VERSION}.tar.gz
cd tmux-${VERSION}
./configure
make
sudo make install
cd -
rm -rf /usr/local/src/tmux-*
mv tmux-${VERSION} /usr/local/src

touch ~/.tmux.conf
cat <<EOT>> ~/.tmux.conf
set-option -g default-shell /bin/zsh
set -g mouse on
EOT
bind R source-file ~/.tmux.conf

echo "--- finished ---"tmux
