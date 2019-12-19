# ---------------------------------------------
# Uninstall not needed anymore
# ---------------------------------------------

# Python 3
echo "Uninstall zplug"
brew uninstall zplug

# ---------------------------------------------
# Install new tools
# ---------------------------------------------

# Ack
echo "Install ack"
brew install ack

# Zplugin
echo "Install Zplugin"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# ---------------------------------------------
# Cleanup and finish
# ---------------------------------------------

# Remove outdated versions from the cellar
echo "Brew Cleanup"
brew cleanup