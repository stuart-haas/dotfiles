### Modified from https://github.com/mathiasbynens/dotfiles

# Install native apps
function cask() {
  brew cask install ${@} 2> /dev/null
}

# APPS TO CONSIDER
# cask google-chrome-canary
# cask "gpg-suite"
# cask "insomnia"
# cask miro-video-converter
# cask slowy
# cask "jeromelebel-mongohub"
# cask "karabiner-elements"
# cask "sublime-text"
