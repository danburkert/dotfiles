set -xg FZF_DEFAULT_COMMAND 'rg --files'
set -xg RIPGREP_CONFIG_PATH $HOME/.ripgreprc

alias git=hub
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ll='exa -lh'

# Add to default $PATH
set -g fish_user_paths $fish_user_paths /usr/local/sbin $HOME/.cargo/bin $HOME/bin

# Add rbenv to the path.
status --is-interactive; and type -q rbenv; and source (rbenv init -|psub)
