# App Info

This is a simple [Hammerspoon](https://www.hammerspoon.org) that lets you get info about the currently focused application with a hotkey.

## Instillation.

If you have Hammerspoon installed, simply open the .spoon file, and it should automatically go in the right spot.

To actually use the spoon, add the following two lines to your init.lua:

```lua
hs.loadSpoon("AppInfo")
spoon.AppInfo:start()
```

and reload your configuration. After doing this, control+shift+v should report the name of the foreground application, the version (if available), and the path it's running from.
