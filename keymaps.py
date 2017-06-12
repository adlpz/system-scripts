#!/usr/bin/env python3

from subprocess import Popen, PIPE
from sys import argv, exit

def run_command(command):
    cmd = Popen(command, stdout=PIPE, shell=True)
    return cmd.communicate()[0].decode("utf-8").strip()

languages = ['us/altgr-intl', 'es']
scripts = ['~/scripts/keymods.sh']

current_map = run_command("/usr/bin/setxkbmap -query | grep layout | cut -d: -f2")
current_variant = run_command("/usr/bin/setxkbmap -query | grep variant | cut -d: -f2")
if (current_variant):
    current_map = current_map + "/" + current_variant;

try:
    current_index = languages.index(current_map)
except ValueError:
    current_index = -1

def next():
    next_map = languages[(current_index + 1) % len(languages)]
    keymap, *keyvariant = next_map.split("/")
    if not keyvariant:
        run_command("/usr/bin/setxkbmap " + next_map)
    else:
        run_command("/usr/bin/setxkbmap -layout " + keymap + " -variant " + keyvariant[0])

    for script in scripts:
        run_command(script)

    print(next_map)

if len(argv) < 2 or not argv[1] in ['next', 'current']:
    print("Usage: " + argv[0] + " [next|current]")
    exit()
    
if argv[1] == 'next':
    next()
elif argv[1] == 'current':
    print(current_map)
else:
    print("lol cannot be here")

