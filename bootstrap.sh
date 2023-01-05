export INSTALL_ZSH=true
export USERNAME="jyje"

echo "Bootstrapping for $USERNAME"

sudo apt update

if [ "$INSTALL_ZSH" = "true" ]
then
    sudo apt install -y zsh

    cp -f ~/dotfiles/.zshrc ~/.zshrc
    chsh -s /usr/bin/zsh $USERNAME
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    echo "source $PWD/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ${ZDOTDIR:-$HOME}/.zshrc
fi
