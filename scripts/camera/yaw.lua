{$lua}
-- Prevent execution of Lua in aasm scripts during syntax check
if syntaxcheck then
    return
end

local asm = require "asm"

[ENABLE]
enableInfo = {
    memSymbol = "newmem",
    addressSymbol = "camerayaw_nop",
    address = "CameraBlendProbe:UpdateWeightsPosition+5f0",
    asmPath = "autoassembly/camera/yaw_nop.asm",
}
asm.enable(enableInfo)

[DISABLE]
disableInfo = {
    memSymbol = "newmem",
    addressSymbol = "camerayaw_nop",
    address = "CameraBlendProbe:UpdateWeightsPosition+5f0",
    bytes = {0x48, 0x89, 0x08, 0x48, 0x63, 0x4D, 0x88}
}
asm.disable(disableInfo)
