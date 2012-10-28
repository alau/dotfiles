#!/bin/bash

# Focus follow mouse
xfconf-query --channel xfwm4 --property /general/click_to_focus --set false
xfconf-query --channel xfwm4 --property /general/focus_delay --set 130

# Window manager buttons
xfconf-query --channel xfwm4 --property /general/button_layout --set 'O|HC'

# No desktop icons
xfconf-query --channel xfce4-desktop --property /desktop-icons/style --set 0
