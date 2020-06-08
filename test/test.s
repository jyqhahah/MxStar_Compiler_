	.data

	.globl  .str.0
.str.0:
	.asciz  "Warning: Slice_int::slice: out of range"

	.globl  .str.1
.str.1:
	.asciz  "Warning: Slice_int::copy: size() < arr.size()"

	.globl  .str.2
.str.2:
	.asciz  " "

	.globl  .str.3
.str.3:
	.asciz  ""


	.text

	.globl  merge
	.p2align	2
	.type   merge, @function
merge:
	addi    sp,sp,-48
	sw      ra,44(sp)
	sw      s0,40(sp)
	sw      s1,36(sp)
	sw      s2,32(sp)
	sw      s3,28(sp)
	sw      s4,24(sp)
	sw      s5,20(sp)
	sw      s6,16(sp)
	sw      s7,12(sp)
	sw      s8,8(sp)
	sw      s9,4(sp)
	mv      s4,s10
	mv      s1,a0
	mv      s6,a1
	addi    ra,s1,8
	lw      ra,8(s1)
	addi    a2,s1,4
	lw      s3,4(s1)
	sub     s10,ra,s3
	li      ra,0
	beq     s10,ra,merge_thenBodyBBlock.0
	j       merge_afterIfBBlock.0

merge_thenBodyBBlock.0:
	addi    ra,s6,8
	lw      ra,8(s6)
	addi    a2,s6,4
	lw      s8,4(s6)
	sub     s5,ra,s8
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    a0,a0,4
	li      a2,0
	j       merge_forCondBBlock.0

merge_afterIfBBlock.0:
	addi    ra,s6,8
	lw      a2,8(s6)
	addi    ra,s6,4
	lw      s0,4(s6)
	sub     s8,a2,s0
	li      ra,0
	beq     s8,ra,merge_thenBodyBBlock.1
	j       merge_afterIfBBlock.1

merge_thenBodyBBlock.1:
	li      ra,4
	mul     ra,ra,s10
	addi    a0,ra,4
	call    __malloc
	sw      s10,0(a0)
	addi    a0,a0,4
	li      a2,0
	j       merge_forCondBBlock.1

merge_afterIfBBlock.1:
	add     s5,s10,s8
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    s7,a0,4
	li      a0,12
	call    __malloc
	mv      s2,a0
	mv      ra,s2
	sw      s7,0(s2)
	li      a2,0
	addi    ra,s2,4
	sw      a2,4(s2)
	addi    ra,s2,8
	addi    ra,s7,-4
	lw      ra,-4(s7)
	sw      ra,8(s2)
	addi    s9,ra,0
	li      a0,12
	call    __malloc
	mv      s5,a0
	mv      ra,s5
	lw      a1,0(s2)
	sw      a1,0(s5)
	addi    ra,s5,4
	lw      a2,4(s2)
	addi    a3,a2,1
	sw      a3,4(s5)
	addi    ra,s5,8
	add     a2,a2,s9
	sw      a2,8(s5)
	addi    ra,a1,-4
	lw      ra,-4(a1)
	bgt     a3,ra,merge_criticalEdge.0
	j       merge_logicalOr.0

merge_thenBodyBBlock.2:
	mv      ra,s7
	sw      a2,0(s7)
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s2,0(s8)
	addi    ra,s8,4
	addi    a3,s3,1
	sw      a3,4(s8)
	addi    ra,s8,8
	add     ra,s3,s10
	sw      ra,8(s8)
	addi    a2,s2,-4
	lw      a2,-4(s2)
	bgt     a3,a2,merge_criticalEdge.1
	j       merge_logicalOr.1

merge_elseBodyBBlock.0:
	mv      ra,s7
	sw      a3,0(s7)
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s9,0(s10)
	addi    ra,s10,4
	addi    a3,s0,1
	sw      a3,4(s10)
	addi    ra,s10,8
	add     ra,s0,s8
	sw      ra,8(s10)
	addi    a2,s9,-4
	lw      a2,-4(s9)
	bgt     a3,a2,merge_criticalEdge.2
	j       merge_logicalOr.2

merge_afterIfBBlock.2:
	mv      a0,s7
	j       merge_returnBBlock.0

merge_returnBBlock.0:
	mv      s10,s4
	lw      s9,4(sp)
	lw      s8,8(sp)
	lw      s7,12(sp)
	lw      s6,16(sp)
	lw      s5,20(sp)
	lw      s4,24(sp)
	lw      s3,28(sp)
	lw      s2,32(sp)
	lw      s1,36(sp)
	lw      s0,40(sp)
	lw      ra,44(sp)
	addi    sp,sp,48
	jr      ra

merge_forCondBBlock.0:
	blt     a2,s5,merge_forBodyBBlock.0
	j       merge_afterForBBlock.0

merge_forBodyBBlock.0:
	slli    ra,a2,2
	add     a3,a0,ra
	mv      ra,s6
	lw      a1,0(s6)
	add     ra,s8,a2
	slli    ra,ra,2
	add     ra,a1,ra
	lw      ra,0(ra)
	sw      ra,0(a3)
	addi    a2,a2,1
	j       merge_forCondBBlock.0

merge_afterForBBlock.0:
	j       merge_returnBBlock.0

merge_forCondBBlock.1:
	blt     a2,s10,merge_forBodyBBlock.1
	j       merge_afterForBBlock.1

merge_forBodyBBlock.1:
	slli    ra,a2,2
	add     a3,a0,ra
	mv      ra,s1
	lw      ra,0(s1)
	add     s5,s3,a2
	slli    s5,s5,2
	add     ra,ra,s5
	lw      ra,0(ra)
	sw      ra,0(a3)
	addi    a2,a2,1
	j       merge_forCondBBlock.1

merge_afterForBBlock.1:
	j       merge_returnBBlock.0

merge_thenBodyBBlock.3:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.3

merge_afterIfBBlock.3:
	mv      ra,s1
	lw      s2,0(s1)
	addi    ra,s3,0
	slli    ra,ra,2
	add     ra,s2,ra
	lw      a2,0(ra)
	mv      ra,s6
	lw      s9,0(s6)
	addi    ra,s0,0
	slli    ra,ra,2
	add     ra,s9,ra
	lw      a3,0(ra)
	blt     a2,a3,merge_thenBodyBBlock.2
	j       merge_elseBodyBBlock.0

merge_logicalOr.0:
	slt     ra,ra,a2
	j       merge_afterLogicalOr.0

merge_afterLogicalOr.0:
	bne     ra,zero,merge_thenBodyBBlock.3
	j       merge_afterIfBBlock.3

merge_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.4

merge_afterIfBBlock.4:
	mv      a0,s8
	mv      a1,s6
	call    merge
	mv      s8,a0
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s8,0(s10)
	li      a2,0
	addi    ra,s10,4
	sw      a2,4(s10)
	addi    ra,s10,8
	addi    ra,s8,-4
	lw      a2,-4(s8)
	sw      a2,8(s10)
	lw      ra,8(s5)
	lw      s8,4(s5)
	sub     ra,ra,s8
	addi    a2,a2,0
	blt     ra,a2,merge_thenBodyBBlock.5
	j       merge_afterIfBBlock.5

merge_logicalOr.1:
	slt     ra,a2,ra
	j       merge_afterLogicalOr.1

merge_afterLogicalOr.1:
	bne     ra,zero,merge_thenBodyBBlock.4
	j       merge_afterIfBBlock.4

merge_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       merge_afterIfBBlock.5

merge_afterIfBBlock.5:
	li      ra,0
	j       merge_forCondBBlock.2

merge_forCondBBlock.2:
	lw      a2,8(s10)
	lw      a3,4(s10)
	sub     a2,a2,a3
	blt     ra,a2,merge_forBodyBBlock.2
	j       merge_afterForBBlock.2

merge_forBodyBBlock.2:
	lw      a1,0(s5)
	add     a2,s8,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a1,0(s10)
	add     a3,a3,ra
	slli    a3,a3,2
	add     a3,a1,a3
	lw      a3,0(a3)
	sw      a3,0(a2)
	addi    ra,ra,1
	j       merge_forCondBBlock.2

merge_afterForBBlock.2:
	j       merge_afterIfBBlock.2

merge_thenBodyBBlock.6:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.6

merge_afterIfBBlock.6:
	mv      a0,s1
	mv      a1,s10
	call    merge
	mv      s8,a0
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s8,0(s10)
	li      a2,0
	addi    ra,s10,4
	sw      a2,4(s10)
	addi    ra,s10,8
	addi    ra,s8,-4
	lw      a3,-4(s8)
	sw      a3,8(s10)
	lw      ra,8(s5)
	lw      s8,4(s5)
	sub     a2,ra,s8
	addi    ra,a3,0
	blt     a2,ra,merge_thenBodyBBlock.7
	j       merge_afterIfBBlock.7

merge_logicalOr.2:
	slt     ra,a2,ra
	j       merge_afterLogicalOr.2

merge_afterLogicalOr.2:
	bne     ra,zero,merge_thenBodyBBlock.6
	j       merge_afterIfBBlock.6

merge_thenBodyBBlock.7:
    la      a0,.str.1
	call    __println
	j       merge_afterIfBBlock.7

merge_afterIfBBlock.7:
	li      ra,0
	j       merge_forCondBBlock.3

merge_forCondBBlock.3:
	lw      a2,8(s10)
	lw      t1,4(s10)
	sub     a2,a2,t1
	blt     ra,a2,merge_forBodyBBlock.3
	j       merge_afterForBBlock.3

merge_forBodyBBlock.3:
	lw      a3,0(s5)
	add     a2,s8,ra
	slli    a2,a2,2
	add     a1,a3,a2
	lw      a3,0(s10)
	add     a2,t1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       merge_forCondBBlock.3

merge_afterForBBlock.3:
	j       merge_afterIfBBlock.2

merge_criticalEdge.0:
	addi    ra,zero,1
	j       merge_afterLogicalOr.0

merge_criticalEdge.1:
	addi    ra,zero,1
	j       merge_afterLogicalOr.1

merge_criticalEdge.2:
	addi    ra,zero,1
	j       merge_afterLogicalOr.2


	.globl  mergeSort
	.p2align	2
	.type   mergeSort, @function
mergeSort:
	addi    sp,sp,-112
	sw      ra,108(sp)
	sw      s0,104(sp)
	sw      s1,100(sp)
	sw      s2,96(sp)
	sw      s3,92(sp)
	sw      s4,88(sp)
	sw      s5,84(sp)
	sw      s6,80(sp)
	sw      s7,76(sp)
	sw      s8,72(sp)
	sw      s9,68(sp)
	sw      s10,64(sp)
	sw      s11,60(sp)
	mv      s3,a0
	addi    ra,s3,8
	lw      ra,8(s3)
	addi    a2,s3,4
	lw      s1,4(s3)
	sub     s5,ra,s1
	li      ra,1
	beq     s5,ra,mergeSort_thenBodyBBlock.0
	j       mergeSort_afterIfBBlock.0

mergeSort_thenBodyBBlock.0:
	j       mergeSort_returnBBlock.0

mergeSort_afterIfBBlock.0:
	li      ra,2
	div     s8,s5,ra
	li      a0,12
	call    __malloc
	mv      s10,a0
	mv      ra,s3
	lw      a1,0(s3)
	sw      a1,0(s10)
	addi    ra,s10,4
	addi    a3,s1,0
	sw      a3,4(s10)
	addi    ra,s10,8
	add     a2,s1,s8
	sw      a2,8(s10)
	addi    ra,a1,-4
	lw      ra,-4(a1)
	bgt     a3,ra,mergeSort_criticalEdge.0
	j       mergeSort_logicalOr.0

mergeSort_returnBBlock.0:
	lw      s11,60(sp)
	lw      s10,64(sp)
	lw      s9,68(sp)
	lw      s8,72(sp)
	lw      s7,76(sp)
	lw      s6,80(sp)
	lw      s5,84(sp)
	lw      s4,88(sp)
	lw      s3,92(sp)
	lw      s2,96(sp)
	lw      s1,100(sp)
	lw      s0,104(sp)
	lw      ra,108(sp)
	addi    sp,sp,112
	jr      ra

mergeSort_thenBodyBBlock.1:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.1

mergeSort_afterIfBBlock.1:
	mv      a0,s10
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s10,a0
	lw      a1,0(s3)
	sw      a1,0(s10)
	addi    ra,s10,4
	lw      ra,4(s3)
	add     a2,ra,s8
	sw      a2,4(s10)
	addi    a3,s10,8
	add     a3,ra,s5
	sw      a3,8(s10)
	addi    ra,a1,-4
	lw      ra,-4(a1)
	bgt     a2,ra,mergeSort_criticalEdge.1
	j       mergeSort_logicalOr.1

mergeSort_logicalOr.0:
	slt     ra,ra,a2
	j       mergeSort_afterLogicalOr.0

mergeSort_afterLogicalOr.0:
	bne     ra,zero,mergeSort_thenBodyBBlock.1
	j       mergeSort_afterIfBBlock.1

mergeSort_thenBodyBBlock.2:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.2

mergeSort_afterIfBBlock.2:
	mv      a0,s10
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s0,a0
	mv      ra,s0
	lw      s1,0(s3)
	sw      s1,0(s0)
	addi    ra,s0,4
	lw      s10,4(s3)
	addi    a2,s10,0
	sw      a2,4(s0)
	addi    ra,s0,8
	add     s7,s10,s8
	sw      s7,8(s0)
	addi    ra,s1,-4
	lw      s11,-4(s1)
	bgt     a2,s11,mergeSort_criticalEdge.2
	j       mergeSort_logicalOr.2

mergeSort_logicalOr.1:
	slt     ra,ra,a3
	j       mergeSort_afterLogicalOr.1

mergeSort_afterLogicalOr.1:
	bne     ra,zero,mergeSort_thenBodyBBlock.2
	j       mergeSort_afterIfBBlock.2

mergeSort_thenBodyBBlock.3:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.3

mergeSort_afterIfBBlock.3:
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      ra,s8
	sw      s1,0(s8)
	addi    ra,s8,4
	sw      s7,4(s8)
	addi    ra,s8,8
	add     ra,s10,s5
	sw      ra,8(s8)
	bgt     s7,s11,mergeSort_criticalEdge.3
	j       mergeSort_logicalOr.3

mergeSort_logicalOr.2:
	slt     ra,s11,s7
	j       mergeSort_afterLogicalOr.2

mergeSort_afterLogicalOr.2:
	bne     ra,zero,mergeSort_thenBodyBBlock.3
	j       mergeSort_afterIfBBlock.3

mergeSort_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.4

mergeSort_afterIfBBlock.4:
	lw      ra,8(s0)
	lw      s7,4(s0)
	sub     s1,ra,s7
	li      s9,0
	li      ra,0
	beq     s1,ra,mergeSort_thenBodyBBlock.6
	j       mergeSort_afterIfBBlock.6

mergeSort_logicalOr.3:
	slt     ra,s11,ra
	j       mergeSort_afterLogicalOr.3

mergeSort_afterLogicalOr.3:
	bne     ra,zero,mergeSort_thenBodyBBlock.4
	j       mergeSort_afterIfBBlock.4

mergeSort_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.5

mergeSort_afterIfBBlock.5:
	li      ra,0
	j       mergeSort_forCondBBlock.0

mergeSort_forCondBBlock.0:
	lw      a2,0(s10)
	lw      a3,0(s1)
	sub     a2,a2,a3
	blt     ra,a2,mergeSort_forBodyBBlock.0
	j       mergeSort_afterForBBlock.0

mergeSort_forBodyBBlock.0:
	lw      a1,0(s3)
	add     a2,s5,ra
	slli    a2,a2,2
	add     a1,a1,a2
	lw      t1,0(s8)
	add     a2,a3,ra
	slli    a2,a2,2
	add     a2,t1,a2
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.0

mergeSort_afterForBBlock.0:
	j       mergeSort_returnBBlock.0

mergeSort_thenBodyBBlock.6:
	lw      ra,8(s8)
	lw      s10,4(s8)
	sub     s1,ra,s10
	li      ra,4
	mul     ra,ra,s1
	addi    a0,ra,4
	call    __malloc
	sw      s1,0(a0)
	addi    s5,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.1

mergeSort_afterIfBBlock.6:
	lw      ra,8(s8)
	lw      s10,4(s8)
	sub     s6,ra,s10
	li      ra,0
	sw      ra,56(sp)
	li      ra,0
	li      a2,0
	sw      a2,52(sp)
	beq     s6,ra,mergeSort_thenBodyBBlock.7
	j       mergeSort_afterIfBBlock.7

mergeSort_thenBodyBBlock.7:
	li      ra,4
	mul     ra,ra,s1
	addi    a0,ra,4
	call    __malloc
	sw      s1,0(a0)
	addi    s5,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.2

mergeSort_afterIfBBlock.7:
	add     s5,s1,s6
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    ra,a0,4
	sw      ra,48(sp)
	li      a0,12
	call    __malloc
	mv      s5,a0
	lw      ra,48(sp)
	sw      ra,0(s5)
	li      a2,0
	addi    ra,s5,4
	sw      a2,4(s5)
	addi    ra,s5,8
	lw      ra,48(sp)
	addi    ra,ra,-4
	lw      ra,48(sp)
	lw      ra,-4(ra)
	sw      ra,8(s5)
	addi    s11,ra,0
	li      a0,12
	call    __malloc
	mv      s2,a0
	mv      ra,s2
	lw      a2,0(s5)
	sw      a2,0(s2)
	addi    ra,s2,4
	lw      ra,4(s5)
	addi    a3,ra,1
	sw      a3,4(s2)
	addi    s5,s2,8
	add     s5,ra,s11
	sw      s5,8(s2)
	addi    ra,a2,-4
	lw      ra,-4(a2)
	bgt     a3,ra,mergeSort_criticalEdge.4
	j       mergeSort_logicalOr.4

mergeSort_thenBodyBBlock.8:
	lw      ra,48(sp)
	lw      ra,48(sp)
	sw      s4,0(ra)
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      ra,s9
	sw      s11,0(s9)
	addi    ra,s9,4
	addi    a3,s7,1
	sw      a3,4(s9)
	addi    ra,s9,8
	add     a2,s7,s1
	sw      a2,8(s9)
	addi    ra,s11,-4
	lw      ra,-4(s11)
	bgt     a3,ra,mergeSort_criticalEdge.5
	j       mergeSort_logicalOr.5

mergeSort_elseBodyBBlock.0:
	lw      ra,48(sp)
	lw      ra,48(sp)
	lw      a2,44(sp)
	sw      a2,0(ra)
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      ra,s8
	sw      s5,0(s8)
	addi    ra,s8,4
	addi    ra,s10,1
	sw      ra,4(s8)
	addi    a2,s8,8
	add     a3,s10,s6
	sw      a3,8(s8)
	addi    a2,s5,-4
	lw      a2,-4(s5)
	bgt     ra,a2,mergeSort_criticalEdge.6
	j       mergeSort_logicalOr.6

mergeSort_afterIfBBlock.8:
	lw      s5,48(sp)
	j       mergeSort_returnBBlock.13

mergeSort_returnBBlock.13:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      ra,0
	addi    s1,s8,4
	sw      ra,4(s8)
	addi    s10,s8,8
	addi    ra,s5,-4
	lw      ra,-4(s5)
	sw      ra,8(s8)
	lw      a2,8(s3)
	lw      s5,4(s3)
	sub     a2,a2,s5
	addi    ra,ra,0
	blt     a2,ra,mergeSort_thenBodyBBlock.5
	j       mergeSort_afterIfBBlock.5

mergeSort_forCondBBlock.1:
	blt     ra,s1,mergeSort_forBodyBBlock.1
	j       mergeSort_afterForBBlock.1

mergeSort_forBodyBBlock.1:
	slli    a2,ra,2
	add     a2,s5,a2
	lw      a1,0(s8)
	add     a3,s10,ra
	slli    a3,a3,2
	add     a3,a1,a3
	lw      a3,0(a3)
	sw      a3,0(a2)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.1

mergeSort_afterForBBlock.1:
	j       mergeSort_returnBBlock.13

mergeSort_forCondBBlock.2:
	blt     ra,s1,mergeSort_forBodyBBlock.2
	j       mergeSort_afterForBBlock.2

mergeSort_forBodyBBlock.2:
	slli    a2,ra,2
	add     a3,s5,a2
	lw      a1,0(s0)
	add     a2,s7,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.2

mergeSort_afterForBBlock.2:
	j       mergeSort_returnBBlock.13

mergeSort_thenBodyBBlock.9:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.9

mergeSort_afterIfBBlock.9:
	lw      s11,0(s0)
	addi    ra,s7,0
	slli    ra,ra,2
	add     ra,s11,ra
	lw      s4,0(ra)
	lw      s5,0(s8)
	addi    ra,s10,0
	slli    ra,ra,2
	add     ra,s5,ra
	lw      ra,0(ra)
	sw      ra,44(sp)
	mv      ra,ra
	blt     s4,ra,mergeSort_thenBodyBBlock.8
	j       mergeSort_elseBodyBBlock.0

mergeSort_logicalOr.4:
	slt     ra,ra,s5
	j       mergeSort_afterLogicalOr.4

mergeSort_afterLogicalOr.4:
	bne     ra,zero,mergeSort_thenBodyBBlock.9
	j       mergeSort_afterIfBBlock.9

mergeSort_thenBodyBBlock.10:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.10

mergeSort_afterIfBBlock.10:
	lw      ra,8(s9)
	lw      s7,4(s9)
	sub     s1,ra,s7
	li      ra,0
	li      a2,0
	sw      a2,40(sp)
	beq     s1,ra,mergeSort_thenBodyBBlock.14
	j       mergeSort_afterIfBBlock.14

mergeSort_logicalOr.5:
	slt     ra,ra,a2
	j       mergeSort_afterLogicalOr.5

mergeSort_afterLogicalOr.5:
	bne     ra,zero,mergeSort_thenBodyBBlock.10
	j       mergeSort_afterIfBBlock.10

mergeSort_thenBodyBBlock.11:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.11

mergeSort_afterIfBBlock.11:
	li      ra,0
	j       mergeSort_forCondBBlock.3

mergeSort_forCondBBlock.3:
	lw      a2,0(s1)
	lw      t1,0(s10)
	sub     a2,a2,t1
	blt     ra,a2,mergeSort_forBodyBBlock.3
	j       mergeSort_afterForBBlock.3

mergeSort_forBodyBBlock.3:
	lw      a3,0(s2)
	add     a2,s8,ra
	slli    a2,a2,2
	add     a1,a3,a2
	lw      a2,0(s5)
	add     a3,t1,ra
	slli    a3,a3,2
	add     a2,a2,a3
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.3

mergeSort_afterForBBlock.3:
	j       mergeSort_afterIfBBlock.8

mergeSort_thenBodyBBlock.12:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.12

mergeSort_afterIfBBlock.12:
	beq     s1,s9,mergeSort_thenBodyBBlock.22
	j       mergeSort_afterIfBBlock.22

mergeSort_logicalOr.6:
	slt     ra,a2,a3
	j       mergeSort_afterLogicalOr.6

mergeSort_afterLogicalOr.6:
	bne     ra,zero,mergeSort_thenBodyBBlock.12
	j       mergeSort_afterIfBBlock.12

mergeSort_thenBodyBBlock.13:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.13

mergeSort_afterIfBBlock.13:
	li      ra,0
	j       mergeSort_forCondBBlock.4

mergeSort_forCondBBlock.4:
	lw      a2,0(s1)
	lw      a3,0(s10)
	sub     a2,a2,a3
	blt     ra,a2,mergeSort_forBodyBBlock.4
	j       mergeSort_afterForBBlock.4

mergeSort_forBodyBBlock.4:
	lw      a1,0(s2)
	add     a2,s5,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a1,0(s8)
	add     a3,a3,ra
	slli    a3,a3,2
	add     a3,a1,a3
	lw      a3,0(a3)
	sw      a3,0(a2)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.4

mergeSort_afterForBBlock.4:
	j       mergeSort_afterIfBBlock.8

mergeSort_thenBodyBBlock.14:
	li      ra,4
	mul     ra,ra,s6
	addi    a0,ra,4
	call    __malloc
	sw      s6,0(a0)
	addi    s8,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.5

mergeSort_afterIfBBlock.14:
	lw      ra,52(sp)
	beq     s6,ra,mergeSort_thenBodyBBlock.15
	j       mergeSort_afterIfBBlock.15

mergeSort_thenBodyBBlock.15:
	li      ra,4
	mul     ra,ra,s1
	addi    a0,ra,4
	call    __malloc
	sw      s1,0(a0)
	addi    s8,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.6

mergeSort_afterIfBBlock.15:
	add     s11,s1,s6
	li      ra,4
	mul     ra,ra,s11
	addi    a0,ra,4
	call    __malloc
	sw      s11,0(a0)
	addi    ra,a0,4
	sw      ra,36(sp)
	li      a0,12
	call    __malloc
	mv      s0,a0
	mv      ra,s0
	lw      ra,36(sp)
	sw      ra,0(s0)
	li      ra,0
	addi    a2,s0,4
	sw      ra,4(s0)
	addi    ra,s0,8
	lw      ra,36(sp)
	addi    ra,ra,-4
	lw      ra,36(sp)
	lw      ra,-4(ra)
	sw      ra,8(s0)
	addi    s4,ra,0
	li      a0,12
	call    __malloc
	mv      s11,a0
	mv      ra,s11
	lw      a2,0(s0)
	sw      a2,0(s11)
	addi    ra,s11,4
	lw      ra,4(s0)
	addi    a1,ra,1
	sw      a1,4(s11)
	addi    a3,s11,8
	add     a3,ra,s4
	sw      a3,8(s11)
	addi    ra,a2,-4
	lw      ra,-4(a2)
	bgt     a1,ra,mergeSort_criticalEdge.7
	j       mergeSort_logicalOr.7

mergeSort_thenBodyBBlock.16:
	lw      ra,36(sp)
	lw      a2,36(sp)
	lw      ra,32(sp)
	sw      ra,0(a2)
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      ra,s9
	sw      s0,0(s9)
	addi    ra,s9,4
	addi    ra,s7,1
	sw      ra,4(s9)
	addi    a2,s9,8
	add     a3,s7,s1
	sw      a3,8(s9)
	addi    a2,s0,-4
	lw      a2,-4(s0)
	bgt     ra,a2,mergeSort_criticalEdge.8
	j       mergeSort_logicalOr.8

mergeSort_elseBodyBBlock.1:
	lw      ra,36(sp)
	lw      ra,36(sp)
	lw      a2,44(sp)
	sw      a2,0(ra)
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      ra,s8
	sw      s5,0(s8)
	addi    ra,s8,4
	addi    a2,s10,1
	sw      a2,4(s8)
	addi    ra,s8,8
	add     a3,s10,s6
	sw      a3,8(s8)
	addi    ra,s5,-4
	lw      ra,-4(s5)
	bgt     a2,ra,mergeSort_criticalEdge.9
	j       mergeSort_logicalOr.9

mergeSort_afterIfBBlock.16:
	lw      s8,36(sp)
	j       mergeSort_returnBBlock.14

mergeSort_returnBBlock.14:
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s8,0(s5)
	li      ra,0
	addi    s10,s5,4
	sw      ra,4(s5)
	addi    s1,s5,8
	addi    ra,s8,-4
	lw      ra,-4(s8)
	sw      ra,8(s5)
	lw      a2,8(s2)
	lw      s8,4(s2)
	sub     a2,a2,s8
	addi    ra,ra,0
	blt     a2,ra,mergeSort_thenBodyBBlock.11
	j       mergeSort_afterIfBBlock.11

mergeSort_forCondBBlock.5:
	blt     ra,s6,mergeSort_forBodyBBlock.5
	j       mergeSort_afterForBBlock.5

mergeSort_forBodyBBlock.5:
	slli    a2,ra,2
	add     a3,s8,a2
	add     a2,s10,ra
	slli    a2,a2,2
	add     a2,s5,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.5

mergeSort_afterForBBlock.5:
	j       mergeSort_returnBBlock.14

mergeSort_forCondBBlock.6:
	blt     ra,s1,mergeSort_forBodyBBlock.6
	j       mergeSort_afterForBBlock.6

mergeSort_forBodyBBlock.6:
	slli    a2,ra,2
	add     a3,s8,a2
	lw      a2,0(s9)
	add     s5,s7,ra
	slli    s5,s5,2
	add     a2,a2,s5
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.6

mergeSort_afterForBBlock.6:
	j       mergeSort_returnBBlock.14

mergeSort_thenBodyBBlock.17:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.17

mergeSort_afterIfBBlock.17:
	lw      s0,0(s9)
	addi    ra,s7,0
	slli    ra,ra,2
	add     ra,s0,ra
	lw      ra,0(ra)
	sw      ra,32(sp)
	lw      ra,44(sp)
	lw      a2,32(sp)
	blt     a2,ra,mergeSort_thenBodyBBlock.16
	j       mergeSort_elseBodyBBlock.1

mergeSort_logicalOr.7:
	slt     ra,ra,a3
	j       mergeSort_afterLogicalOr.7

mergeSort_afterLogicalOr.7:
	bne     ra,zero,mergeSort_thenBodyBBlock.17
	j       mergeSort_afterIfBBlock.17

mergeSort_thenBodyBBlock.18:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.18

mergeSort_afterIfBBlock.18:
	lw      ra,8(s9)
	lw      a2,4(s9)
	sw      a2,28(sp)
	mv      a2,a2
	sub     s7,ra,a2
	li      ra,0
	beq     s7,ra,mergeSort_thenBodyBBlock.30
	j       mergeSort_afterIfBBlock.30

mergeSort_logicalOr.8:
	slt     ra,a2,a3
	j       mergeSort_afterLogicalOr.8

mergeSort_afterLogicalOr.8:
	bne     ra,zero,mergeSort_thenBodyBBlock.18
	j       mergeSort_afterIfBBlock.18

mergeSort_thenBodyBBlock.19:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.19

mergeSort_afterIfBBlock.19:
	li      ra,0
	j       mergeSort_forCondBBlock.7

mergeSort_forCondBBlock.7:
	lw      a2,0(s10)
	lw      a1,0(s1)
	sub     a2,a2,a1
	blt     ra,a2,mergeSort_forBodyBBlock.7
	j       mergeSort_afterForBBlock.7

mergeSort_forBodyBBlock.7:
	lw      a2,0(s11)
	add     a3,s8,ra
	slli    a3,a3,2
	add     t1,a2,a3
	lw      a3,0(s5)
	add     a2,a1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(t1)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.7

mergeSort_afterForBBlock.7:
	j       mergeSort_afterIfBBlock.16

mergeSort_thenBodyBBlock.20:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.20

mergeSort_afterIfBBlock.20:
	lw      ra,40(sp)
	beq     s1,ra,mergeSort_thenBodyBBlock.38
	j       mergeSort_afterIfBBlock.38

mergeSort_logicalOr.9:
	slt     ra,ra,a3
	j       mergeSort_afterLogicalOr.9

mergeSort_afterLogicalOr.9:
	bne     ra,zero,mergeSort_thenBodyBBlock.20
	j       mergeSort_afterIfBBlock.20

mergeSort_thenBodyBBlock.21:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.21

mergeSort_afterIfBBlock.21:
	li      ra,0
	j       mergeSort_forCondBBlock.8

mergeSort_forCondBBlock.8:
	lw      a2,0(s1)
	lw      t1,0(s10)
	sub     a2,a2,t1
	blt     ra,a2,mergeSort_forBodyBBlock.8
	j       mergeSort_afterForBBlock.8

mergeSort_forBodyBBlock.8:
	lw      a2,0(s11)
	add     a3,s5,ra
	slli    a3,a3,2
	add     a1,a2,a3
	lw      a3,0(s8)
	add     a2,t1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.8

mergeSort_afterForBBlock.8:
	j       mergeSort_afterIfBBlock.16

mergeSort_thenBodyBBlock.22:
	lw      ra,8(s8)
	lw      s10,4(s8)
	sub     s1,ra,s10
	li      ra,4
	mul     ra,ra,s1
	addi    a0,ra,4
	call    __malloc
	sw      s1,0(a0)
	addi    s5,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.9

mergeSort_afterIfBBlock.22:
	lw      ra,8(s8)
	lw      s5,4(s8)
	sub     ra,ra,s5
	sw      ra,24(sp)
	li      a2,0
	lw      ra,24(sp)
	beq     ra,a2,mergeSort_thenBodyBBlock.23
	j       mergeSort_afterIfBBlock.23

mergeSort_thenBodyBBlock.23:
	li      ra,4
	mul     ra,ra,s1
	addi    a0,ra,4
	call    __malloc
	sw      s1,0(a0)
	addi    s5,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.10

mergeSort_afterIfBBlock.23:
	lw      ra,24(sp)
	add     s10,s1,ra
	li      ra,4
	mul     ra,ra,s10
	addi    a0,ra,4
	call    __malloc
	sw      s10,0(a0)
	addi    s10,a0,4
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      ra,s9
	sw      s10,0(s9)
	li      ra,0
	addi    a2,s9,4
	sw      ra,4(s9)
	addi    ra,s9,8
	addi    ra,s10,-4
	lw      ra,-4(s10)
	sw      ra,8(s9)
	addi    ra,ra,0
	sw      ra,20(sp)
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      ra,s6
	lw      ra,0(s9)
	sw      ra,0(s6)
	addi    a2,s6,4
	lw      a2,4(s9)
	addi    a1,a2,1
	sw      a1,4(s6)
	addi    a3,s6,8
	lw      a3,20(sp)
	add     a2,a2,a3
	sw      a2,8(s6)
	addi    a3,ra,-4
	lw      ra,-4(ra)
	bgt     a1,ra,mergeSort_criticalEdge.10
	j       mergeSort_logicalOr.10

mergeSort_thenBodyBBlock.24:
	mv      ra,s10
	sw      s4,0(s10)
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s11,0(s5)
	addi    ra,s5,4
	addi    a2,s7,1
	sw      a2,4(s5)
	addi    ra,s5,8
	add     ra,s7,s1
	sw      ra,8(s5)
	addi    a3,s11,-4
	lw      a3,-4(s11)
	bgt     a2,a3,mergeSort_criticalEdge.11
	j       mergeSort_logicalOr.11

mergeSort_elseBodyBBlock.2:
	mv      ra,s10
	sw      a2,0(s10)
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s9,0(s8)
	addi    ra,s8,4
	addi    a3,s5,1
	sw      a3,4(s8)
	addi    ra,s8,8
	lw      ra,24(sp)
	add     ra,s5,ra
	sw      ra,8(s8)
	addi    a2,s9,-4
	lw      a2,-4(s9)
	bgt     a3,a2,mergeSort_criticalEdge.12
	j       mergeSort_logicalOr.12

mergeSort_afterIfBBlock.24:
	mv      s5,s10
	j       mergeSort_returnBBlock.15

mergeSort_returnBBlock.15:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      ra,0
	addi    s10,s8,4
	sw      ra,4(s8)
	addi    s1,s8,8
	addi    ra,s5,-4
	lw      ra,-4(s5)
	sw      ra,8(s8)
	lw      a2,8(s2)
	lw      s5,4(s2)
	sub     a2,a2,s5
	addi    ra,ra,0
	blt     a2,ra,mergeSort_thenBodyBBlock.13
	j       mergeSort_afterIfBBlock.13

mergeSort_forCondBBlock.9:
	blt     ra,s1,mergeSort_forBodyBBlock.9
	j       mergeSort_afterForBBlock.9

mergeSort_forBodyBBlock.9:
	slli    a2,ra,2
	add     a3,s5,a2
	lw      a1,0(s8)
	add     a2,s10,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.9

mergeSort_afterForBBlock.9:
	j       mergeSort_returnBBlock.15

mergeSort_forCondBBlock.10:
	blt     ra,s1,mergeSort_forBodyBBlock.10
	j       mergeSort_afterForBBlock.10

mergeSort_forBodyBBlock.10:
	slli    a2,ra,2
	add     a3,s5,a2
	add     a2,s7,ra
	slli    a2,a2,2
	add     a2,s11,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.10

mergeSort_afterForBBlock.10:
	j       mergeSort_returnBBlock.15

mergeSort_thenBodyBBlock.25:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.25

mergeSort_afterIfBBlock.25:
	lw      s9,0(s8)
	addi    ra,s5,0
	slli    ra,ra,2
	add     ra,s9,ra
	lw      a2,0(ra)
	blt     s4,a2,mergeSort_thenBodyBBlock.24
	j       mergeSort_elseBodyBBlock.2

mergeSort_logicalOr.10:
	slt     ra,ra,a2
	j       mergeSort_afterLogicalOr.10

mergeSort_afterLogicalOr.10:
	bne     ra,zero,mergeSort_thenBodyBBlock.25
	j       mergeSort_afterIfBBlock.25

mergeSort_thenBodyBBlock.26:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.26

mergeSort_afterIfBBlock.26:
	mv      a0,s5
	mv      a1,s8
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      ra,0
	addi    a2,s8,4
	sw      ra,4(s8)
	addi    ra,s8,8
	addi    ra,s5,-4
	lw      ra,-4(s5)
	sw      ra,8(s8)
	lw      a2,8(s6)
	lw      s5,4(s6)
	sub     a2,a2,s5
	addi    ra,ra,0
	blt     a2,ra,mergeSort_thenBodyBBlock.27
	j       mergeSort_afterIfBBlock.27

mergeSort_logicalOr.11:
	slt     ra,a3,ra
	j       mergeSort_afterLogicalOr.11

mergeSort_afterLogicalOr.11:
	bne     ra,zero,mergeSort_thenBodyBBlock.26
	j       mergeSort_afterIfBBlock.26

mergeSort_thenBodyBBlock.27:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.27

mergeSort_afterIfBBlock.27:
	li      ra,0
	j       mergeSort_forCondBBlock.11

mergeSort_forCondBBlock.11:
	lw      a2,8(s8)
	lw      t1,4(s8)
	sub     a2,a2,t1
	blt     ra,a2,mergeSort_forBodyBBlock.11
	j       mergeSort_afterForBBlock.11

mergeSort_forBodyBBlock.11:
	lw      a2,0(s6)
	add     a3,s5,ra
	slli    a3,a3,2
	add     a2,a2,a3
	lw      a1,0(s8)
	add     a3,t1,ra
	slli    a3,a3,2
	add     a3,a1,a3
	lw      a3,0(a3)
	sw      a3,0(a2)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.11

mergeSort_afterForBBlock.11:
	j       mergeSort_afterIfBBlock.24

mergeSort_thenBodyBBlock.28:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.28

mergeSort_afterIfBBlock.28:
	mv      a0,s0
	mv      a1,s8
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      ra,0
	addi    a2,s8,4
	sw      ra,4(s8)
	addi    ra,s8,8
	addi    ra,s5,-4
	lw      a3,-4(s5)
	sw      a3,8(s8)
	lw      ra,8(s6)
	lw      s5,4(s6)
	sub     a2,ra,s5
	addi    ra,a3,0
	blt     a2,ra,mergeSort_thenBodyBBlock.29
	j       mergeSort_afterIfBBlock.29

mergeSort_logicalOr.12:
	slt     ra,a2,ra
	j       mergeSort_afterLogicalOr.12

mergeSort_afterLogicalOr.12:
	bne     ra,zero,mergeSort_thenBodyBBlock.28
	j       mergeSort_afterIfBBlock.28

mergeSort_thenBodyBBlock.29:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.29

mergeSort_afterIfBBlock.29:
	li      ra,0
	j       mergeSort_forCondBBlock.12

mergeSort_forCondBBlock.12:
	lw      a2,8(s8)
	lw      a1,4(s8)
	sub     a2,a2,a1
	blt     ra,a2,mergeSort_forBodyBBlock.12
	j       mergeSort_afterForBBlock.12

mergeSort_forBodyBBlock.12:
	lw      a2,0(s6)
	add     a3,s5,ra
	slli    a3,a3,2
	add     a3,a2,a3
	lw      a2,0(s8)
	add     a1,a1,ra
	slli    a1,a1,2
	add     a2,a2,a1
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.12

mergeSort_afterForBBlock.12:
	j       mergeSort_afterIfBBlock.24

mergeSort_thenBodyBBlock.30:
	li      ra,4
	mul     ra,ra,s6
	addi    a0,ra,4
	call    __malloc
	sw      s6,0(a0)
	addi    s8,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.13

mergeSort_afterIfBBlock.30:
	lw      ra,56(sp)
	beq     s6,ra,mergeSort_thenBodyBBlock.31
	j       mergeSort_afterIfBBlock.31

mergeSort_thenBodyBBlock.31:
	li      ra,4
	mul     ra,ra,s7
	addi    a0,ra,4
	call    __malloc
	sw      s7,0(a0)
	addi    s8,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.14

mergeSort_afterIfBBlock.31:
	add     s1,s7,s6
	li      ra,4
	mul     ra,ra,s1
	addi    a0,ra,4
	call    __malloc
	sw      s1,0(a0)
	addi    s4,a0,4
	li      a0,12
	call    __malloc
	mv      s0,a0
	mv      ra,s0
	sw      s4,0(s0)
	li      a2,0
	addi    ra,s0,4
	sw      a2,4(s0)
	addi    ra,s0,8
	addi    ra,s4,-4
	lw      ra,-4(s4)
	sw      ra,8(s0)
	addi    ra,ra,0
	sw      ra,16(sp)
	li      a0,12
	call    __malloc
	mv      s1,a0
	mv      ra,s1
	lw      a2,0(s0)
	sw      a2,0(s1)
	addi    ra,s1,4
	lw      a1,4(s0)
	addi    a3,a1,1
	sw      a3,4(s1)
	addi    ra,s1,8
	lw      ra,16(sp)
	add     a1,a1,ra
	sw      a1,8(s1)
	addi    ra,a2,-4
	lw      ra,-4(a2)
	bgt     a3,ra,mergeSort_criticalEdge.13
	j       mergeSort_logicalOr.13

mergeSort_thenBodyBBlock.32:
	mv      ra,s4
	sw      a2,0(s4)
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s0,0(s5)
	addi    ra,s5,4
	lw      ra,28(sp)
	addi    a2,ra,1
	sw      a2,4(s5)
	addi    ra,s5,8
	lw      ra,28(sp)
	add     a3,ra,s7
	sw      a3,8(s5)
	addi    ra,s0,-4
	lw      ra,-4(s0)
	bgt     a2,ra,mergeSort_criticalEdge.14
	j       mergeSort_logicalOr.14

mergeSort_elseBodyBBlock.3:
	mv      ra,s4
	lw      ra,44(sp)
	sw      ra,0(s4)
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	addi    ra,s8,4
	addi    a3,s10,1
	sw      a3,4(s8)
	addi    ra,s8,8
	add     ra,s10,s6
	sw      ra,8(s8)
	addi    a2,s5,-4
	lw      a2,-4(s5)
	bgt     a3,a2,mergeSort_criticalEdge.15
	j       mergeSort_logicalOr.15

mergeSort_afterIfBBlock.32:
	mv      s8,s4
	j       mergeSort_returnBBlock.16

mergeSort_returnBBlock.16:
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s8,0(s5)
	li      ra,0
	addi    s1,s5,4
	sw      ra,4(s5)
	addi    s10,s5,8
	addi    ra,s8,-4
	lw      a2,-4(s8)
	sw      a2,8(s5)
	lw      ra,8(s11)
	lw      s8,4(s11)
	sub     ra,ra,s8
	addi    a2,a2,0
	blt     ra,a2,mergeSort_thenBodyBBlock.19
	j       mergeSort_afterIfBBlock.19

mergeSort_forCondBBlock.13:
	blt     ra,s6,mergeSort_forBodyBBlock.13
	j       mergeSort_afterForBBlock.13

mergeSort_forBodyBBlock.13:
	slli    a2,ra,2
	add     a3,s8,a2
	add     a2,s10,ra
	slli    a2,a2,2
	add     a2,s5,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.13

mergeSort_afterForBBlock.13:
	j       mergeSort_returnBBlock.16

mergeSort_forCondBBlock.14:
	blt     ra,s7,mergeSort_forBodyBBlock.14
	j       mergeSort_afterForBBlock.14

mergeSort_forBodyBBlock.14:
	slli    a2,ra,2
	add     s5,s8,a2
	lw      a2,0(s9)
	lw      a3,28(sp)
	add     a3,a3,ra
	slli    a3,a3,2
	add     a2,a2,a3
	lw      a2,0(a2)
	sw      a2,0(s5)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.14

mergeSort_afterForBBlock.14:
	j       mergeSort_returnBBlock.16

mergeSort_thenBodyBBlock.33:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.33

mergeSort_afterIfBBlock.33:
	lw      s0,0(s9)
	lw      ra,28(sp)
	addi    ra,ra,0
	slli    ra,ra,2
	add     ra,s0,ra
	lw      a2,0(ra)
	lw      ra,44(sp)
	blt     a2,ra,mergeSort_thenBodyBBlock.32
	j       mergeSort_elseBodyBBlock.3

mergeSort_logicalOr.13:
	slt     ra,ra,a1
	j       mergeSort_afterLogicalOr.13

mergeSort_afterLogicalOr.13:
	bne     ra,zero,mergeSort_thenBodyBBlock.33
	j       mergeSort_afterIfBBlock.33

mergeSort_thenBodyBBlock.34:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.34

mergeSort_afterIfBBlock.34:
	mv      a0,s5
	mv      a1,s8
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      a2,0
	addi    ra,s8,4
	sw      a2,4(s8)
	addi    ra,s8,8
	addi    ra,s5,-4
	lw      a2,-4(s5)
	sw      a2,8(s8)
	lw      ra,8(s1)
	lw      s5,4(s1)
	sub     ra,ra,s5
	addi    a2,a2,0
	blt     ra,a2,mergeSort_thenBodyBBlock.35
	j       mergeSort_afterIfBBlock.35

mergeSort_logicalOr.14:
	slt     ra,ra,a3
	j       mergeSort_afterLogicalOr.14

mergeSort_afterLogicalOr.14:
	bne     ra,zero,mergeSort_thenBodyBBlock.34
	j       mergeSort_afterIfBBlock.34

mergeSort_thenBodyBBlock.35:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.35

mergeSort_afterIfBBlock.35:
	li      ra,0
	j       mergeSort_forCondBBlock.15

mergeSort_forCondBBlock.15:
	lw      a2,8(s8)
	lw      t1,4(s8)
	sub     a2,a2,t1
	blt     ra,a2,mergeSort_forBodyBBlock.15
	j       mergeSort_afterForBBlock.15

mergeSort_forBodyBBlock.15:
	lw      a3,0(s1)
	add     a2,s5,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a1,0(s8)
	add     a3,t1,ra
	slli    a3,a3,2
	add     a3,a1,a3
	lw      a3,0(a3)
	sw      a3,0(a2)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.15

mergeSort_afterForBBlock.15:
	j       mergeSort_afterIfBBlock.32

mergeSort_thenBodyBBlock.36:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.36

mergeSort_afterIfBBlock.36:
	mv      a0,s9
	mv      a1,s8
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      ra,0
	addi    a2,s8,4
	sw      ra,4(s8)
	addi    ra,s8,8
	addi    ra,s5,-4
	lw      a2,-4(s5)
	sw      a2,8(s8)
	lw      ra,8(s1)
	lw      s5,4(s1)
	sub     ra,ra,s5
	addi    a2,a2,0
	blt     ra,a2,mergeSort_thenBodyBBlock.37
	j       mergeSort_afterIfBBlock.37

mergeSort_logicalOr.15:
	slt     ra,a2,ra
	j       mergeSort_afterLogicalOr.15

mergeSort_afterLogicalOr.15:
	bne     ra,zero,mergeSort_thenBodyBBlock.36
	j       mergeSort_afterIfBBlock.36

mergeSort_thenBodyBBlock.37:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.37

mergeSort_afterIfBBlock.37:
	li      ra,0
	j       mergeSort_forCondBBlock.16

mergeSort_forCondBBlock.16:
	lw      a2,8(s8)
	lw      a3,4(s8)
	sub     a2,a2,a3
	blt     ra,a2,mergeSort_forBodyBBlock.16
	j       mergeSort_afterForBBlock.16

mergeSort_forBodyBBlock.16:
	lw      a1,0(s1)
	add     a2,s5,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a1,0(s8)
	add     a3,a3,ra
	slli    a3,a3,2
	add     a3,a1,a3
	lw      a3,0(a3)
	sw      a3,0(a2)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.16

mergeSort_afterForBBlock.16:
	j       mergeSort_afterIfBBlock.32

mergeSort_thenBodyBBlock.38:
	lw      ra,8(s8)
	lw      s1,4(s8)
	sub     s10,ra,s1
	li      ra,4
	mul     ra,ra,s10
	addi    a0,ra,4
	call    __malloc
	sw      s10,0(a0)
	addi    s5,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.17

mergeSort_afterIfBBlock.38:
	lw      ra,8(s8)
	lw      s4,4(s8)
	sub     ra,ra,s4
	sw      ra,12(sp)
	li      ra,0
	lw      a2,12(sp)
	beq     a2,ra,mergeSort_thenBodyBBlock.39
	j       mergeSort_afterIfBBlock.39

mergeSort_thenBodyBBlock.39:
	li      ra,4
	mul     ra,ra,s1
	addi    a0,ra,4
	call    __malloc
	sw      s1,0(a0)
	addi    s5,a0,4
	li      ra,0
	j       mergeSort_forCondBBlock.18

mergeSort_afterIfBBlock.39:
	lw      ra,12(sp)
	add     s5,s1,ra
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    s5,a0,4
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      ra,s6
	sw      s5,0(s6)
	li      ra,0
	addi    a2,s6,4
	sw      ra,4(s6)
	addi    ra,s6,8
	addi    ra,s5,-4
	lw      ra,-4(s5)
	sw      ra,8(s6)
	addi    ra,ra,0
	sw      ra,8(sp)
	li      a0,12
	call    __malloc
	mv      s10,a0
	mv      ra,s10
	lw      a2,0(s6)
	sw      a2,0(s10)
	addi    ra,s10,4
	lw      ra,4(s6)
	addi    a1,ra,1
	sw      a1,4(s10)
	addi    a3,s10,8
	lw      a3,8(sp)
	add     a3,ra,a3
	sw      a3,8(s10)
	addi    ra,a2,-4
	lw      ra,-4(a2)
	bgt     a1,ra,mergeSort_criticalEdge.16
	j       mergeSort_logicalOr.16

mergeSort_thenBodyBBlock.40:
	mv      ra,s5
	lw      ra,32(sp)
	sw      ra,0(s5)
	li      a0,12
	call    __malloc
	mv      s6,a0
	sw      s0,0(s6)
	addi    ra,s6,4
	addi    a3,s7,1
	sw      a3,4(s6)
	addi    ra,s6,8
	add     ra,s7,s1
	sw      ra,8(s6)
	addi    a2,s0,-4
	lw      a2,-4(s0)
	bgt     a3,a2,mergeSort_criticalEdge.17
	j       mergeSort_logicalOr.17

mergeSort_elseBodyBBlock.4:
	mv      ra,s5
	sw      a2,0(s5)
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s6,0(s8)
	addi    ra,s8,4
	addi    a2,s4,1
	sw      a2,4(s8)
	addi    ra,s8,8
	lw      ra,12(sp)
	add     ra,s4,ra
	sw      ra,8(s8)
	addi    a3,s6,-4
	lw      a3,-4(s6)
	bgt     a2,a3,mergeSort_criticalEdge.18
	j       mergeSort_logicalOr.18

mergeSort_afterIfBBlock.40:
	j       mergeSort_returnBBlock.17

mergeSort_returnBBlock.17:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      ra,0
	addi    s10,s8,4
	sw      ra,4(s8)
	addi    s1,s8,8
	addi    ra,s5,-4
	lw      ra,-4(s5)
	sw      ra,8(s8)
	lw      a2,8(s11)
	lw      s5,4(s11)
	sub     a2,a2,s5
	addi    ra,ra,0
	blt     a2,ra,mergeSort_thenBodyBBlock.21
	j       mergeSort_afterIfBBlock.21

mergeSort_forCondBBlock.17:
	blt     ra,s10,mergeSort_forBodyBBlock.17
	j       mergeSort_afterForBBlock.17

mergeSort_forBodyBBlock.17:
	slli    a2,ra,2
	add     a1,s5,a2
	lw      a2,0(s8)
	add     a3,s1,ra
	slli    a3,a3,2
	add     a2,a2,a3
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.17

mergeSort_afterForBBlock.17:
	j       mergeSort_returnBBlock.17

mergeSort_forCondBBlock.18:
	blt     ra,s1,mergeSort_forBodyBBlock.18
	j       mergeSort_afterForBBlock.18

mergeSort_forBodyBBlock.18:
	slli    a2,ra,2
	add     a3,s5,a2
	add     a2,s7,ra
	slli    a2,a2,2
	add     a2,s0,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.18

mergeSort_afterForBBlock.18:
	j       mergeSort_returnBBlock.17

mergeSort_thenBodyBBlock.41:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.41

mergeSort_afterIfBBlock.41:
	lw      s6,0(s8)
	addi    ra,s4,0
	slli    ra,ra,2
	add     ra,s6,ra
	lw      a2,0(ra)
	lw      ra,32(sp)
	blt     ra,a2,mergeSort_thenBodyBBlock.40
	j       mergeSort_elseBodyBBlock.4

mergeSort_logicalOr.16:
	slt     ra,ra,a3
	j       mergeSort_afterLogicalOr.16

mergeSort_afterLogicalOr.16:
	bne     ra,zero,mergeSort_thenBodyBBlock.41
	j       mergeSort_afterIfBBlock.41

mergeSort_thenBodyBBlock.42:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.42

mergeSort_afterIfBBlock.42:
	mv      a0,s6
	mv      a1,s8
	call    merge
	mv      s8,a0
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s8,0(s1)
	li      a2,0
	addi    ra,s1,4
	sw      a2,4(s1)
	addi    ra,s1,8
	addi    ra,s8,-4
	lw      a2,-4(s8)
	sw      a2,8(s1)
	lw      ra,8(s10)
	lw      s8,4(s10)
	sub     ra,ra,s8
	addi    a2,a2,0
	blt     ra,a2,mergeSort_thenBodyBBlock.43
	j       mergeSort_afterIfBBlock.43

mergeSort_logicalOr.17:
	slt     ra,a2,ra
	j       mergeSort_afterLogicalOr.17

mergeSort_afterLogicalOr.17:
	bne     ra,zero,mergeSort_thenBodyBBlock.42
	j       mergeSort_afterIfBBlock.42

mergeSort_thenBodyBBlock.43:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.43

mergeSort_afterIfBBlock.43:
	li      ra,0
	j       mergeSort_forCondBBlock.19

mergeSort_forCondBBlock.19:
	lw      a2,8(s1)
	lw      a1,4(s1)
	sub     a2,a2,a1
	blt     ra,a2,mergeSort_forBodyBBlock.19
	j       mergeSort_afterForBBlock.19

mergeSort_forBodyBBlock.19:
	lw      a3,0(s10)
	add     a2,s8,ra
	slli    a2,a2,2
	add     t1,a3,a2
	lw      a3,0(s1)
	add     a2,a1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(t1)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.19

mergeSort_afterForBBlock.19:
	j       mergeSort_afterIfBBlock.40

mergeSort_thenBodyBBlock.44:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.44

mergeSort_afterIfBBlock.44:
	mv      a0,s9
	mv      a1,s8
	call    merge
	mv      s8,a0
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s8,0(s1)
	li      a2,0
	addi    ra,s1,4
	sw      a2,4(s1)
	addi    ra,s1,8
	addi    ra,s8,-4
	lw      a2,-4(s8)
	sw      a2,8(s1)
	lw      ra,8(s10)
	lw      s8,4(s10)
	sub     ra,ra,s8
	addi    a2,a2,0
	blt     ra,a2,mergeSort_thenBodyBBlock.45
	j       mergeSort_afterIfBBlock.45

mergeSort_logicalOr.18:
	slt     ra,a3,ra
	j       mergeSort_afterLogicalOr.18

mergeSort_afterLogicalOr.18:
	bne     ra,zero,mergeSort_thenBodyBBlock.44
	j       mergeSort_afterIfBBlock.44

mergeSort_thenBodyBBlock.45:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.45

mergeSort_afterIfBBlock.45:
	li      ra,0
	j       mergeSort_forCondBBlock.20

mergeSort_forCondBBlock.20:
	lw      a2,8(s1)
	lw      a1,4(s1)
	sub     a2,a2,a1
	blt     ra,a2,mergeSort_forBodyBBlock.20
	j       mergeSort_afterForBBlock.20

mergeSort_forBodyBBlock.20:
	lw      a3,0(s10)
	add     a2,s8,ra
	slli    a2,a2,2
	add     t1,a3,a2
	lw      a3,0(s1)
	add     a2,a1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(t1)
	addi    ra,ra,1
	j       mergeSort_forCondBBlock.20

mergeSort_afterForBBlock.20:
	j       mergeSort_afterIfBBlock.40

mergeSort_criticalEdge.0:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.0

mergeSort_criticalEdge.1:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.1

mergeSort_criticalEdge.2:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.2

mergeSort_criticalEdge.3:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.3

mergeSort_criticalEdge.4:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.4

mergeSort_criticalEdge.5:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.5

mergeSort_criticalEdge.6:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.6

mergeSort_criticalEdge.7:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.7

mergeSort_criticalEdge.8:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.8

mergeSort_criticalEdge.9:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.9

mergeSort_criticalEdge.10:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.10

mergeSort_criticalEdge.11:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.11

mergeSort_criticalEdge.12:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.12

mergeSort_criticalEdge.13:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.13

mergeSort_criticalEdge.14:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.14

mergeSort_criticalEdge.15:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.15

mergeSort_criticalEdge.16:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.16

mergeSort_criticalEdge.17:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.17

mergeSort_criticalEdge.18:
	addi    ra,zero,1
	j       mergeSort_afterLogicalOr.18


	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-128
	sw      ra,124(sp)
	sw      s0,120(sp)
	sw      s1,116(sp)
	sw      s2,112(sp)
	sw      s3,108(sp)
	sw      s4,104(sp)
	sw      s5,100(sp)
	sw      s6,96(sp)
	sw      s7,92(sp)
	sw      s8,88(sp)
	sw      s9,84(sp)
	sw      s10,80(sp)
	sw      s11,76(sp)
	call    __getInt
	mv      s8,a0
	li      ra,4
	mul     ra,ra,s8
	addi    a0,ra,4
	call    __malloc
	sw      s8,0(a0)
	addi    ra,a0,4
	sw      ra,72(sp)
	li      s5,0
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	blt     s5,s8,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    ra,s5,2
	lw      a2,72(sp)
	add     s10,a2,ra
	call    __getInt
	sw      a0,0(s10)
	addi    s5,s5,1
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	li      a0,12
	call    __malloc
	mv      s1,a0
	mv      ra,s1
	lw      ra,72(sp)
	sw      ra,0(s1)
	li      ra,0
	addi    a2,s1,4
	sw      ra,4(s1)
	addi    ra,s1,8
	lw      ra,72(sp)
	addi    ra,ra,-4
	lw      ra,72(sp)
	lw      ra,-4(ra)
	sw      ra,8(s1)
	addi    s5,ra,0
	li      ra,1
	beq     s5,ra,main_thenBodyBBlock.0
	j       main_afterIfBBlock.0

main_forCondBBlock.1:
	blt     s5,s8,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    a2,s5,2
	lw      ra,72(sp)
	add     ra,ra,a2
	lw      a0,0(ra)
	call    __toString
    la      a1,.str.2
	call    __stringAdd
	call    __print
	addi    s5,s5,1
	j       main_forCondBBlock.1

main_afterForBBlock.1:
    la      a0,.str.3
	call    __println
	li      a0,0
	lw      s11,76(sp)
	lw      s10,80(sp)
	lw      s9,84(sp)
	lw      s8,88(sp)
	lw      s7,92(sp)
	lw      s6,96(sp)
	lw      s5,100(sp)
	lw      s4,104(sp)
	lw      s3,108(sp)
	lw      s2,112(sp)
	lw      s1,116(sp)
	lw      s0,120(sp)
	lw      ra,124(sp)
	addi    sp,sp,128
	jr      ra

main_thenBodyBBlock.0:
	j       main_returnBBlock.5

main_afterIfBBlock.0:
	li      ra,2
	div     s7,s5,ra
	li      a0,12
	call    __malloc
	mv      s10,a0
	lw      a1,0(s1)
	sw      a1,0(s10)
	addi    ra,s10,4
	lw      ra,4(s1)
	addi    a3,ra,0
	sw      a3,4(s10)
	addi    a2,s10,8
	add     a2,ra,s7
	sw      a2,8(s10)
	addi    ra,a1,-4
	lw      ra,-4(a1)
	bgt     a3,ra,main_criticalEdge.0
	j       main_logicalOr.0

main_returnBBlock.5:
	li      s5,0
	j       main_forCondBBlock.1

main_thenBodyBBlock.1:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.1

main_afterIfBBlock.1:
	mv      a0,s10
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s10,a0
	lw      a1,0(s1)
	sw      a1,0(s10)
	addi    ra,s10,4
	lw      a2,4(s1)
	add     a3,a2,s7
	sw      a3,4(s10)
	addi    ra,s10,8
	add     a2,a2,s5
	sw      a2,8(s10)
	addi    ra,a1,-4
	lw      ra,-4(a1)
	bgt     a3,ra,main_criticalEdge.1
	j       main_logicalOr.1

main_logicalOr.0:
	slt     ra,ra,a2
	j       main_afterLogicalOr.0

main_afterLogicalOr.0:
	bne     ra,zero,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_thenBodyBBlock.2:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.2

main_afterIfBBlock.2:
	mv      a0,s10
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s10,a0
	mv      ra,s10
	lw      s6,0(s1)
	sw      s6,0(s10)
	addi    ra,s10,4
	lw      s11,4(s1)
	addi    a2,s11,0
	sw      a2,4(s10)
	addi    ra,s10,8
	add     s7,s11,s7
	sw      s7,8(s10)
	addi    ra,s6,-4
	lw      s0,-4(s6)
	bgt     a2,s0,main_criticalEdge.2
	j       main_logicalOr.2

main_logicalOr.1:
	slt     ra,ra,a2
	j       main_afterLogicalOr.1

main_afterLogicalOr.1:
	bne     ra,zero,main_thenBodyBBlock.2
	j       main_afterIfBBlock.2

main_thenBodyBBlock.3:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.3

main_afterIfBBlock.3:
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      ra,s9
	sw      s6,0(s9)
	addi    ra,s9,4
	sw      s7,4(s9)
	addi    ra,s9,8
	add     ra,s11,s5
	sw      ra,8(s9)
	bgt     s7,s0,main_criticalEdge.3
	j       main_logicalOr.3

main_logicalOr.2:
	slt     ra,s0,s7
	j       main_afterLogicalOr.2

main_afterLogicalOr.2:
	bne     ra,zero,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.4

main_afterIfBBlock.4:
	lw      ra,8(s10)
	lw      s3,4(s10)
	sub     s5,ra,s3
	li      ra,0
	li      s4,0
	beq     s5,ra,main_thenBodyBBlock.6
	j       main_afterIfBBlock.6

main_logicalOr.3:
	slt     ra,s0,ra
	j       main_afterLogicalOr.3

main_afterLogicalOr.3:
	bne     ra,zero,main_thenBodyBBlock.4
	j       main_afterIfBBlock.4

main_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.5

main_afterIfBBlock.5:
	li      ra,0
	j       main_forCondBBlock.2

main_forCondBBlock.2:
	lw      a2,0(s10)
	lw      a1,0(s11)
	sub     a2,a2,a1
	blt     ra,a2,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	lw      a3,0(s1)
	add     a2,s7,ra
	slli    a2,a2,2
	add     a3,a3,a2
	lw      t1,0(s5)
	add     a2,a1,ra
	slli    a2,a2,2
	add     a2,t1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.2

main_afterForBBlock.2:
	j       main_returnBBlock.5

main_thenBodyBBlock.6:
	lw      ra,8(s9)
	lw      s5,4(s9)
	sub     s10,ra,s5
	li      ra,4
	mul     ra,ra,s10
	addi    a0,ra,4
	call    __malloc
	sw      s10,0(a0)
	addi    s7,a0,4
	li      ra,0
	j       main_forCondBBlock.3

main_afterIfBBlock.6:
	lw      ra,8(s9)
	lw      s6,4(s9)
	sub     s11,ra,s6
	li      ra,0
	sw      ra,68(sp)
	li      ra,0
	li      a2,0
	sw      a2,64(sp)
	beq     s11,ra,main_thenBodyBBlock.7
	j       main_afterIfBBlock.7

main_thenBodyBBlock.7:
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    s7,a0,4
	li      ra,0
	j       main_forCondBBlock.4

main_afterIfBBlock.7:
	add     s7,s5,s11
	li      ra,4
	mul     ra,ra,s7
	addi    a0,ra,4
	call    __malloc
	sw      s7,0(a0)
	addi    ra,a0,4
	sw      ra,60(sp)
	li      a0,12
	call    __malloc
	mv      s7,a0
	mv      ra,s7
	lw      ra,60(sp)
	sw      ra,0(s7)
	li      ra,0
	addi    a2,s7,4
	sw      ra,4(s7)
	addi    ra,s7,8
	lw      ra,60(sp)
	addi    ra,ra,-4
	lw      ra,60(sp)
	lw      ra,-4(ra)
	sw      ra,8(s7)
	addi    s2,ra,0
	li      a0,12
	call    __malloc
	mv      s0,a0
	mv      ra,s0
	lw      a2,0(s7)
	sw      a2,0(s0)
	addi    ra,s0,4
	lw      ra,4(s7)
	addi    a1,ra,1
	sw      a1,4(s0)
	addi    a3,s0,8
	add     a3,ra,s2
	sw      a3,8(s0)
	addi    ra,a2,-4
	lw      ra,-4(a2)
	bgt     a1,ra,main_criticalEdge.4
	j       main_logicalOr.4

main_thenBodyBBlock.8:
	lw      ra,60(sp)
	lw      a2,60(sp)
	lw      ra,56(sp)
	sw      ra,0(a2)
	li      a0,12
	call    __malloc
	mv      s10,a0
	mv      ra,s10
	sw      s7,0(s10)
	addi    ra,s10,4
	addi    a3,s3,1
	sw      a3,4(s10)
	addi    ra,s10,8
	add     a2,s3,s5
	sw      a2,8(s10)
	addi    ra,s7,-4
	lw      ra,-4(s7)
	bgt     a3,ra,main_criticalEdge.5
	j       main_logicalOr.5

main_elseBodyBBlock.0:
	lw      ra,60(sp)
	lw      ra,60(sp)
	lw      a2,52(sp)
	sw      a2,0(ra)
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      ra,s9
	sw      s2,0(s9)
	addi    ra,s9,4
	addi    a3,s6,1
	sw      a3,4(s9)
	addi    ra,s9,8
	add     ra,s6,s11
	sw      ra,8(s9)
	addi    a2,s2,-4
	lw      a2,-4(s2)
	bgt     a3,a2,main_criticalEdge.6
	j       main_logicalOr.6

main_afterIfBBlock.8:
	lw      s7,60(sp)
	j       main_returnBBlock.6

main_returnBBlock.6:
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s7,0(s5)
	li      ra,0
	addi    s11,s5,4
	sw      ra,4(s5)
	addi    s10,s5,8
	addi    ra,s7,-4
	lw      ra,-4(s7)
	sw      ra,8(s5)
	lw      a2,8(s1)
	lw      s7,4(s1)
	sub     a2,a2,s7
	addi    ra,ra,0
	blt     a2,ra,main_thenBodyBBlock.5
	j       main_afterIfBBlock.5

main_forCondBBlock.3:
	blt     ra,s10,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	slli    a2,ra,2
	add     a1,s7,a2
	lw      a2,0(s9)
	add     a3,s5,ra
	slli    a3,a3,2
	add     a2,a2,a3
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       main_forCondBBlock.3

main_afterForBBlock.3:
	j       main_returnBBlock.6

main_forCondBBlock.4:
	blt     ra,s5,main_forBodyBBlock.4
	j       main_afterForBBlock.4

main_forBodyBBlock.4:
	slli    a2,ra,2
	add     a3,s7,a2
	lw      a1,0(s10)
	add     a2,s3,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.4

main_afterForBBlock.4:
	j       main_returnBBlock.6

main_thenBodyBBlock.9:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.9

main_afterIfBBlock.9:
	lw      s7,0(s10)
	addi    ra,s3,0
	slli    ra,ra,2
	add     ra,s7,ra
	lw      ra,0(ra)
	sw      ra,56(sp)
	lw      s2,0(s9)
	addi    ra,s6,0
	slli    ra,ra,2
	add     ra,s2,ra
	lw      ra,0(ra)
	sw      ra,52(sp)
	lw      a2,56(sp)
	lw      ra,52(sp)
	blt     a2,ra,main_thenBodyBBlock.8
	j       main_elseBodyBBlock.0

main_logicalOr.4:
	slt     ra,ra,a3
	j       main_afterLogicalOr.4

main_afterLogicalOr.4:
	bne     ra,zero,main_thenBodyBBlock.9
	j       main_afterIfBBlock.9

main_thenBodyBBlock.10:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.10

main_afterIfBBlock.10:
	lw      ra,8(s10)
	lw      s4,4(s10)
	sub     s5,ra,s4
	li      ra,0
	li      a2,0
	sw      a2,48(sp)
	beq     s5,ra,main_thenBodyBBlock.14
	j       main_afterIfBBlock.14

main_logicalOr.5:
	slt     ra,ra,a2
	j       main_afterLogicalOr.5

main_afterLogicalOr.5:
	bne     ra,zero,main_thenBodyBBlock.10
	j       main_afterIfBBlock.10

main_thenBodyBBlock.11:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.11

main_afterIfBBlock.11:
	li      ra,0
	j       main_forCondBBlock.5

main_forCondBBlock.5:
	lw      a2,0(s11)
	lw      t1,0(s10)
	sub     a2,a2,t1
	blt     ra,a2,main_forBodyBBlock.5
	j       main_afterForBBlock.5

main_forBodyBBlock.5:
	lw      a2,0(s0)
	add     a3,s7,ra
	slli    a3,a3,2
	add     a1,a2,a3
	lw      a3,0(s5)
	add     a2,t1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       main_forCondBBlock.5

main_afterForBBlock.5:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.12:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.12

main_afterIfBBlock.12:
	beq     s5,s4,main_thenBodyBBlock.22
	j       main_afterIfBBlock.22

main_logicalOr.6:
	slt     ra,a2,ra
	j       main_afterLogicalOr.6

main_afterLogicalOr.6:
	bne     ra,zero,main_thenBodyBBlock.12
	j       main_afterIfBBlock.12

main_thenBodyBBlock.13:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.13

main_afterIfBBlock.13:
	li      ra,0
	j       main_forCondBBlock.6

main_forCondBBlock.6:
	lw      a2,0(s11)
	lw      t1,0(s7)
	sub     a2,a2,t1
	blt     ra,a2,main_forBodyBBlock.6
	j       main_afterForBBlock.6

main_forBodyBBlock.6:
	lw      a3,0(s0)
	add     a2,s10,ra
	slli    a2,a2,2
	add     a1,a3,a2
	lw      a3,0(s5)
	add     a2,t1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       main_forCondBBlock.6

main_afterForBBlock.6:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.14:
	li      ra,4
	mul     ra,ra,s11
	addi    a0,ra,4
	call    __malloc
	sw      s11,0(a0)
	addi    s7,a0,4
	li      ra,0
	j       main_forCondBBlock.7

main_afterIfBBlock.14:
	lw      ra,64(sp)
	beq     s11,ra,main_thenBodyBBlock.15
	j       main_afterIfBBlock.15

main_thenBodyBBlock.15:
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    s7,a0,4
	li      ra,0
	j       main_forCondBBlock.8

main_afterIfBBlock.15:
	add     s7,s5,s11
	li      ra,4
	mul     ra,ra,s7
	addi    a0,ra,4
	call    __malloc
	sw      s7,0(a0)
	addi    ra,a0,4
	sw      ra,44(sp)
	li      a0,12
	call    __malloc
	mv      s7,a0
	mv      ra,s7
	lw      ra,44(sp)
	sw      ra,0(s7)
	li      ra,0
	addi    a2,s7,4
	sw      ra,4(s7)
	addi    ra,s7,8
	lw      ra,44(sp)
	addi    ra,ra,-4
	lw      ra,44(sp)
	lw      ra,-4(ra)
	sw      ra,8(s7)
	addi    ra,ra,0
	sw      ra,40(sp)
	li      a0,12
	call    __malloc
	mv      s3,a0
	mv      ra,s3
	lw      a1,0(s7)
	sw      a1,0(s3)
	addi    ra,s3,4
	lw      a2,4(s7)
	addi    a3,a2,1
	sw      a3,4(s3)
	addi    ra,s3,8
	lw      ra,40(sp)
	add     ra,a2,ra
	sw      ra,8(s3)
	addi    a2,a1,-4
	lw      a2,-4(a1)
	bgt     a3,a2,main_criticalEdge.7
	j       main_logicalOr.7

main_thenBodyBBlock.16:
	lw      ra,44(sp)
	lw      a2,36(sp)
	lw      ra,44(sp)
	sw      a2,0(ra)
	li      a0,12
	call    __malloc
	mv      s10,a0
	mv      ra,s10
	sw      s7,0(s10)
	addi    ra,s10,4
	addi    a2,s4,1
	sw      a2,4(s10)
	addi    ra,s10,8
	add     ra,s4,s5
	sw      ra,8(s10)
	addi    a3,s7,-4
	lw      a3,-4(s7)
	bgt     a2,a3,main_criticalEdge.8
	j       main_logicalOr.8

main_elseBodyBBlock.1:
	lw      ra,44(sp)
	lw      ra,44(sp)
	lw      a2,52(sp)
	sw      a2,0(ra)
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      ra,s9
	sw      s2,0(s9)
	addi    ra,s9,4
	addi    ra,s6,1
	sw      ra,4(s9)
	addi    a2,s9,8
	add     a2,s6,s11
	sw      a2,8(s9)
	addi    a3,s2,-4
	lw      a3,-4(s2)
	bgt     ra,a3,main_criticalEdge.9
	j       main_logicalOr.9

main_afterIfBBlock.16:
	lw      s7,44(sp)
	j       main_returnBBlock.7

main_returnBBlock.7:
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s7,0(s5)
	li      ra,0
	addi    s10,s5,4
	sw      ra,4(s5)
	addi    s11,s5,8
	addi    ra,s7,-4
	lw      ra,-4(s7)
	sw      ra,8(s5)
	lw      a2,8(s0)
	lw      s7,4(s0)
	sub     a2,a2,s7
	addi    ra,ra,0
	blt     a2,ra,main_thenBodyBBlock.11
	j       main_afterIfBBlock.11

main_forCondBBlock.7:
	blt     ra,s11,main_forBodyBBlock.7
	j       main_afterForBBlock.7

main_forBodyBBlock.7:
	slli    a2,ra,2
	add     a3,s7,a2
	add     a2,s6,ra
	slli    a2,a2,2
	add     a2,s2,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.7

main_afterForBBlock.7:
	j       main_returnBBlock.7

main_forCondBBlock.8:
	blt     ra,s5,main_forBodyBBlock.8
	j       main_afterForBBlock.8

main_forBodyBBlock.8:
	slli    a2,ra,2
	add     a3,s7,a2
	lw      a1,0(s10)
	add     a2,s4,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.8

main_afterForBBlock.8:
	j       main_returnBBlock.7

main_thenBodyBBlock.17:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.17

main_afterIfBBlock.17:
	lw      s7,0(s10)
	addi    ra,s4,0
	slli    ra,ra,2
	add     ra,s7,ra
	lw      ra,0(ra)
	sw      ra,36(sp)
	mv      ra,ra
	lw      a2,52(sp)
	blt     ra,a2,main_thenBodyBBlock.16
	j       main_elseBodyBBlock.1

main_logicalOr.7:
	slt     ra,a2,ra
	j       main_afterLogicalOr.7

main_afterLogicalOr.7:
	bne     ra,zero,main_thenBodyBBlock.17
	j       main_afterIfBBlock.17

main_thenBodyBBlock.18:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.18

main_afterIfBBlock.18:
	lw      ra,8(s10)
	lw      a2,4(s10)
	sw      a2,32(sp)
	mv      a2,a2
	sub     s5,ra,a2
	li      ra,0
	beq     s5,ra,main_thenBodyBBlock.30
	j       main_afterIfBBlock.30

main_logicalOr.8:
	slt     ra,a3,ra
	j       main_afterLogicalOr.8

main_afterLogicalOr.8:
	bne     ra,zero,main_thenBodyBBlock.18
	j       main_afterIfBBlock.18

main_thenBodyBBlock.19:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.19

main_afterIfBBlock.19:
	li      ra,0
	j       main_forCondBBlock.9

main_forCondBBlock.9:
	lw      a2,0(s11)
	lw      a3,0(s10)
	sub     a2,a2,a3
	blt     ra,a2,main_forBodyBBlock.9
	j       main_afterForBBlock.9

main_forBodyBBlock.9:
	lw      a1,0(s3)
	add     a2,s7,ra
	slli    a2,a2,2
	add     a1,a1,a2
	lw      a2,0(s5)
	add     a3,a3,ra
	slli    a3,a3,2
	add     a2,a2,a3
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       main_forCondBBlock.9

main_afterForBBlock.9:
	j       main_afterIfBBlock.16

main_thenBodyBBlock.20:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.20

main_afterIfBBlock.20:
	lw      ra,48(sp)
	beq     s5,ra,main_thenBodyBBlock.38
	j       main_afterIfBBlock.38

main_logicalOr.9:
	slt     ra,a3,a2
	j       main_afterLogicalOr.9

main_afterLogicalOr.9:
	bne     ra,zero,main_thenBodyBBlock.20
	j       main_afterIfBBlock.20

main_thenBodyBBlock.21:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.21

main_afterIfBBlock.21:
	li      ra,0
	j       main_forCondBBlock.10

main_forCondBBlock.10:
	lw      a3,0(s7)
	lw      a2,0(s11)
	sub     a3,a3,a2
	blt     ra,a3,main_forBodyBBlock.10
	j       main_afterForBBlock.10

main_forBodyBBlock.10:
	lw      a1,0(s3)
	add     a3,s10,ra
	slli    a3,a3,2
	add     a3,a1,a3
	lw      a1,0(s5)
	add     a2,a2,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.10

main_afterForBBlock.10:
	j       main_afterIfBBlock.16

main_thenBodyBBlock.22:
	lw      ra,8(s9)
	lw      s5,4(s9)
	sub     s7,ra,s5
	li      ra,4
	mul     ra,ra,s7
	addi    a0,ra,4
	call    __malloc
	sw      s7,0(a0)
	addi    s10,a0,4
	li      ra,0
	j       main_forCondBBlock.11

main_afterIfBBlock.22:
	lw      ra,8(s9)
	lw      s4,4(s9)
	sub     ra,ra,s4
	sw      ra,28(sp)
	li      a2,0
	lw      ra,28(sp)
	beq     ra,a2,main_thenBodyBBlock.23
	j       main_afterIfBBlock.23

main_thenBodyBBlock.23:
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    s10,a0,4
	li      ra,0
	j       main_forCondBBlock.12

main_afterIfBBlock.23:
	lw      ra,28(sp)
	add     s11,s5,ra
	li      ra,4
	mul     ra,ra,s11
	addi    a0,ra,4
	call    __malloc
	sw      s11,0(a0)
	addi    s11,a0,4
	li      a0,12
	call    __malloc
	mv      s2,a0
	mv      ra,s2
	sw      s11,0(s2)
	li      a2,0
	addi    ra,s2,4
	sw      a2,4(s2)
	addi    ra,s2,8
	addi    ra,s11,-4
	lw      ra,-4(s11)
	sw      ra,8(s2)
	addi    ra,ra,0
	sw      ra,24(sp)
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      ra,s6
	lw      a1,0(s2)
	sw      a1,0(s6)
	addi    ra,s6,4
	lw      a3,4(s2)
	addi    a2,a3,1
	sw      a2,4(s6)
	addi    ra,s6,8
	lw      ra,24(sp)
	add     a3,a3,ra
	sw      a3,8(s6)
	addi    ra,a1,-4
	lw      ra,-4(a1)
	bgt     a2,ra,main_criticalEdge.10
	j       main_logicalOr.10

main_thenBodyBBlock.24:
	mv      ra,s11
	lw      ra,56(sp)
	sw      ra,0(s11)
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s7,0(s10)
	addi    ra,s10,4
	addi    a3,s3,1
	sw      a3,4(s10)
	addi    ra,s10,8
	add     a2,s3,s5
	sw      a2,8(s10)
	addi    ra,s7,-4
	lw      ra,-4(s7)
	bgt     a3,ra,main_criticalEdge.11
	j       main_logicalOr.11

main_elseBodyBBlock.2:
	mv      ra,s11
	sw      a2,0(s11)
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s2,0(s5)
	addi    ra,s5,4
	addi    a2,s4,1
	sw      a2,4(s5)
	addi    ra,s5,8
	lw      ra,28(sp)
	add     a3,s4,ra
	sw      a3,8(s5)
	addi    ra,s2,-4
	lw      ra,-4(s2)
	bgt     a2,ra,main_criticalEdge.12
	j       main_logicalOr.12

main_afterIfBBlock.24:
	mv      s10,s11
	j       main_returnBBlock.8

main_returnBBlock.8:
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s10,0(s5)
	li      ra,0
	addi    s7,s5,4
	sw      ra,4(s5)
	addi    s11,s5,8
	addi    ra,s10,-4
	lw      ra,-4(s10)
	sw      ra,8(s5)
	lw      a2,8(s0)
	lw      s10,4(s0)
	sub     a2,a2,s10
	addi    ra,ra,0
	blt     a2,ra,main_thenBodyBBlock.13
	j       main_afterIfBBlock.13

main_forCondBBlock.11:
	blt     ra,s7,main_forBodyBBlock.11
	j       main_afterForBBlock.11

main_forBodyBBlock.11:
	slli    a2,ra,2
	add     a3,s10,a2
	lw      a1,0(s9)
	add     a2,s5,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.11

main_afterForBBlock.11:
	j       main_returnBBlock.8

main_forCondBBlock.12:
	blt     ra,s5,main_forBodyBBlock.12
	j       main_afterForBBlock.12

main_forBodyBBlock.12:
	slli    a2,ra,2
	add     a3,s10,a2
	add     a2,s3,ra
	slli    a2,a2,2
	add     a2,s7,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.12

main_afterForBBlock.12:
	j       main_returnBBlock.8

main_thenBodyBBlock.25:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.25

main_afterIfBBlock.25:
	lw      s2,0(s9)
	addi    ra,s4,0
	slli    ra,ra,2
	add     ra,s2,ra
	lw      a2,0(ra)
	lw      ra,56(sp)
	blt     ra,a2,main_thenBodyBBlock.24
	j       main_elseBodyBBlock.2

main_logicalOr.10:
	slt     ra,ra,a3
	j       main_afterLogicalOr.10

main_afterLogicalOr.10:
	bne     ra,zero,main_thenBodyBBlock.25
	j       main_afterIfBBlock.25

main_thenBodyBBlock.26:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.26

main_afterIfBBlock.26:
	mv      a0,s10
	mv      a1,s9
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s5,0(s10)
	li      ra,0
	addi    a2,s10,4
	sw      ra,4(s10)
	addi    ra,s10,8
	addi    ra,s5,-4
	lw      a2,-4(s5)
	sw      a2,8(s10)
	lw      ra,8(s6)
	lw      s5,4(s6)
	sub     ra,ra,s5
	addi    a2,a2,0
	blt     ra,a2,main_thenBodyBBlock.27
	j       main_afterIfBBlock.27

main_logicalOr.11:
	slt     ra,ra,a2
	j       main_afterLogicalOr.11

main_afterLogicalOr.11:
	bne     ra,zero,main_thenBodyBBlock.26
	j       main_afterIfBBlock.26

main_thenBodyBBlock.27:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.27

main_afterIfBBlock.27:
	li      ra,0
	j       main_forCondBBlock.13

main_forCondBBlock.13:
	lw      a3,8(s10)
	lw      a2,4(s10)
	sub     a3,a3,a2
	blt     ra,a3,main_forBodyBBlock.13
	j       main_afterForBBlock.13

main_forBodyBBlock.13:
	lw      a1,0(s6)
	add     a3,s5,ra
	slli    a3,a3,2
	add     a3,a1,a3
	lw      a1,0(s10)
	add     a2,a2,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.13

main_afterForBBlock.13:
	j       main_afterIfBBlock.24

main_thenBodyBBlock.28:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.28

main_afterIfBBlock.28:
	mv      a0,s10
	mv      a1,s5
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s5,0(s10)
	li      a2,0
	addi    ra,s10,4
	sw      a2,4(s10)
	addi    ra,s10,8
	addi    ra,s5,-4
	lw      ra,-4(s5)
	sw      ra,8(s10)
	lw      a2,8(s6)
	lw      s5,4(s6)
	sub     a2,a2,s5
	addi    ra,ra,0
	blt     a2,ra,main_thenBodyBBlock.29
	j       main_afterIfBBlock.29

main_logicalOr.12:
	slt     ra,ra,a3
	j       main_afterLogicalOr.12

main_afterLogicalOr.12:
	bne     ra,zero,main_thenBodyBBlock.28
	j       main_afterIfBBlock.28

main_thenBodyBBlock.29:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.29

main_afterIfBBlock.29:
	li      ra,0
	j       main_forCondBBlock.14

main_forCondBBlock.14:
	lw      a2,8(s10)
	lw      a3,4(s10)
	sub     a2,a2,a3
	blt     ra,a2,main_forBodyBBlock.14
	j       main_afterForBBlock.14

main_forBodyBBlock.14:
	lw      a1,0(s6)
	add     a2,s5,ra
	slli    a2,a2,2
	add     t1,a1,a2
	lw      a1,0(s10)
	add     a2,a3,ra
	slli    a2,a2,2
	add     a2,a1,a2
	lw      a2,0(a2)
	sw      a2,0(t1)
	addi    ra,ra,1
	j       main_forCondBBlock.14

main_afterForBBlock.14:
	j       main_afterIfBBlock.24

main_thenBodyBBlock.30:
	li      ra,4
	mul     ra,ra,s11
	addi    a0,ra,4
	call    __malloc
	sw      s11,0(a0)
	addi    s7,a0,4
	li      ra,0
	j       main_forCondBBlock.15

main_afterIfBBlock.30:
	lw      ra,68(sp)
	beq     s11,ra,main_thenBodyBBlock.31
	j       main_afterIfBBlock.31

main_thenBodyBBlock.31:
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    s7,a0,4
	li      ra,0
	j       main_forCondBBlock.16

main_afterIfBBlock.31:
	add     s7,s5,s11
	li      ra,4
	mul     ra,ra,s7
	addi    a0,ra,4
	call    __malloc
	sw      s7,0(a0)
	addi    ra,a0,4
	sw      ra,20(sp)
	li      a0,12
	call    __malloc
	mv      s4,a0
	mv      ra,s4
	lw      ra,20(sp)
	sw      ra,0(s4)
	li      a2,0
	addi    ra,s4,4
	sw      a2,4(s4)
	addi    ra,s4,8
	lw      ra,20(sp)
	addi    ra,ra,-4
	lw      ra,20(sp)
	lw      ra,-4(ra)
	sw      ra,8(s4)
	addi    ra,ra,0
	sw      ra,16(sp)
	li      a0,12
	call    __malloc
	mv      s7,a0
	mv      ra,s7
	lw      ra,0(s4)
	sw      ra,0(s7)
	addi    a2,s7,4
	lw      a3,4(s4)
	addi    a1,a3,1
	sw      a1,4(s7)
	addi    a2,s7,8
	lw      a2,16(sp)
	add     a3,a3,a2
	sw      a3,8(s7)
	addi    a2,ra,-4
	lw      ra,-4(ra)
	bgt     a1,ra,main_criticalEdge.13
	j       main_logicalOr.13

main_thenBodyBBlock.32:
	lw      ra,20(sp)
	lw      ra,20(sp)
	sw      a2,0(ra)
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s4,0(s10)
	addi    ra,s10,4
	lw      ra,32(sp)
	addi    a2,ra,1
	sw      a2,4(s10)
	addi    ra,s10,8
	lw      ra,32(sp)
	add     a3,ra,s5
	sw      a3,8(s10)
	addi    ra,s4,-4
	lw      ra,-4(s4)
	bgt     a2,ra,main_criticalEdge.14
	j       main_logicalOr.14

main_elseBodyBBlock.3:
	lw      ra,20(sp)
	lw      ra,20(sp)
	lw      a2,52(sp)
	sw      a2,0(ra)
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s2,0(s5)
	addi    ra,s5,4
	addi    a3,s6,1
	sw      a3,4(s5)
	addi    ra,s5,8
	add     a2,s6,s11
	sw      a2,8(s5)
	addi    ra,s2,-4
	lw      ra,-4(s2)
	bgt     a3,ra,main_criticalEdge.15
	j       main_logicalOr.15

main_afterIfBBlock.32:
	lw      s7,20(sp)
	j       main_returnBBlock.9

main_returnBBlock.9:
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s7,0(s5)
	li      ra,0
	addi    s10,s5,4
	sw      ra,4(s5)
	addi    s11,s5,8
	addi    ra,s7,-4
	lw      a2,-4(s7)
	sw      a2,8(s5)
	lw      ra,8(s3)
	lw      s7,4(s3)
	sub     a3,ra,s7
	addi    ra,a2,0
	blt     a3,ra,main_thenBodyBBlock.19
	j       main_afterIfBBlock.19

main_forCondBBlock.15:
	blt     ra,s11,main_forBodyBBlock.15
	j       main_afterForBBlock.15

main_forBodyBBlock.15:
	slli    a2,ra,2
	add     a3,s7,a2
	add     a2,s6,ra
	slli    a2,a2,2
	add     a2,s2,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.15

main_afterForBBlock.15:
	j       main_returnBBlock.9

main_forCondBBlock.16:
	blt     ra,s5,main_forBodyBBlock.16
	j       main_afterForBBlock.16

main_forBodyBBlock.16:
	slli    a2,ra,2
	add     a1,s7,a2
	lw      a2,0(s10)
	lw      a3,32(sp)
	add     a3,a3,ra
	slli    a3,a3,2
	add     a2,a2,a3
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       main_forCondBBlock.16

main_afterForBBlock.16:
	j       main_returnBBlock.9

main_thenBodyBBlock.33:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.33

main_afterIfBBlock.33:
	lw      s4,0(s10)
	lw      ra,32(sp)
	addi    ra,ra,0
	slli    ra,ra,2
	add     ra,s4,ra
	lw      a2,0(ra)
	lw      ra,52(sp)
	blt     a2,ra,main_thenBodyBBlock.32
	j       main_elseBodyBBlock.3

main_logicalOr.13:
	slt     ra,ra,a3
	j       main_afterLogicalOr.13

main_afterLogicalOr.13:
	bne     ra,zero,main_thenBodyBBlock.33
	j       main_afterIfBBlock.33

main_thenBodyBBlock.34:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.34

main_afterIfBBlock.34:
	mv      a0,s10
	mv      a1,s9
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s5,0(s10)
	li      ra,0
	addi    a2,s10,4
	sw      ra,4(s10)
	addi    ra,s10,8
	addi    ra,s5,-4
	lw      a2,-4(s5)
	sw      a2,8(s10)
	lw      ra,8(s7)
	lw      s5,4(s7)
	sub     a3,ra,s5
	addi    ra,a2,0
	blt     a3,ra,main_thenBodyBBlock.35
	j       main_afterIfBBlock.35

main_logicalOr.14:
	slt     ra,ra,a3
	j       main_afterLogicalOr.14

main_afterLogicalOr.14:
	bne     ra,zero,main_thenBodyBBlock.34
	j       main_afterIfBBlock.34

main_thenBodyBBlock.35:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.35

main_afterIfBBlock.35:
	li      ra,0
	j       main_forCondBBlock.17

main_forCondBBlock.17:
	lw      a2,8(s10)
	lw      a3,4(s10)
	sub     a2,a2,a3
	blt     ra,a2,main_forBodyBBlock.17
	j       main_afterForBBlock.17

main_forBodyBBlock.17:
	lw      a1,0(s7)
	add     a2,s5,ra
	slli    a2,a2,2
	add     a1,a1,a2
	lw      a2,0(s10)
	add     a3,a3,ra
	slli    a3,a3,2
	add     a2,a2,a3
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       main_forCondBBlock.17

main_afterForBBlock.17:
	j       main_afterIfBBlock.32

main_thenBodyBBlock.36:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.36

main_afterIfBBlock.36:
	mv      a0,s10
	mv      a1,s5
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s5,0(s10)
	li      ra,0
	addi    a2,s10,4
	sw      ra,4(s10)
	addi    ra,s10,8
	addi    ra,s5,-4
	lw      a3,-4(s5)
	sw      a3,8(s10)
	lw      ra,8(s7)
	lw      s5,4(s7)
	sub     a2,ra,s5
	addi    ra,a3,0
	blt     a2,ra,main_thenBodyBBlock.37
	j       main_afterIfBBlock.37

main_logicalOr.15:
	slt     ra,ra,a2
	j       main_afterLogicalOr.15

main_afterLogicalOr.15:
	bne     ra,zero,main_thenBodyBBlock.36
	j       main_afterIfBBlock.36

main_thenBodyBBlock.37:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.37

main_afterIfBBlock.37:
	li      ra,0
	j       main_forCondBBlock.18

main_forCondBBlock.18:
	lw      a2,8(s10)
	lw      t1,4(s10)
	sub     a2,a2,t1
	blt     ra,a2,main_forBodyBBlock.18
	j       main_afterForBBlock.18

main_forBodyBBlock.18:
	lw      a2,0(s7)
	add     a3,s5,ra
	slli    a3,a3,2
	add     a1,a2,a3
	lw      a3,0(s10)
	add     a2,t1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(a1)
	addi    ra,ra,1
	j       main_forCondBBlock.18

main_afterForBBlock.18:
	j       main_afterIfBBlock.32

main_thenBodyBBlock.38:
	lw      ra,8(s9)
	lw      s7,4(s9)
	sub     s5,ra,s7
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    s10,a0,4
	li      ra,0
	j       main_forCondBBlock.19

main_afterIfBBlock.38:
	lw      ra,8(s9)
	lw      a2,4(s9)
	sw      a2,12(sp)
	mv      a2,a2
	sub     ra,ra,a2
	sw      ra,8(sp)
	li      a2,0
	lw      ra,8(sp)
	beq     ra,a2,main_thenBodyBBlock.39
	j       main_afterIfBBlock.39

main_thenBodyBBlock.39:
	li      ra,4
	mul     ra,ra,s5
	addi    a0,ra,4
	call    __malloc
	sw      s5,0(a0)
	addi    s10,a0,4
	li      ra,0
	j       main_forCondBBlock.20

main_afterIfBBlock.39:
	lw      ra,8(sp)
	add     s11,s5,ra
	li      ra,4
	mul     ra,ra,s11
	addi    a0,ra,4
	call    __malloc
	sw      s11,0(a0)
	addi    s11,a0,4
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      ra,s6
	sw      s11,0(s6)
	li      a2,0
	addi    ra,s6,4
	sw      a2,4(s6)
	addi    ra,s6,8
	addi    ra,s11,-4
	lw      ra,-4(s11)
	sw      ra,8(s6)
	addi    ra,ra,0
	sw      ra,4(sp)
	li      a0,12
	call    __malloc
	mv      s2,a0
	mv      ra,s2
	lw      a2,0(s6)
	sw      a2,0(s2)
	addi    ra,s2,4
	lw      ra,4(s6)
	addi    a1,ra,1
	sw      a1,4(s2)
	addi    a3,s2,8
	lw      a3,4(sp)
	add     a3,ra,a3
	sw      a3,8(s2)
	addi    ra,a2,-4
	lw      ra,-4(a2)
	bgt     a1,ra,main_criticalEdge.16
	j       main_logicalOr.16

main_thenBodyBBlock.40:
	mv      ra,s11
	lw      ra,36(sp)
	sw      ra,0(s11)
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s7,0(s10)
	addi    ra,s10,4
	addi    ra,s4,1
	sw      ra,4(s10)
	addi    a2,s10,8
	add     a3,s4,s5
	sw      a3,8(s10)
	addi    a2,s7,-4
	lw      a2,-4(s7)
	bgt     ra,a2,main_criticalEdge.17
	j       main_logicalOr.17

main_elseBodyBBlock.4:
	mv      ra,s11
	sw      a2,0(s11)
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s6,0(s5)
	addi    ra,s5,4
	lw      ra,12(sp)
	addi    a2,ra,1
	sw      a2,4(s5)
	addi    ra,s5,8
	lw      ra,12(sp)
	lw      a3,8(sp)
	add     a3,ra,a3
	sw      a3,8(s5)
	addi    ra,s6,-4
	lw      ra,-4(s6)
	bgt     a2,ra,main_criticalEdge.18
	j       main_logicalOr.18

main_afterIfBBlock.40:
	mv      s10,s11
	j       main_returnBBlock.10

main_returnBBlock.10:
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s10,0(s5)
	li      ra,0
	addi    s11,s5,4
	sw      ra,4(s5)
	addi    s7,s5,8
	addi    ra,s10,-4
	lw      a2,-4(s10)
	sw      a2,8(s5)
	lw      ra,8(s3)
	lw      s10,4(s3)
	sub     ra,ra,s10
	addi    a2,a2,0
	blt     ra,a2,main_thenBodyBBlock.21
	j       main_afterIfBBlock.21

main_forCondBBlock.19:
	blt     ra,s5,main_forBodyBBlock.19
	j       main_afterForBBlock.19

main_forBodyBBlock.19:
	slli    a2,ra,2
	add     a2,s10,a2
	lw      a3,0(s9)
	add     a1,s7,ra
	slli    a1,a1,2
	add     a3,a3,a1
	lw      a3,0(a3)
	sw      a3,0(a2)
	addi    ra,ra,1
	j       main_forCondBBlock.19

main_afterForBBlock.19:
	j       main_returnBBlock.10

main_forCondBBlock.20:
	blt     ra,s5,main_forBodyBBlock.20
	j       main_afterForBBlock.20

main_forBodyBBlock.20:
	slli    a2,ra,2
	add     a3,s10,a2
	add     a2,s4,ra
	slli    a2,a2,2
	add     a2,s7,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.20

main_afterForBBlock.20:
	j       main_returnBBlock.10

main_thenBodyBBlock.41:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.41

main_afterIfBBlock.41:
	lw      s6,0(s9)
	lw      ra,12(sp)
	addi    ra,ra,0
	slli    ra,ra,2
	add     ra,s6,ra
	lw      a2,0(ra)
	lw      ra,36(sp)
	blt     ra,a2,main_thenBodyBBlock.40
	j       main_elseBodyBBlock.4

main_logicalOr.16:
	slt     ra,ra,a3
	j       main_afterLogicalOr.16

main_afterLogicalOr.16:
	bne     ra,zero,main_thenBodyBBlock.41
	j       main_afterIfBBlock.41

main_thenBodyBBlock.42:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.42

main_afterIfBBlock.42:
	mv      a0,s10
	mv      a1,s9
	call    merge
	mv      s10,a0
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s10,0(s5)
	li      ra,0
	addi    a2,s5,4
	sw      ra,4(s5)
	addi    ra,s5,8
	addi    ra,s10,-4
	lw      ra,-4(s10)
	sw      ra,8(s5)
	lw      a2,8(s2)
	lw      s10,4(s2)
	sub     a2,a2,s10
	addi    ra,ra,0
	blt     a2,ra,main_thenBodyBBlock.43
	j       main_afterIfBBlock.43

main_logicalOr.17:
	slt     ra,a2,a3
	j       main_afterLogicalOr.17

main_afterLogicalOr.17:
	bne     ra,zero,main_thenBodyBBlock.42
	j       main_afterIfBBlock.42

main_thenBodyBBlock.43:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.43

main_afterIfBBlock.43:
	li      ra,0
	j       main_forCondBBlock.21

main_forCondBBlock.21:
	lw      a2,8(s5)
	lw      a1,4(s5)
	sub     a2,a2,a1
	blt     ra,a2,main_forBodyBBlock.21
	j       main_afterForBBlock.21

main_forBodyBBlock.21:
	lw      a3,0(s2)
	add     a2,s10,ra
	slli    a2,a2,2
	add     t1,a3,a2
	lw      a3,0(s5)
	add     a2,a1,ra
	slli    a2,a2,2
	add     a2,a3,a2
	lw      a2,0(a2)
	sw      a2,0(t1)
	addi    ra,ra,1
	j       main_forCondBBlock.21

main_afterForBBlock.21:
	j       main_afterIfBBlock.40

main_thenBodyBBlock.44:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.44

main_afterIfBBlock.44:
	mv      a0,s10
	mv      a1,s5
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s5,0(s10)
	li      ra,0
	addi    a2,s10,4
	sw      ra,4(s10)
	addi    ra,s10,8
	addi    ra,s5,-4
	lw      ra,-4(s5)
	sw      ra,8(s10)
	lw      a2,8(s2)
	lw      s5,4(s2)
	sub     a2,a2,s5
	addi    ra,ra,0
	blt     a2,ra,main_thenBodyBBlock.45
	j       main_afterIfBBlock.45

main_logicalOr.18:
	slt     ra,ra,a3
	j       main_afterLogicalOr.18

main_afterLogicalOr.18:
	bne     ra,zero,main_thenBodyBBlock.44
	j       main_afterIfBBlock.44

main_thenBodyBBlock.45:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.45

main_afterIfBBlock.45:
	li      ra,0
	j       main_forCondBBlock.22

main_forCondBBlock.22:
	lw      a2,8(s10)
	lw      a1,4(s10)
	sub     a2,a2,a1
	blt     ra,a2,main_forBodyBBlock.22
	j       main_afterForBBlock.22

main_forBodyBBlock.22:
	lw      a2,0(s2)
	add     a3,s5,ra
	slli    a3,a3,2
	add     a3,a2,a3
	lw      t1,0(s10)
	add     a2,a1,ra
	slli    a2,a2,2
	add     a2,t1,a2
	lw      a2,0(a2)
	sw      a2,0(a3)
	addi    ra,ra,1
	j       main_forCondBBlock.22

main_afterForBBlock.22:
	j       main_afterIfBBlock.40

main_criticalEdge.0:
	addi    ra,zero,1
	j       main_afterLogicalOr.0

main_criticalEdge.1:
	addi    ra,zero,1
	j       main_afterLogicalOr.1

main_criticalEdge.2:
	addi    ra,zero,1
	j       main_afterLogicalOr.2

main_criticalEdge.3:
	addi    ra,zero,1
	j       main_afterLogicalOr.3

main_criticalEdge.4:
	addi    ra,zero,1
	j       main_afterLogicalOr.4

main_criticalEdge.5:
	addi    ra,zero,1
	j       main_afterLogicalOr.5

main_criticalEdge.6:
	addi    ra,zero,1
	j       main_afterLogicalOr.6

main_criticalEdge.7:
	addi    ra,zero,1
	j       main_afterLogicalOr.7

main_criticalEdge.8:
	addi    ra,zero,1
	j       main_afterLogicalOr.8

main_criticalEdge.9:
	addi    ra,zero,1
	j       main_afterLogicalOr.9

main_criticalEdge.10:
	addi    ra,zero,1
	j       main_afterLogicalOr.10

main_criticalEdge.11:
	addi    ra,zero,1
	j       main_afterLogicalOr.11

main_criticalEdge.12:
	addi    ra,zero,1
	j       main_afterLogicalOr.12

main_criticalEdge.13:
	addi    ra,zero,1
	j       main_afterLogicalOr.13

main_criticalEdge.14:
	addi    ra,zero,1
	j       main_afterLogicalOr.14

main_criticalEdge.15:
	addi    ra,zero,1
	j       main_afterLogicalOr.15

main_criticalEdge.16:
	addi    ra,zero,1
	j       main_afterLogicalOr.16

main_criticalEdge.17:
	addi    ra,zero,1
	j       main_afterLogicalOr.17

main_criticalEdge.18:
	addi    ra,zero,1
	j       main_afterLogicalOr.18


