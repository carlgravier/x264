;*****************************************************************************
;* cpu-a.asm: x86 cpu utilities
;*****************************************************************************
;* Copyright (C) 2003-2016 x264 project
;*
;* Authors: Laurent Aimar <fenrir@via.ecp.fr>
;*          Loren Merritt <lorenm@u.washington.edu>
;*          Fiona Glaser <fiona@x264.com>
;*
;* This program is free software; you can redistribute it and/or modify
;* it under the terms of the GNU General Public License as published by
;* the Free Software Foundation; either version 2 of the License, or
;* (at your option) any later version.
;*
;* This program is distributed in the hope that it will be useful,
;* but WITHOUT ANY WARRANTY; without even the implied warranty of
;* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;* GNU General Public License for more details.
;*
;* You should have received a copy of the GNU General Public License
;* along with this program; if not, write to the Free Software
;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02111, USA.
;*
;* This program is also available under a commercial proprietary license.
;* For more information, contact us at licensing@x264.com.
;*****************************************************************************

%include "x86inc.asm"

SECTION .text

;-----------------------------------------------------------------------------
; void cpu_cpuid( int op, int *eax, int *ebx, int *ecx, int *edx )
;-----------------------------------------------------------------------------
cglobal cpu_cpuid, 5,7
    push rbx
    push  r4
    push  r3
    push  r2
    push  r1
    mov  eax, r0d
    xor  ecx, ecx
    cpuid
    pop   r4
    mov [r4], eax
    pop   r4
    mov [r4], ebx
    pop   r4
    mov [r4], ecx
    pop   r4
    mov [r4], edx
    pop  rbx
    RET

;-----------------------------------------------------------------------------
; void cpu_xgetbv( int op, int *eax, int *edx )
;-----------------------------------------------------------------------------
cglobal cpu_xgetbv, 3,7
    push  r2
    push  r1
    mov  ecx, r0d
    xgetbv
    pop   r4
    mov [r4], eax
    pop   r4
    mov [r4], edx
    RET

;-----------------------------------------------------------------------------
; uint32_t endian_fix32( uint32_t x )
;-----------------------------------------------------------------------------
;cglobal endian_fix32, 1,1
;    mov rax, r0
;    bswap rax
;    ret

;-----------------------------------------------------------------------------
; uint64_t endian_fix64( uint64_t x )
;-----------------------------------------------------------------------------
;cglobal endian_fix64, 1,1
;    mov rax, r0
;    bswap rax
;    ret

;-----------------------------------------------------------------------------
; void prefetch( void *p )
;-----------------------------------------------------------------------------
;cglobal prefetch, 1,1
;   prefetcht0 [r0]
;   ret

;-----------------------------------------------------------------------------
; void median_mv_mmx2( int16_t *dst, int16_t *a, int16_t *b, int16_t *c )
;-----------------------------------------------------------------------------
;cglobal median_mv_mmx2, 4,4
;    movd   r1, mm0
;    movd   r2, mm1
;    movq   mm0, mm3
;    movd   r3, mm2
;    pmaxsw mm1, mm0 
;    pminsw mm3, mm1
;    pminsw mm2, mm0
;    pmaxsw mm1, mm0
;    movd   mm0, r0
;    ret

;-----------------------------------------------------------------------------
; int predictor_difference_mmx2( int16_t (*mvc)[2], intptr_t i_mvc )
;-----------------------------------------------------------------------------
;cglobal predictor_difference_mmx2, 2,3
;    mov r2, 0x0001000100010001
;    movd r2, mm5
;    pxor    mm4, mm4
;    test r1, 1
;    jnz short three
;    movd   [r0 + r1*4 - 8], mm0
;    movd   [r0 + r1*4 - 4], mm3
;    psubw  mm0, mm3
;    jmp short two
;three:
;    dec     r1
;    ret
;one:
;    movq    [r0 + r1*4 -8], mm0
;    psubw   mm0, [r0 + r1*4 -4]
;two:
;    sub     r1, 2
;    pxor    mm2, mm2
;    psubw   mm2, mm0
;    pmaxsw  mm2, mm0
;    paddusw mm0, mm4
;    jg short one
;    pmaddwd mm4, mm5
;    pshufw  mm4, mm0, 14
;    paddd   mm0, mm4
;    movd    mm4, rax
;    ret

;----------------------------------------------------------------------------
; uint16_t cabac_mvd_sum_mmx2(uint8_t *mvdleft, uint8_t *mvdtop)
;----------------------------------------------------------------------------
;cglobal cabac_mvd_sum_mmx2, 2,5
;     mov r2, 0x2121212121212121
;     mov r3, 0x0202020202020202
;     mov r4, 0x2020202020202020
;     movd r2, mm3
;     movd r3, mm4
;     movd r4, mm5
;     movd         r0, mm0
;     movd         r1, mm1
;     paddusb   mm1, mm0
;     pminub    mm0, mm5
;     pxor      mm2, mm2
;     movq      mm0, mm1
;     pcmpgtb   mm0, mm3
;     pcmpgtb   mm1, mm4
;     psubb     mm0, mm2
;     psubb     mm1, mm2
;     movd      mm2, rax
;     ret

;----------------------------------------------------------------------------
; int predictor_clip_mmx2( int16_t (*dst)[2], int16_t (*mvc)[2], int i_mvc, int16_t mv_limit[2][2], uint32_t pmv )
;----------------------------------------------------------------------------
;cglobal predictor_clip_mmx2, 5,9
;    mov r5, 0x20
;    mov r6, r2
;    mov r7, 0
;    mov r8, r3
;    movq       r8, mm5
;    movd       r4, mm3
;    psllw      mm5, 2
;    pshufw mm5, mm6, 0xEE
;    dec         r6
;    jz twom
;    punpckldq mm3, mm3
;    punpckldq mm5, mm5
;    movd         r5, mm4
;    lea   r6, [r1 + r2*4]
;onem:
;    movq       r2, mm0
;    add       r2, 8
;    movq      mm3, mm1
;    pxor      mm2, mm2
;    pcmpeqd   mm0, mm1
;    pcmpeqd   mm0, mm2
;    por       mm1, mm2
;    pmovmskb  r8, mm2
;    pmaxsw    mm5, mm0
;    pminsw    mm6, mm0
;    pand      mm4, mm2
;    psrlq     mm2, mm0
;    movq      mm0, [r0 + r7*4]
;    and       r8, 24
;    add       r7, 2
;    add       r8, 8
;    shr       r8, 4
;    sub       r8, r7
;    cmp       r6, r1
;    jl onem
;    jg threem
;twom:
;    movd       r1, mm0
;    pxor      mm2, mm2
;    pcmpeqd   mm0, mm3
;    pcmpeqd   mm0, mm2
;    por       mm3, mm2
;    pmovmskb  r8, mm2  
;    pmaxsw    mm5, mm0
;    pminsw    mm6, mm0
;    movd      mm0, [r0 + r7*4]
;    inc          r7
;    and          r8, 1
;    sub          r8, r7
;threem:
;    mov rax, r7
;    ret

;----------------------------------------------------------------------------
; int predictor_roundclip_mmx2( int16_t (*dst)[2], int16_t (*mvc)[2], int i_mvc, int16_t mv_limit[2][2], uint32_t pmv )
;----------------------------------------------------------------------------
;cglobal predictor_roundclip_mmx2, 5,10
;    mov r5, 0x20
;    mov r6, r2
;    mov r7, 0
;    mov r8, r3
;    mov r9, 0x0002000200020002
;    movq       r8, mm5
;    movq         r9, mm7
;    movd         r4, mm3
;    pshufw    mm5, mm6, 0xEE
;    dec       r6
;    jz twomm
;    punpckldq mm3, mm3
;    punpckldq mm5, mm5
;    movd      r5, mm4
;    lea   r6, [r1 + r2*4]
;onemm:
;    movq       r1, mm0 
;    add        r1, 8
;    paddw     mm7, mm0
;    psraw     mm0, 2
;    movq      mm3, mm1
;    pxor      mm2, mm2
;    pcmpeqd   mm0, mm1
;    pcmpeqd   mm0, mm2
;    por       mm1, mm2
;    pmovmskb  r8,  mm2
;    pmaxsw    mm5, mm0
;    pminsw    mm6, mm0
;    pand      mm4, mm2
;    psrlq     mm2, mm0
;    movq      mm0, [r0 + r7*4]
;    and       r8, 24 
;    add       r7, 2
;    add       r8, 8
;    shr       r8, 4
;    sub          r8, r7 
;    cmp          r6, r1 
;    jl onemm
;    jg threemm
;twomm:
;    movd       r1, mm0
;    paddw     mm7, mm0
;    psraw     mm0, 2
;    pxor      mm2, mm2
;    pcmpeqd   mm0, mm3
;    pcmpeqd   mm0, mm2
;    por       mm3, mm2
;    pmovmskb  r8,  mm2 
;    pmaxsw    mm5, mm0
;    pminsw    mm6, mm0
;    movd      mm0, [r0 + r7*4]
;    inc          r7
;    and          r8, 1
;    sub          r8, r7
;threemm:
;    mov rax, r7
;    ret

;----------------------------------------------------------------------------
; void mc_clip_add(s,x)
;----------------------------------------------------------------------------
;cglobal mc_clip_add, 2,2
;   movd       r0, xmm0
;   movd       r1, xmm1
;   paddsw xmm1, xmm0
;   movd   xmm0, r0
;   ret

;----------------------------------------------------------------------------
; void mc_clip_add2(s,x)
;----------------------------------------------------------------------------
;cglobal mc_clip_add2, 2,2
;   movd       r0, xmm0
;   movd       r1, xmm1
;   paddsw xmm1, xmm0
;   movd   xmm0, r0
;   ret

%if ARCH_X86_64

;-----------------------------------------------------------------------------
; void stack_align( void (*func)(void*), void *arg );
;-----------------------------------------------------------------------------
cglobal stack_align
    push rbp
    mov  rbp, rsp
%if WIN64
    sub  rsp, 32 ; shadow space
%endif
    and  rsp, ~31
    mov  rax, r0
    mov   r0, r1
    mov   r1, r2
    mov   r2, r3
    call rax
    leave
    ret

%else

;-----------------------------------------------------------------------------
; int cpu_cpuid_test( void )
; return 0 if unsupported
;-----------------------------------------------------------------------------
cglobal cpu_cpuid_test
    pushfd
    push    ebx
    push    ebp
    push    esi
    push    edi
    pushfd
    pop     eax
    mov     ebx, eax
    xor     eax, 0x200000
    push    eax
    popfd
    pushfd
    pop     eax
    xor     eax, ebx
    pop     edi
    pop     esi
    pop     ebp
    pop     ebx
    popfd
    ret

cglobal stack_align
    push ebp
    mov  ebp, esp
    sub  esp, 12
    and  esp, ~31
    mov  ecx, [ebp+8]
    mov  edx, [ebp+12]
    mov  [esp], edx
    mov  edx, [ebp+16]
    mov  [esp+4], edx
    mov  edx, [ebp+20]
    mov  [esp+8], edx
    call ecx
    leave
    ret

%endif

;-----------------------------------------------------------------------------
; void cpu_emms( void )
;-----------------------------------------------------------------------------
cglobal cpu_emms
    emms
    ret

;-----------------------------------------------------------------------------
; void cpu_sfence( void )
;-----------------------------------------------------------------------------
cglobal cpu_sfence
    sfence
    ret
