BITS 64

; Copyright (c) 2011-2013, Shawn Webb
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

;    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
;    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;;;;;;;;;;;;;;;
; Call dlopen ;
;;;;;;;;;;;;;;;

push rax
push rbx
push rcx
push rdx
push rsi
push rdi
push rbp
push rsp
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
mov rdi, 0x2222222222222222 ; .so filename (string)
mov rsi, 0x102
mov rbx, 0x3333333333333333 ; addr of dlopen (unsigned long)
call rbx

;;;;;;;;;;;;;;
; Call dlsym ;
;;;;;;;;;;;;;;

mov rdi, rax
mov rsi, 0x4444444444444444 ; function name (string)
mov rbx, 0x5555555555555555 ; addr of dlsym (unsigned long)
call rbx

;;;;;;;;;;;;;;;;;
; Patch PLT/GOT ;
;;;;;;;;;;;;;;;;;

mov rbx, 0x6666666666666666 ; addr of PLT/GOT entry (unsigned long)
mov [rbx], rax

pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsp
pop rbp
pop rdi
pop rsi
pop rdx
pop rcx
pop rbx
pop rax

ret
