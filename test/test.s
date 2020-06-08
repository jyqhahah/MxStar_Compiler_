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
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	sw      s4,8(sp)
	sw      s5,4(sp)
	mv      s2,s6
	mv      s6,a0
	mv      s4,a1
	addi    t6,s6,8
	lw      s1,8(s6)
	addi    t6,s6,4
	lw      t6,4(s6)
	sub     s1,s1,t6
	li      t6,0
	beq     s1,t6,merge_thenBodyBBlock.0
	j       merge_afterIfBBlock.0

merge_thenBodyBBlock.0:
	addi    t6,s4,8
	lw      s1,8(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	sub     s1,s1,t6
	li      t6,4
	mul     t6,t6,s1
	addi    a0,t6,4
	call    __malloc
	sw      s1,0(a0)
	addi    a0,a0,4
	li      s1,0
	j       merge_forCondBBlock.0

merge_afterIfBBlock.0:
	addi    t6,s4,8
	lw      s1,8(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	sub     s1,s1,t6
	li      t6,0
	beq     s1,t6,merge_thenBodyBBlock.1
	j       merge_afterIfBBlock.1

merge_thenBodyBBlock.1:
	addi    t6,s6,8
	lw      s4,8(s6)
	addi    t6,s6,4
	lw      t6,4(s6)
	sub     s4,s4,t6
	li      t6,4
	mul     t6,t6,s4
	addi    a0,t6,4
	call    __malloc
	sw      s4,0(a0)
	addi    a0,a0,4
	li      s4,0
	j       merge_forCondBBlock.1

merge_afterIfBBlock.1:
	addi    t6,s6,8
	lw      t6,8(s6)
	addi    s1,s6,4
	lw      s1,4(s6)
	sub     s1,t6,s1
	addi    t6,s4,8
	lw      a1,8(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	sub     t6,a1,t6
	add     s1,s1,t6
	li      t6,4
	mul     t6,t6,s1
	addi    a0,t6,4
	call    __malloc
	sw      s1,0(a0)
	addi    s1,a0,4
	li      a0,12
	call    __malloc
	mv      s0,a0
	mv      t6,s0
	sw      s1,0(s0)
	li      a1,0
	addi    t6,s0,4
	sw      a1,4(s0)
	addi    t6,s0,8
	addi    t6,s1,-4
	lw      t6,-4(s1)
	sw      t6,8(s0)
	addi    t6,s0,8
	lw      a1,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s3,a1,t6
	li      a0,12
	call    __malloc
	mv      s5,a0
	mv      t6,s5
	mv      t6,s0
	lw      t6,0(s0)
	sw      t6,0(s5)
	addi    t6,s5,4
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,1
	sw      t6,4(s5)
	addi    t6,s5,8
	addi    t6,s0,4
	lw      t6,4(s0)
	add     t6,t6,s3
	sw      t6,8(s5)
	addi    t6,s5,4
	lw      a1,4(s5)
	mv      t6,s0
	lw      t6,0(s0)
	addi    a5,t6,-4
	lw      t6,-4(t6)
	bgt     a1,t6,merge_criticalEdge.0
	j       merge_logicalOr.0

merge_thenBodyBBlock.2:
	mv      t6,s1
	mv      t6,s6
	lw      a1,0(s6)
	addi    t6,s6,4
	lw      t6,4(s6)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s1)
	addi    t6,s6,8
	lw      t6,8(s6)
	addi    a1,s6,4
	lw      a1,4(s6)
	sub     s0,t6,a1
	li      a0,12
	call    __malloc
	mv      s3,a0
	mv      t6,s3
	mv      t6,s6
	lw      t6,0(s6)
	sw      t6,0(s3)
	addi    t6,s3,4
	addi    t6,s6,4
	lw      t6,4(s6)
	addi    t6,t6,1
	sw      t6,4(s3)
	addi    t6,s3,8
	addi    t6,s6,4
	lw      t6,4(s6)
	add     t6,t6,s0
	sw      t6,8(s3)
	addi    t6,s3,4
	lw      a5,4(s3)
	mv      t6,s6
	lw      a1,0(s6)
	addi    t6,a1,-4
	lw      t6,-4(a1)
	bgt     a5,t6,merge_criticalEdge.1
	j       merge_logicalOr.1

merge_elseBodyBBlock.0:
	mv      t6,s1
	mv      t6,s4
	lw      a1,0(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s1)
	addi    t6,s4,8
	lw      t6,8(s4)
	addi    a1,s4,4
	lw      a1,4(s4)
	sub     s3,t6,a1
	li      a0,12
	call    __malloc
	mv      s0,a0
	mv      t6,s0
	mv      t6,s4
	lw      t6,0(s4)
	sw      t6,0(s0)
	addi    t6,s0,4
	addi    t6,s4,4
	lw      t6,4(s4)
	addi    t6,t6,1
	sw      t6,4(s0)
	addi    t6,s0,8
	addi    t6,s4,4
	lw      t6,4(s4)
	add     t6,t6,s3
	sw      t6,8(s0)
	addi    t6,s0,4
	lw      a1,4(s0)
	mv      t6,s4
	lw      a5,0(s4)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	bgt     a1,t6,merge_criticalEdge.2
	j       merge_logicalOr.2

merge_afterIfBBlock.2:
	mv      a0,s1
	j       merge_returnBBlock.0

merge_returnBBlock.0:
	mv      s6,s2
	lw      s5,4(sp)
	lw      s4,8(sp)
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

merge_forCondBBlock.0:
	addi    t6,s4,8
	lw      s6,8(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	sub     t6,s6,t6
	blt     s1,t6,merge_forBodyBBlock.0
	j       merge_afterForBBlock.0

merge_forBodyBBlock.0:
	slli    t6,s1,2
	add     a1,a0,t6
	mv      t6,s4
	lw      s6,0(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	add     t6,t6,s1
	slli    t6,t6,2
	add     t6,s6,t6
	lw      t6,0(t6)
	sw      t6,0(a1)
	addi    s1,s1,1
	j       merge_forCondBBlock.0

merge_afterForBBlock.0:
	j       merge_returnBBlock.0

merge_forCondBBlock.1:
	addi    t6,s6,8
	lw      t6,8(s6)
	addi    s1,s6,4
	lw      s1,4(s6)
	sub     t6,t6,s1
	blt     s4,t6,merge_forBodyBBlock.1
	j       merge_afterForBBlock.1

merge_forBodyBBlock.1:
	slli    t6,s4,2
	add     a1,a0,t6
	mv      t6,s6
	lw      t6,0(s6)
	addi    s1,s6,4
	lw      s1,4(s6)
	add     s1,s1,s4
	slli    s1,s1,2
	add     t6,t6,s1
	lw      t6,0(t6)
	sw      t6,0(a1)
	addi    s4,s4,1
	j       merge_forCondBBlock.1

merge_afterForBBlock.1:
	j       merge_returnBBlock.0

merge_thenBodyBBlock.3:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.3

merge_afterIfBBlock.3:
	mv      t6,s6
	lw      a1,0(s6)
	addi    t6,s6,4
	lw      t6,4(s6)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      a1,0(t6)
	mv      t6,s4
	lw      a5,0(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	blt     a1,t6,merge_thenBodyBBlock.2
	j       merge_elseBodyBBlock.0

merge_logicalOr.0:
	addi    t6,s5,8
	lw      a5,8(s5)
	mv      t6,s0
	lw      t6,0(s0)
	addi    a1,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a5
	j       merge_afterLogicalOr.0

merge_afterLogicalOr.0:
	bne     t6,zero,merge_thenBodyBBlock.3
	j       merge_afterIfBBlock.3

merge_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.4

merge_afterIfBBlock.4:
	mv      a0,s3
	mv      a1,s4
	call    merge
	mv      s6,a0
	li      a0,12
	call    __malloc
	mv      s4,a0
	sw      s6,0(s4)
	li      a1,0
	addi    t6,s4,4
	sw      a1,4(s4)
	addi    t6,s4,8
	addi    t6,s6,-4
	lw      t6,-4(s6)
	sw      t6,8(s4)
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    s6,s5,4
	lw      s6,4(s5)
	sub     s6,t6,s6
	addi    t6,s4,8
	lw      a1,8(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	sub     t6,a1,t6
	blt     s6,t6,merge_thenBodyBBlock.5
	j       merge_afterIfBBlock.5

merge_logicalOr.1:
	addi    t6,s3,8
	lw      a1,8(s3)
	mv      t6,s6
	lw      s6,0(s6)
	addi    t6,s6,-4
	lw      t6,-4(s6)
	slt     t6,t6,a1
	j       merge_afterLogicalOr.1

merge_afterLogicalOr.1:
	bne     t6,zero,merge_thenBodyBBlock.4
	j       merge_afterIfBBlock.4

merge_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       merge_afterIfBBlock.5

merge_afterIfBBlock.5:
	li      s6,0
	j       merge_forCondBBlock.2

merge_forCondBBlock.2:
	addi    t6,s4,8
	lw      a1,8(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	sub     t6,a1,t6
	blt     s6,t6,merge_forBodyBBlock.2
	j       merge_afterForBBlock.2

merge_forBodyBBlock.2:
	mv      t6,s5
	lw      a1,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	add     t6,t6,s6
	slli    t6,t6,2
	add     a1,a1,t6
	lw      a5,0(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	add     t6,t6,s6
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	sw      t6,0(a1)
	addi    s6,s6,1
	j       merge_forCondBBlock.2

merge_afterForBBlock.2:
	j       merge_afterIfBBlock.2

merge_thenBodyBBlock.6:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.6

merge_afterIfBBlock.6:
	mv      a0,s6
	mv      a1,s0
	call    merge
	mv      s6,a0
	li      a0,12
	call    __malloc
	mv      s4,a0
	sw      s6,0(s4)
	li      t6,0
	addi    a1,s4,4
	sw      t6,4(s4)
	addi    t6,s4,8
	addi    t6,s6,-4
	lw      t6,-4(s6)
	sw      t6,8(s4)
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    s6,s5,4
	lw      s6,4(s5)
	sub     a1,t6,s6
	addi    t6,s4,8
	lw      t6,8(s4)
	addi    s6,s4,4
	lw      s6,4(s4)
	sub     t6,t6,s6
	blt     a1,t6,merge_thenBodyBBlock.7
	j       merge_afterIfBBlock.7

merge_logicalOr.2:
	addi    t6,s0,8
	lw      a1,8(s0)
	mv      t6,s4
	lw      s4,0(s4)
	addi    t6,s4,-4
	lw      t6,-4(s4)
	slt     t6,t6,a1
	j       merge_afterLogicalOr.2

merge_afterLogicalOr.2:
	bne     t6,zero,merge_thenBodyBBlock.6
	j       merge_afterIfBBlock.6

merge_thenBodyBBlock.7:
    la      a0,.str.1
	call    __println
	j       merge_afterIfBBlock.7

merge_afterIfBBlock.7:
	li      s6,0
	j       merge_forCondBBlock.3

merge_forCondBBlock.3:
	addi    t6,s4,8
	lw      a1,8(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	sub     t6,a1,t6
	blt     s6,t6,merge_forBodyBBlock.3
	j       merge_afterForBBlock.3

merge_forBodyBBlock.3:
	mv      t6,s5
	lw      t6,0(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	add     a1,a1,s6
	slli    a1,a1,2
	add     a1,t6,a1
	lw      a5,0(s4)
	addi    t6,s4,4
	lw      t6,4(s4)
	add     t6,t6,s6
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	sw      t6,0(a1)
	addi    s6,s6,1
	j       merge_forCondBBlock.3

merge_afterForBBlock.3:
	j       merge_afterIfBBlock.2

merge_criticalEdge.0:
	addi    t6,zero,1
	j       merge_afterLogicalOr.0

merge_criticalEdge.1:
	addi    t6,zero,1
	j       merge_afterLogicalOr.1

merge_criticalEdge.2:
	addi    t6,zero,1
	j       merge_afterLogicalOr.2


	.globl  mergeSort
	.p2align	2
	.type   mergeSort, @function
mergeSort:
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
	mv      s7,s9
	mv      s1,a0
	addi    t6,s1,8
	lw      s4,8(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	sub     t6,s4,t6
	li      s4,1
	beq     t6,s4,mergeSort_thenBodyBBlock.0
	j       mergeSort_afterIfBBlock.0

mergeSort_thenBodyBBlock.0:
	j       mergeSort_returnBBlock.0

mergeSort_afterIfBBlock.0:
	addi    t6,s1,8
	lw      s4,8(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	sub     s6,s4,t6
	li      t6,2
	div     s4,s6,t6
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      t6,s1
	lw      t6,0(s1)
	sw      t6,0(s8)
	addi    t6,s8,4
	addi    t6,s1,4
	lw      t6,4(s1)
	addi    t6,t6,0
	sw      t6,4(s8)
	addi    t6,s8,8
	addi    t6,s1,4
	lw      t6,4(s1)
	add     t6,t6,s4
	sw      t6,8(s8)
	addi    t6,s8,4
	lw      a1,4(s8)
	mv      t6,s1
	lw      a5,0(s1)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	bgt     a1,t6,mergeSort_criticalEdge.0
	j       mergeSort_logicalOr.0

mergeSort_returnBBlock.0:
	mv      s9,s7
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

mergeSort_thenBodyBBlock.1:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.1

mergeSort_afterIfBBlock.1:
	mv      a0,s8
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      t6,s1
	lw      t6,0(s1)
	sw      t6,0(s8)
	addi    t6,s8,4
	addi    t6,s1,4
	lw      t6,4(s1)
	add     t6,t6,s4
	sw      t6,4(s8)
	addi    t6,s8,8
	addi    t6,s1,4
	lw      t6,4(s1)
	add     t6,t6,s6
	sw      t6,8(s8)
	addi    t6,s8,4
	lw      a5,4(s8)
	mv      t6,s1
	lw      a1,0(s1)
	addi    t6,a1,-4
	lw      t6,-4(a1)
	bgt     a5,t6,mergeSort_criticalEdge.1
	j       mergeSort_logicalOr.1

mergeSort_logicalOr.0:
	addi    t6,s8,8
	lw      a1,8(s8)
	mv      t6,s1
	lw      a5,0(s1)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.0

mergeSort_afterLogicalOr.0:
	bne     t6,zero,mergeSort_thenBodyBBlock.1
	j       mergeSort_afterIfBBlock.1

mergeSort_thenBodyBBlock.2:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.2

mergeSort_afterIfBBlock.2:
	mv      a0,s8
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      t6,s8
	mv      t6,s1
	lw      t6,0(s1)
	sw      t6,0(s8)
	addi    t6,s8,4
	addi    t6,s1,4
	lw      t6,4(s1)
	addi    t6,t6,0
	sw      t6,4(s8)
	addi    t6,s8,8
	addi    t6,s1,4
	lw      t6,4(s1)
	add     t6,t6,s4
	sw      t6,8(s8)
	addi    t6,s8,4
	lw      a5,4(s8)
	mv      t6,s1
	lw      a1,0(s1)
	addi    t6,a1,-4
	lw      t6,-4(a1)
	bgt     a5,t6,mergeSort_criticalEdge.2
	j       mergeSort_logicalOr.2

mergeSort_logicalOr.1:
	addi    t6,s8,8
	lw      a5,8(s8)
	mv      t6,s1
	lw      t6,0(s1)
	addi    a1,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a5
	j       mergeSort_afterLogicalOr.1

mergeSort_afterLogicalOr.1:
	bne     t6,zero,mergeSort_thenBodyBBlock.2
	j       mergeSort_afterIfBBlock.2

mergeSort_thenBodyBBlock.3:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.3

mergeSort_afterIfBBlock.3:
	li      a0,12
	call    __malloc
	mv      s0,a0
	mv      t6,s0
	mv      t6,s1
	lw      t6,0(s1)
	sw      t6,0(s0)
	addi    t6,s0,4
	addi    t6,s1,4
	lw      t6,4(s1)
	add     t6,t6,s4
	sw      t6,4(s0)
	addi    t6,s0,8
	addi    t6,s1,4
	lw      t6,4(s1)
	add     t6,t6,s6
	sw      t6,8(s0)
	addi    t6,s0,4
	lw      s4,4(s0)
	mv      t6,s1
	lw      t6,0(s1)
	addi    s6,t6,-4
	lw      t6,-4(t6)
	bgt     s4,t6,mergeSort_criticalEdge.3
	j       mergeSort_logicalOr.3

mergeSort_logicalOr.2:
	addi    t6,s8,8
	lw      a1,8(s8)
	mv      t6,s1
	lw      a5,0(s1)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.2

mergeSort_afterLogicalOr.2:
	bne     t6,zero,mergeSort_thenBodyBBlock.3
	j       mergeSort_afterIfBBlock.3

mergeSort_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.4

mergeSort_afterIfBBlock.4:
	addi    t6,s8,8
	lw      s4,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,s4,t6
	li      s4,0
	beq     t6,s4,mergeSort_thenBodyBBlock.6
	j       mergeSort_afterIfBBlock.6

mergeSort_logicalOr.3:
	addi    t6,s0,8
	lw      s6,8(s0)
	mv      t6,s1
	lw      s4,0(s1)
	addi    t6,s4,-4
	lw      t6,-4(s4)
	slt     t6,t6,s6
	j       mergeSort_afterLogicalOr.3

mergeSort_afterLogicalOr.3:
	bne     t6,zero,mergeSort_thenBodyBBlock.4
	j       mergeSort_afterIfBBlock.4

mergeSort_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.5

mergeSort_afterIfBBlock.5:
	li      s4,0
	j       mergeSort_forCondBBlock.0

mergeSort_forCondBBlock.0:
	addi    t6,s6,8
	lw      t6,8(s6)
	addi    a1,s6,4
	lw      a1,4(s6)
	sub     t6,t6,a1
	blt     s4,t6,mergeSort_forBodyBBlock.0
	j       mergeSort_afterForBBlock.0

mergeSort_forBodyBBlock.0:
	mv      t6,s1
	lw      a1,0(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	add     t6,t6,s4
	slli    t6,t6,2
	add     t6,a1,t6
	lw      a1,0(s6)
	addi    s8,s6,4
	lw      s8,4(s6)
	add     s8,s8,s4
	slli    s8,s8,2
	add     a1,a1,s8
	lw      a1,0(a1)
	sw      a1,0(t6)
	addi    s4,s4,1
	j       mergeSort_forCondBBlock.0

mergeSort_afterForBBlock.0:
	j       mergeSort_returnBBlock.0

mergeSort_thenBodyBBlock.6:
	addi    t6,s0,8
	lw      s4,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s4,s4,t6
	li      t6,4
	mul     t6,t6,s4
	addi    a0,t6,4
	call    __malloc
	sw      s4,0(a0)
	addi    s4,a0,4
	li      s6,0
	j       mergeSort_forCondBBlock.1

mergeSort_afterIfBBlock.6:
	addi    t6,s0,8
	lw      t6,8(s0)
	addi    s4,s0,4
	lw      s4,4(s0)
	sub     s4,t6,s4
	li      t6,0
	beq     s4,t6,mergeSort_thenBodyBBlock.7
	j       mergeSort_afterIfBBlock.7

mergeSort_thenBodyBBlock.7:
	addi    t6,s8,8
	lw      s4,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     s4,s4,t6
	li      t6,4
	mul     t6,t6,s4
	addi    a0,t6,4
	call    __malloc
	sw      s4,0(a0)
	addi    s4,a0,4
	li      s6,0
	j       mergeSort_forCondBBlock.2

mergeSort_afterIfBBlock.7:
	addi    t6,s8,8
	lw      s4,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     s4,s4,t6
	addi    t6,s0,8
	lw      t6,8(s0)
	addi    s6,s0,4
	lw      s6,4(s0)
	sub     t6,t6,s6
	add     s4,s4,t6
	li      t6,4
	mul     t6,t6,s4
	addi    a0,t6,4
	call    __malloc
	sw      s4,0(a0)
	addi    s4,a0,4
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s4,0(s5)
	li      t6,0
	addi    s6,s5,4
	sw      t6,4(s5)
	addi    t6,s5,8
	addi    t6,s4,-4
	lw      t6,-4(s4)
	sw      t6,8(s5)
	addi    t6,s5,8
	lw      s6,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     s3,s6,t6
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      t6,s6
	lw      t6,0(s5)
	sw      t6,0(s6)
	addi    t6,s6,4
	addi    t6,s5,4
	lw      t6,4(s5)
	addi    t6,t6,1
	sw      t6,4(s6)
	addi    t6,s6,8
	addi    t6,s5,4
	lw      t6,4(s5)
	add     t6,t6,s3
	sw      t6,8(s6)
	addi    t6,s6,4
	lw      a1,4(s6)
	lw      a5,0(s5)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	bgt     a1,t6,mergeSort_criticalEdge.4
	j       mergeSort_logicalOr.4

mergeSort_thenBodyBBlock.8:
	mv      t6,s4
	mv      t6,s8
	lw      a1,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s4)
	addi    t6,s8,8
	lw      t6,8(s8)
	addi    a1,s8,4
	lw      a1,4(s8)
	sub     s3,t6,a1
	li      a0,12
	call    __malloc
	mv      s5,a0
	mv      t6,s5
	mv      t6,s8
	lw      t6,0(s8)
	sw      t6,0(s5)
	addi    t6,s5,4
	addi    t6,s8,4
	lw      t6,4(s8)
	addi    t6,t6,1
	sw      t6,4(s5)
	addi    t6,s5,8
	addi    t6,s8,4
	lw      t6,4(s8)
	add     t6,t6,s3
	sw      t6,8(s5)
	addi    t6,s5,4
	lw      a1,4(s5)
	mv      t6,s8
	lw      a5,0(s8)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	bgt     a1,t6,mergeSort_criticalEdge.5
	j       mergeSort_logicalOr.5

mergeSort_elseBodyBBlock.0:
	mv      t6,s4
	mv      t6,s0
	lw      a1,0(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s4)
	addi    t6,s0,8
	lw      a1,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s3,a1,t6
	li      a0,12
	call    __malloc
	mv      s5,a0
	mv      t6,s5
	mv      t6,s0
	lw      t6,0(s0)
	sw      t6,0(s5)
	addi    t6,s5,4
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,1
	sw      t6,4(s5)
	addi    t6,s5,8
	addi    t6,s0,4
	lw      t6,4(s0)
	add     t6,t6,s3
	sw      t6,8(s5)
	addi    t6,s5,4
	lw      a5,4(s5)
	mv      t6,s0
	lw      t6,0(s0)
	addi    a1,t6,-4
	lw      t6,-4(t6)
	bgt     a5,t6,mergeSort_criticalEdge.6
	j       mergeSort_logicalOr.6

mergeSort_afterIfBBlock.8:
	j       mergeSort_returnBBlock.13

mergeSort_returnBBlock.13:
	li      a0,12
	call    __malloc
	mv      s6,a0
	sw      s4,0(s6)
	li      t6,0
	addi    a1,s6,4
	sw      t6,4(s6)
	addi    t6,s6,8
	addi    t6,s4,-4
	lw      t6,-4(s4)
	sw      t6,8(s6)
	addi    t6,s1,8
	lw      s4,8(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	sub     a1,s4,t6
	addi    t6,s6,8
	lw      t6,8(s6)
	addi    s4,s6,4
	lw      s4,4(s6)
	sub     t6,t6,s4
	blt     a1,t6,mergeSort_thenBodyBBlock.5
	j       mergeSort_afterIfBBlock.5

mergeSort_forCondBBlock.1:
	addi    t6,s0,8
	lw      a1,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     t6,a1,t6
	blt     s6,t6,mergeSort_forBodyBBlock.1
	j       mergeSort_afterForBBlock.1

mergeSort_forBodyBBlock.1:
	slli    t6,s6,2
	add     s8,s4,t6
	mv      t6,s0
	lw      t6,0(s0)
	addi    a1,s0,4
	lw      a1,4(s0)
	add     a1,a1,s6
	slli    a1,a1,2
	add     t6,t6,a1
	lw      t6,0(t6)
	sw      t6,0(s8)
	addi    s6,s6,1
	j       mergeSort_forCondBBlock.1

mergeSort_afterForBBlock.1:
	j       mergeSort_returnBBlock.13

mergeSort_forCondBBlock.2:
	addi    t6,s8,8
	lw      t6,8(s8)
	addi    a1,s8,4
	lw      a1,4(s8)
	sub     t6,t6,a1
	blt     s6,t6,mergeSort_forBodyBBlock.2
	j       mergeSort_afterForBBlock.2

mergeSort_forBodyBBlock.2:
	slli    t6,s6,2
	add     a1,s4,t6
	mv      t6,s8
	lw      a5,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	add     t6,t6,s6
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	sw      t6,0(a1)
	addi    s6,s6,1
	j       mergeSort_forCondBBlock.2

mergeSort_afterForBBlock.2:
	j       mergeSort_returnBBlock.13

mergeSort_thenBodyBBlock.9:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.9

mergeSort_afterIfBBlock.9:
	mv      t6,s8
	lw      t6,0(s8)
	addi    a1,s8,4
	lw      a1,4(s8)
	addi    a1,a1,0
	slli    a1,a1,2
	add     t6,t6,a1
	lw      a1,0(t6)
	mv      t6,s0
	lw      a5,0(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	blt     a1,t6,mergeSort_thenBodyBBlock.8
	j       mergeSort_elseBodyBBlock.0

mergeSort_logicalOr.4:
	addi    t6,s6,8
	lw      a5,8(s6)
	lw      t6,0(s5)
	addi    a1,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a5
	j       mergeSort_afterLogicalOr.4

mergeSort_afterLogicalOr.4:
	bne     t6,zero,mergeSort_thenBodyBBlock.9
	j       mergeSort_afterIfBBlock.9

mergeSort_thenBodyBBlock.10:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.10

mergeSort_afterIfBBlock.10:
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	sub     t6,t6,a1
	li      a1,0
	beq     t6,a1,mergeSort_thenBodyBBlock.14
	j       mergeSort_afterIfBBlock.14

mergeSort_logicalOr.5:
	addi    t6,s5,8
	lw      a1,8(s5)
	mv      t6,s8
	lw      s8,0(s8)
	addi    t6,s8,-4
	lw      t6,-4(s8)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.5

mergeSort_afterLogicalOr.5:
	bne     t6,zero,mergeSort_thenBodyBBlock.10
	j       mergeSort_afterIfBBlock.10

mergeSort_thenBodyBBlock.11:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.11

mergeSort_afterIfBBlock.11:
	li      a1,0
	j       mergeSort_forCondBBlock.3

mergeSort_forCondBBlock.3:
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    s8,s5,4
	lw      s8,4(s5)
	sub     t6,t6,s8
	blt     a1,t6,mergeSort_forBodyBBlock.3
	j       mergeSort_afterForBBlock.3

mergeSort_forBodyBBlock.3:
	mv      t6,s6
	lw      t6,0(s6)
	addi    s8,s6,4
	lw      s8,4(s6)
	add     s8,s8,a1
	slli    s8,s8,2
	add     a5,t6,s8
	lw      s8,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	add     t6,t6,a1
	slli    t6,t6,2
	add     t6,s8,t6
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.3

mergeSort_afterForBBlock.3:
	j       mergeSort_afterIfBBlock.8

mergeSort_thenBodyBBlock.12:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.12

mergeSort_afterIfBBlock.12:
	addi    t6,s8,8
	lw      a1,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,a1,t6
	li      a1,0
	beq     t6,a1,mergeSort_thenBodyBBlock.22
	j       mergeSort_afterIfBBlock.22

mergeSort_logicalOr.6:
	addi    t6,s5,8
	lw      a1,8(s5)
	mv      t6,s0
	lw      a5,0(s0)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.6

mergeSort_afterLogicalOr.6:
	bne     t6,zero,mergeSort_thenBodyBBlock.12
	j       mergeSort_afterIfBBlock.12

mergeSort_thenBodyBBlock.13:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.13

mergeSort_afterIfBBlock.13:
	li      a1,0
	j       mergeSort_forCondBBlock.4

mergeSort_forCondBBlock.4:
	addi    t6,s8,8
	lw      a5,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,a5,t6
	blt     a1,t6,mergeSort_forBodyBBlock.4
	j       mergeSort_afterForBBlock.4

mergeSort_forBodyBBlock.4:
	mv      t6,s6
	lw      a5,0(s6)
	addi    t6,s6,4
	lw      t6,4(s6)
	add     t6,t6,a1
	slli    t6,t6,2
	add     a5,a5,t6
	lw      s5,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	add     t6,t6,a1
	slli    t6,t6,2
	add     t6,s5,t6
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.4

mergeSort_afterForBBlock.4:
	j       mergeSort_afterIfBBlock.8

mergeSort_thenBodyBBlock.14:
	addi    t6,s0,8
	lw      a1,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s8,a1,t6
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s8,a0,4
	li      a1,0
	j       mergeSort_forCondBBlock.5

mergeSort_afterIfBBlock.14:
	addi    t6,s0,8
	lw      a1,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     t6,a1,t6
	li      a1,0
	beq     t6,a1,mergeSort_thenBodyBBlock.15
	j       mergeSort_afterIfBBlock.15

mergeSort_thenBodyBBlock.15:
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	sub     s8,t6,a1
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s8,a0,4
	li      a1,0
	j       mergeSort_forCondBBlock.6

mergeSort_afterIfBBlock.15:
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	sub     a1,t6,a1
	addi    t6,s0,8
	lw      s8,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     t6,s8,t6
	add     s8,a1,t6
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s3,a0,4
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	sw      s3,0(s9)
	li      a1,0
	addi    t6,s9,4
	sw      a1,4(s9)
	addi    t6,s9,8
	addi    t6,s3,-4
	lw      t6,-4(s3)
	sw      t6,8(s9)
	addi    t6,s9,8
	lw      t6,8(s9)
	addi    a1,s9,4
	lw      a1,4(s9)
	sub     s2,t6,a1
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      t6,s8
	mv      t6,s9
	lw      t6,0(s9)
	sw      t6,0(s8)
	addi    t6,s8,4
	addi    t6,s9,4
	lw      t6,4(s9)
	addi    t6,t6,1
	sw      t6,4(s8)
	addi    t6,s8,8
	addi    t6,s9,4
	lw      t6,4(s9)
	add     t6,t6,s2
	sw      t6,8(s8)
	addi    t6,s8,4
	lw      a1,4(s8)
	mv      t6,s9
	lw      t6,0(s9)
	addi    a5,t6,-4
	lw      t6,-4(t6)
	bgt     a1,t6,mergeSort_criticalEdge.7
	j       mergeSort_logicalOr.7

mergeSort_thenBodyBBlock.16:
	mv      t6,s3
	mv      t6,s5
	lw      a1,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s3)
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	sub     s2,t6,a1
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	mv      t6,s5
	lw      t6,0(s5)
	sw      t6,0(s9)
	addi    t6,s9,4
	addi    t6,s5,4
	lw      t6,4(s5)
	addi    t6,t6,1
	sw      t6,4(s9)
	addi    t6,s9,8
	addi    t6,s5,4
	lw      t6,4(s5)
	add     t6,t6,s2
	sw      t6,8(s9)
	addi    t6,s9,4
	lw      a1,4(s9)
	mv      t6,s5
	lw      t6,0(s5)
	addi    a5,t6,-4
	lw      t6,-4(t6)
	bgt     a1,t6,mergeSort_criticalEdge.8
	j       mergeSort_logicalOr.8

mergeSort_elseBodyBBlock.1:
	mv      t6,s3
	mv      t6,s0
	lw      a1,0(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s3)
	addi    t6,s0,8
	lw      a1,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s9,a1,t6
	li      a0,12
	call    __malloc
	mv      s2,a0
	mv      t6,s2
	mv      t6,s0
	lw      t6,0(s0)
	sw      t6,0(s2)
	addi    t6,s2,4
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,1
	sw      t6,4(s2)
	addi    t6,s2,8
	addi    t6,s0,4
	lw      t6,4(s0)
	add     t6,t6,s9
	sw      t6,8(s2)
	addi    t6,s2,4
	lw      a5,4(s2)
	mv      t6,s0
	lw      a1,0(s0)
	addi    t6,a1,-4
	lw      t6,-4(a1)
	bgt     a5,t6,mergeSort_criticalEdge.9
	j       mergeSort_logicalOr.9

mergeSort_afterIfBBlock.16:
	mv      s8,s3
	j       mergeSort_returnBBlock.14

mergeSort_returnBBlock.14:
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s8,0(s5)
	li      a1,0
	addi    t6,s5,4
	sw      a1,4(s5)
	addi    t6,s5,8
	addi    t6,s8,-4
	lw      t6,-4(s8)
	sw      t6,8(s5)
	addi    t6,s6,8
	lw      t6,8(s6)
	addi    a1,s6,4
	lw      a1,4(s6)
	sub     t6,t6,a1
	addi    a1,s5,8
	lw      a1,8(s5)
	addi    s8,s5,4
	lw      s8,4(s5)
	sub     a1,a1,s8
	blt     t6,a1,mergeSort_thenBodyBBlock.11
	j       mergeSort_afterIfBBlock.11

mergeSort_forCondBBlock.5:
	addi    t6,s0,8
	lw      a5,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     t6,a5,t6
	blt     a1,t6,mergeSort_forBodyBBlock.5
	j       mergeSort_afterForBBlock.5

mergeSort_forBodyBBlock.5:
	slli    t6,a1,2
	add     a5,s8,t6
	mv      t6,s0
	lw      t6,0(s0)
	addi    s5,s0,4
	lw      s5,4(s0)
	add     s5,s5,a1
	slli    s5,s5,2
	add     t6,t6,s5
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.5

mergeSort_afterForBBlock.5:
	j       mergeSort_returnBBlock.14

mergeSort_forCondBBlock.6:
	addi    t6,s5,8
	lw      a5,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     t6,a5,t6
	blt     a1,t6,mergeSort_forBodyBBlock.6
	j       mergeSort_afterForBBlock.6

mergeSort_forBodyBBlock.6:
	slli    t6,a1,2
	add     t5,s8,t6
	mv      t6,s5
	lw      t6,0(s5)
	addi    a5,s5,4
	lw      a5,4(s5)
	add     a5,a5,a1
	slli    a5,a5,2
	add     t6,t6,a5
	lw      t6,0(t6)
	sw      t6,0(t5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.6

mergeSort_afterForBBlock.6:
	j       mergeSort_returnBBlock.14

mergeSort_thenBodyBBlock.17:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.17

mergeSort_afterIfBBlock.17:
	mv      t6,s5
	lw      a1,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      a5,0(t6)
	mv      t6,s0
	lw      t6,0(s0)
	addi    a1,s0,4
	lw      a1,4(s0)
	addi    a1,a1,0
	slli    a1,a1,2
	add     t6,t6,a1
	lw      t6,0(t6)
	blt     a5,t6,mergeSort_thenBodyBBlock.16
	j       mergeSort_elseBodyBBlock.1

mergeSort_logicalOr.7:
	addi    t6,s8,8
	lw      a5,8(s8)
	mv      t6,s9
	lw      t6,0(s9)
	addi    a1,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a5
	j       mergeSort_afterLogicalOr.7

mergeSort_afterLogicalOr.7:
	bne     t6,zero,mergeSort_thenBodyBBlock.17
	j       mergeSort_afterIfBBlock.17

mergeSort_thenBodyBBlock.18:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.18

mergeSort_afterIfBBlock.18:
	mv      a0,s9
	mv      a1,s0
	call    merge
	mv      s0,a0
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s0,0(s5)
	li      a1,0
	addi    t6,s5,4
	sw      a1,4(s5)
	addi    t6,s5,8
	addi    t6,s0,-4
	lw      t6,-4(s0)
	sw      t6,8(s5)
	addi    t6,s8,8
	lw      t6,8(s8)
	addi    a1,s8,4
	lw      a1,4(s8)
	sub     t6,t6,a1
	addi    a1,s5,8
	lw      a5,8(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	sub     a1,a5,a1
	blt     t6,a1,mergeSort_thenBodyBBlock.19
	j       mergeSort_afterIfBBlock.19

mergeSort_logicalOr.8:
	addi    t6,s9,8
	lw      a1,8(s9)
	mv      t6,s5
	lw      t6,0(s5)
	addi    a5,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.8

mergeSort_afterLogicalOr.8:
	bne     t6,zero,mergeSort_thenBodyBBlock.18
	j       mergeSort_afterIfBBlock.18

mergeSort_thenBodyBBlock.19:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.19

mergeSort_afterIfBBlock.19:
	li      a1,0
	j       mergeSort_forCondBBlock.7

mergeSort_forCondBBlock.7:
	addi    t6,s5,8
	lw      a5,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     t6,a5,t6
	blt     a1,t6,mergeSort_forBodyBBlock.7
	j       mergeSort_afterForBBlock.7

mergeSort_forBodyBBlock.7:
	mv      t6,s8
	lw      a5,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	add     t6,t6,a1
	slli    t6,t6,2
	add     t5,a5,t6
	lw      a5,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	add     t6,t6,a1
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	sw      t6,0(t5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.7

mergeSort_afterForBBlock.7:
	j       mergeSort_afterIfBBlock.16

mergeSort_thenBodyBBlock.20:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.20

mergeSort_afterIfBBlock.20:
	mv      a0,s5
	mv      a1,s2
	call    merge
	mv      s0,a0
	li      a0,12
	call    __malloc
	mv      s5,a0
	sw      s0,0(s5)
	li      t6,0
	addi    a1,s5,4
	sw      t6,4(s5)
	addi    t6,s5,8
	addi    t6,s0,-4
	lw      t6,-4(s0)
	sw      t6,8(s5)
	addi    t6,s8,8
	lw      a1,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     a5,a1,t6
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	sub     t6,t6,a1
	blt     a5,t6,mergeSort_thenBodyBBlock.21
	j       mergeSort_afterIfBBlock.21

mergeSort_logicalOr.9:
	addi    t6,s2,8
	lw      a1,8(s2)
	mv      t6,s0
	lw      a5,0(s0)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.9

mergeSort_afterLogicalOr.9:
	bne     t6,zero,mergeSort_thenBodyBBlock.20
	j       mergeSort_afterIfBBlock.20

mergeSort_thenBodyBBlock.21:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.21

mergeSort_afterIfBBlock.21:
	li      a1,0
	j       mergeSort_forCondBBlock.8

mergeSort_forCondBBlock.8:
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    a5,s5,4
	lw      a5,4(s5)
	sub     t6,t6,a5
	blt     a1,t6,mergeSort_forBodyBBlock.8
	j       mergeSort_afterForBBlock.8

mergeSort_forBodyBBlock.8:
	mv      t6,s8
	lw      a5,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	add     t6,t6,a1
	slli    t6,t6,2
	add     a5,a5,t6
	lw      t5,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	add     t6,t6,a1
	slli    t6,t6,2
	add     t6,t5,t6
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.8

mergeSort_afterForBBlock.8:
	j       mergeSort_afterIfBBlock.16

mergeSort_thenBodyBBlock.22:
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	sub     s8,t6,a1
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s0,a0,4
	li      a1,0
	j       mergeSort_forCondBBlock.9

mergeSort_afterIfBBlock.22:
	addi    t6,s5,8
	lw      a1,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     a1,a1,t6
	li      t6,0
	beq     a1,t6,mergeSort_thenBodyBBlock.23
	j       mergeSort_afterIfBBlock.23

mergeSort_thenBodyBBlock.23:
	addi    t6,s8,8
	lw      a1,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     s5,a1,t6
	li      t6,4
	mul     t6,t6,s5
	addi    a0,t6,4
	call    __malloc
	sw      s5,0(a0)
	addi    s0,a0,4
	li      a1,0
	j       mergeSort_forCondBBlock.10

mergeSort_afterIfBBlock.23:
	addi    t6,s8,8
	lw      t6,8(s8)
	addi    a1,s8,4
	lw      a1,4(s8)
	sub     a1,t6,a1
	addi    t6,s5,8
	lw      a5,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     t6,a5,t6
	add     s0,a1,t6
	li      t6,4
	mul     t6,t6,s0
	addi    a0,t6,4
	call    __malloc
	sw      s0,0(a0)
	addi    s0,a0,4
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	sw      s0,0(s9)
	li      t6,0
	addi    a1,s9,4
	sw      t6,4(s9)
	addi    t6,s9,8
	addi    t6,s0,-4
	lw      t6,-4(s0)
	sw      t6,8(s9)
	addi    t6,s9,8
	lw      t6,8(s9)
	addi    a1,s9,4
	lw      a1,4(s9)
	sub     s2,t6,a1
	li      a0,12
	call    __malloc
	mv      s3,a0
	mv      t6,s3
	mv      t6,s9
	lw      t6,0(s9)
	sw      t6,0(s3)
	addi    t6,s3,4
	addi    t6,s9,4
	lw      t6,4(s9)
	addi    t6,t6,1
	sw      t6,4(s3)
	addi    t6,s3,8
	addi    t6,s9,4
	lw      t6,4(s9)
	add     t6,t6,s2
	sw      t6,8(s3)
	addi    t6,s3,4
	lw      a5,4(s3)
	mv      t6,s9
	lw      a1,0(s9)
	addi    t6,a1,-4
	lw      t6,-4(a1)
	bgt     a5,t6,mergeSort_criticalEdge.10
	j       mergeSort_logicalOr.10

mergeSort_thenBodyBBlock.24:
	mv      t6,s0
	mv      t6,s8
	lw      a1,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s0)
	addi    t6,s8,8
	lw      a1,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     s2,a1,t6
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	mv      t6,s8
	lw      t6,0(s8)
	sw      t6,0(s9)
	addi    t6,s9,4
	addi    t6,s8,4
	lw      t6,4(s8)
	addi    t6,t6,1
	sw      t6,4(s9)
	addi    t6,s9,8
	addi    t6,s8,4
	lw      t6,4(s8)
	add     t6,t6,s2
	sw      t6,8(s9)
	addi    t6,s9,4
	lw      a5,4(s9)
	mv      t6,s8
	lw      a1,0(s8)
	addi    t6,a1,-4
	lw      t6,-4(a1)
	bgt     a5,t6,mergeSort_criticalEdge.11
	j       mergeSort_logicalOr.11

mergeSort_elseBodyBBlock.2:
	mv      t6,s0
	mv      t6,s5
	lw      t6,0(s5)
	addi    a1,s5,4
	lw      a1,4(s5)
	addi    a1,a1,0
	slli    a1,a1,2
	add     t6,t6,a1
	lw      t6,0(t6)
	sw      t6,0(s0)
	addi    t6,s5,8
	lw      a1,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     s2,a1,t6
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	mv      t6,s5
	lw      t6,0(s5)
	sw      t6,0(s9)
	addi    t6,s9,4
	addi    t6,s5,4
	lw      t6,4(s5)
	addi    t6,t6,1
	sw      t6,4(s9)
	addi    t6,s9,8
	addi    t6,s5,4
	lw      t6,4(s5)
	add     t6,t6,s2
	sw      t6,8(s9)
	addi    t6,s9,4
	lw      a5,4(s9)
	mv      t6,s5
	lw      t6,0(s5)
	addi    a1,t6,-4
	lw      t6,-4(t6)
	bgt     a5,t6,mergeSort_criticalEdge.12
	j       mergeSort_logicalOr.12

mergeSort_afterIfBBlock.24:
	j       mergeSort_returnBBlock.15

mergeSort_returnBBlock.15:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s0,0(s8)
	li      t6,0
	addi    a1,s8,4
	sw      t6,4(s8)
	addi    t6,s8,8
	addi    t6,s0,-4
	lw      t6,-4(s0)
	sw      t6,8(s8)
	addi    t6,s6,8
	lw      t6,8(s6)
	addi    a1,s6,4
	lw      a1,4(s6)
	sub     a5,t6,a1
	addi    t6,s8,8
	lw      a1,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,a1,t6
	blt     a5,t6,mergeSort_thenBodyBBlock.13
	j       mergeSort_afterIfBBlock.13

mergeSort_forCondBBlock.9:
	addi    t6,s5,8
	lw      t6,8(s5)
	addi    s8,s5,4
	lw      s8,4(s5)
	sub     t6,t6,s8
	blt     a1,t6,mergeSort_forBodyBBlock.9
	j       mergeSort_afterForBBlock.9

mergeSort_forBodyBBlock.9:
	slli    t6,a1,2
	add     a5,s0,t6
	mv      t6,s5
	lw      s8,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	add     t6,t6,a1
	slli    t6,t6,2
	add     t6,s8,t6
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.9

mergeSort_afterForBBlock.9:
	j       mergeSort_returnBBlock.15

mergeSort_forCondBBlock.10:
	addi    t6,s8,8
	lw      a5,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,a5,t6
	blt     a1,t6,mergeSort_forBodyBBlock.10
	j       mergeSort_afterForBBlock.10

mergeSort_forBodyBBlock.10:
	slli    t6,a1,2
	add     s5,s0,t6
	mv      t6,s8
	lw      a5,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	add     t6,t6,a1
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	sw      t6,0(s5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.10

mergeSort_afterForBBlock.10:
	j       mergeSort_returnBBlock.15

mergeSort_thenBodyBBlock.25:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.25

mergeSort_afterIfBBlock.25:
	mv      t6,s8
	lw      a1,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      a1,0(t6)
	mv      t6,s5
	lw      a5,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	blt     a1,t6,mergeSort_thenBodyBBlock.24
	j       mergeSort_elseBodyBBlock.2

mergeSort_logicalOr.10:
	addi    t6,s3,8
	lw      a1,8(s3)
	mv      t6,s9
	lw      t6,0(s9)
	addi    a5,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.10

mergeSort_afterLogicalOr.10:
	bne     t6,zero,mergeSort_thenBodyBBlock.25
	j       mergeSort_afterIfBBlock.25

mergeSort_thenBodyBBlock.26:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.26

mergeSort_afterIfBBlock.26:
	mv      a0,s9
	mv      a1,s5
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      a1,0
	addi    t6,s8,4
	sw      a1,4(s8)
	addi    t6,s8,8
	addi    t6,s5,-4
	lw      t6,-4(s5)
	sw      t6,8(s8)
	addi    t6,s3,8
	lw      a1,8(s3)
	addi    t6,s3,4
	lw      t6,4(s3)
	sub     a1,a1,t6
	addi    t6,s8,8
	lw      a5,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,a5,t6
	blt     a1,t6,mergeSort_thenBodyBBlock.27
	j       mergeSort_afterIfBBlock.27

mergeSort_logicalOr.11:
	addi    t6,s9,8
	lw      a1,8(s9)
	mv      t6,s8
	lw      t6,0(s8)
	addi    s8,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.11

mergeSort_afterLogicalOr.11:
	bne     t6,zero,mergeSort_thenBodyBBlock.26
	j       mergeSort_afterIfBBlock.26

mergeSort_thenBodyBBlock.27:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.27

mergeSort_afterIfBBlock.27:
	li      a1,0
	j       mergeSort_forCondBBlock.11

mergeSort_forCondBBlock.11:
	addi    t6,s8,8
	lw      a5,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,a5,t6
	blt     a1,t6,mergeSort_forBodyBBlock.11
	j       mergeSort_afterForBBlock.11

mergeSort_forBodyBBlock.11:
	mv      t6,s3
	lw      a5,0(s3)
	addi    t6,s3,4
	lw      t6,4(s3)
	add     t6,t6,a1
	slli    t6,t6,2
	add     a5,a5,t6
	lw      s5,0(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	add     t6,t6,a1
	slli    t6,t6,2
	add     t6,s5,t6
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.11

mergeSort_afterForBBlock.11:
	j       mergeSort_afterIfBBlock.24

mergeSort_thenBodyBBlock.28:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.28

mergeSort_afterIfBBlock.28:
	mv      a0,s8
	mv      a1,s9
	call    merge
	mv      s5,a0
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	li      a1,0
	addi    t6,s8,4
	sw      a1,4(s8)
	addi    t6,s8,8
	addi    t6,s5,-4
	lw      t6,-4(s5)
	sw      t6,8(s8)
	addi    t6,s3,8
	lw      a1,8(s3)
	addi    t6,s3,4
	lw      t6,4(s3)
	sub     a5,a1,t6
	addi    t6,s8,8
	lw      a1,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,a1,t6
	blt     a5,t6,mergeSort_thenBodyBBlock.29
	j       mergeSort_afterIfBBlock.29

mergeSort_logicalOr.12:
	addi    t6,s9,8
	lw      a1,8(s9)
	mv      t6,s5
	lw      a5,0(s5)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	slt     t6,t6,a1
	j       mergeSort_afterLogicalOr.12

mergeSort_afterLogicalOr.12:
	bne     t6,zero,mergeSort_thenBodyBBlock.28
	j       mergeSort_afterIfBBlock.28

mergeSort_thenBodyBBlock.29:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.29

mergeSort_afterIfBBlock.29:
	li      a1,0
	j       mergeSort_forCondBBlock.12

mergeSort_forCondBBlock.12:
	addi    t6,s8,8
	lw      a5,8(s8)
	addi    t6,s8,4
	lw      t6,4(s8)
	sub     t6,a5,t6
	blt     a1,t6,mergeSort_forBodyBBlock.12
	j       mergeSort_afterForBBlock.12

mergeSort_forBodyBBlock.12:
	mv      t6,s3
	lw      a5,0(s3)
	addi    t6,s3,4
	lw      t6,4(s3)
	add     t6,t6,a1
	slli    t6,t6,2
	add     a5,a5,t6
	lw      t6,0(s8)
	addi    s5,s8,4
	lw      s5,4(s8)
	add     s5,s5,a1
	slli    s5,s5,2
	add     t6,t6,s5
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    a1,a1,1
	j       mergeSort_forCondBBlock.12

mergeSort_afterForBBlock.12:
	j       mergeSort_afterIfBBlock.24

mergeSort_criticalEdge.0:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.0

mergeSort_criticalEdge.1:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.1

mergeSort_criticalEdge.2:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.2

mergeSort_criticalEdge.3:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.3

mergeSort_criticalEdge.4:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.4

mergeSort_criticalEdge.5:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.5

mergeSort_criticalEdge.6:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.6

mergeSort_criticalEdge.7:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.7

mergeSort_criticalEdge.8:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.8

mergeSort_criticalEdge.9:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.9

mergeSort_criticalEdge.10:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.10

mergeSort_criticalEdge.11:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.11

mergeSort_criticalEdge.12:
	addi    t6,zero,1
	j       mergeSort_afterLogicalOr.12


	.globl  main
	.p2align	2
	.type   main, @function
main:
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
	sw      s10,0(sp)
	mv      s7,s11
	call    __getInt
	mv      s3,a0
	li      s11,4
	mul     s11,s11,s3
	addi    a0,s11,4
	call    __malloc
	sw      s3,0(a0)
	addi    s4,a0,4
	li      s11,0
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	blt     s11,s3,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    t6,s11,2
	add     s1,s4,t6
	call    __getInt
	sw      a0,0(s1)
	addi    s11,s11,1
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	li      a0,12
	call    __malloc
	mv      s10,a0
	mv      s11,s10
	sw      s4,0(s10)
	li      s11,0
	addi    t6,s10,4
	sw      s11,4(s10)
	addi    s11,s10,8
	addi    s11,s4,-4
	lw      s11,-4(s4)
	sw      s11,8(s10)
	addi    s11,s10,8
	lw      s11,8(s10)
	addi    t6,s10,4
	lw      t6,4(s10)
	sub     t6,s11,t6
	li      s11,1
	beq     t6,s11,main_thenBodyBBlock.0
	j       main_afterIfBBlock.0

main_forCondBBlock.1:
	blt     s11,s3,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    t6,s11,2
	add     t6,s4,t6
	lw      a0,0(t6)
	call    __toString
    la      a1,.str.2
	call    __stringAdd
	call    __print
	addi    s11,s11,1
	j       main_forCondBBlock.1

main_afterForBBlock.1:
    la      a0,.str.3
	call    __println
	li      a0,0
	mv      s11,s7
	lw      s10,0(sp)
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

main_thenBodyBBlock.0:
	j       main_returnBBlock.5

main_afterIfBBlock.0:
	addi    s11,s10,8
	lw      t6,8(s10)
	addi    s11,s10,4
	lw      s11,4(s10)
	sub     s1,t6,s11
	li      s11,2
	div     s6,s1,s11
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      s11,s10
	lw      s11,0(s10)
	sw      s11,0(s8)
	addi    s11,s8,4
	addi    s11,s10,4
	lw      s11,4(s10)
	addi    s11,s11,0
	sw      s11,4(s8)
	addi    s11,s8,8
	addi    s11,s10,4
	lw      s11,4(s10)
	add     s11,s11,s6
	sw      s11,8(s8)
	addi    s11,s8,4
	lw      t6,4(s8)
	mv      s11,s10
	lw      s11,0(s10)
	addi    a1,s11,-4
	lw      s11,-4(s11)
	bgt     t6,s11,main_criticalEdge.0
	j       main_logicalOr.0

main_returnBBlock.5:
	li      s11,0
	j       main_forCondBBlock.1

main_thenBodyBBlock.1:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.1

main_afterIfBBlock.1:
	mv      a0,s8
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      s11,s10
	lw      s11,0(s10)
	sw      s11,0(s8)
	addi    s11,s8,4
	addi    s11,s10,4
	lw      s11,4(s10)
	add     s11,s11,s6
	sw      s11,4(s8)
	addi    s11,s8,8
	addi    s11,s10,4
	lw      s11,4(s10)
	add     s11,s11,s1
	sw      s11,8(s8)
	addi    s11,s8,4
	lw      t6,4(s8)
	mv      s11,s10
	lw      s11,0(s10)
	addi    a1,s11,-4
	lw      s11,-4(s11)
	bgt     t6,s11,main_criticalEdge.1
	j       main_logicalOr.1

main_logicalOr.0:
	addi    s11,s8,8
	lw      a1,8(s8)
	mv      s11,s10
	lw      t6,0(s10)
	addi    s11,t6,-4
	lw      s11,-4(t6)
	slt     s11,s11,a1
	j       main_afterLogicalOr.0

main_afterLogicalOr.0:
	bne     s11,zero,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_thenBodyBBlock.2:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.2

main_afterIfBBlock.2:
	mv      a0,s8
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s5,a0
	mv      s11,s10
	lw      s11,0(s10)
	sw      s11,0(s5)
	addi    s11,s5,4
	addi    s11,s10,4
	lw      s11,4(s10)
	addi    s11,s11,0
	sw      s11,4(s5)
	addi    s11,s5,8
	addi    s11,s10,4
	lw      s11,4(s10)
	add     s11,s11,s6
	sw      s11,8(s5)
	addi    s11,s5,4
	lw      t6,4(s5)
	mv      s11,s10
	lw      s11,0(s10)
	addi    a1,s11,-4
	lw      s11,-4(s11)
	bgt     t6,s11,main_criticalEdge.2
	j       main_logicalOr.2

main_logicalOr.1:
	addi    s11,s8,8
	lw      a1,8(s8)
	mv      s11,s10
	lw      s11,0(s10)
	addi    t6,s11,-4
	lw      s11,-4(s11)
	slt     s11,s11,a1
	j       main_afterLogicalOr.1

main_afterLogicalOr.1:
	bne     s11,zero,main_thenBodyBBlock.2
	j       main_afterIfBBlock.2

main_thenBodyBBlock.3:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.3

main_afterIfBBlock.3:
	li      a0,12
	call    __malloc
	mv      s0,a0
	mv      s11,s0
	mv      s11,s10
	lw      s11,0(s10)
	sw      s11,0(s0)
	addi    s11,s0,4
	addi    s11,s10,4
	lw      s11,4(s10)
	add     s11,s11,s6
	sw      s11,4(s0)
	addi    s11,s0,8
	addi    s11,s10,4
	lw      s11,4(s10)
	add     s11,s11,s1
	sw      s11,8(s0)
	addi    s11,s0,4
	lw      t6,4(s0)
	mv      s11,s10
	lw      s1,0(s10)
	addi    s11,s1,-4
	lw      s11,-4(s1)
	bgt     t6,s11,main_criticalEdge.3
	j       main_logicalOr.3

main_logicalOr.2:
	addi    s11,s5,8
	lw      t6,8(s5)
	mv      s11,s10
	lw      a1,0(s10)
	addi    s11,a1,-4
	lw      s11,-4(a1)
	slt     s11,s11,t6
	j       main_afterLogicalOr.2

main_afterLogicalOr.2:
	bne     s11,zero,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.4

main_afterIfBBlock.4:
	addi    s11,s5,8
	lw      s11,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     t6,s11,t6
	li      s11,0
	beq     t6,s11,main_thenBodyBBlock.6
	j       main_afterIfBBlock.6

main_logicalOr.3:
	addi    s11,s0,8
	lw      t6,8(s0)
	mv      s11,s10
	lw      s1,0(s10)
	addi    s11,s1,-4
	lw      s11,-4(s1)
	slt     s11,s11,t6
	j       main_afterLogicalOr.3

main_afterLogicalOr.3:
	bne     s11,zero,main_thenBodyBBlock.4
	j       main_afterIfBBlock.4

main_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.5

main_afterIfBBlock.5:
	li      t6,0
	j       main_forCondBBlock.2

main_forCondBBlock.2:
	addi    s11,s1,8
	lw      s11,8(s1)
	addi    s6,s1,4
	lw      s6,4(s1)
	sub     s11,s11,s6
	blt     t6,s11,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	mv      s11,s10
	lw      s6,0(s10)
	addi    s11,s10,4
	lw      s11,4(s10)
	add     s11,s11,t6
	slli    s11,s11,2
	add     a1,s6,s11
	lw      s11,0(s1)
	addi    s6,s1,4
	lw      s6,4(s1)
	add     s6,s6,t6
	slli    s6,s6,2
	add     s11,s11,s6
	lw      s11,0(s11)
	sw      s11,0(a1)
	addi    t6,t6,1
	j       main_forCondBBlock.2

main_afterForBBlock.2:
	j       main_returnBBlock.5

main_thenBodyBBlock.6:
	addi    s11,s0,8
	lw      s11,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s1,s11,t6
	li      s11,4
	mul     s11,s11,s1
	addi    a0,s11,4
	call    __malloc
	sw      s1,0(a0)
	addi    s11,a0,4
	li      s1,0
	j       main_forCondBBlock.3

main_afterIfBBlock.6:
	addi    s11,s0,8
	lw      t6,8(s0)
	addi    s11,s0,4
	lw      s11,4(s0)
	sub     s11,t6,s11
	li      t6,0
	beq     s11,t6,main_thenBodyBBlock.7
	j       main_afterIfBBlock.7

main_thenBodyBBlock.7:
	addi    s11,s5,8
	lw      s11,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     s1,s11,t6
	li      s11,4
	mul     s11,s11,s1
	addi    a0,s11,4
	call    __malloc
	sw      s1,0(a0)
	addi    s11,a0,4
	li      s1,0
	j       main_forCondBBlock.4

main_afterIfBBlock.7:
	addi    s11,s5,8
	lw      t6,8(s5)
	addi    s11,s5,4
	lw      s11,4(s5)
	sub     s1,t6,s11
	addi    s11,s0,8
	lw      t6,8(s0)
	addi    s11,s0,4
	lw      s11,4(s0)
	sub     s11,t6,s11
	add     s11,s1,s11
	li      t6,4
	mul     t6,t6,s11
	addi    a0,t6,4
	call    __malloc
	sw      s11,0(a0)
	addi    s8,a0,4
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s8,0(s1)
	li      t6,0
	addi    s11,s1,4
	sw      t6,4(s1)
	addi    s11,s1,8
	addi    s11,s8,-4
	lw      s11,-4(s8)
	sw      s11,8(s1)
	addi    s11,s1,8
	lw      t6,8(s1)
	addi    s11,s1,4
	lw      s11,4(s1)
	sub     s2,t6,s11
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      s11,s6
	lw      s11,0(s1)
	sw      s11,0(s6)
	addi    s11,s6,4
	addi    s11,s1,4
	lw      s11,4(s1)
	addi    s11,s11,1
	sw      s11,4(s6)
	addi    s11,s6,8
	addi    s11,s1,4
	lw      s11,4(s1)
	add     s11,s11,s2
	sw      s11,8(s6)
	addi    s11,s6,4
	lw      t6,4(s6)
	lw      s11,0(s1)
	addi    a1,s11,-4
	lw      s11,-4(s11)
	bgt     t6,s11,main_criticalEdge.4
	j       main_logicalOr.4

main_thenBodyBBlock.8:
	mv      s11,s8
	lw      s11,0(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	addi    t6,t6,0
	slli    t6,t6,2
	add     s11,s11,t6
	lw      s11,0(s11)
	sw      s11,0(s8)
	addi    s11,s5,8
	lw      t6,8(s5)
	addi    s11,s5,4
	lw      s11,4(s5)
	sub     s2,t6,s11
	li      a0,12
	call    __malloc
	mv      s1,a0
	mv      s11,s1
	mv      s11,s5
	lw      s11,0(s5)
	sw      s11,0(s1)
	addi    s11,s1,4
	addi    s11,s5,4
	lw      s11,4(s5)
	addi    s11,s11,1
	sw      s11,4(s1)
	addi    s11,s1,8
	addi    s11,s5,4
	lw      s11,4(s5)
	add     s11,s11,s2
	sw      s11,8(s1)
	addi    s11,s1,4
	lw      t6,4(s1)
	lw      s11,0(s5)
	addi    a1,s11,-4
	lw      s11,-4(s11)
	bgt     t6,s11,main_criticalEdge.5
	j       main_logicalOr.5

main_elseBodyBBlock.0:
	mv      s11,s8
	mv      s11,s0
	lw      t6,0(s0)
	addi    s11,s0,4
	lw      s11,4(s0)
	addi    s11,s11,0
	slli    s11,s11,2
	add     s11,t6,s11
	lw      s11,0(s11)
	sw      s11,0(s8)
	addi    s11,s0,8
	lw      s11,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s2,s11,t6
	li      a0,12
	call    __malloc
	mv      s1,a0
	mv      s11,s0
	lw      s11,0(s0)
	sw      s11,0(s1)
	addi    s11,s1,4
	addi    s11,s0,4
	lw      s11,4(s0)
	addi    s11,s11,1
	sw      s11,4(s1)
	addi    s11,s1,8
	addi    s11,s0,4
	lw      s11,4(s0)
	add     s11,s11,s2
	sw      s11,8(s1)
	addi    s11,s1,4
	lw      a1,4(s1)
	mv      s11,s0
	lw      s11,0(s0)
	addi    t6,s11,-4
	lw      s11,-4(s11)
	bgt     a1,s11,main_criticalEdge.6
	j       main_logicalOr.6

main_afterIfBBlock.8:
	mv      s11,s8
	j       main_returnBBlock.6

main_returnBBlock.6:
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s11,0(s1)
	li      t6,0
	addi    s6,s1,4
	sw      t6,4(s1)
	addi    t6,s1,8
	addi    t6,s11,-4
	lw      s11,-4(s11)
	sw      s11,8(s1)
	addi    s11,s10,8
	lw      t6,8(s10)
	addi    s11,s10,4
	lw      s11,4(s10)
	sub     s6,t6,s11
	addi    s11,s1,8
	lw      t6,8(s1)
	addi    s11,s1,4
	lw      s11,4(s1)
	sub     s11,t6,s11
	blt     s6,s11,main_thenBodyBBlock.5
	j       main_afterIfBBlock.5

main_forCondBBlock.3:
	addi    t6,s0,8
	lw      s6,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     t6,s6,t6
	blt     s1,t6,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	slli    t6,s1,2
	add     s6,s11,t6
	mv      t6,s0
	lw      a1,0(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	add     t6,t6,s1
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s6)
	addi    s1,s1,1
	j       main_forCondBBlock.3

main_afterForBBlock.3:
	j       main_returnBBlock.6

main_forCondBBlock.4:
	addi    t6,s5,8
	lw      s6,8(s5)
	addi    t6,s5,4
	lw      t6,4(s5)
	sub     t6,s6,t6
	blt     s1,t6,main_forBodyBBlock.4
	j       main_afterForBBlock.4

main_forBodyBBlock.4:
	slli    t6,s1,2
	add     a1,s11,t6
	mv      t6,s5
	lw      t6,0(s5)
	addi    s6,s5,4
	lw      s6,4(s5)
	add     s6,s6,s1
	slli    s6,s6,2
	add     t6,t6,s6
	lw      t6,0(t6)
	sw      t6,0(a1)
	addi    s1,s1,1
	j       main_forCondBBlock.4

main_afterForBBlock.4:
	j       main_returnBBlock.6

main_thenBodyBBlock.9:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.9

main_afterIfBBlock.9:
	lw      t6,0(s5)
	addi    s11,s5,4
	lw      s11,4(s5)
	addi    s11,s11,0
	slli    s11,s11,2
	add     s11,t6,s11
	lw      t6,0(s11)
	mv      s11,s0
	lw      s1,0(s0)
	addi    s11,s0,4
	lw      s11,4(s0)
	addi    s11,s11,0
	slli    s11,s11,2
	add     s11,s1,s11
	lw      s11,0(s11)
	blt     t6,s11,main_thenBodyBBlock.8
	j       main_elseBodyBBlock.0

main_logicalOr.4:
	addi    s11,s6,8
	lw      t6,8(s6)
	lw      s11,0(s1)
	addi    s1,s11,-4
	lw      s11,-4(s11)
	slt     s11,s11,t6
	j       main_afterLogicalOr.4

main_afterLogicalOr.4:
	bne     s11,zero,main_thenBodyBBlock.9
	j       main_afterIfBBlock.9

main_thenBodyBBlock.10:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.10

main_afterIfBBlock.10:
	addi    s11,s1,8
	lw      s11,8(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	sub     t6,s11,t6
	li      s11,0
	beq     t6,s11,main_thenBodyBBlock.14
	j       main_afterIfBBlock.14

main_logicalOr.5:
	addi    s11,s1,8
	lw      s11,8(s1)
	lw      a1,0(s5)
	addi    t6,a1,-4
	lw      t6,-4(a1)
	slt     s11,t6,s11
	j       main_afterLogicalOr.5

main_afterLogicalOr.5:
	bne     s11,zero,main_thenBodyBBlock.10
	j       main_afterIfBBlock.10

main_thenBodyBBlock.11:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.11

main_afterIfBBlock.11:
	li      t6,0
	j       main_forCondBBlock.5

main_forCondBBlock.5:
	addi    s11,s1,8
	lw      a1,8(s1)
	addi    s11,s1,4
	lw      s11,4(s1)
	sub     s11,a1,s11
	blt     t6,s11,main_forBodyBBlock.5
	j       main_afterForBBlock.5

main_forBodyBBlock.5:
	mv      s11,s6
	lw      a1,0(s6)
	addi    s11,s6,4
	lw      s11,4(s6)
	add     s11,s11,t6
	slli    s11,s11,2
	add     s11,a1,s11
	lw      a5,0(s1)
	addi    a1,s1,4
	lw      a1,4(s1)
	add     a1,a1,t6
	slli    a1,a1,2
	add     a1,a5,a1
	lw      a1,0(a1)
	sw      a1,0(s11)
	addi    t6,t6,1
	j       main_forCondBBlock.5

main_afterForBBlock.5:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.12:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.12

main_afterIfBBlock.12:
	mv      a0,s5
	mv      a1,s1
	call    merge
	mv      s11,a0
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s11,0(s1)
	li      t6,0
	addi    a1,s1,4
	sw      t6,4(s1)
	addi    t6,s1,8
	addi    t6,s11,-4
	lw      s11,-4(s11)
	sw      s11,8(s1)
	addi    s11,s6,8
	lw      s11,8(s6)
	addi    t6,s6,4
	lw      t6,4(s6)
	sub     t6,s11,t6
	addi    s11,s1,8
	lw      s11,8(s1)
	addi    a1,s1,4
	lw      a1,4(s1)
	sub     s11,s11,a1
	blt     t6,s11,main_thenBodyBBlock.13
	j       main_afterIfBBlock.13

main_logicalOr.6:
	addi    s11,s1,8
	lw      a1,8(s1)
	mv      s11,s0
	lw      s11,0(s0)
	addi    t6,s11,-4
	lw      s11,-4(s11)
	slt     s11,s11,a1
	j       main_afterLogicalOr.6

main_afterLogicalOr.6:
	bne     s11,zero,main_thenBodyBBlock.12
	j       main_afterIfBBlock.12

main_thenBodyBBlock.13:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.13

main_afterIfBBlock.13:
	li      t6,0
	j       main_forCondBBlock.6

main_forCondBBlock.6:
	addi    s11,s1,8
	lw      s11,8(s1)
	addi    a1,s1,4
	lw      a1,4(s1)
	sub     s11,s11,a1
	blt     t6,s11,main_forBodyBBlock.6
	j       main_afterForBBlock.6

main_forBodyBBlock.6:
	mv      s11,s6
	lw      a1,0(s6)
	addi    s11,s6,4
	lw      s11,4(s6)
	add     s11,s11,t6
	slli    s11,s11,2
	add     a1,a1,s11
	lw      a5,0(s1)
	addi    s11,s1,4
	lw      s11,4(s1)
	add     s11,s11,t6
	slli    s11,s11,2
	add     s11,a5,s11
	lw      s11,0(s11)
	sw      s11,0(a1)
	addi    t6,t6,1
	j       main_forCondBBlock.6

main_afterForBBlock.6:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.14:
	addi    s11,s0,8
	lw      s11,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s11,s11,t6
	li      t6,4
	mul     t6,t6,s11
	addi    a0,t6,4
	call    __malloc
	sw      s11,0(a0)
	addi    s11,a0,4
	li      s1,0
	j       main_forCondBBlock.7

main_afterIfBBlock.14:
	addi    s11,s0,8
	lw      t6,8(s0)
	addi    s11,s0,4
	lw      s11,4(s0)
	sub     t6,t6,s11
	li      s11,0
	beq     t6,s11,main_thenBodyBBlock.15
	j       main_afterIfBBlock.15

main_thenBodyBBlock.15:
	addi    s11,s1,8
	lw      s11,8(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	sub     s11,s11,t6
	li      t6,4
	mul     t6,t6,s11
	addi    a0,t6,4
	call    __malloc
	sw      s11,0(a0)
	addi    s11,a0,4
	li      a1,0
	j       main_forCondBBlock.8

main_afterIfBBlock.15:
	addi    s11,s1,8
	lw      t6,8(s1)
	addi    s11,s1,4
	lw      s11,4(s1)
	sub     t6,t6,s11
	addi    s11,s0,8
	lw      s11,8(s0)
	addi    a1,s0,4
	lw      a1,4(s0)
	sub     s11,s11,a1
	add     s11,t6,s11
	li      t6,4
	mul     t6,t6,s11
	addi    a0,t6,4
	call    __malloc
	sw      s11,0(a0)
	addi    s5,a0,4
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      s11,s9
	sw      s5,0(s9)
	li      t6,0
	addi    s11,s9,4
	sw      t6,4(s9)
	addi    s11,s9,8
	addi    s11,s5,-4
	lw      s11,-4(s5)
	sw      s11,8(s9)
	addi    s11,s9,8
	lw      t6,8(s9)
	addi    s11,s9,4
	lw      s11,4(s9)
	sub     s2,t6,s11
	li      a0,12
	call    __malloc
	mv      s11,a0
	mv      t6,s9
	lw      t6,0(s9)
	sw      t6,0(s11)
	addi    t6,s11,4
	addi    t6,s9,4
	lw      t6,4(s9)
	addi    t6,t6,1
	sw      t6,4(s11)
	addi    t6,s11,8
	addi    t6,s9,4
	lw      t6,4(s9)
	add     t6,t6,s2
	sw      t6,8(s11)
	addi    t6,s11,4
	lw      a1,4(s11)
	mv      t6,s9
	lw      a5,0(s9)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	bgt     a1,t6,main_criticalEdge.7
	j       main_logicalOr.7

main_thenBodyBBlock.16:
	mv      t6,s5
	mv      t6,s1
	lw      a1,0(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s5)
	addi    t6,s1,8
	lw      a1,8(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	sub     s9,a1,t6
	li      a0,12
	call    __malloc
	mv      s2,a0
	mv      t6,s2
	mv      t6,s1
	lw      t6,0(s1)
	sw      t6,0(s2)
	addi    t6,s2,4
	addi    t6,s1,4
	lw      t6,4(s1)
	addi    t6,t6,1
	sw      t6,4(s2)
	addi    t6,s2,8
	addi    t6,s1,4
	lw      t6,4(s1)
	add     t6,t6,s9
	sw      t6,8(s2)
	addi    t6,s2,4
	lw      a1,4(s2)
	mv      t6,s1
	lw      a5,0(s1)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	bgt     a1,t6,main_criticalEdge.8
	j       main_logicalOr.8

main_elseBodyBBlock.1:
	mv      t6,s5
	mv      t6,s0
	lw      a1,0(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(s5)
	addi    t6,s0,8
	lw      a1,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     s2,a1,t6
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	mv      t6,s0
	lw      t6,0(s0)
	sw      t6,0(s9)
	addi    t6,s9,4
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,1
	sw      t6,4(s9)
	addi    t6,s9,8
	addi    t6,s0,4
	lw      t6,4(s0)
	add     t6,t6,s2
	sw      t6,8(s9)
	addi    t6,s9,4
	lw      a1,4(s9)
	mv      t6,s0
	lw      t6,0(s0)
	addi    a5,t6,-4
	lw      t6,-4(t6)
	bgt     a1,t6,main_criticalEdge.9
	j       main_logicalOr.9

main_afterIfBBlock.16:
	mv      s11,s5
	j       main_returnBBlock.7

main_returnBBlock.7:
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s11,0(s1)
	li      a1,0
	addi    t6,s1,4
	sw      a1,4(s1)
	addi    t6,s1,8
	addi    t6,s11,-4
	lw      s11,-4(s11)
	sw      s11,8(s1)
	addi    s11,s6,8
	lw      s11,8(s6)
	addi    t6,s6,4
	lw      t6,4(s6)
	sub     t6,s11,t6
	addi    s11,s1,8
	lw      s11,8(s1)
	addi    a1,s1,4
	lw      a1,4(s1)
	sub     s11,s11,a1
	blt     t6,s11,main_thenBodyBBlock.11
	j       main_afterIfBBlock.11

main_forCondBBlock.7:
	addi    t6,s0,8
	lw      a1,8(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	sub     t6,a1,t6
	blt     s1,t6,main_forBodyBBlock.7
	j       main_afterForBBlock.7

main_forBodyBBlock.7:
	slli    t6,s1,2
	add     a1,s11,t6
	mv      t6,s0
	lw      a5,0(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	add     t6,t6,s1
	slli    t6,t6,2
	add     t6,a5,t6
	lw      t6,0(t6)
	sw      t6,0(a1)
	addi    s1,s1,1
	j       main_forCondBBlock.7

main_afterForBBlock.7:
	j       main_returnBBlock.7

main_forCondBBlock.8:
	addi    t6,s1,8
	lw      t6,8(s1)
	addi    a5,s1,4
	lw      a5,4(s1)
	sub     t6,t6,a5
	blt     a1,t6,main_forBodyBBlock.8
	j       main_afterForBBlock.8

main_forBodyBBlock.8:
	slli    t6,a1,2
	add     s5,s11,t6
	mv      t6,s1
	lw      t6,0(s1)
	addi    a5,s1,4
	lw      a5,4(s1)
	add     a5,a5,a1
	slli    a5,a5,2
	add     t6,t6,a5
	lw      t6,0(t6)
	sw      t6,0(s5)
	addi    a1,a1,1
	j       main_forCondBBlock.8

main_afterForBBlock.8:
	j       main_returnBBlock.7

main_thenBodyBBlock.17:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.17

main_afterIfBBlock.17:
	mv      t6,s1
	lw      a1,0(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      a5,0(t6)
	mv      t6,s0
	lw      a1,0(s0)
	addi    t6,s0,4
	lw      t6,4(s0)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	blt     a5,t6,main_thenBodyBBlock.16
	j       main_elseBodyBBlock.1

main_logicalOr.7:
	addi    t6,s11,8
	lw      a1,8(s11)
	mv      t6,s9
	lw      t6,0(s9)
	addi    a5,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a1
	j       main_afterLogicalOr.7

main_afterLogicalOr.7:
	bne     t6,zero,main_thenBodyBBlock.17
	j       main_afterIfBBlock.17

main_thenBodyBBlock.18:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.18

main_afterIfBBlock.18:
	mv      a0,s2
	mv      a1,s0
	call    merge
	mv      s0,a0
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s0,0(s1)
	li      a1,0
	addi    t6,s1,4
	sw      a1,4(s1)
	addi    t6,s1,8
	addi    t6,s0,-4
	lw      t6,-4(s0)
	sw      t6,8(s1)
	addi    t6,s11,8
	lw      a1,8(s11)
	addi    t6,s11,4
	lw      t6,4(s11)
	sub     a5,a1,t6
	addi    t6,s1,8
	lw      a1,8(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	sub     t6,a1,t6
	blt     a5,t6,main_thenBodyBBlock.19
	j       main_afterIfBBlock.19

main_logicalOr.8:
	addi    t6,s2,8
	lw      a1,8(s2)
	mv      t6,s1
	lw      t6,0(s1)
	addi    s1,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a1
	j       main_afterLogicalOr.8

main_afterLogicalOr.8:
	bne     t6,zero,main_thenBodyBBlock.18
	j       main_afterIfBBlock.18

main_thenBodyBBlock.19:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.19

main_afterIfBBlock.19:
	li      t6,0
	j       main_forCondBBlock.9

main_forCondBBlock.9:
	addi    a1,s1,8
	lw      a5,8(s1)
	addi    a1,s1,4
	lw      a1,4(s1)
	sub     a1,a5,a1
	blt     t6,a1,main_forBodyBBlock.9
	j       main_afterForBBlock.9

main_forBodyBBlock.9:
	lw      a5,0(s11)
	addi    a1,s11,4
	lw      a1,4(s11)
	add     a1,a1,t6
	slli    a1,a1,2
	add     a1,a5,a1
	lw      t5,0(s1)
	addi    a5,s1,4
	lw      a5,4(s1)
	add     a5,a5,t6
	slli    a5,a5,2
	add     a5,t5,a5
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       main_forCondBBlock.9

main_afterForBBlock.9:
	j       main_afterIfBBlock.16

main_thenBodyBBlock.20:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.20

main_afterIfBBlock.20:
	mv      a0,s1
	mv      a1,s9
	call    merge
	mv      s0,a0
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s0,0(s1)
	li      t6,0
	addi    a1,s1,4
	sw      t6,4(s1)
	addi    t6,s1,8
	addi    t6,s0,-4
	lw      t6,-4(s0)
	sw      t6,8(s1)
	addi    t6,s11,8
	lw      a1,8(s11)
	addi    t6,s11,4
	lw      t6,4(s11)
	sub     a5,a1,t6
	addi    t6,s1,8
	lw      a1,8(s1)
	addi    t6,s1,4
	lw      t6,4(s1)
	sub     t6,a1,t6
	blt     a5,t6,main_thenBodyBBlock.21
	j       main_afterIfBBlock.21

main_logicalOr.9:
	addi    t6,s9,8
	lw      a1,8(s9)
	mv      t6,s0
	lw      t6,0(s0)
	addi    a5,t6,-4
	lw      t6,-4(t6)
	slt     t6,t6,a1
	j       main_afterLogicalOr.9

main_afterLogicalOr.9:
	bne     t6,zero,main_thenBodyBBlock.20
	j       main_afterIfBBlock.20

main_thenBodyBBlock.21:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.21

main_afterIfBBlock.21:
	li      t6,0
	j       main_forCondBBlock.10

main_forCondBBlock.10:
	addi    a1,s1,8
	lw      a5,8(s1)
	addi    a1,s1,4
	lw      a1,4(s1)
	sub     a1,a5,a1
	blt     t6,a1,main_forBodyBBlock.10
	j       main_afterForBBlock.10

main_forBodyBBlock.10:
	lw      a1,0(s11)
	addi    a5,s11,4
	lw      a5,4(s11)
	add     a5,a5,t6
	slli    a5,a5,2
	add     a5,a1,a5
	lw      t5,0(s1)
	addi    a1,s1,4
	lw      a1,4(s1)
	add     a1,a1,t6
	slli    a1,a1,2
	add     a1,t5,a1
	lw      a1,0(a1)
	sw      a1,0(a5)
	addi    t6,t6,1
	j       main_forCondBBlock.10

main_afterForBBlock.10:
	j       main_afterIfBBlock.16

main_criticalEdge.0:
	addi    s11,zero,1
	j       main_afterLogicalOr.0

main_criticalEdge.1:
	addi    s11,zero,1
	j       main_afterLogicalOr.1

main_criticalEdge.2:
	addi    s11,zero,1
	j       main_afterLogicalOr.2

main_criticalEdge.3:
	addi    s11,zero,1
	j       main_afterLogicalOr.3

main_criticalEdge.4:
	addi    s11,zero,1
	j       main_afterLogicalOr.4

main_criticalEdge.5:
	addi    s11,zero,1
	j       main_afterLogicalOr.5

main_criticalEdge.6:
	addi    s11,zero,1
	j       main_afterLogicalOr.6

main_criticalEdge.7:
	addi    t6,zero,1
	j       main_afterLogicalOr.7

main_criticalEdge.8:
	addi    t6,zero,1
	j       main_afterLogicalOr.8

main_criticalEdge.9:
	addi    t6,zero,1
	j       main_afterLogicalOr.9


