# Python 3
echo "Uninstall python"
brew uninstall python

# Yarn
echo "Uninstall Yarn"
brew uninstall yarn

# ZSH Plugins
echo "Uninstall zsh-autosuggestions zsh-syntax-highlighting thefuck"
brew uninstall zsh-autosuggestions zsh-syntax-highlighting thefuck

# Oh-My-ZSH
echo "Uninstall Oh-My-ZSH"
rm -rf ./.oh-my-zsh

# NVM
echo "Uninstall NVM"
rm -rf ./.nvm

# Zplug
echo "Instal Zplug"
brew install zplug

# GPG
echo "Install gpg"
brew install gpg

# ASDF
echo "Install ASDF"
brew install asdf

# Jq
echo "Install jq"
brew install jq