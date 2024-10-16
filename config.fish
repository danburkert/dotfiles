if status is-interactive
  alias ll='eza -lh --time-style long-iso'
  alias cat='bat'

  fish_add_path $HOME/.local/bin

  starship init fish | source
end
