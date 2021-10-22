---------------------------------------------
-- Imports
---------------------------------------------
import XMonad
-- Layout
import XMonad.Layout.ThreeColumns
-- Utils
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

---------------------------------------------
-- VARIABLES
---------------------------------------------
myFont :: String
myFont =
  "xft:Iosevka Nerd Font Mono:style=regular:size=12:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4mask -- super/windows key

myTerminal :: String
myTerminal = "kitty"

myBrowser :: String
myBrowser = "brave"

---------------------------------------------
-- LAYOUTS
---------------------------------------------
myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100

---------------------------------------------
-- KEYBINDS
---------------------------------------------
myKeys :: [(String, X ())]
myKeys =
  [ -- XMonad
    ("M-S-r", spawn "xmonad --restart"),
    -- Terminal
    ("M-<Return>", spawn myTerminal)
  ]


-------------------------------------------------------------------------
-- NIXOS RESTARTHOOK
-------------------------------------------------------------------------
restartEventHook e@ClientMessageEvent {ev_message_type = mt} = do
  a <- getAtom "XMONAD_RESTART"
  if mt == a
    then XMonad.Operations.restart "tejasag-xmonad" True >> return (All True)
    else return $ All True
restartEventHook _ = return $ All True


---------------------------------------------
-- CONFIG
---------------------------------------------
myConfig =
  def
    { modMask = myModMask,
      terminal = myTerminal,
      layoutHook = myLayout
    }
    `additionalKeysP` myKeys

---------------------------------------------
-- MAIN
---------------------------------------------
main :: IO ()
main =
  xmonad $
    myConfig
