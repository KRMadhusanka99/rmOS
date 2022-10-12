    global loader                   ; the entry symbol for ELF
    extern kmain                    ; the function kmain is defined elsewhere

    MAGIC_NUMBER equ 0x1BADB002     ; define the magic number constant
    FLAGS        equ 0x0            ; multiboot flags
    CHECKSUM     equ -MAGIC_NUMBER  ; calculate the checksum
                                    ; (magic number + checksum + flags should equal 0)

    section .text:                  ; start of the text (code) section
    align 4                         ; the code must be 4 byte aligned
        dd MAGIC_NUMBER             ; write the magic number to the machine code,
        dd FLAGS                    ; the flags,
        dd CHECKSUM                 ; and the checksum

    loader:                         ; the loader label (defined as entry point in linker script)
        mov eax, 0xCAFEBABE         ; place the number 0xCAFEBABE in the register eax
        push dword 3                ; arg3
        push dword 2                ; arg2
        push dword 1                ; arg1
        call kmain	             ; call the function, the result will be in eax
    .loop:
        jmp .loop                   ; loop forever
