	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	call    __getInt
	mv      s0,a0
	call    __getInt
	mv      s1,a0
	call    __getInt
	add     t4,s1,a0
	addi    t4,t4,-1
	div     t4,t4,a0
	add     t2,s0,a0
	addi    t2,t2,-1
	div     t2,t2,a0
	mul     a0,t4,t2
	call    __toString
	call    __print
	li      a0,0
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


