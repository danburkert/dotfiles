# Path to your oh-my-fish.
set fish_path $HOME/opt/oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'agnoster'
Plugin 'theme'

set -x PATH $HOME/opt/bin $PATH
alias git=hub
set -g theme_display_user yes
