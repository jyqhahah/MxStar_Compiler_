	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-16
	sw      ra,12(sp)
	call    __init__
	li      a5,5
	addi    t3,a5,1
	li      a5,5
	addi    a5,a5,5
	add     a0,a5,t3
	call    __toString
	call    __print
	li      a0,0
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	jr      ra


