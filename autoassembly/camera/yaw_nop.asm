label(return)

newmem:
    // mov [rax],rcx
    movsxd  rcx,dword ptr [rbp-78]
    jmp return

camerayaw_nop:
    jmp newmem
    nop
    nop
return:
