set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x TERMINFO_DIRS $HOME/.local/share/terminfo

# Aliases

alias cat=bat
alias ll='exa -lh'
alias vim=lvim
alias google-chrome="/opt/homebrew/Caskroom/google-chrome/111.0.5563.50/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

if test -x /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession
  alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
end

# $PATH

for bin_dir in /usr/local/sbin $HOME/.cargo/bin $HOME/bin $HOME/.local/bin /opt/homebrew/bin $HOME/src/clockwork/bin /Library/Frameworks/GStreamer.framework/Versions/1.0/bin /opt/homebrew/opt/postgresql@15/bin
  if test -d $bin_dir
    set -g fish_user_paths $bin_dir $fish_user_paths
  end
end

# set -g DYLD_FALLBACK_LIBRARY_PATH /Library/Frameworks/GStreamer.framework/Libraries

# nvm.fish https://github.com/jorgebucaran/nvm.fish
set -x nvm_default_version lts
pyenv init - | source

starship init fish | source
