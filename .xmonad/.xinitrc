xrdb -merge ~/.Xresources
xscreensaver -no-splash &
/home/evil/bin/choose-display

compton --config ~/.comptonrc -b &

xsetroot -cursor_name left_ptr \
  && setxkbmap -option ctrl:nocaps \
  && nitrogen --restore \
  && exec xmonad
