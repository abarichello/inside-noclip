{$lua}
-- Prevent execution of Lua in aasm scripts during syntax check
if syntaxcheck then
    return
end

local asm = require "asm"

[ENABLE]
enableInfo = {
    memSymbol = "newmem",
    addressSymbol = "camerazoom_nop",
    address = "CameraBlendProbe:UpdateWeightsPosition+429",
    asmPath = "autoassembly/camera/zoom_nop.asm",
}
asm.enable(enableInfo)

[DISABLE]
disableInfo = {
    memSymbol = "newmem",
    addressSymbol = "camerazoom_nop",
    address = "CameraBlendProbe:UpdateWeightsPosition+429",
    bytes = {0x89, 0x48, 0x08, 0x48, 0x8D, 0x86, 0xF0, 0x00, 0x00, 0x00}
}
asm.disable(disableInfo)
