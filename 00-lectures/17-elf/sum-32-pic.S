/*
        это пример перемещаемого кода для 32-битной динамической компоновки
*/
        .att_syntax     noprefix
        .text
        .align  16
        .global func
        .extern A, B, C
        .type   func, @function
func:
        call    geteip
        add     $_GLOBAL_OFFSET_TABLE_, edx // geteip возвращает адрес этой инструкции
                                            // $_GLOBAL_OFFSET_TABLE_ - это смещение от текущей инструкции до начала GOT
                                            // в результате сложения в регистре edx будет находиться адрес GOT в памяти

        mov     A@GOT(edx), eax             // запись A@GOT - это смещение относительно начала GOT ячейки, в которой будет находиться фактический адрес A
                                            // в результате в регистре eax будет находиться адрес переменной A
        mov     (eax), eax                  // загружаем значение переменной A в eax
        mov     B@GOT(edx), ecx
        add     (ecx), eax
        mov     C@GOT(edx), ecx
        mov     eax, (ecx)
        ret
/*
        вспомогательная программа geteip возвращает адрес текущей инструкции в регистре edx
*/
geteip:
        mov     (esp), edx
        ret
