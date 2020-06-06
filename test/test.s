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
	lui     a1,%hi(n)
	sw      a0,%lo(n)(a1)
	call    __getInt
	lui     a1,%hi(p)
	sw      a0,%lo(p)(a1)
	call    __getInt
	lui     a1,%hi(k)
	sw      a0,%lo(k)(a1)
	lui     a1,%hi(p)
	lw      a1,%lo(p)(a1)
	lui     t1,%hi(k)
	lw      t1,%lo(k)(t1)
	sub     t1,a1,t1
	li      a1,1
	bgt     t1,a1,main_thenBodyBBlock.0
	j       main_afterIfBBlock.0

main_thenBodyBBlock.0:
    la      a0,.str.0
	call    __print
	j       main_afterIfBBlock.0

main_afterIfBBlock.0:
	lui     a1,%hi(p)
	lw      t1,%lo(p)(a1)
	lui     a1,%hi(k)
	lw      a1,%lo(k)(a1)
	sub     t1,t1,a1
	lui     a1,%hi(i)
	sw      t1,%lo(i)(a1)
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	lui     a1,%hi(i)
	lw      t1,%lo(i)(a1)
	lui     a1,%hi(p)
	lw      a7,%lo(p)(a1)
	lui     a1,%hi(k)
	lw      a1,%lo(k)(a1)
	add     a1,a7,a1
	ble     t1,a1,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	lui     a1,%hi(i)
	lw      t1,%lo(i)(a1)
	li      a1,1
	ble     a1,t1,main_logicalAnd.0
	j       main_criticalEdge.0

main_afterForBBlock.0:
	lui     a1,%hi(p)
	lw      t1,%lo(p)(a1)
	lui     a1,%hi(k)
	lw      a1,%lo(k)(a1)
	add     t1,t1,a1
	lui     a1,%hi(n)
	lw      a1,%lo(n)(a1)
	blt     t1,a1,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_thenBodyBBlock.1:
	lui     a1,%hi(i)
	lw      a1,%lo(i)(a1)
	lui     t1,%hi(p)
	lw      t1,%lo(p)(t1)
	beq     a1,t1,main_thenBodyBBlock.2
	j       main_elseBodyBBlock.0

main_afterIfBBlock.1:
	lui     a1,%hi(i)
	lw      a1,%lo(i)(a1)
	addi    a1,a1,1
	lui     t1,%hi(i)
	sw      a1,%lo(i)(t1)
	j       main_forCondBBlock.0

main_logicalAnd.0:
	lui     a1,%hi(i)
	lw      t1,%lo(i)(a1)
	lui     a1,%hi(n)
	lw      a1,%lo(n)(a1)
	slt     a1,a1,t1
	xori    a1,a1,1
	j       main_afterLogicalAnd.0

main_afterLogicalAnd.0:
	bne     a1,zero,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_thenBodyBBlock.2:
    la      a0,.str.1
	call    __print
	lui     a1,%hi(i)
	lw      a0,%lo(i)(a1)
	call    __toString
	call    __print
    la      a0,.str.2
	call    __print
	j       main_afterIfBBlock.2

main_elseBodyBBlock.0:
	lui     a1,%hi(i)
	lw      a0,%lo(i)(a1)
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
	mv      a1,zero
	j       main_afterLogicalAnd.0


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	jr      ra


