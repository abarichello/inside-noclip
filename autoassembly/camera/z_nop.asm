label(return)

cameraz_cave:
    // mov [rax],rcx
    movsxd  rcx,dword ptr [rbp-000000E8]
    jmp return

cameraz_nop:
    jmp cameraz_cave
    nop
    nop
    nop
    nop
    nop
return:
