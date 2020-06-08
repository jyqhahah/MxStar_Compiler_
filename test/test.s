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


	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	mv      s2,s4
	call    __getInt
	mv      s3,a0
	call    __getInt
	mv      s1,a0
	call    __getInt
	mv      s4,a0
	sub     s0,s1,s4
	li      a0,1
	bgt     s0,a0,main_thenBodyBBlock.0
	j       main_afterIfBBlock.0

main_thenBodyBBlock.0:
    la      a0,.str.0
	call    __print
	j       main_afterIfBBlock.0

main_afterIfBBlock.0:
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	add     a0,s1,s4
	ble     s0,a0,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	li      a0,1
	ble     a0,s0,main_logicalAnd.0
	j       main_criticalEdge.0

main_afterForBBlock.0:
	blt     a0,s3,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_thenBodyBBlock.1:
	beq     s0,s1,main_thenBodyBBlock.2
	j       main_elseBodyBBlock.0

main_afterIfBBlock.1:
	addi    a0,s0,1
	mv      s0,a0
	j       main_forCondBBlock.0

main_logicalAnd.0:
	slt     a0,s3,s0
	xori    a0,a0,1
	j       main_afterLogicalAnd.0

main_afterLogicalAnd.0:
	bne     a0,zero,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_thenBodyBBlock.2:
    la      a0,.str.1
	call    __print
	mv      a0,s0
	call    __toString
	call    __print
    la      a0,.str.2
	call    __print
	j       main_afterIfBBlock.2

main_elseBodyBBlock.0:
	mv      a0,s0
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
	mv      s4,s2
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

main_criticalEdge.0:
	mv      a0,zero
	j       main_afterLogicalAnd.0


