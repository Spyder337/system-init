function init-zsh() {
    #	Install Oh my Zsh
    apt install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    ZSH=$HOME/.oh-my-zsh
    ZSH_CUSTOM=$ZSH/custom/plugins

    #	Install Antigen
    export ANTIGEN=$ZSH_CUSTOM/antigen.zsh

    curl -L git.io/antigen > $ANTIGEN
    # or use git.io/antigen-nightly for the latest version

    #	Copy over config presets
    cp presets/.zshrc ~/.zshrc
}
