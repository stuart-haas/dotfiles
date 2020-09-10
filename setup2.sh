DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}")"  && pwd)"

# Install Yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

# Install global npm packages
source $DOTFILES/init/npm.sh

# Install Ruby Gems
source $DOTFILES/init/gem.sh

# Configure zsh
source $DOTFILES/init/zsh.sh

# Configure hyper.js
cp -v $DOTFILES/templates/.hyper.js ~/.hyper.js