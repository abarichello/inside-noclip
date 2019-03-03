label(return)

newmem:
    // mov [rax+08],ecx
    lea rax,[rsi+000000F0]
    jmp return

camerazoom_nop:
    jmp newmem
    nop
    nop
    nop
    nop
    nop
return:
