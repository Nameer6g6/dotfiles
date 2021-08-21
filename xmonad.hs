-- import XMonad.Wallpaper
{-# LANGUAGE ImportQualifiedPost #-}

import Data.Map qualified as M
import Data.Word (Word32)
import Graphics.X11.ExtraTypes.XF86
import System.IO
import XMonad
import XMonad.Actions.Minimize
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Layout
import XMonad.Layout.BoringWindows as BW
import XMonad.Layout.Fullscreen
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.WorkspaceDir
import XMonad.StackSet qualified as W
import XMonad.Util.EZConfig
import XMonad.Util.Font
import XMonad.Util.Loggers
import XMonad.Util.NamedWindows (getName)
import XMonad.Util.Run (safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

-- Border Styling
myBorderWidth :: Word32
myBorderWidth = 3

myNormalBorderColor :: String
myNormalBorderColor = "#BFBFBF"

myFocusedBorderColor :: String
myFocusedBorderColor = "#89DDFF"

myWorkspaces :: [String]
myWorkspaces = ["一", "二", "三", "四", "五", "六", "七", "八", "九"]
  where
    clickable l =
        [ "<action=xdotool key mod4Mask+" ++ show (n) ++ ">" ++ ws ++ "</action>"
        | (i, ws) <- zip [1 .. 9] l
        , let n = i
        ]

data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)

instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        name <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset

        safeSpawn "notify-send" [show name, "workspace" ++ idx]

-- xmobarEscape = concatMap doubleLts
--    where doubleLts '<' = "<<"
--          doubleLts x = [x]
--
-- myWorkspaces :: [String]
-- myWorkspaces = clickable . (map xmobarEscape) $ ["一","二","三","四","五","六","七","八","九"]
--    where clickable l = ["<action=xdotool key alt+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
--                              (i,ws) <- zip [1..9] l,
--                             let n = i ]

myTerminal :: String
myTerminal = "alacritty"

gaps = spacingRaw True (Border 0 0 0 0) False (Border 8 8 8 8) True -- gaps (border / window spacing)

-- myLayout = maximize (ResizableTall 1 (3 / 100) (1 / 2) [] ||| Full)
myLayout =
    avoidStruts
        ( -- ThreeColMid 1 (3/100) (1/2) |||
          Tall 1 (3 / 100) (1 / 2)
            ||| Mirror (Tall 1 (3 / 100) (1 / 2))
            ||| tabbed shrinkText tabConfig
            ||| Full
        )
        |||
        -- Full) |||
        -- spiral (6/7)) |||
        noBorders (fullscreenFull Full)

tabConfig =
    defaultTheme
        { activeBorderColor = "#7C7C7C"
        , activeTextColor = "#CEFFAC"
        , activeColor = "#000000"
        , inactiveBorderColor = "#7C7C7C"
        , inactiveTextColor = "#EEEEEE"
        , inactiveColor = "#000000"
        }

myXmobarrc :: String
myXmobarrc = "xmobar $HOME/.config/xmobar/xmobarrc.hs"

xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

localBin :: String -> String
localBin x = "$HOME/.local/bin/" <> x

main :: IO ()
main = do
    --setRandomWallpaper ["$HOME/Pictures/nixos-onedark-wallpaper.png"]
    xmproc <- spawnPipe myXmobarrc
    xmonad $
        docks $
            withUrgencyHook LibNotifyUrgencyHook $
                ewmh $
                    def
                        { manageHook = manageDocks <+> manageHook def -- replaced defaultConfig by def
                        , layoutHook = myLayoutHook
                        , logHook =
                            dynamicLogWithPP
                                xmobarPP
                                    { ppOutput = hPutStrLn xmproc
                                    , -- , ppTitle = xmobarColor "#98c379" "" . shorten 100
                                      ppTitle = xmobarColor "#d0d0d0" "" . shorten 80 -- Title of active window in xmobar
                                      -- , ppCurrent = xmobarColor "#61afef" "" . wrap "[" "]"
                                    , ppCurrent = xmobarColor "#6495ED" "" . wrap "[" "]"
                                    , ppUrgent = xmobarColor "red" "yellow"
                                    , ppVisible = wrap "(" ")"
                                    , ppSep = "<fc=#9AEDFE> :: </fc>" -- Separators in xmobar
                                    , ppExtras = [windowCount] -- # of windows current workspace
                                    , ppHiddenNoWindows = xmobarColor "#F07178" ""
                                    }
                        , borderWidth = myBorderWidth
                        , -- , startupHook = ewmhDesktopsStartup >> setWMName "LG3D"
                          -- , startupHook        = myStartupHooker >> setWMName "LG3D"
                          startupHook = myStartupHook
                        , modMask = mod4Mask
                        , workspaces = myWorkspaces
                        , terminal = myTerminal
                        , normalBorderColor = myNormalBorderColor
                        , focusedBorderColor = myFocusedBorderColor
                        }
                        `additionalKeys` myKeys

myLayoutHook = minimize . BW.boringWindows $ avoidStruts $ gaps $ smartBorders $ myLayout

myKeys =
    [ -- myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $ [
      -- ((mod4Mask, xK_p                   ), spawn "j4-dmenu-desktop --dmenu=\"dmenu_run -fn 'monospace:regular:pixelsize=12' -nb '#282c34' -sf '#282c34' -sb '#98c379' -nf '#abb2bf'\"" ) ,
      ((mod4Mask, xK_p), spawn "dmenu_run -i -p 'Packages' -fn 'Fira Mono:bold:pixelsize=15' -nb '#5b247a' -nf '#ce9ffc' -sf '#3425AF' -sb '#ce9ffc'")
    , ((mod4Mask, xK_i), spawn "kill -s USR1 $(pidof deadd-notification-center)")
    , ((mod4Mask .|. controlMask, xK_i), (spawn . localBin) "dunicode")
    , ((mod4Mask .|. shiftMask, xK_i), (spawn . localBin) "dunicode 1")
    , ((mod4Mask .|. shiftMask, xK_e), spawn "nemo")
    , ((mod4Mask .|. shiftMask, xK_n), spawn "joplin-desktop")
    , ((mod4Mask .|. shiftMask, xK_w), spawn "chromium")
    , ((mod4Mask .|. controlMask, xK_g), spawn "termite")
    , ((mod4Mask .|. controlMask, xK_k), spawn "kitty")
    , ((mod1Mask .|. controlMask, xK_l), spawn "i3lock-fancy")
    , ((mod1Mask, xK_m), withFocused minimizeWindow)
    , ((mod1Mask .|. shiftMask, xK_m), withLastMinimized maximizeWindow)
    , ((0, xF86XK_AudioMute), spawn "amixer set Master toggle")
    , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set Master 2%-")
    , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q sset Master 2%+")
    , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 5")
    , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 5")
    ]

myStartupHook = do
    -- spawnOnce "xbacklight -set 30"
    spawnOnce "xrandr --output DP-2 --brightness 0.7"
    spawnOnce "mpd"
    spawnOnce "mpd-notification"
    spawnOnce "ibus-daemon"
    spawnOnce "compton --config ~/.compton.conf"
    spawnOnce "unclutter"
    -- spawnOnce "trayer --expand true  --transparent true  --alpha 255 --edge bottom --align right --expand true --SetDockType true --widthtype request"
    spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 2 --transparent true --alpha 0 --tint 0x292d3e --height 22"
    -- spawnOnce "xmodmap ~/.Xmodmap"
    spawnOnce "setxkbmap -option caps:swapescape"
    spawnOnce "nitrogen --restore &"
    spawnOnce "clipit"

-- spawnHere "xloadimage -onroot -fullscreen ~/Pictures/nixos-onedark-wallpaper.png"
-- spawnOn "workspace2" "pulseeffects"
