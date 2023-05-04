set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x TERMINFO_DIRS $HOME/.local/share/terminfo

# Aliases

alias cat=bat
alias ll='exa -lh'
alias vim=lvim

if test -x /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession
  alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
end

# $PATH

for bin_dir in /usr/local/sbin $HOME/.cargo/bin $HOME/bin $HOME/.local/bin /opt/homebrew/bin $HOME/src/clockwork/bin
  if test -d $bin_dir
    set -g fish_user_paths $bin_dir $fish_user_paths
  end
end

# nvm.fish https://github.com/jorgebucaran/nvm.fish
set -x nvm_default_version lts
pyenv init - | source

starship init fish | source
