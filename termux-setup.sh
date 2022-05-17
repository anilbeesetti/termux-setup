#!/data/data/com.termux/files/usr/bin/sh


tmpdir=$HOME/tmp
pkg upgrade

pkg install -y wget curl vim zsh git python

mkdir -p $tmpdir

rm /data/data/com.termux/files/usr/etc/motd

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -O $tmpdir/CascadiaCode.zip

unzip $tmpdir/CascadiaCode.zip -d $tmpdir

cp $tmpdir/'Caskaydia Cove Nerd Font Complete.ttf' $HOME/.termux/font.ttf

curl https://raw.githubusercontent.com/adi1090x/termux-style/master/colors/dracula.properties > $HOME/.termux/colors.properties

rm -rf $tmpdir

cp zshrc $HOME/.zshrc

git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1 $PREFIX/share/spaceship-prompt

ln -sf "$PREFIX/share/spaceship-prompt/spaceship.zsh" "$PREFIX/share/zsh/site-functions/prompt_spaceship_setup"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PREFIX/share/zsh-syntax-highlighting

chsh -s zsh
