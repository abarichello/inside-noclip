{$lua}
-- Prevent execution of Lua in aasm scripts during syntax check
if syntaxcheck then
    return
end

local asm = require "asm"

local SCRIPTNAME = "camerayaw"
local ADDRESS = "CameraBlendProbe:UpdateWeightsPosition+5f0"

[ENABLE]
enableInfo = {
    symbolPrefix = SCRIPTNAME,
    address = ADDRESS,
    asmPath = "autoassembly/camera/yaw_nop.asm",
}
asm.enable(enableInfo)

[DISABLE]
disableInfo = {
    symbolPrefix = SCRIPTNAME,
    address = ADDRESS,
    bytes = {0x48, 0x89, 0x08, 0x48, 0x63, 0x4D, 0x88}
}
asm.disable(disableInfo)
