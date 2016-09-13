# From AUR (arch linux) package:
# The following needs to be added to the /usr/share/phpstorm/bin/phpstorm64.vmoptions file:
# -Dswing.aatext=true
# -Dawt.useSystemAAFontSettings=on
# See https://aur.archlinux.org/packages/phpstorm/+
#
# En el meu cas, PHPSTORM esta en ~/tools/phpstorm/
#
# Also: http://superuser.com/questions/614960/how-to-fix-font-anti-aliasing-in-intellij-idea-when-using-high-dpi/623596#623596

PATCHED_FILE=~/tools/phpstorm/bin/phpstorm64.vmoptions

echo "-Dswing.aatext=true" >> $PATCHED_FILE
echo "-Dawt.useSystemAAFontSettings=on" >> $PATCHED_FILE
echo "-Dawt.useSystemAAFontSettings=on" >> $PATCHED_FILE
echo "-Dsun.java2d.xrender=true" >> $PATCHED_FILE
