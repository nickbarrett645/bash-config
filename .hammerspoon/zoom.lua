hs.loadSpoon("PushToTalk")

spoon.PushToTalk.detect_on_start = true
spoon.PushToTalk.app_switcher = {
    ['zoom.us'] ='push-to-talk'
}

spoon.PushToTalk:start()
