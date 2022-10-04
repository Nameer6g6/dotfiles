Config
    { -- font = "xft:Iosevka:size=12:style=Regular, sarasagothicsc:size=12"
    font = "xft:Iosevka:size=8:style=Regular, sarasagothicsc:size=8"
    , -- font = "xft:Iosevka:size=12:style=Regular, vlgothic:size=12"
      additionalFonts = ["xft:FontAwesome:size=9:FontAwesome5Free:size=9:FontAwesome5Brands:size=9"]
    , -- font = "xft:fira fira:size=12:weight=bold, vlgothic:size=12"
      -- font = "xft:fira mono:size=7:weight=bold, vlgothic:size=7"
      iconRoot = ".config/xmobar/icons"
    , -- , bgColor 	= "#32302f"
      -- , fgColor 	= "#f2e5bc"
      bgColor = "#282a2e"
    , fgColor = "#c5c8c6"
    , alpha = 0
    , border = NoBorder
    , borderWidth = 0
    , borderColor = "#373b41"
    , position = Top
    , lowerOnStart = True -- send to bottom of window stack on start
    , hideOnStart = False -- start with window unmapped (hidden)
    , allDesktops = True -- show on all desktops
    , overrideRedirect = True -- set the Override Redirect flag (Xlib)
    , pickBroadest = False -- choose widest display (multi-monitor)
    , persistent = True -- enable/disable hiding (True = disabled)
    , sepChar = "%" -- delineator between plugin names and straight text
    , alignSep = "}{" -- separator between left-right alignment
    , commands =
        [ Run DateZone "<fc=#E6E6FA>%a %b%d日 %H:%M:%S</fc>" "ja_JP.utf-8" "" "date" 2
        , -- , Run StdinReader
          Run UnsafeStdinReader
        , Run
            Memory
            [ "--template"
            , "<usedipat><usedratio>%"
            , "--Low"
            , "55" -- units: %
            , "--High"
            , "77" -- units: %
            , "--low"
            , "#b5bd68"
            , "--normal"
            , "#de935f"
            , "--high"
            , "#a54242"
            , "--ppad"
            , "3"
            , "--width"
            , "3"
            , "--maxtwidth"
            , "4"
            , "--"
            , "--used-icon-pattern"
            , "<icon=ram/ram_%%.xpm/>"
            ]
            10
        , -- , Run Brightness
          --     [ "-t" , "<ipat>"
          --     , "--"
          --     , "--brightness-icon-pattern" , "<icon=bright_%%.xpm/>"
          --     ] 30
          -- , Run Brightness ["-t", "<bar>"] 60
          Run
            Cpu
            [ "--template"
            , "<ipat><total>%"
            , "--Low"
            , "55" -- units: %
            , "--High"
            , "77" -- units: %
            , "--low"
            , "#b5bd68"
            , "--normal"
            , "#de935f"
            , "--high"
            , "#a54242"
            , "--ppad"
            , "3"
            , "--width"
            , "3"
            , "--maxtwidth"
            , "4"
            , "--"
            , "--load-icon-pattern"
            , "<icon=cpu/cpu_%%.xpm/>"
            ]
            10
        , Run
            MultiCoreTemp
            [ "--template"
            , "<maxipat><max>°C"
            , "--Low"
            , "64" -- units: °C
            , "--High"
            , "73" -- units: °C
            , "--low"
            , "#b5bd68"
            , "--normal"
            , "#de935f"
            , "--high"
            , "#a54242"
            , "--ppad"
            , "3"
            , "--width"
            , "3"
            , "--maxtwidth"
            , "5"
            , "--"
            , "--max-icon-pattern"
            , "<icon=temperature/temperature_%%.xpm/>"
            , "--mintemp"
            , "20"
            , "--maxtemp"
            , "100"
            ]
            50
        , Run Com "uname" ["-s", "-r"] "" 3600
        , Run
            DynNetwork
            [ "--template"
            , "<fc=#d5c4a1><dev></fc> <tx>kB/s|<rx>kB/s <txipat><rxipat>"
            , "--Low"
            , "10000" -- units: B/s
            , "--High"
            , "100000" -- units: B/s
            , "--low"
            , "#b5bd68"
            , "--normal"
            , "#de935f"
            , "--high"
            , "#a54242"
            , "--maxtwidth"
            , "0"
            , "--"
            , "--rx-icon-pattern"
            , "<icon=network/rx/network_rx_%%.xpm/>"
            , "--tx-icon-pattern"
            , "<icon=network/tx/network_tx_%%.xpm/>"
            ]
            10
        , Run
            WeatherX
            "ORBI"
            [ ("", "<fc=#5e8d87>?</fc>")
            , ("clear", "<icon=weather/weather_sunny.xpm/>")
            , ("mostly clear", "<icon=weather/weather_mostly_sunny.xpm/>")
            , ("sunny", "<icon=weather/weather_sunny.xpm/>")
            , ("mostly sunny", "<icon=weather/weather_mostly_sunny.xpm/>")
            , ("partly sunny", "<icon=weather/weather_mostly_cloudy.xpm/>")
            , ("cloudy", "<icon=weather/weather_cloudy.xpm/>")
            , ("mostly cloudy", "<icon=weather/weather_mostly_cloudy.xpm/>")
            , ("partly cloudy", "<icon=weather/weather_mostly_sunny.xpm/>")
            , ("fair", "<icon=weather/weather_sunny.xpm/>")
            , ("Fair", "<icon=weather/weather_sunny.xpm/>")
            , ("overcast", "<icon=weather/weather_cloudy.xpm/>")
            , ("considerable cloudiness", "<icon=weather/weather_cloudy.xpm/>")
            , ("obscured", "<icon=weather/weather_obscured.xpm/>")
            ]
            [ "--template"
            , "<skyConditionS><tempC>°C <fc=#5f819d><rh></fc>% <fc=#81a2be><pressure></fc>hPa"
            , "--Low"
            , "10" -- units: %
            , "--High"
            , "20" -- units: %
            , "--low"
            , "#81a2be"
            , "--normal"
            , "#b5bd68"
            , "--high"
            , "#de935f"
            , "--ppad"
            , "3"
            , "--width"
            , "3"
            , "--maxtwidth"
            , "18"
            ]
            3600
        , Run
            Battery
            [ "--template"
            , "<leftipat> <acstatus>"
            , "--Low"
            , "36" -- units: %
            , "--High"
            , "71" -- units: %
            , "--low"
            , "#a54242"
            , "--normal"
            , "#de935f"
            , "--high"
            , "#b5bd68"
            , "--maxtwidth"
            , "10"
            , "--"
            , "--on-icon-pattern"
            , "<icon=battery/on/battery_on_%%.xpm/>"
            , "--off-icon-pattern"
            , "<icon=battery/off/battery_off_%%.xpm/>"
            , "--idle-icon-pattern"
            , "<icon=battery/idle/battery_idle_%%.xpm/>"
            , "-o"
            , "<left><fc=#c5c8c6>%</fc> <timeleft>" -- discharging status
            , "-O"
            , "<left><fc=#c5c8c6>% <timeleft></fc>" -- plugged in status
            , "-i"
            , "<fc=#707880>Full</fc>" -- charged status
            ]
            50
        , Run
            Kbd
            [ ("ar", "<fc=#cc6666>AR</fc>")
            , ("us", "<fc=#b5bd68>US</fc>")
            , ("jp", "<fc=#b5bd68>JP</fc>")
            ]
        , Run
            DiskU
            [ ("sdb3", "<icon=gentoo.xbm/> <free>")
            , ("/", "<icon=arch.xbm/> <free>")
            , ("/home", "<fn=1>\xf0a0</fn> <free>")
            ]
            [ "--Low"
            , "10"
            , "--High"
            , "50"
            , "--low"
            , "red"
            , "--high"
            , "darkgreen"
            , "-m"
            , "1"
            , "-p"
            , "3"
            ]
            100
        , Run
            MPD
            [ "--template"
            , "<artist> <title> <plength> <statei> "
            , "--maxtwidth"
            , "30"
            , "--"
            , "--host"
            , "127.0.0.1"
            , "-P"
            , "<icon=music/music_playing.xpm/>" -- playing
            , "-Z"
            , "<icon=music/music_paused.xpm/>" -- paused
            , "-S"
            , "<icon=music/music_stopped.xpm/>" -- stopped
            ]
            10
        -- , Run Com "rescuetime_timetracker" [] "" 100
        , Run Com "/bin/sh" ["-c", "$HOME/.config/xmobar/trayer-padding-icon.sh"] "trayerpad" 10
        ]
    , template = "%uname% <icon=seperators/seperator.xpm/> %kbd% <icon=seperators/seperator.xpm/> %UnsafeStdinReader%} { %dynnetwork% <icon=seperators/seperator.xpm/>  %mpd%  <icon=seperators/seperator.xpm/> %disku% <icon=seperators/seperator.xpm/>  %ORBI% <icon=seperators/seperator.xpm/> %battery% <icon=seperators/seperator.xpm/> %cpu% <icon=seperators/seperator.xpm/> %memory% <icon=seperators/seperator.xpm/> %multicoretemp%  <icon=seperators/seperator.xpm/> %date% <icon=seperators/seperator.xpm/> %trayerpad%"
    }
