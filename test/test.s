	.data

	.globl  .str.0
.str.0:
	.asciz  "<< "

	.globl  .str.1
.str.1:
	.asciz  "("

	.globl  .str.2
.str.2:
	.asciz  ") "

	.globl  .str.3
.str.3:
	.asciz  " "

	.globl  .str.4
.str.4:
	.asciz  ">> "

	.globl  n
	.p2align	2
n:
	.word   0

	.globl  p
	.p2align	2
p:
	.word   0

	.globl  k
	.p2align	2
k:
	.word   0

	.globl  i
	.p2align	2
i:
	.word   0


	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-16
	sw      ra,12(sp)
	call    __init__
	call    __getInt
	lui     a4,%hi(n)
	sw      a0,%lo(n)(a4)
	call    __getInt
	lui     a4,%hi(p)
	sw      a0,%lo(p)(a4)
	call    __getInt
	lui     a4,%hi(k)
	sw      a0,%lo(k)(a4)
	lui     a4,%hi(p)
	lw      a6,%lo(p)(a4)
	lui     a4,%hi(k)
	lw      a4,%lo(k)(a4)
	sub     a6,a6,a4
	li      a4,1
	bgt     a6,a4,main_thenBodyBBlock.0
	j       main_afterIfBBlock.0

main_thenBodyBBlock.0:
    la      a0,.str.0
	call    __print
	j       main_afterIfBBlock.0

main_afterIfBBlock.0:
	lui     a4,%hi(p)
	lw      a6,%lo(p)(a4)
	lui     a4,%hi(k)
	lw      a4,%lo(k)(a4)
	sub     a4,a6,a4
	lui     a6,%hi(i)
	sw      a4,%lo(i)(a6)
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	lui     a4,%hi(i)
	lw      a3,%lo(i)(a4)
	lui     a4,%hi(p)
	lw      a4,%lo(p)(a4)
	lui     a6,%hi(k)
	lw      a6,%lo(k)(a6)
	add     a4,a4,a6
	ble     a3,a4,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	lui     a4,%hi(i)
	lw      a4,%lo(i)(a4)
	li      a6,1
	ble     a6,a4,main_logicalAnd.0
	j       main_criticalEdge.0

main_afterForBBlock.0:
	lui     a4,%hi(p)
	lw      a4,%lo(p)(a4)
	lui     a6,%hi(k)
	lw      a6,%lo(k)(a6)
	add     a6,a4,a6
	lui     a4,%hi(n)
	lw      a4,%lo(n)(a4)
	blt     a6,a4,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_thenBodyBBlock.1:
	lui     a4,%hi(i)
	lw      a6,%lo(i)(a4)
	lui     a4,%hi(p)
	lw      a4,%lo(p)(a4)
	beq     a6,a4,main_thenBodyBBlock.2
	j       main_elseBodyBBlock.0

main_afterIfBBlock.1:
	lui     a4,%hi(i)
	lw      a4,%lo(i)(a4)
	addi    a6,a4,1
	lui     a4,%hi(i)
	sw      a6,%lo(i)(a4)
	j       main_forCondBBlock.0

main_logicalAnd.0:
	lui     a4,%hi(i)
	lw      a6,%lo(i)(a4)
	lui     a4,%hi(n)
	lw      a4,%lo(n)(a4)
	slt     a4,a4,a6
	xori    a4,a4,1
	j       main_afterLogicalAnd.0

main_afterLogicalAnd.0:
	bne     a4,zero,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_thenBodyBBlock.2:
    la      a0,.str.1
	call    __print
	lui     a4,%hi(i)
	lw      a0,%lo(i)(a4)
	call    __toString
	call    __print
    la      a0,.str.2
	call    __print
	j       main_afterIfBBlock.2

main_elseBodyBBlock.0:
	lui     a4,%hi(i)
	lw      a0,%lo(i)(a4)
	call    __printInt
    la      a0,.str.3
	call    __print
	j       main_afterIfBBlock.2

main_afterIfBBlock.2:
	j       main_afterIfBBlock.1

main_thenBodyBBlock.3:
    la      a0,.str.4
	call    __print
	j       main_afterIfBBlock.3

main_afterIfBBlock.3:
	li      a0,0
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra

main_criticalEdge.0:
	mv      a4,zero
	j       main_afterLogicalAnd.0


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	jr      ra


