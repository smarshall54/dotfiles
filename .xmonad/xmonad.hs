import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Hooks.ManageHelpers

myConfig = defaultConfig
	{ manageHook = ( isFullscreen --> doFullFloat ) <+> manageDocks <+> manageHook defaultConfig
	, layoutHook = smartBorders (avoidStruts  $  layoutHook defaultConfig)
	, borderWidth = 2
	} `additionalKeysP`
	[ ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
	, ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
	, ("<XF86KbdBrightnessUp>", spawn "/archive/repos/backlights/xkb_backlight_key up 10")
	, ("<XF86KbdBrightnessDown>", spawn "/archive/repos/backlights/xkb_backlight_key down 10")
	, ("<XF86AudioMute>", spawn "amixer -q set Master togglemute")
	, ("<XF86AudioLowerVolume>", spawn "amixer -c 0 -q set Master 2dB-")
	, ("<XF86AudioRaiseVolume>", spawn "amixer -c 0 -q set Master 2dB+")
	, ("<XF86AudioPlay>", spawn "playerctl play-pause")
	, ("<XF86AudioNext>", spawn "playerctl next")
	, ("<XF86AudioPrev>", spawn "playerctl prev")
	, ("M1-C-l", spawn "xautolock -locknow || (killall xautolock; xautolock -time 10 -locker slock & sleep 1; xautolock -locknow)")
	]

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "green" "" . wrap "<" ">" . shorten 68}

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
