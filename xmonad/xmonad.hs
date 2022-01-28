import XMonad

main = xmonad def
    { modMask = mod4Mask -- Map super as the mod key
    , terminal = "st"
    , borderWidth = 3
    }

startupHook = startup
startup :: X ()
startup = do
    spawm "bash ~/.fehbg"
