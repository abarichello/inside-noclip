label(return)

camerazoom_cave:
    // mov [rax+08],ecx
    lea rax,[rsi+000000F0]
    jmp return

camerazoom_nop:
    jmp camerazoom_cave
    nop
    nop
    nop
    nop
    nop
return:
