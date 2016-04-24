xrdb -merge ~/.Xresources
xscreensaver -no-splash &
compton -Ccf -o 0.8 -i 0.5 &

xsetroot -cursor_name left_ptr \
  && setxkbmap -option ctrl:nocaps \
  && nitrogen --restore \
  && exec xmonad
