# Add to default $PATH
# set --universal fish_user_paths $fish_user_paths $HOME/.cargo/bin

set -xg FZF_DEFAULT_COMMAND 'rg --files'
set -xg RIPGREP_CONFIG_PATH $HOME/.ripgreprc

alias git=hub
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ll='exa -lh'
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Add rbenv to the path.
status --is-interactive; and source (rbenv init -|psub)
