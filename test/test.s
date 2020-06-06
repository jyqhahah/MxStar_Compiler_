	.data

	.globl  .str.0
.str.0:
	.asciz  "hahaha"


	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	mv      s0,s1
	call    __init__
	call    vvvvvv
	bne     a0,zero,main_thenBodyBBlock.0
	j       main_elseBodyBBlock.0

main_thenBodyBBlock.0:
	j       main_afterIfBBlock.0

main_elseBodyBBlock.0:
	call    vvwvvv
	j       main_forCondBBlock.0

main_afterIfBBlock.0:
	call    vwvvvv
	mv      s1,a0
	call    vvwvvv
	call    __toString
	mv      a1,a0
	mv      a0,s1
	call    __stringAdd
	call    __stringParseInt
	mv      s1,s0
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra

main_forCondBBlock.0:
	call    vvvvvv
	addi    a4,zero,1
	xor     a4,a0,a4
	bne     a4,zero,main_logicalAnd.0
	j       main_criticalEdge.0

main_forBodyBBlock.0:
    la      a0,.str.0
	call    __println
	call    vvwvvv
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	call    vvvvwv
	j       main_afterIfBBlock.0

main_logicalAnd.0:
	call    vvvvvv
	j       main_afterLogicalAnd.0

main_afterLogicalAnd.0:
	bne     a0,zero,main_criticalEdge.1
	j       main_logicalOr.0

main_logicalOr.0:
	call    vvvvvv
	j       main_afterLogicalOr.0

main_afterLogicalOr.0:
	bne     a0,zero,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_criticalEdge.0:
	mv      a0,zero
	j       main_afterLogicalAnd.0

main_criticalEdge.1:
	addi    a0,zero,1
	j       main_afterLogicalOr.0


	.globl  vvvvvv
	.p2align	2
	.type   vvvvvv, @function
vvvvvv:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	mv      s0,s1
	call    vwvvvv
	mv      s1,a0
	call    vwvvvv
	mv      a1,a0
	mv      a0,s1
	call    __stringGreaterEqual
	bne     a0,zero,vvvvvv_logicalAnd.0
	j       vvvvvv_criticalEdge.0

vvvvvv_thenBodyBBlock.0:
	call    vvwvvv
	call    __toString
	mv      s1,a0
	call    vwvvvv
	mv      a1,a0
	mv      a0,s1
	call    __stringEqual
	j       vvvvvv_returnBBlock.0

vvvvvv_afterIfBBlock.0:
	call    vwvvvv
	mv      s1,a0
	call    vwvvvv
	mv      a1,a0
	mv      a0,s1
	call    __stringNotEqual
	j       vvvvvv_returnBBlock.0

vvvvvv_logicalAnd.0:
	call    vwvvvv
	mv      s1,a0
	call    vwvvvv
	mv      a1,a0
	mv      a0,s1
	call    __stringLessEqual
	j       vvvvvv_afterLogicalAnd.0

vvvvvv_afterLogicalAnd.0:
	bne     a0,zero,vvvvvv_thenBodyBBlock.0
	j       vvvvvv_afterIfBBlock.0

vvvvvv_returnBBlock.0:
	mv      s1,s0
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra

vvvvvv_criticalEdge.0:
	mv      a0,zero
	j       vvvvvv_afterLogicalAnd.0


	.globl  vvvvwv
	.p2align	2
	.type   vvvvwv, @function
vvvvwv:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	call    vvwvvv
	mv      s0,a0
	call    vvwvvv
	mv      s1,a0
	call    vwvvvv
	call    __stringParseInt
	xor     a3,s1,a0
	addi    a4,s0,1
	li      a1,0
	sub     a4,a1,a4
	bgt     a3,a4,vvvvwv_afterLogicalOr.0
	j       vvvvwv_logicalOr.0

vvvvwv_afterIfBBlock.0:
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra

vvvvwv_logicalOr.0:
	call    vvvvvv
	call    vwvvvv
	mv      s1,a0
	call    vwvvvv
	mv      a1,a0
	mv      a0,s1
	call    __stringAdd
	mv      s1,a0
	call    vwvvvv
	mv      a1,a0
	mv      a0,s1
	call    __stringGreaterEqual
	j       vvvvwv_afterLogicalOr.0

vvvvwv_afterLogicalOr.0:
	j       vvvvwv_afterIfBBlock.0


	.globl  vwvvvv
	.p2align	2
	.type   vwvvvv, @function
vwvvvv:
	addi    sp,sp,-16
	sw      ra,12(sp)
	call    __getString
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  vvwvvv
	.p2align	2
	.type   vvwvvv, @function
vvwvvv:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	mv      s0,s1
	call    vwvvvv
	call    __stringParseInt
	mv      s1,a0
	call    vwvvvv
	call    __stringParseInt
	rem     a0,s1,a0
	mv      s1,s0
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	jr      ra


