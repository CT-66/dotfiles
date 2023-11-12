; don't use this with anything other than kde since the `ctrl+backspace` section somehow sends ctrl+alt+backspace which kills the X server
; kde has an option to disable this keybinding, but other WMs don't have one

!h::Send {Left}
return
!j::Send {Down}
return
!k::Send {Up}
return
!l::Send {Right}
return


^w::Send ^{Backspace}
return

!w::Send ^{w}
return
