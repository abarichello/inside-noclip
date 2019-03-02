{$lua}
-- Prevent execution of Lua in aasm scripts during syntax check
if syntaxcheck then
    return
end

local asm = require "asm"

[ENABLE]
unregisterSymbol("newmem")
unregisterSymbol("cameraz_nop")

scan = "CameraBlendProbe:UpdateWeightsPosition+5f0"
registerSymbol("cameraz_nop", scan)

mem = allocateMemory(0x1000) -- 4KB
registerSymbol("newmem", mem)

autoAssemble(asm.open("autoassembly/cameraz_nop.asm"))

[DISABLE]
writeBytes(scan, 0x48, 0x89, 0x08, 0x48, 0x63, 0x4D, 0x88)
unregisterSymbol("newmem")
unregisterSymbol("cameraz_nop")
deAlloc(mem, 0x1000)

scan = nil
mem = nil
