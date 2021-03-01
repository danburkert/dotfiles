set -xg FZF_DEFAULT_COMMAND 'rg --files'
set -xg RIPGREP_CONFIG_PATH $HOME/.ripgreprc
# set -xg JAVA_HOME (/usr/libexec/java_home)

# alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ll='exa -lh'
alias cat=bat
alias vim=nvim

# Add to default $PATH
set -g fish_user_paths $fish_user_paths /usr/local/sbin $HOME/.cargo/bin $HOME/bin

# Add Helm to the path.
# set -g fish_user_paths "/usr/local/opt/helm@2/bin" $fish_user_paths

# Add PostgreSQL 10 to the path
# set -g fish_user_paths "/usr/local/opt/postgresql@10/bin" $fish_user_paths

starship init fish | source
