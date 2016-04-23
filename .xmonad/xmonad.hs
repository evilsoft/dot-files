import XMonad

import XMonad.Actions.CycleWindows
import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive

import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.Fullscreen

import XMonad.Util.EZConfig
import XMonad.Util.Run ( spawnPipe )
import System.IO

import qualified XMonad.StackSet as W

colorWhite    = "#FFFFFF"
colorLight    = "#BDDFB3"
colorSat      = "#009D57"
colorSatDark  = "#004727"
colorSatLight = "#00F285"

main = do
  desktopBar  <- spawnPipe evilDzenDesktop
  statusBar   <- spawnPipe evilDzenStatus
  centerBar   <- spawnPipe evilDzenCenter
  xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
      { modMask            = mod4Mask
      , terminal           = "uxterm"
      , borderWidth        = 0
      , layoutHook = evilLayoutHook
      , manageHook = manageDocks <+> evilManageHook <+> manageHook defaultConfig
      , logHook    = evilLogHook desktopBar >> (evilFadeLogHook)
      }
      `additionalKeysP` evilKeys

evilLayoutHook = avoidStruts $ smartBorders ( tiled ||| mtiled ||| grid ||| full )
  where
    tiled   = named "Tall" $ spacing 7 $ Tall 1 (5/100) (2/(1+(toRational(sqrt(5)::Double))))
    mtiled  = named "Wide" $ Mirror tiled
    grid    = named "Grid" $ spacing 5 $ Grid
    full    = named "Full" $ Full

evilManageHook = composeAll
  [ isFullscreen  --> doFullFloat
  , isDialog      --> doFloat
  ]

evilLogHook h = dynamicLogWithPP $ evilDzenPP { ppOutput = hPutStrLn h }

evilFadeLogHook = fadeInactiveLogHook fadeAmount
  where fadeAmount = 0.9

evilDzenDesktop = "dzen2 -w '300' -ta 'l'" ++ evilDzenStyle ++ evilDzenColors
evilDzenStatus  = "conky -c /home/evil/.xmonad/.conky_dzen | dzen2 -x '1066' -w '300' -ta 'c'" ++ evilDzenStyle ++ evilDzenColors
evilDzenCenter  = "conky -c /home/evil/.xmonad/.conky_dzen_center | dzen2 -x '300' -w '766' -ta 'c'" ++ evilDzenStyle ++ evilDzenCenterColors

evilDzenColors        = " -fg '" ++ colorLight ++ "' -bg '" ++ colorSat ++ "'"
evilDzenCenterColors  = " -fg '" ++ colorSatDark ++ "' -bg '" ++ colorWhite ++ "'"
evilDzenStyle         = " -h '25' -e 'button2=' -dock"

evilRofi = "rofi -show run -font 'Jaldi 12' -bg '" ++ colorSat ++ "' -fg '" ++ colorSatDark ++ "' -hlbg '" ++ colorSatLight ++ "' -hlfg '" ++ colorSatDark ++ "' -opacity 90 -width 400 -lines 5"

evilDzenPP  = dzenPP
  { ppCurrent = dzenColor colorWhite colorSatLight . wrap "   " "   "
  , ppHidden  = dzenColor colorWhite "" . wrap "   " "   "
  , ppHiddenNoWindows = dzenColor colorLight "" . wrap "   " "   "
  , ppVisible = dzenColor "#ffffff" "#543948" . wrap "   " "   "
  , ppUrgent  = dzenColor "#ff0000" "" . wrap "   " "   "
  , ppSep     = "     "
  , ppLayout  = dzenColor colorWhite  "" . wrap "• " " •"
  , ppTitle  = dzenColor colorSat colorSat
  }

evilKeys = [ ("M-b"      , sendMessage ToggleStruts         )
  , ("C-'"        , spawn evilRofi )
  , ("M1-<Tab>"   , cycleRecentWindows [xK_Alt_L] xK_Tab xK_Tab )
  , ("M-<Return>" , dwmpromote                               )
  , ("M-<Tab>"    , toggleWS                                 )
  , ("M-<Right>"  , nextWS                                   )
  , ("M-<Left>"   , prevWS                                   )
  , ("M-S-<Right>", shiftToNext                              )
  , ("M-S-<Left>" , shiftToPrev                              )
  , ("<XF86AudioLowerVolume>" , spawn "pactl set-sink-volume 0 -10%")
  , ("<XF86AudioRaiseVolume>" , spawn "pactl set-sink-volume 0 +10%")
  , ("<XF86AudioMute>" , spawn "pactl set-sink-mute 0 toggle")
  , ("<XF86AudioPlay>" , spawn "cmus-remote -u")
  , ("<XF86AudioStop>" , spawn "cmus-remote -s")
  , ("<XF86AudioNext>" , spawn "cmus-remote -n")
  , ("<XF86AudioPrev>" , spawn "cmus-remote -r")
  ]
