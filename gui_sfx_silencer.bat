@echo off
setlocal enabledelayedexpansion

echo This script will remap sound files in gui_sfx.pxp file, so the menu music will be replaced with silent sounds
echo.
pause

set PXP_FILE="gui_sfx.pxp"

if not exist %PXP_FILE% (
echo file %PXP_FILE% not found, please place the script in a directory with that file and retry
pause 
exit /B 1
)

if not exist %PXP_FILE%.bak (
echo Creating backup file
copy %PXP_FILE% %PXP_FILE%.bak
)

REM source file
REM file vo_loc_tutorial_wms_feature_01_deluxe_gfx.ogg is silent, so it will be used to replace music everywhere
set SRC_FILE="vo_loc_tutorial_wms_feature_01_deluxe_gfx.ogg"


echo.

set TGT_FILE1=music.ogg
set TGT_FILE2=music_arcade.ogg
set TGT_FILE3=music_challenge.ogg
set TGT_FILE4=music_results.ogg
set TGT_FILE5=music_shopping.ogg
set TGT_FILE6=music_upgrade.ogg

FOR /L %%i IN (1,1,6) DO (
echo.
echo Trying to remap !TGT_FILE%%i! to %SRC_FILE%
echo. 
powershell "$source = '%SRC_FILE%' ; $target = '!TGT_FILE%%i!' ; $data = (Get-Content -path %PXP_FILE% -Raw); $bytes  = [System.IO.File]::ReadAllBytes('%PXP_FILE%'); $nm = $data.IndexOf($source) ; if ($nm -lt 1) {echo \""source not found, quitting\""; exit 1}; echo \""found $source at offset $nm\"" ; $m1 = $data.IndexOf($target) ; if ($m1 -lt 1) {echo \""target not found, quitting\""; exit 1} ; echo \""found $target at offset $m1\"" ; $bytes[$m1-2] = $bytes[$nm-2]; $bytes[$m1-3] = $bytes[$nm-3] ; $bytes[$m1-4] = $bytes[$nm-4]; $bytes[$m1-5] = $bytes[$nm-5] ; $bytes[$m1-6] = $bytes[$nm-6]; $bytes[$m1-7] = $bytes[$nm-7] ; $bytes[$m1-8] = $bytes[$nm-8]; $bytes[$m1-9] = $bytes[$nm-9] ; $bytes[$m1-10] = $bytes[$nm-10]; $bytes[$m1-11] = $bytes[$nm-11] ; $bytes[$m1-12] = $bytes[$nm-12] ; $bytes[$m1-13] = $bytes[$nm-13] ; $bytes[$m1-14] = $bytes[$nm-14] ; $bytes[$m1-15] = $bytes[$nm-15]  ; [System.IO.File]::WriteAllBytes('%PXP_FILE%', $bytes); echo \""Remapped\""; echo ''"

)
echo. 
echo Done
pause

