label(return)

camerayaw_cave:
    // mov [rax],rcx
    movsxd  rcx,dword ptr [rbp-78]
    jmp return

camerayaw_nop:
    jmp camerayaw_cave
    nop
    nop
return:
