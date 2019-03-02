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

return asm
