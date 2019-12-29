        // в этом примере вычисляется сумма чисел, считанных со стандартного потока ввода
        // число 42 завершает ввод
        .att_syntax     noprefix
        .text
        .global main
main:
        xor     ebx, ebx        // обнуляем ebx: ebx = 0
again:
        // значение ebx сохранится после выполнения readi32
        call    readi32
        cmp     $42, eax        // вычисляем eax - 42, результат игнорируется, но устанавливаются флаги ZF, SF, CF, OF
        je      out             // если ZF == 1, то есть eax - 42 == 0, то есть eax == 42, то выполнение продолжится с метки out
        add     eax, ebx        // иначе (если ZF == 0), ebx += eax
        jmp     again           // следующая выполняемая инструкция находится по адресу, помеченному again
                                // (безусловный переход на метку again)

out:
        mov     ebx, eax
        call    writei32
        call    nl
        xor     eax, eax
        ret
