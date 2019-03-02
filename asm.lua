local asm = {}

function log(message)
    print("--> asm.lua: " .. message)
end

-- Open Cheat Engine's auto assemble(*.asm) scripts and returns contents as a string
function asm.open(path)
    local file = io.open(path, "r")
    if file == nil then
        log("Couldn't find file!")
        return
    end
    local contents = file:read("*all")
    return contents
end

-- Allocs memory inside the process, registers necessary user defined symbols
-- and executes the assembly script to create the code cave.
function asm.enable(info)
    log("Enabling script " .. info.asmPath)
    unregisterSymbol(info.memSymbol)
    unregisterSymbol(info.addressSymbol)

    registerSymbol(info.addressSymbol, info.address)
    memAddress = allocateMemory(0x1000) -- 4KB
    registerSymbol(info.memSymbol, memAddress)

    autoAssemble(asm.open(info.asmPath))
end

-- Unregisters all user defined symbols on enable.
-- Frees memory used in code cave.
function asm.disable(info)
    log("Disabling script")
    writeBytes(info.address, info.bytes)
    unregisterSymbol(info.memSymbol)
    unregisterSymbol(info.addressSymbol)
    deAlloc(memAddress, 0x1000) -- 4KB
end

return asm
