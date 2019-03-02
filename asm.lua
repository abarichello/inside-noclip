local asm = {}

-- Open Cheat Engine's auto assemble(*.asm) scripts
function asm.open(path)
    local file = io.open(path, "r")
    if file == nil then
        print("--> asm.lua: Couldn't find file!")
        return
    end
    local contents = file:read("*all")
    return contents
end

-- Allocs memory inside the process, registers necessary user defined symbols
-- and executes the assembly script to create the code cave.
function asm.enable(info)
    print("--> asm.lua: Enabling script " .. info.asmPath)
    unregisterSymbol(info.memSymbol)
    unregisterSymbol(info.addressSymbol)

    registerSymbol(info.addressSymbol, info.address)
    mem = allocateMemory(0x1000) -- 4KB
    registerSymbol(info.memSymbol, mem)

    autoAssemble(asm.open(info.asmPath))
end

-- Unregisters all user defined symbols on enable.
-- Frees memory used in code cave.
function asm.disable(info)
    print("--> asm.lua: Disabling script")
    writeBytes(info.address, info.bytes)
    unregisterSymbol(info.memSymbol)
    unregisterSymbol(info.addressSymbol)
    deAlloc(mem, 0x1000) -- 4KB
end

return asm
