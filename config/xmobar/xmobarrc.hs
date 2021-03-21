Config {
        font = "xft:fira mono:size=7:weight=bold, vlgothic:size=9"
       , additionalFonts = [ "xft:FontAwesome:size=9:FontAwesome5Free:size=9:FontAwesome5Brands:size=9" ]
       -- , additionalFonts = [ "xft:mononoki Nerd Font:pixelsize=11:antialias=true:hinting=true"
       --                     , "xft:mononoki Nerd Font:pixelsize=16:antialias=true:hinting=true"
       --                     , "xft:FontAwesome:pixelsize=13"]
       , iconRoot = ".config/xmobar/icons"
       , bgColor = "#32302f"
       , allDesktops = True
       , fgColor = "#f2e5bc"
       , position = Top 0 20
       -- , position = Static { xpos = 1920 , ypos = 0, width = 1920, height = 24 }
       , lowerOnStart = True
       , hideOnStart = False
       , persistent = True
        , commands = [
                       -- Run Date "<fn=1>\xf073</fn> %d %m %Y %H:%M:%S  " "date" 10
                       Run DateZone "<fc=#E6E6FA><fn=1>\xf073</fn> %a %b%d日 %H:%M:%S</fc>" "ja_JP.utf-8" "" "date" 2
                     , Run StdinReader
                     , Run Memory ["-t","Mem: <usedratio>%"] 10
                     , Run Brightness [ "-t", "<ipat>" , "--"
                              , "--brightness-icon-pattern", "<icon=bright_%%.xpm/>"
                              ] 30
                     , Run CoreTemp  [ "--template" , "<fn=1>\xf2db</fn>: <core0>°C | <core1>°C | <core2>°C | <core3>°C"
                                     , "--Low"      , "50"        -- units: °C
                                     , "--High"     , "80"        -- units: °C
                                     , "--low"      , "#E0FFFF"
                                     , "--normal"   , "#fabd2f"
                                     , "--high"     , "#fb4934"
                                     ] 50
                     , Run Com "uname" ["-s","-r"] "" 36000
                     , Run DynNetwork ["-L", "8", "-H", "32", "-l", "#899299", "-n", "#CEDBE5" ,"-h", "#E5F4FF", "-t", "<dev> ↓<rx> ↑<tx>"] 10
                     , Run Weather "ORBI" [ "--template", "<fn=1>\xf2c9</fn> <fc=#4682B4><tempC></fc>°C" ] 36000
                     , Run Battery [ "--template" , "B: <acstatus>"
                                   , "--Low"      , "50"        -- units: %
                                   , "--High"     , "80"        -- units: %
                                   , "--low"      , "#CD5C5C"
                                   , "--normal"   , "#fabd2f"
                                   , "--high"     , "#E0FFFF"

                                   , "--" -- battery specific options
                                             -- discharging status
                                             , "-o"	, "<left>% (<timeleft>)"
                                             -- AC "on" status
                                             , "-O"	, "<left>% <fc=#dAA520>Charging</fc>"
                                             -- charged status
                                             , "-i"	, "<fc=#83a598><fn=1>\xf240</fn></fc>"
                                   ] 50

                     , Run DynNetwork [ "--template" , "<fc=#d5c4a1><dev></fc>: <tx>kB/s|<rx>kB/s"
                                      , "--Low"      , "10000"       -- units: B/s
                                      , "--High"     , "100000"       -- units: B/s
                                      , "--low"      , "#a89984"
                                      , "--normal"   , "#83a598"
                                      , "--high"     , "#fb4934"
                                      ] 10
                     -- , Run DiskU [()("/", "<fn=1>\xf233</fn> <free>"),("/home", "<fn=1>\xf0a0</fn> <free>")]
                     , Run DiskU [("sdb3", "<icon=gentoo.xbm/> <free>"), ("/", "<icon=arch.xbm/> <free>"),("/home", "<fn=1>\xf0a0</fn> <free>")]
                           [ "--Low"   , "10"
                           , "--High"  , "50"
                           , "--low"   , "red"
                           , "--high"  , "darkgreen"
                           , "-m"      , "1"
                           , "-p"      , "3"
                        ] 100
                     -- , Run DiskU [("/home/angron", "<used>")]
                     --          ["-L", "20gg", "-H", "50", "-m", "1", "-p", "3",
                     --          "--normal", "grey50", "--high", "#a0522d",
                     --          "--low", "#2f4f4f"] 20
                     -- , Run Network  "enp3s0"  ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10
                     -- , Run Network  "enp3s0"   ["-L","0","-H","32","--normal","green","--high","red"] 10
                     -- , Run Com "wifi-stat" [] "wifi" 30
                     -- , Run Com "volume.sh" [] "vol" 10
                        , Run Com "home/angron/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 20
                      -- Prints out the left side items such as workspaces, layout, etc.
                      -- The workspaces are 'clickable' in my configs.
                     ]

        , sepChar = "%"
        , alignSep = "}{"
        , template = "%uname% | %StdinReader% }{ %dynnetwork% | %disku% |  %ORBI% | %battery% | %memory% | <fc=#fbf1c7>%coretemp%</fc> | %date% |   %trayerpad%"
        }
