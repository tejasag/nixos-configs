---------------------------------------------
-- Imports
---------------------------------------------
import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

-- Variables
myFont :: String
myFont = "xft:Iosevka Nerd Font Mono:style=regular:size=12:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4mask

myTerminal :: String
myTerminal = "kitty"

myBrowser :: String
myBrowser = "brave"

---------------------------------------------
-- MAIN
---------------------------------------------
main :: IO ()
main =
  xmonad $
    def
      { modMask = myModMask
      }
