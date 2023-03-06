local AppInfo = {}
AppInfo.name = "Application Information"
AppInfo.version = "1.0"
AppInfo.author = "Quin Marilyn <quin.marilyn05@gmail.com>"
AppInfo.license = "MIT"
AppInfo.homepage = "https://www.github.com/TheQuinbox/App-Info"

local synth = hs.speech.new()

local function speak(text)
    if hs.application.get("VoiceOver") ~= nil then
        hs.osascript.applescript(
            "tell application \"VoiceOver\" to output \"" .. text:gsub("\"", "\\\"") .. "\""
        )
    else
        synth:speak(text)
    end
end

local function checkAppInfo()
    local app = hs.application.frontmostApplication()
    local name = app:name()
    local path = app:path()
    local version = hs.execute(
        "mdls -name kMDItemVersion "
            .. path
            .. " | awk -F\\\" '/kMDItemVersion/ {print $2}'"
    )
    local res = name .. " "
    if version ~= "" then
        res = res .. "version" .. version .. " "
    end
    res = res .. "(running from " .. path .. ")."
    speak(res)
end

local checkHotkey = hs.hotkey.new("ctrl-shift", "v", checkAppInfo)

function AppInfo.init() end

function AppInfo.start()
    checkHotkey:enable()
end

function AppInfo.stop()
    checkHotkey:disable()
end

return AppInfo
