	.text

	.globl  qpow
	.p2align	2
	.type   qpow, @function
qpow:
	li      t1,1
	j       qpow_whileCondBBlock.0

qpow_whileCondBBlock.0:
	li      a4,0
	bgt     a1,a4,qpow_whileBodyBBlock.0
	j       qpow_afterWhileBBlock.0

qpow_whileBodyBBlock.0:
	andi    a4,a1,1
	li      a6,1
	beq     a4,a6,qpow_thenBodyBBlock.0
	j       qpow_criticalEdge.0

qpow_afterWhileBBlock.0:
	mv      a0,t1
	jr      ra

qpow_thenBodyBBlock.0:
	mul     t1,t1,a0
	rem     t1,t1,a2
	j       qpow_afterIfBBlock.0

qpow_afterIfBBlock.0:
	mul     a4,a0,a0
	rem     a0,a4,a2
	li      a4,2
	div     a1,a1,a4
	j       qpow_whileCondBBlock.0

qpow_criticalEdge.0:
	j       qpow_afterIfBBlock.0


	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-16
	sw      ra,12(sp)
	call    __init__
	li      a0,2
	li      a1,10
	li      a2,10000
	call    qpow
	call    __toString
	call    __println
	li      a0,0
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	jr      ra


