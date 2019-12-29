        .att_syntax     noprefix
        .text
        .global main
main:
        xor     ebx, ebx
again:
        call    readi32
        // if (eax == 0) eax = 100500;
        test    eax, eax        // вычисляется eax & eax, результат игнорируется, но устанавливаются флаги ZF, SF
        jnz     L2              // переход на L2, если ZF = 0, то есть если eax != 0
        mov     $100500, eax    // eax = 100500
L2:     
        // if (eax < 5) eax = 5;
        cmp     $5, eax         // вычисляется eax - 5, результат игнорируется, но устанавливаются флаги ZF, SF, CF, OF
        jge     L1              // переход на L1, если предыдущий вычисленный результат >= 0, то есть eax - 5 >= 0, то есть eax >= 5
        mov     $5, eax
L1:     
        cmp     $42, eax
        je      out
        add     eax, ebx
        jmp     again

out:
        mov     ebx, eax
        call    writei32
        call    nl
        xor     eax, eax
        ret
