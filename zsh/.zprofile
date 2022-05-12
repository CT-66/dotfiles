source ~/.zshenv

case $(tty) in /dev/tty[0-9]*)
    source ~/Scripts/nord-tty
    start-wm
    ;;
esac
