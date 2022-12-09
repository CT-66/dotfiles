from xkeysnail.transform import *

define_keymap(
    None,
    {
        K("Ctrl-w"): K("Ctrl-Backspace"),
        K("Alt-w"): K("Ctrl-w"),
        K("Alt-h"): K("Left"),
        K("Alt-j"): K("Down"),
        K("Alt-k"): K("Up"),
        K("Alt-l"): K("Right"),
    },
    "name",
)
