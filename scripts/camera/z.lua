{$lua}
-- Prevent execution of Lua in aasm scripts during syntax check
if syntaxcheck then
    return
end

local asm = require "asm"

[ENABLE]
enableInfo = {
    memSymbol = "cameraz_cave",
    addressSymbol = "cameraz_nop",
    address = "CameraBlendProbe:UpdateWeightsPosition+41f",
    asmPath = "autoassembly/camera/z_nop.asm",
}
asm.enable(enableInfo)

[DISABLE]
disableInfo = {
    memSymbol = "cameraz_cave",
    addressSymbol = "cameraz_nop",
    address = "CameraBlendProbe:UpdateWeightsPosition+41f",
    bytes = {0x48, 0x89, 0x08, 0x48, 0x63, 0x8D, 0x18, 0xFF, 0xFF, 0xFF}
}
asm.disable(disableInfo)
