import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.NamedWindows (getName)
import XMonad.Util.Font
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
-- import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Actions.SpawnOn
import XMonad.Actions.Minimize

import XMonad.Layout
import XMonad.Layout.PerWorkspace
import XMonad.Layout.WorkspaceDir
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.BoringWindows as BW
-- import XMonad.Layout.ResizableTile (MirrorShrink, MirrorExpand)

import Graphics.X11.ExtraTypes.XF86

import qualified XMonad.StackSet as W
--import XMonad.Wallpaper
import Graphics.X11.ExtraTypes.XF86
import System.IO

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Tabbed
import XMonad.Layout.Spiral
import XMonad.Layout.Fullscreen
import qualified XMonad.StackSet as W
import qualified Data.Map as M

-- Border Styling
myBorderWidth = 3
myNormalBorderColor = "#BFBFBF"
myFocusedBorderColor = "#89DDFF"

myWorkspaces = ["一","二","三","四","五","六","七","八","九"]
   where clickable l = [ "<action=xdotool key mod4Mask+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                             (i,ws) <- zip [1..9] l
                       , let n = i ]


-- xmobarEscape = concatMap doubleLts
--    where doubleLts '<' = "<<"
--          doubleLts x = [x]
--
-- myWorkspaces :: [String]
-- myWorkspaces = clickable . (map xmobarEscape) $ ["一","二","三","四","五","六","七","八","九"]
--    where clickable l = ["<action=xdotool key alt+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
--                              (i,ws) <- zip [1..9] l,
--                             let n = i ]

myTerminal = "alacritty"

gaps = spacingRaw True (Border 0 0 0 0) False (Border 8 8 8 8) True -- gaps (border / window spacing)

-- myLayout = maximize (ResizableTall 1 (3 / 100) (1 / 2) [] ||| Full)
myLayout = avoidStruts (
    ThreeColMid 1 (3/100) (1/2) |||
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    tabbed shrinkText tabConfig |||
    Full |||
    spiral (6/7)) |||
    noBorders (fullscreenFull Full)

tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000"
}

myXmobarrc = "xmobar /home/angron/.config/xmobar/xmobarrc"

xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"


windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

main = do
    --setRandomWallpaper ["$HOME/Pictures/nixos-onedark-wallpaper.png"]

    -- xmproc <- spawnPipe "xmobar /home/angron/.config/xmobar/xmobarrc"
    xmproc <- spawnPipe "xmobar /home/angron/.config/xmobar/xmobarrc.hs"

    xmonad $ docks $ def
        { manageHook = manageDocks <+> manageHook def -- replaced defaultConfig by def
        , layoutHook = myLayoutHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        -- , ppTitle = xmobarColor "#98c379" "" . shorten 100
                        , ppTitle = xmobarColor "#d0d0d0" "" . shorten 80     -- Title of active window in xmobar
                        , ppCurrent = xmobarColor "#6495ED" "" . wrap "[" "]"
                        , ppUrgent  = xmobarColor "red" "yellow"
                        , ppVisible = wrap "(" ")"
                        , ppSep =  "<fc=#9AEDFE> :: </fc>"                     -- Separators in xmobar
                        , ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppHiddenNoWindows = xmobarColor "#F07178" ""
                        }
        , borderWidth        = myBorderWidth
        -- , startupHook = ewmhDesktopsStartup >> setWMName "LG3D"
        -- , startupHook        = myStartupHooker >> setWMName "LG3D"
        , startupHook        = myStartupHook
        , modMask            = mod4Mask
        , workspaces         = myWorkspaces
        , terminal           = "alacritty"
        -- , terminal           = "gnome-terminal"
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor }

        `additionalKeys` myKeys


myLayoutHook = minimize . BW.boringWindows $ avoidStruts  $ gaps $ smartBorders $ myLayout

myKeys = [
-- myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $ [
          -- ((mod4Mask, xK_p                   ), spawn "j4-dmenu-desktop --dmenu=\"dmenu_run -fn 'monospace:regular:pixelsize=12' -nb '#282c34' -sf '#282c34' -sb '#98c379' -nf '#abb2bf'\"" ) ,
          ((mod4Mask, xK_p                                 ), spawn "j4-dmenu-desktop" ) ,
          ((mod4Mask .|. shiftMask, xK_e                   ) , spawn "nemo" ),
          ((mod4Mask .|. shiftMask, xK_w                   ) , spawn "chromium" ),
          ((mod4Mask .|. shiftMask, xK_g                   ) , spawn "termite" ),
          ((mod1Mask .|. controlMask, xK_l                 ) , spawn "i3lock-fancy" ),
          ((mod1Mask, xK_m                                 ), withFocused minimizeWindow ),
          ((mod1Mask .|. shiftMask, xK_m                   ), withLastMinimized maximizeWindow),
          ((0       , xF86XK_AudioMute                     ), spawn "amixer set Master toggle"),
          ((0       , xF86XK_AudioLowerVolume              ), spawn "amixer -q set Master 2%-"),
          ((0       , xF86XK_AudioRaiseVolume              ), spawn "amixer -q sset Master 2%+"),
          ((0       , xF86XK_MonBrightnessDown             ), spawn "xbacklight -dec 5"),
          ((0       , xF86XK_MonBrightnessUp               ), spawn "xbacklight -inc 5")
         ]

myStartupHook = do
   spawnOnce "xbacklight -set 30"
   spawnOnce "ibus-daemon"
   spawnOnce "compton --config ~/.compton.conf"
   spawnOnce "unclutter &"
   spawnOnce "trayer --expand true  --transparent true  --alpha 255 --edge bottom --align right --expand true --SetDockType true --widthtype request"
   -- spawnOnce "trayer --expand true --edge bottom --align right --expand true --SetDockType true --widthtype request"
   spawnOnce "xmodmap ~/.Xmodmap"
   spawnOnce "nitrogen --restore &"
   spawnOnce "clipit"
   -- spawnHere "xloadimage -onroot -fullscreen ~/Pictures/nixos-onedark-wallpaper.png"
   -- spawnOn "workspace2" "pulseeffects"

