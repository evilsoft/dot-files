xrdb -merge ~/.Xresources
xscreensaver -no-splash &
/home/evil/bin/choose-display

pactl load-module module-switch-on-connect

compton --config ~/.comptonrc -b &

xmodmap home/evil/.Xmodmap

xsetroot -cursor_name left_ptr \
  && setxkbmap -option ctrl:nocaps \
  && nitrogen --restore \
  && exec xmonad
