set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc


# Aliases

alias cat=bat
alias ll='exa -lh'
alias vim=lvim

if test -x /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession
  alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
end

# $PATH

for bin_dir in /usr/local/opt/postgresql@11/bin /bin/usr/local/opt/openjdk@11/bin /usr/local/sbin $HOME/.cargo/bin $HOME/bin $HOME/.local/bin $HOME/go/bin
  if test -d $bin_dir
    set -g fish_user_paths $bin_dir $fish_user_paths
  end
end

if test -x /usr/local/opt/java11
  set -x JAVA_HOME /usr/local/opt/java11
end

starship init fish | source
