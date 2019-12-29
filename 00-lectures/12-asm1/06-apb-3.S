// эта программа для 64-битной архитектуры x86_64
// не используются глобальные переменные, значения хранятся на регистрах процессора        
        .att_syntax     noprefix
        .text
        .global main
main:
        call    readi64         // считываем int64_t и помещаем результат в регистр rax процессора
        mov     rax, rbx        // rbx = rax, то есть копируем результат в rbx

        call    readi64         // считываем int64_t и помещаем результат в регистр rax процессора

        add     rbx, rax        // rax += rbx

        mov     rax, rdi        // rdi = rax
        call    writei64        // в отличие от x86 (32-битной архитектуры), в x86_64 число для вывода передается в rdi
        call    nl              // выводим \n

        xor     rax, rax        // rax = 0
        ret
