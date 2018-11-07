# Add to default $PATH
# set --universal fish_user_paths $fish_user_paths $HOME/.cargo/bin

set -xg FZF_DEFAULT_COMMAND 'rg --files'

alias git=hub
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ll='exa -lh'
