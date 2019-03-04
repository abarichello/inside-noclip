local asm = {}

-- Table that constains all addresses of memory allocations made by cheat engine
-- Key: code cave symbol / Value: address of allocated memory
local memoryAddresses = {}

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
    return file:read("*all")
end

-- Allocs memory inside the process, registers necessary user defined symbols
-- and executes the assembly script to create the code cave.
function asm.enable(info)
    log("Enabling script " .. info.asmPath)

    local caveSymbol = info.symbolPrefix .. "_cave"
    local addressSymbol = info.symbolPrefix .. "_nop"

    unregisterSymbol(caveSymbol)
    unregisterSymbol(addressSymbol)

    registerSymbol(addressSymbol, info.address)
    local caveMemAddress = allocateMemory(0x1000) -- 4KB
    registerSymbol(caveSymbol, caveMemAddress)
    memoryAddresses[caveSymbol] = caveMemAddress

    autoAssemble(asm.open(info.asmPath))
end

-- Unregisters all user defined symbols on enable.
-- Frees memory used in code cave.
function asm.disable(info)
    log("Disabling script " .. info.symbolPrefix)

    local caveSymbol = info.symbolPrefix .. "_cave"
    local addressSymbol = info.symbolPrefix .. "_nop"

    writeBytes(info.address, info.bytes)
    unregisterSymbol(caveSymbol)
    unregisterSymbol(addressSymbol)

    local caveMemAddress = memoryAddresses[caveSymbol]
    deAlloc(caveMemAddress, 0x1000) -- 4KB
    memoryAddresses[caveSymbol] = nil
end

return asm
