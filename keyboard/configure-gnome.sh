gsettings set org.gnome.libgnomekbd.keyboard layouts "['us\tdvp', 'se']"
gsettings set org.gnome.libgnomekbd.keyboard options "['caps\tcaps:swapescape', 'Compose key\tcompose:102', 'keypad\tkeypad:atm']"

# Note to self: If the keyboard switcher sticks to one language after having
# logged out and in once then it might be due to the keyboard options. Check if
# it works with no options set. So far, I have experienced that the keypad
# option caused this problem on one computer, while working on others.
