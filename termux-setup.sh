#!/data/data/com.termux/files/usr/bin/sh


tmpdir=$HOME/tmp
pkg upgrade

pkg install -y wget curl vim zsh

mkdir -p $tmpdir

rm /data/data/com.termux/files/usr/etc/motd

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -O $tmpdir/CascadiaCode.zip

unzip $tmpdir/CascadiaCode.zip -d $tmpdir

cp $tmpdir/'Caskaydia Cove Nerd Font Complete.ttf' $HOME/.termux/font.ttf

curl https://raw.githubusercontent.com/adi1090x/termux-style/master/colors/dracula.properties > $HOME/.termux/colors.properties

rm -rf $tmpdir

cp zshrc $HOME/.zshrc

mkdir -p ~/.cache/zsh/history

git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1 $PREFIX/share/spaceship-prompt

ln -sf "$PREFIX/share/spaceship-prompt/spaceship.zsh" "$PREFIX/share/zsh/site-functions/prompt_spaceship_setup"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PREFIX/share/zsh-syntax-highlighting

chsh -s zsh

mkdir -p ~/.config && touch ~/.config/starship.toml

cat << EOF  > ~/.config/starship.toml
# Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'

format = '$directory'

# Inserts a blank line between shell prompts
add_newline = false

# Replace the '❯' symbol in the prompt with '➜'
[character] # The name of the module we are configuring is 'character'
success_symbol = '[➜](bold green)' # The 'success_symbol' segment is being set to '➜' with the color 'bold green'

# Disable the package module, hiding it from the prompt completely
[package]
disabled = true
EOF
