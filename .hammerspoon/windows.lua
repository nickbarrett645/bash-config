local window = require "hs.window"
local screen = require "hs.screen"
local hotkey = require "hs.hotkey"
local fnutils = require "hs.fnutils"
local hyper = {"ctrl", "alt", "cmd"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})


-- set up your windowfilter
switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only

-- bind to hotkeys; WARNING: at least one modifier key is required!
hs.hotkey.bind('alt','right',function()switcher:next()end)
hs.hotkey.bind('alt','left',function()switcher:previous()end)


function moveToNextScreen()
  local app = hs.window.focusedWindow()
  app:moveToScreen(app:screen():next())
end

hs.hotkey.bind({"shift", "alt"}, "n", moveToNextScreen)


function windowInScreen(screen, win)
  return win:screen() == screen
end

-- Shift focus to the next monitor
function focusNextScreen()
  local next = window.focusedWindow():screen():next()
  windows = fnutils.filter(window.orderedWindows(), fnutils.partial(windowInScreen, next))
  if #windows > 0 then
    windows[1]:focus()
  else
    window.desktop():focus()
  end
end

-- Shift focus to the previous monitor
function focusPreviousScreen()
  local previous = window.focusedWindow():screen():previous()
  windows = fnutils.filter(window.orderedWindows(), fnutils.partial(windowInScreen, previous))
  if #windows > 0 then
    windows[1]:focus()
  else
    window.desktop():focus()
  end
end

hotkey.bind({"alt", "ctrl"}, "L", focusNextScreen)
hotkey.bind({"alt", "ctrl"}, "H", focusPreviousScreen)
