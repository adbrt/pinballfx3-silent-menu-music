# pinballfx3-silent-menu-music
Script for silencing and/or remapping menu music in Pinball FX3

# How to use it
Download gui_sfx_silencer.bat and put it next to the gui_sfx.pxp file in the game folder. Double click it, press enter to confirm and that's it. There will be no menu music anymore. A backup file gui_sfx.pxp.bak is created in the process, so you can restore it later if you wish.

# How does it work
This script edits Pinball FX3\data\steam\gui_sfx.pxp file in such a way, that menu music sounds will be remapped to a silent sound file. Thanks to that it will be possible to silence only (annoying) menu music, but keep the music during the gameplay. It uses simple batch commands and doesn't modify any game files other than gui_sfx.pxp. You can adjust the script to your own needs if you want to replace other sounds.
