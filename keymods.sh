# Remap CapsLock to Control
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Control_R"
xmodmap -e "add Control = Control_R"
# Right Control (Caps Lock) acts as Escape on single press
# AUR: xcape-git
xcape -e "Control_R=Escape"