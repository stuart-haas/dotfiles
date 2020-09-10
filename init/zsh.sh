# In case there is no .zshrc yet:
touch ~/.zshrc

echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Create a `.zsh` directory to store our plugins in one place
mkdir ~/.zsh
cd ~/.zsh

# Download 'fast-syntax-highlighting' plugin
git clone git@github.com:zdharma/fast-syntax-highlighting.git

echo "# Enable 'fast-syntax-highlighting' plugin in ZSH" >> ~/.zshrc
echo "source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" >> ~/.zshrc

# Download completion config
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh

echo "\n# Enable 'completion' plugin in ZSH" >> ~/.zshrc
echo "source $HOME/.zsh/completion.zsh" >> ~/.zshrc

echo "# Initialize the completion system" >> ~/.zshrc
echo "autoload -Uz compinit" >> ~/.zshrc

echo "\n# Cache completion if nothing changed - faster startup time" >> ~/.zshrc
echo "typeset -i updated_at=\$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi" >> ~/.zshrc

echo "\n# Enhanced form of menu completion called 'menu selection'" >> ~/.zshrc
echo "zmodload -i zsh/complist" >> ~/.zshrc

# Download 'zsh-autosuggestions' plugin
git clone git@github.com:zsh-users/zsh-autosuggestions.git

# Enable 'zsh-autosuggestions' plugin in ZSH
echo "source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# Download history config
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/history.zsh

echo "\n# Enable 'history' config in ZSH" >> ~/.zshrc
echo "source $HOME/.zsh/history.zsh" >> ~/.zshrc

# Download key bindings config
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/key-bindings.zsh

echo "\n# Enable 'key-bindings' config in ZSH" >> ~/.zshrc
echo "source $HOME/.zsh/key-bindings.zsh" >> ~/.zshrc

echo "\n# Add aliases" >> ~/.zshrc
cp -v $DOTFILES/templates/aliases.zsh aliases.zsh

echo "source $HOME/.zsh/aliases.zsh" >> ~/.zshrc

# Reload zsh
source ~/.zshrc