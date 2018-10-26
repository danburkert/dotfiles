set -xg KUDU_HOME $HOME/src/cpp/kudu
set -x PATH /usr/local/opt/ccache/libexec $HOME/opt/bin $HOME/.cargo/bin $PATH
set -xg FZF_DEFAULT_COMMAND 'rg --files'

alias git=hub
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ll='exa -lh'

set -g theme_display_user yes
ulimit -n 2048
