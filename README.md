# KillSwitch

If you are in the situation when you need to test cold start scenario a lot (i.e. testing custom plugin implementing `application:didFinishLaunchingWithOptions:`), this plugin might become handy.

**Important**: don't forget to link your project with QuartzCore library (*Build Phases -> Link Binary With Library*).

You can kill the application directly using simple JavaScript call [`1`], or you can use skull-themed kill switch floating above your fancy UI with transparency and drag&drop support (to prevent accidental taps button requires double-tap) [`2`].

1. `window.plugins.killSwitch.engage();` -- kills app immediately
2. `window.plugins.killSwitch.start();`  -- shows floating skull

![Screenshot](http://marekjalovec.cz/projects/cz.marekjalovec.killswitch/screenshot.png)