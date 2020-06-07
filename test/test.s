	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
	li      a0,444
	call    __malloc
	li      a1,110
	sw      a1,0(a0)
	li      a0,444
	call    __malloc
	li      a1,110
	sw      a1,0(a0)
	li      a0,444
	call    __malloc
	li      a1,110
	sw      a1,0(a0)
	li      a0,444
	call    __malloc
	li      a1,110
	sw      a1,0(a0)
	addi    s6,a0,4
	li      a0,444
	call    __malloc
	li      a1,110
	sw      a1,0(a0)
	addi    a1,a0,4
	sw      a1,0(s6)
	j       main_forCondBBlock.1

main_forCondBBlock.1:
	lw      s11,0(s6)
	li      a1,0
	sw      a1,0(s11)
	j       main_forCondBBlock.1


