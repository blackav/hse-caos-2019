// в этом примере вызывается функция printf для вывода трех значений
// внимание! для простоты игнорируется выравнивание стека, выработка кода завершения 0

        .global main
main:
        // при использовании инструкции pushl аргументы в стек заносятся в обратном порядке
        pushl   $C
        pushl   B
        pushl   A + 4
        pushl   A
        pushl   $D
        call    printf
        add     $20, %esp       // очищаем стек от параметров для printf

        ret

        .data
A:      .quad 0x1122334455667777
B:      .int    42
C:      .asciz  "world!"
D:      .asciz  "Hello, %llx, %d, %s\n"
