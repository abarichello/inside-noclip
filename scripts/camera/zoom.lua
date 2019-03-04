{$lua}
-- Prevent execution of Lua in aasm scripts during syntax check
if syntaxcheck then
    return
end

local asm = require "asm"

local SCRIPTNAME = "camerazoom"
local ADDRESS = "CameraBlendProbe:UpdateWeightsPosition+429"

[ENABLE]
enableInfo = {
    symbolPrefix = SCRIPTNAME,
    address = ADDRESS,
    asmPath = "autoassembly/camera/zoom_nop.asm",
}
asm.enable(enableInfo)

[DISABLE]
disableInfo = {
    symbolPrefix = SCRIPTNAME,
    address = ADDRESS,
    bytes = {0x89, 0x48, 0x08, 0x48, 0x8D, 0x86, 0xF0, 0x00, 0x00, 0x00}
}
asm.disable(disableInfo)
