# disable startup message
set fish_greeting
set TERM "xterm-256color"

# vim mode
fish_vi_key_bindings

# vim mode cursor
function fish_mode_prompt
  switch $fish_bind_mode
    case default
      echo -en "\e[2 q"
      set_color -o brwhite
    case insert
      echo -en "\e[6 q"
      set_color -o brwhite
    case replace_one
      echo -en "\e[4 q"
      set_color -o brwhite
    case visual
      echo -en "\e[2 q"
      set_color -o brwhite
    case '*'
      echo -en "\e[2 q"
      set_color -o brwhite
  end
  set_color normal
end
