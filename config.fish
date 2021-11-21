set -xg FZF_DEFAULT_COMMAND 'rg --files'
set -xg RIPGREP_CONFIG_PATH $HOME/.ripgreprc

alias ll='exa -lh'
alias cat=bat
alias vim=nvim

for bin_dir in /usr/local/opt/helm@2/bin /usr/local/opt/postgresql@10/bin /bin/usr/local/opt/openjdk@11/bin /usr/local/sbin $HOME/.cargo/bin $HOME/bin $HOME/.local/bin
  if test -d $bin_dir
    set -g fish_user_paths $bin_dir $fish_user_paths
  end
end

if test -x /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession
  alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
end

# if test -x /usr/libexec/java_home
#   set -xg JAVA_HOME (/usr/libexec/java_home)
# end
if test -x /usr/local/opt/java11
  set -xg JAVA_HOME /usr/local/opt/java11
end


if command -v pyenv 1>/dev/null 2>&1
  status is-login; and pyenv init --path | source
  pyenv init - | source
end

starship init fish | source
