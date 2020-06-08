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
	sw      s10,0(sp)
	mv      s2,a0
	mv      s1,a1
	addi    t6,s2,8
	lw      t6,8(s2)
	addi    a5,s2,4
	lw      s3,4(s2)
	sub     s5,t6,s3
	li      t6,0
	beq     s5,t6,merge_thenBodyBBlock.0
	j       merge_afterIfBBlock.0

merge_thenBodyBBlock.0:
	addi    t6,s1,8
	lw      a5,8(s1)
	addi    t6,s1,4
	lw      s8,4(s1)
	sub     s10,a5,s8
	li      t6,4
	mul     t6,t6,s10
	addi    a0,t6,4
	call    __malloc
	sw      s10,0(a0)
	addi    a0,a0,4
	li      a5,0
	j       merge_forCondBBlock.0

merge_afterIfBBlock.0:
	addi    t6,s1,8
	lw      t6,8(s1)
	addi    a5,s1,4
	lw      s10,4(s1)
	sub     s6,t6,s10
	li      t6,0
	beq     s6,t6,merge_thenBodyBBlock.1
	j       merge_afterIfBBlock.1

merge_thenBodyBBlock.1:
	li      t6,4
	mul     t6,t6,s5
	addi    a0,t6,4
	call    __malloc
	sw      s5,0(a0)
	addi    a0,a0,4
	li      a5,0
	j       merge_forCondBBlock.1

merge_afterIfBBlock.1:
	add     s8,s5,s6
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s9,a0,4
	li      a0,12
	call    __malloc
	mv      s4,a0
	mv      t6,s4
	sw      s9,0(s4)
	li      t6,0
	addi    a5,s4,4
	sw      t6,4(s4)
	addi    t6,s4,8
	addi    t6,s9,-4
	lw      t6,-4(s9)
	sw      t6,8(s4)
	lw      t6,8(s4)
	lw      s7,4(s4)
	sub     s0,t6,s7
	li      a0,12
	call    __malloc
	mv      s8,a0
	mv      t6,s8
	lw      t6,0(s4)
	sw      t6,0(s8)
	addi    a5,s8,4
	addi    a5,s7,1
	sw      a5,4(s8)
	addi    a5,s8,8
	add     a5,s7,s0
	sw      a5,8(s8)
	lw      a5,4(s8)
	addi    a3,t6,-4
	lw      a3,-4(t6)
	bgt     a5,a3,merge_criticalEdge.0
	j       merge_logicalOr.0

merge_thenBodyBBlock.2:
	mv      t6,s9
	sw      a3,0(s9)
	li      a0,12
	call    __malloc
	mv      s10,a0
	sw      s7,0(s10)
	addi    t6,s10,4
	addi    t6,s3,1
	sw      t6,4(s10)
	addi    t6,s10,8
	add     t6,s3,s5
	sw      t6,8(s10)
	lw      a5,4(s10)
	addi    t6,s7,-4
	lw      t6,-4(s7)
	bgt     a5,t6,merge_criticalEdge.1
	j       merge_logicalOr.1

merge_elseBodyBBlock.0:
	mv      t6,s9
	sw      a5,0(s9)
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s4,0(s1)
	addi    t6,s1,4
	addi    t6,s10,1
	sw      t6,4(s1)
	addi    t6,s1,8
	add     t6,s10,s6
	sw      t6,8(s1)
	lw      a3,4(s1)
	addi    t6,s4,-4
	lw      a5,-4(s4)
	bgt     a3,a5,merge_criticalEdge.2
	j       merge_logicalOr.2

merge_afterIfBBlock.2:
	mv      a0,s9
	j       merge_returnBBlock.0

merge_returnBBlock.0:
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

merge_forCondBBlock.0:
	blt     a5,s10,merge_forBodyBBlock.0
	j       merge_afterForBBlock.0

merge_forBodyBBlock.0:
	slli    t6,a5,2
	add     a3,a0,t6
	mv      t6,s1
	lw      a1,0(s1)
	add     t6,s8,a5
	slli    t6,t6,2
	add     t6,a1,t6
	lw      t6,0(t6)
	sw      t6,0(a3)
	addi    a5,a5,1
	j       merge_forCondBBlock.0

merge_afterForBBlock.0:
	j       merge_returnBBlock.0

merge_forCondBBlock.1:
	blt     a5,s5,merge_forBodyBBlock.1
	j       merge_afterForBBlock.1

merge_forBodyBBlock.1:
	slli    t6,a5,2
	add     a3,a0,t6
	mv      t6,s2
	lw      t6,0(s2)
	add     a1,s3,a5
	slli    a1,a1,2
	add     t6,t6,a1
	lw      t6,0(t6)
	sw      t6,0(a3)
	addi    a5,a5,1
	j       merge_forCondBBlock.1

merge_afterForBBlock.1:
	j       merge_returnBBlock.0

merge_thenBodyBBlock.3:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.3

merge_afterIfBBlock.3:
	mv      t6,s2
	lw      s7,0(s2)
	addi    t6,s3,0
	slli    t6,t6,2
	add     t6,s7,t6
	lw      a3,0(t6)
	mv      t6,s1
	lw      s4,0(s1)
	addi    t6,s10,0
	slli    t6,t6,2
	add     t6,s4,t6
	lw      a5,0(t6)
	blt     a3,a5,merge_thenBodyBBlock.2
	j       merge_elseBodyBBlock.0

merge_logicalOr.0:
	lw      t6,8(s8)
	slt     t6,a3,t6
	j       merge_afterLogicalOr.0

merge_afterLogicalOr.0:
	bne     t6,zero,merge_thenBodyBBlock.3
	j       merge_afterIfBBlock.3

merge_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.4

merge_afterIfBBlock.4:
	mv      a0,s10
	mv      a1,s1
	call    merge
	mv      s10,a0
	li      a0,12
	call    __malloc
	mv      s4,a0
	sw      s10,0(s4)
	li      a5,0
	addi    t6,s4,4
	sw      a5,4(s4)
	addi    t6,s4,8
	addi    t6,s10,-4
	lw      t6,-4(s10)
	sw      t6,8(s4)
	lw      t6,8(s8)
	lw      s10,4(s8)
	sub     t6,t6,s10
	lw      a5,8(s4)
	lw      s1,4(s4)
	sub     s7,a5,s1
	blt     t6,s7,merge_thenBodyBBlock.5
	j       merge_afterIfBBlock.5

merge_logicalOr.1:
	lw      a5,8(s10)
	slt     t6,t6,a5
	j       merge_afterLogicalOr.1

merge_afterLogicalOr.1:
	bne     t6,zero,merge_thenBodyBBlock.4
	j       merge_afterIfBBlock.4

merge_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       merge_afterIfBBlock.5

merge_afterIfBBlock.5:
	li      t6,0
	j       merge_forCondBBlock.2

merge_forCondBBlock.2:
	blt     t6,s7,merge_forBodyBBlock.2
	j       merge_afterForBBlock.2

merge_forBodyBBlock.2:
	lw      a5,0(s8)
	add     a3,s10,t6
	slli    a3,a3,2
	add     a3,a5,a3
	lw      a5,0(s4)
	add     a1,s1,t6
	slli    a1,a1,2
	add     a5,a5,a1
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       merge_forCondBBlock.2

merge_afterForBBlock.2:
	j       merge_afterIfBBlock.2

merge_thenBodyBBlock.6:
    la      a0,.str.0
	call    __println
	j       merge_afterIfBBlock.6

merge_afterIfBBlock.6:
	mv      a0,s2
	mv      a1,s1
	call    merge
	mv      s10,a0
	li      a0,12
	call    __malloc
	mv      s4,a0
	sw      s10,0(s4)
	li      a5,0
	addi    t6,s4,4
	sw      a5,4(s4)
	addi    t6,s4,8
	addi    t6,s10,-4
	lw      t6,-4(s10)
	sw      t6,8(s4)
	lw      t6,8(s8)
	lw      s1,4(s8)
	sub     a5,t6,s1
	lw      t6,8(s4)
	lw      s10,4(s4)
	sub     s7,t6,s10
	blt     a5,s7,merge_thenBodyBBlock.7
	j       merge_afterIfBBlock.7

merge_logicalOr.2:
	lw      t6,8(s1)
	slt     t6,a5,t6
	j       merge_afterLogicalOr.2

merge_afterLogicalOr.2:
	bne     t6,zero,merge_thenBodyBBlock.6
	j       merge_afterIfBBlock.6

merge_thenBodyBBlock.7:
    la      a0,.str.1
	call    __println
	j       merge_afterIfBBlock.7

merge_afterIfBBlock.7:
	li      t6,0
	j       merge_forCondBBlock.3

merge_forCondBBlock.3:
	blt     t6,s7,merge_forBodyBBlock.3
	j       merge_afterForBBlock.3

merge_forBodyBBlock.3:
	lw      a3,0(s8)
	add     a5,s1,t6
	slli    a5,a5,2
	add     a1,a3,a5
	lw      a3,0(s4)
	add     a5,s10,t6
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
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
	addi    sp,sp,-96
	sw      ra,92(sp)
	sw      s0,88(sp)
	sw      s1,84(sp)
	sw      s2,80(sp)
	sw      s3,76(sp)
	sw      s4,72(sp)
	sw      s5,68(sp)
	sw      s6,64(sp)
	sw      s7,60(sp)
	sw      s8,56(sp)
	sw      s9,52(sp)
	sw      s10,48(sp)
	sw      s11,44(sp)
	mv      s11,a0
	addi    t6,s11,8
	lw      a5,8(s11)
	addi    t6,s11,4
	lw      s4,4(s11)
	sub     s8,a5,s4
	li      t6,1
	beq     s8,t6,mergeSort_thenBodyBBlock.0
	j       mergeSort_afterIfBBlock.0

mergeSort_thenBodyBBlock.0:
	j       mergeSort_returnBBlock.0

mergeSort_afterIfBBlock.0:
	li      t6,2
	div     s10,s8,t6
	li      a0,12
	call    __malloc
	mv      s9,a0
	lw      a5,0(s11)
	sw      a5,0(s9)
	addi    t6,s9,4
	addi    t6,s4,0
	sw      t6,4(s9)
	addi    t6,s9,8
	add     t6,s4,s10
	sw      t6,8(s9)
	lw      a3,4(s9)
	addi    t6,a5,-4
	lw      a5,-4(a5)
	bgt     a3,a5,mergeSort_criticalEdge.0
	j       mergeSort_logicalOr.0

mergeSort_returnBBlock.0:
	lw      s11,44(sp)
	lw      s10,48(sp)
	lw      s9,52(sp)
	lw      s8,56(sp)
	lw      s7,60(sp)
	lw      s6,64(sp)
	lw      s5,68(sp)
	lw      s4,72(sp)
	lw      s3,76(sp)
	lw      s2,80(sp)
	lw      s1,84(sp)
	lw      s0,88(sp)
	lw      ra,92(sp)
	addi    sp,sp,96
	jr      ra

mergeSort_thenBodyBBlock.1:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.1

mergeSort_afterIfBBlock.1:
	mv      a0,s9
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s9,a0
	lw      a3,0(s11)
	sw      a3,0(s9)
	addi    t6,s9,4
	lw      a5,4(s11)
	add     t6,a5,s10
	sw      t6,4(s9)
	addi    t6,s9,8
	add     t6,a5,s8
	sw      t6,8(s9)
	lw      a5,4(s9)
	addi    t6,a3,-4
	lw      t6,-4(a3)
	bgt     a5,t6,mergeSort_criticalEdge.1
	j       mergeSort_logicalOr.1

mergeSort_logicalOr.0:
	lw      t6,8(s9)
	slt     t6,a5,t6
	j       mergeSort_afterLogicalOr.0

mergeSort_afterLogicalOr.0:
	bne     t6,zero,mergeSort_thenBodyBBlock.1
	j       mergeSort_afterIfBBlock.1

mergeSort_thenBodyBBlock.2:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.2

mergeSort_afterIfBBlock.2:
	mv      a0,s9
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      t6,s6
	lw      s9,0(s11)
	sw      s9,0(s6)
	addi    t6,s6,4
	lw      s1,4(s11)
	addi    t6,s1,0
	sw      t6,4(s6)
	addi    t6,s6,8
	add     s4,s1,s10
	sw      s4,8(s6)
	lw      s2,4(s6)
	addi    t6,s9,-4
	lw      s10,-4(s9)
	bgt     s2,s10,mergeSort_criticalEdge.2
	j       mergeSort_logicalOr.2

mergeSort_logicalOr.1:
	lw      a5,8(s9)
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
	mv      s3,a0
	mv      t6,s3
	sw      s9,0(s3)
	addi    t6,s3,4
	sw      s4,4(s3)
	addi    t6,s3,8
	add     t6,s1,s8
	sw      t6,8(s3)
	lw      s1,4(s3)
	bgt     s1,s10,mergeSort_criticalEdge.3
	j       mergeSort_logicalOr.3

mergeSort_logicalOr.2:
	lw      t6,8(s6)
	slt     t6,s10,t6
	j       mergeSort_afterLogicalOr.2

mergeSort_afterLogicalOr.2:
	bne     t6,zero,mergeSort_thenBodyBBlock.3
	j       mergeSort_afterIfBBlock.3

mergeSort_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.4

mergeSort_afterIfBBlock.4:
	lw      t6,8(s6)
	sub     s8,t6,s2
	li      a5,0
	li      t6,0
	sw      t6,40(sp)
	beq     s8,a5,mergeSort_thenBodyBBlock.6
	j       mergeSort_afterIfBBlock.6

mergeSort_logicalOr.3:
	lw      t6,8(s3)
	slt     t6,s10,t6
	j       mergeSort_afterLogicalOr.3

mergeSort_afterLogicalOr.3:
	bne     t6,zero,mergeSort_thenBodyBBlock.4
	j       mergeSort_afterIfBBlock.4

mergeSort_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.5

mergeSort_afterIfBBlock.5:
	li      t6,0
	j       mergeSort_forCondBBlock.0

mergeSort_forCondBBlock.0:
	blt     t6,s4,mergeSort_forBodyBBlock.0
	j       mergeSort_afterForBBlock.0

mergeSort_forBodyBBlock.0:
	lw      a5,0(s11)
	add     a3,s10,t6
	slli    a3,a3,2
	add     a1,a5,a3
	lw      a5,0(s8)
	add     a3,s9,t6
	slli    a3,a3,2
	add     a5,a5,a3
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.0

mergeSort_afterForBBlock.0:
	j       mergeSort_returnBBlock.0

mergeSort_thenBodyBBlock.6:
	lw      t6,8(s3)
	sub     s8,t6,s1
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s10,a0,4
	li      t6,0
	j       mergeSort_forCondBBlock.1

mergeSort_afterIfBBlock.6:
	lw      t6,8(s3)
	sub     s4,t6,s1
	li      t6,0
	sw      t6,36(sp)
	li      t6,0
	beq     s4,t6,mergeSort_thenBodyBBlock.7
	j       mergeSort_afterIfBBlock.7

mergeSort_thenBodyBBlock.7:
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s10,a0,4
	li      t6,0
	j       mergeSort_forCondBBlock.2

mergeSort_afterIfBBlock.7:
	add     s10,s8,s4
	li      t6,4
	mul     t6,t6,s10
	addi    a0,t6,4
	call    __malloc
	sw      s10,0(a0)
	addi    s0,a0,4
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	sw      s0,0(s9)
	li      a5,0
	addi    t6,s9,4
	sw      a5,4(s9)
	addi    t6,s9,8
	addi    t6,s0,-4
	lw      t6,-4(s0)
	sw      t6,8(s9)
	lw      t6,8(s9)
	lw      s7,4(s9)
	sub     s5,t6,s7
	li      a0,12
	call    __malloc
	mv      s10,a0
	mv      t6,s10
	lw      a5,0(s9)
	sw      a5,0(s10)
	addi    t6,s10,4
	addi    t6,s7,1
	sw      t6,4(s10)
	addi    t6,s10,8
	add     t6,s7,s5
	sw      t6,8(s10)
	lw      a3,4(s10)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	bgt     a3,t6,mergeSort_criticalEdge.4
	j       mergeSort_logicalOr.4

mergeSort_thenBodyBBlock.8:
	mv      t6,s0
	lw      t6,32(sp)
	sw      t6,0(s0)
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      t6,s6
	sw      s7,0(s6)
	addi    t6,s6,4
	addi    t6,s2,1
	sw      t6,4(s6)
	addi    t6,s6,8
	add     t6,s2,s8
	sw      t6,8(s6)
	lw      t6,4(s6)
	sw      t6,28(sp)
	addi    t6,s7,-4
	lw      t6,-4(s7)
	lw      a5,28(sp)
	bgt     a5,t6,mergeSort_criticalEdge.5
	j       mergeSort_logicalOr.5

mergeSort_elseBodyBBlock.0:
	mv      t6,s0
	lw      t6,24(sp)
	sw      t6,0(s0)
	li      a0,12
	call    __malloc
	mv      s3,a0
	mv      t6,s3
	sw      s9,0(s3)
	addi    t6,s3,4
	addi    t6,s1,1
	sw      t6,4(s3)
	addi    t6,s3,8
	add     t6,s1,s4
	sw      t6,8(s3)
	lw      s4,4(s3)
	addi    t6,s9,-4
	lw      a5,-4(s9)
	bgt     s4,a5,mergeSort_criticalEdge.6
	j       mergeSort_logicalOr.6

mergeSort_afterIfBBlock.8:
	mv      s10,s0
	j       mergeSort_returnBBlock.13

mergeSort_returnBBlock.13:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s10,0(s8)
	li      t6,0
	addi    a5,s8,4
	sw      t6,4(s8)
	addi    t6,s8,8
	addi    t6,s10,-4
	lw      t6,-4(s10)
	sw      t6,8(s8)
	lw      t6,8(s11)
	lw      s10,4(s11)
	sub     t6,t6,s10
	lw      a5,8(s8)
	lw      s9,4(s8)
	sub     s4,a5,s9
	blt     t6,s4,mergeSort_thenBodyBBlock.5
	j       mergeSort_afterIfBBlock.5

mergeSort_forCondBBlock.1:
	blt     t6,s8,mergeSort_forBodyBBlock.1
	j       mergeSort_afterForBBlock.1

mergeSort_forBodyBBlock.1:
	slli    a5,t6,2
	add     a3,s10,a5
	lw      a1,0(s3)
	add     a5,s1,t6
	slli    a5,a5,2
	add     a5,a1,a5
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.1

mergeSort_afterForBBlock.1:
	j       mergeSort_returnBBlock.13

mergeSort_forCondBBlock.2:
	blt     t6,s8,mergeSort_forBodyBBlock.2
	j       mergeSort_afterForBBlock.2

mergeSort_forBodyBBlock.2:
	slli    a5,t6,2
	add     a1,s10,a5
	lw      a3,0(s6)
	add     a5,s2,t6
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.2

mergeSort_afterForBBlock.2:
	j       mergeSort_returnBBlock.13

mergeSort_thenBodyBBlock.9:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.9

mergeSort_afterIfBBlock.9:
	lw      s7,0(s6)
	addi    t6,s2,0
	slli    t6,t6,2
	add     t6,s7,t6
	lw      t6,0(t6)
	sw      t6,32(sp)
	lw      s9,0(s3)
	addi    t6,s1,0
	slli    t6,t6,2
	add     t6,s9,t6
	lw      t6,0(t6)
	sw      t6,24(sp)
	lw      t6,32(sp)
	lw      a5,24(sp)
	blt     t6,a5,mergeSort_thenBodyBBlock.8
	j       mergeSort_elseBodyBBlock.0

mergeSort_logicalOr.4:
	lw      a5,8(s10)
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
	lw      t6,8(s6)
	lw      a5,28(sp)
	sub     s8,t6,a5
	li      t6,0
	beq     s8,t6,mergeSort_thenBodyBBlock.14
	j       mergeSort_afterIfBBlock.14

mergeSort_logicalOr.5:
	lw      a5,8(s6)
	slt     t6,t6,a5
	j       mergeSort_afterLogicalOr.5

mergeSort_afterLogicalOr.5:
	bne     t6,zero,mergeSort_thenBodyBBlock.10
	j       mergeSort_afterIfBBlock.10

mergeSort_thenBodyBBlock.11:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.11

mergeSort_afterIfBBlock.11:
	li      t6,0
	j       mergeSort_forCondBBlock.3

mergeSort_forCondBBlock.3:
	blt     t6,s4,mergeSort_forBodyBBlock.3
	j       mergeSort_afterForBBlock.3

mergeSort_forBodyBBlock.3:
	lw      a3,0(s10)
	add     a5,s9,t6
	slli    a5,a5,2
	add     a1,a3,a5
	lw      a3,0(s8)
	add     a5,s1,t6
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.3

mergeSort_afterForBBlock.3:
	j       mergeSort_afterIfBBlock.8

mergeSort_thenBodyBBlock.12:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.12

mergeSort_afterIfBBlock.12:
	lw      t6,40(sp)
	beq     s8,t6,mergeSort_thenBodyBBlock.22
	j       mergeSort_afterIfBBlock.22

mergeSort_logicalOr.6:
	lw      t6,8(s3)
	slt     t6,a5,t6
	j       mergeSort_afterLogicalOr.6

mergeSort_afterLogicalOr.6:
	bne     t6,zero,mergeSort_thenBodyBBlock.12
	j       mergeSort_afterIfBBlock.12

mergeSort_thenBodyBBlock.13:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.13

mergeSort_afterIfBBlock.13:
	li      t6,0
	j       mergeSort_forCondBBlock.4

mergeSort_forCondBBlock.4:
	blt     t6,s4,mergeSort_forBodyBBlock.4
	j       mergeSort_afterForBBlock.4

mergeSort_forBodyBBlock.4:
	lw      a3,0(s10)
	add     a5,s9,t6
	slli    a5,a5,2
	add     a1,a3,a5
	lw      a5,0(s8)
	add     a3,s1,t6
	slli    a3,a3,2
	add     a5,a5,a3
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.4

mergeSort_afterForBBlock.4:
	j       mergeSort_afterIfBBlock.8

mergeSort_thenBodyBBlock.14:
	li      t6,4
	mul     t6,t6,s4
	addi    a0,t6,4
	call    __malloc
	sw      s4,0(a0)
	addi    s7,a0,4
	li      t6,0
	j       mergeSort_forCondBBlock.5

mergeSort_afterIfBBlock.14:
	lw      t6,36(sp)
	beq     s4,t6,mergeSort_thenBodyBBlock.15
	j       mergeSort_afterIfBBlock.15

mergeSort_thenBodyBBlock.15:
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s7,a0,4
	li      t6,0
	j       mergeSort_forCondBBlock.6

mergeSort_afterIfBBlock.15:
	add     s7,s8,s4
	li      t6,4
	mul     t6,t6,s7
	addi    a0,t6,4
	call    __malloc
	sw      s7,0(a0)
	addi    s5,a0,4
	li      a0,12
	call    __malloc
	mv      s7,a0
	mv      t6,s7
	sw      s5,0(s7)
	li      t6,0
	addi    a5,s7,4
	sw      t6,4(s7)
	addi    t6,s7,8
	addi    t6,s5,-4
	lw      t6,-4(s5)
	sw      t6,8(s7)
	lw      a5,8(s7)
	lw      t6,4(s7)
	sw      t6,20(sp)
	lw      t6,20(sp)
	sub     t6,a5,t6
	sw      t6,16(sp)
	li      a0,12
	call    __malloc
	mv      s2,a0
	mv      t6,s2
	lw      a5,0(s7)
	sw      a5,0(s2)
	addi    t6,s2,4
	lw      t6,20(sp)
	addi    t6,t6,1
	sw      t6,4(s2)
	addi    t6,s2,8
	lw      t6,16(sp)
	lw      a3,20(sp)
	add     t6,a3,t6
	sw      t6,8(s2)
	lw      a3,4(s2)
	addi    t6,a5,-4
	lw      t6,-4(a5)
	bgt     a3,t6,mergeSort_criticalEdge.7
	j       mergeSort_logicalOr.7

mergeSort_thenBodyBBlock.16:
	mv      t6,s5
	sw      a5,0(s5)
	li      a0,12
	call    __malloc
	mv      s9,a0
	sw      s7,0(s9)
	addi    t6,s9,4
	lw      t6,28(sp)
	addi    t6,t6,1
	sw      t6,4(s9)
	addi    t6,s9,8
	lw      t6,28(sp)
	add     t6,t6,s8
	sw      t6,8(s9)
	lw      a5,4(s9)
	addi    t6,s7,-4
	lw      t6,-4(s7)
	bgt     a5,t6,mergeSort_criticalEdge.8
	j       mergeSort_logicalOr.8

mergeSort_elseBodyBBlock.1:
	mv      t6,s5
	lw      t6,24(sp)
	sw      t6,0(s5)
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s9,0(s8)
	addi    t6,s8,4
	addi    t6,s1,1
	sw      t6,4(s8)
	addi    t6,s8,8
	add     t6,s1,s4
	sw      t6,8(s8)
	lw      t6,4(s8)
	addi    a5,s9,-4
	lw      a5,-4(s9)
	bgt     t6,a5,mergeSort_criticalEdge.9
	j       mergeSort_logicalOr.9

mergeSort_afterIfBBlock.16:
	mv      s7,s5
	j       mergeSort_returnBBlock.14

mergeSort_returnBBlock.14:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s7,0(s8)
	li      t6,0
	addi    a5,s8,4
	sw      t6,4(s8)
	addi    t6,s8,8
	addi    t6,s7,-4
	lw      t6,-4(s7)
	sw      t6,8(s8)
	lw      t6,8(s10)
	lw      s9,4(s10)
	sub     t6,t6,s9
	lw      a5,8(s8)
	lw      s1,4(s8)
	sub     s4,a5,s1
	blt     t6,s4,mergeSort_thenBodyBBlock.11
	j       mergeSort_afterIfBBlock.11

mergeSort_forCondBBlock.5:
	blt     t6,s4,mergeSort_forBodyBBlock.5
	j       mergeSort_afterForBBlock.5

mergeSort_forBodyBBlock.5:
	slli    a5,t6,2
	add     a3,s7,a5
	add     a5,s1,t6
	slli    a5,a5,2
	add     a5,s9,a5
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.5

mergeSort_afterForBBlock.5:
	j       mergeSort_returnBBlock.14

mergeSort_forCondBBlock.6:
	blt     t6,s8,mergeSort_forBodyBBlock.6
	j       mergeSort_afterForBBlock.6

mergeSort_forBodyBBlock.6:
	slli    a5,t6,2
	add     a1,s7,a5
	lw      a3,0(s6)
	lw      a5,28(sp)
	add     a5,a5,t6
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.6

mergeSort_afterForBBlock.6:
	j       mergeSort_returnBBlock.14

mergeSort_thenBodyBBlock.17:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.17

mergeSort_afterIfBBlock.17:
	lw      s7,0(s6)
	lw      t6,28(sp)
	addi    t6,t6,0
	slli    t6,t6,2
	add     t6,s7,t6
	lw      a5,0(t6)
	lw      t6,24(sp)
	blt     a5,t6,mergeSort_thenBodyBBlock.16
	j       mergeSort_elseBodyBBlock.1

mergeSort_logicalOr.7:
	lw      a5,8(s2)
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
	mv      a1,s3
	call    merge
	mv      s8,a0
	li      a0,12
	call    __malloc
	mv      s9,a0
	sw      s8,0(s9)
	li      a5,0
	addi    t6,s9,4
	sw      a5,4(s9)
	addi    t6,s9,8
	addi    t6,s8,-4
	lw      t6,-4(s8)
	sw      t6,8(s9)
	lw      t6,8(s2)
	lw      s1,4(s2)
	sub     a5,t6,s1
	lw      t6,8(s9)
	lw      s4,4(s9)
	sub     s8,t6,s4
	blt     a5,s8,mergeSort_thenBodyBBlock.19
	j       mergeSort_afterIfBBlock.19

mergeSort_logicalOr.8:
	lw      a5,8(s9)
	slt     t6,t6,a5
	j       mergeSort_afterLogicalOr.8

mergeSort_afterLogicalOr.8:
	bne     t6,zero,mergeSort_thenBodyBBlock.18
	j       mergeSort_afterIfBBlock.18

mergeSort_thenBodyBBlock.19:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.19

mergeSort_afterIfBBlock.19:
	li      t6,0
	j       mergeSort_forCondBBlock.7

mergeSort_forCondBBlock.7:
	blt     t6,s8,mergeSort_forBodyBBlock.7
	j       mergeSort_afterForBBlock.7

mergeSort_forBodyBBlock.7:
	lw      a3,0(s2)
	add     a5,s1,t6
	slli    a5,a5,2
	add     a3,a3,a5
	lw      a1,0(s9)
	add     a5,s4,t6
	slli    a5,a5,2
	add     a5,a1,a5
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.7

mergeSort_afterForBBlock.7:
	j       mergeSort_afterIfBBlock.16

mergeSort_thenBodyBBlock.20:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.20

mergeSort_afterIfBBlock.20:
	mv      a0,s6
	mv      a1,s8
	call    merge
	mv      s8,a0
	li      a0,12
	call    __malloc
	mv      s9,a0
	sw      s8,0(s9)
	li      a5,0
	addi    t6,s9,4
	sw      a5,4(s9)
	addi    t6,s9,8
	addi    t6,s8,-4
	lw      t6,-4(s8)
	sw      t6,8(s9)
	lw      t6,8(s2)
	lw      s8,4(s2)
	sub     a5,t6,s8
	lw      t6,8(s9)
	lw      s4,4(s9)
	sub     s1,t6,s4
	blt     a5,s1,mergeSort_thenBodyBBlock.21
	j       mergeSort_afterIfBBlock.21

mergeSort_logicalOr.9:
	lw      t6,8(s8)
	slt     t6,a5,t6
	j       mergeSort_afterLogicalOr.9

mergeSort_afterLogicalOr.9:
	bne     t6,zero,mergeSort_thenBodyBBlock.20
	j       mergeSort_afterIfBBlock.20

mergeSort_thenBodyBBlock.21:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.21

mergeSort_afterIfBBlock.21:
	li      t6,0
	j       mergeSort_forCondBBlock.8

mergeSort_forCondBBlock.8:
	blt     t6,s1,mergeSort_forBodyBBlock.8
	j       mergeSort_afterForBBlock.8

mergeSort_forBodyBBlock.8:
	lw      a3,0(s2)
	add     a5,s8,t6
	slli    a5,a5,2
	add     a3,a3,a5
	lw      a5,0(s9)
	add     a1,s4,t6
	slli    a1,a1,2
	add     a5,a5,a1
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.8

mergeSort_afterForBBlock.8:
	j       mergeSort_afterIfBBlock.16

mergeSort_thenBodyBBlock.22:
	lw      t6,8(s3)
	sub     s8,t6,s4
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s9,a0,4
	li      t6,0
	j       mergeSort_forCondBBlock.9

mergeSort_afterIfBBlock.22:
	lw      t6,8(s3)
	sub     t6,t6,s4
	sw      t6,12(sp)
	li      a5,0
	lw      t6,12(sp)
	beq     t6,a5,mergeSort_thenBodyBBlock.23
	j       mergeSort_afterIfBBlock.23

mergeSort_thenBodyBBlock.23:
	li      t6,4
	mul     t6,t6,s8
	addi    a0,t6,4
	call    __malloc
	sw      s8,0(a0)
	addi    s9,a0,4
	li      t6,0
	j       mergeSort_forCondBBlock.10

mergeSort_afterIfBBlock.23:
	lw      t6,12(sp)
	add     s9,s8,t6
	li      t6,4
	mul     t6,t6,s9
	addi    a0,t6,4
	call    __malloc
	sw      s9,0(a0)
	addi    s1,a0,4
	li      a0,12
	call    __malloc
	mv      s5,a0
	mv      t6,s5
	sw      s1,0(s5)
	li      a5,0
	addi    t6,s5,4
	sw      a5,4(s5)
	addi    t6,s5,8
	addi    t6,s1,-4
	lw      t6,-4(s1)
	sw      t6,8(s5)
	lw      a5,8(s5)
	lw      t6,4(s5)
	sw      t6,8(sp)
	lw      t6,8(sp)
	sub     t6,a5,t6
	sw      t6,4(sp)
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	lw      a3,0(s5)
	sw      a3,0(s9)
	addi    t6,s9,4
	lw      t6,8(sp)
	addi    t6,t6,1
	sw      t6,4(s9)
	addi    t6,s9,8
	lw      a5,4(sp)
	lw      t6,8(sp)
	add     t6,t6,a5
	sw      t6,8(s9)
	lw      a5,4(s9)
	addi    t6,a3,-4
	lw      t6,-4(a3)
	bgt     a5,t6,mergeSort_criticalEdge.10
	j       mergeSort_logicalOr.10

mergeSort_thenBodyBBlock.24:
	mv      t6,s1
	lw      t6,32(sp)
	sw      t6,0(s1)
	li      a0,12
	call    __malloc
	mv      s4,a0
	sw      s7,0(s4)
	addi    t6,s4,4
	addi    t6,s2,1
	sw      t6,4(s4)
	addi    t6,s4,8
	add     t6,s2,s8
	sw      t6,8(s4)
	lw      a5,4(s4)
	addi    t6,s7,-4
	lw      t6,-4(s7)
	bgt     a5,t6,mergeSort_criticalEdge.11
	j       mergeSort_logicalOr.11

mergeSort_elseBodyBBlock.2:
	mv      t6,s1
	sw      a5,0(s1)
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s5,0(s8)
	addi    t6,s8,4
	addi    t6,s4,1
	sw      t6,4(s8)
	addi    t6,s8,8
	lw      t6,12(sp)
	add     t6,s4,t6
	sw      t6,8(s8)
	lw      a5,4(s8)
	addi    t6,s5,-4
	lw      t6,-4(s5)
	bgt     a5,t6,mergeSort_criticalEdge.12
	j       mergeSort_logicalOr.12

mergeSort_afterIfBBlock.24:
	mv      s9,s1
	j       mergeSort_returnBBlock.15

mergeSort_returnBBlock.15:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s9,0(s8)
	li      a5,0
	addi    t6,s8,4
	sw      a5,4(s8)
	addi    t6,s8,8
	addi    t6,s9,-4
	lw      t6,-4(s9)
	sw      t6,8(s8)
	lw      t6,8(s10)
	lw      s9,4(s10)
	sub     t6,t6,s9
	lw      a5,8(s8)
	lw      s1,4(s8)
	sub     s4,a5,s1
	blt     t6,s4,mergeSort_thenBodyBBlock.13
	j       mergeSort_afterIfBBlock.13

mergeSort_forCondBBlock.9:
	blt     t6,s8,mergeSort_forBodyBBlock.9
	j       mergeSort_afterForBBlock.9

mergeSort_forBodyBBlock.9:
	slli    a5,t6,2
	add     a3,s9,a5
	lw      a1,0(s3)
	add     a5,s4,t6
	slli    a5,a5,2
	add     a5,a1,a5
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.9

mergeSort_afterForBBlock.9:
	j       mergeSort_returnBBlock.15

mergeSort_forCondBBlock.10:
	blt     t6,s8,mergeSort_forBodyBBlock.10
	j       mergeSort_afterForBBlock.10

mergeSort_forBodyBBlock.10:
	slli    a5,t6,2
	add     a3,s9,a5
	add     a5,s2,t6
	slli    a5,a5,2
	add     a5,s7,a5
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.10

mergeSort_afterForBBlock.10:
	j       mergeSort_returnBBlock.15

mergeSort_thenBodyBBlock.25:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.25

mergeSort_afterIfBBlock.25:
	lw      s5,0(s3)
	addi    t6,s4,0
	slli    t6,t6,2
	add     t6,s5,t6
	lw      a5,0(t6)
	lw      t6,32(sp)
	blt     t6,a5,mergeSort_thenBodyBBlock.24
	j       mergeSort_elseBodyBBlock.2

mergeSort_logicalOr.10:
	lw      a5,8(s9)
	slt     t6,t6,a5
	j       mergeSort_afterLogicalOr.10

mergeSort_afterLogicalOr.10:
	bne     t6,zero,mergeSort_thenBodyBBlock.25
	j       mergeSort_afterIfBBlock.25

mergeSort_thenBodyBBlock.26:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.26

mergeSort_afterIfBBlock.26:
	mv      a0,s4
	mv      a1,s3
	call    merge
	mv      s8,a0
	li      a0,12
	call    __malloc
	mv      s7,a0
	sw      s8,0(s7)
	li      a5,0
	addi    t6,s7,4
	sw      a5,4(s7)
	addi    t6,s7,8
	addi    t6,s8,-4
	lw      t6,-4(s8)
	sw      t6,8(s7)
	lw      t6,8(s9)
	lw      s4,4(s9)
	sub     t6,t6,s4
	lw      a5,8(s7)
	lw      s8,4(s7)
	sub     s2,a5,s8
	blt     t6,s2,mergeSort_thenBodyBBlock.27
	j       mergeSort_afterIfBBlock.27

mergeSort_logicalOr.11:
	lw      a5,8(s4)
	slt     t6,t6,a5
	j       mergeSort_afterLogicalOr.11

mergeSort_afterLogicalOr.11:
	bne     t6,zero,mergeSort_thenBodyBBlock.26
	j       mergeSort_afterIfBBlock.26

mergeSort_thenBodyBBlock.27:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.27

mergeSort_afterIfBBlock.27:
	li      t6,0
	j       mergeSort_forCondBBlock.11

mergeSort_forCondBBlock.11:
	blt     t6,s2,mergeSort_forBodyBBlock.11
	j       mergeSort_afterForBBlock.11

mergeSort_forBodyBBlock.11:
	lw      a5,0(s9)
	add     a3,s4,t6
	slli    a3,a3,2
	add     a3,a5,a3
	lw      a5,0(s7)
	add     a1,s8,t6
	slli    a1,a1,2
	add     a5,a5,a1
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       mergeSort_forCondBBlock.11

mergeSort_afterForBBlock.11:
	j       mergeSort_afterIfBBlock.24

mergeSort_thenBodyBBlock.28:
    la      a0,.str.0
	call    __println
	j       mergeSort_afterIfBBlock.28

mergeSort_afterIfBBlock.28:
	mv      a0,s6
	mv      a1,s8
	call    merge
	mv      s8,a0
	li      a0,12
	call    __malloc
	mv      s4,a0
	sw      s8,0(s4)
	li      t6,0
	addi    a5,s4,4
	sw      t6,4(s4)
	addi    t6,s4,8
	addi    t6,s8,-4
	lw      t6,-4(s8)
	sw      t6,8(s4)
	lw      t6,8(s9)
	lw      s8,4(s9)
	sub     t6,t6,s8
	lw      a5,8(s4)
	lw      s2,4(s4)
	sub     s7,a5,s2
	blt     t6,s7,mergeSort_thenBodyBBlock.29
	j       mergeSort_afterIfBBlock.29

mergeSort_logicalOr.12:
	lw      a5,8(s8)
	slt     t6,t6,a5
	j       mergeSort_afterLogicalOr.12

mergeSort_afterLogicalOr.12:
	bne     t6,zero,mergeSort_thenBodyBBlock.28
	j       mergeSort_afterIfBBlock.28

mergeSort_thenBodyBBlock.29:
    la      a0,.str.1
	call    __println
	j       mergeSort_afterIfBBlock.29

mergeSort_afterIfBBlock.29:
	li      t6,0
	j       mergeSort_forCondBBlock.12

mergeSort_forCondBBlock.12:
	blt     t6,s7,mergeSort_forBodyBBlock.12
	j       mergeSort_afterForBBlock.12

mergeSort_forBodyBBlock.12:
	lw      a3,0(s9)
	add     a5,s8,t6
	slli    a5,a5,2
	add     a3,a3,a5
	lw      a1,0(s4)
	add     a5,s2,t6
	slli    a5,a5,2
	add     a5,a1,a5
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
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
	call    __getInt
	mv      s2,a0
	li      s11,4
	mul     s11,s11,s2
	addi    a0,s11,4
	call    __malloc
	sw      s2,0(a0)
	addi    s11,a0,4
	sw      s11,56(sp)
	li      s11,0
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	blt     s11,s2,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    a5,s11,2
	lw      t6,56(sp)
	add     s8,t6,a5
	call    __getInt
	sw      a0,0(s8)
	addi    s11,s11,1
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	li      a0,12
	call    __malloc
	mv      s3,a0
	mv      s11,s3
	lw      s11,56(sp)
	sw      s11,0(s3)
	li      s11,0
	addi    t6,s3,4
	sw      s11,4(s3)
	addi    s11,s3,8
	lw      s11,56(sp)
	addi    s11,s11,-4
	lw      s11,56(sp)
	lw      s11,-4(s11)
	sw      s11,8(s3)
	lw      t6,8(s3)
	lw      s11,4(s3)
	sub     s8,t6,s11
	li      t6,1
	beq     s8,t6,main_thenBodyBBlock.0
	j       main_afterIfBBlock.0

main_forCondBBlock.1:
	blt     s11,s2,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    t6,s11,2
	lw      a5,56(sp)
	add     t6,a5,t6
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

main_thenBodyBBlock.0:
	j       main_returnBBlock.5

main_afterIfBBlock.0:
	li      t6,2
	div     s10,s8,t6
	li      a0,12
	call    __malloc
	mv      s9,a0
	lw      t6,0(s3)
	sw      t6,0(s9)
	addi    a5,s9,4
	addi    a5,s11,0
	sw      a5,4(s9)
	addi    a5,s9,8
	add     s11,s11,s10
	sw      s11,8(s9)
	lw      a5,4(s9)
	addi    s11,t6,-4
	lw      s11,-4(t6)
	bgt     a5,s11,main_criticalEdge.0
	j       main_logicalOr.0

main_returnBBlock.5:
	li      s11,0
	j       main_forCondBBlock.1

main_thenBodyBBlock.1:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.1

main_afterIfBBlock.1:
	mv      a0,s9
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s9,a0
	lw      t6,0(s3)
	sw      t6,0(s9)
	addi    s11,s9,4
	lw      a5,4(s3)
	add     s11,a5,s10
	sw      s11,4(s9)
	addi    s11,s9,8
	add     s11,a5,s8
	sw      s11,8(s9)
	lw      a5,4(s9)
	addi    s11,t6,-4
	lw      s11,-4(t6)
	bgt     a5,s11,main_criticalEdge.1
	j       main_logicalOr.1

main_logicalOr.0:
	lw      t6,8(s9)
	slt     s11,s11,t6
	j       main_afterLogicalOr.0

main_afterLogicalOr.0:
	bne     s11,zero,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_thenBodyBBlock.2:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.2

main_afterIfBBlock.2:
	mv      a0,s9
	call    mergeSort
	li      a0,12
	call    __malloc
	mv      s1,a0
	mv      s11,s1
	lw      s5,0(s3)
	sw      s5,0(s1)
	addi    s11,s1,4
	lw      s4,4(s3)
	addi    s11,s4,0
	sw      s11,4(s1)
	addi    s11,s1,8
	add     s6,s4,s10
	sw      s6,8(s1)
	lw      s7,4(s1)
	addi    s11,s5,-4
	lw      s10,-4(s5)
	bgt     s7,s10,main_criticalEdge.2
	j       main_logicalOr.2

main_logicalOr.1:
	lw      t6,8(s9)
	slt     s11,s11,t6
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
	mv      s9,a0
	mv      s11,s9
	sw      s5,0(s9)
	addi    s11,s9,4
	sw      s6,4(s9)
	addi    s11,s9,8
	add     s11,s4,s8
	sw      s11,8(s9)
	lw      s8,4(s9)
	bgt     s8,s10,main_criticalEdge.3
	j       main_logicalOr.3

main_logicalOr.2:
	lw      s11,8(s1)
	slt     s11,s10,s11
	j       main_afterLogicalOr.2

main_afterLogicalOr.2:
	bne     s11,zero,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_thenBodyBBlock.4:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.4

main_afterIfBBlock.4:
	lw      s11,8(s1)
	sub     s4,s11,s7
	li      s11,0
	sw      s11,52(sp)
	li      s11,0
	beq     s4,s11,main_thenBodyBBlock.6
	j       main_afterIfBBlock.6

main_logicalOr.3:
	lw      s11,8(s9)
	slt     s11,s10,s11
	j       main_afterLogicalOr.3

main_afterLogicalOr.3:
	bne     s11,zero,main_thenBodyBBlock.4
	j       main_afterIfBBlock.4

main_thenBodyBBlock.5:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.5

main_afterIfBBlock.5:
	li      s11,0
	j       main_forCondBBlock.2

main_forCondBBlock.2:
	blt     s11,s9,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	lw      a5,0(s3)
	add     t6,s10,s11
	slli    t6,t6,2
	add     a5,a5,t6
	lw      t6,0(s8)
	add     a3,s4,s11
	slli    a3,a3,2
	add     t6,t6,a3
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    s11,s11,1
	j       main_forCondBBlock.2

main_afterForBBlock.2:
	j       main_returnBBlock.5

main_thenBodyBBlock.6:
	lw      s11,8(s9)
	sub     s10,s11,s8
	li      s11,4
	mul     s11,s11,s10
	addi    a0,s11,4
	call    __malloc
	sw      s10,0(a0)
	addi    s11,a0,4
	li      t6,0
	j       main_forCondBBlock.3

main_afterIfBBlock.6:
	lw      s11,8(s9)
	sub     s11,s11,s8
	li      a5,0
	li      t6,0
	sw      t6,48(sp)
	beq     s11,a5,main_thenBodyBBlock.7
	j       main_afterIfBBlock.7

main_thenBodyBBlock.7:
	li      s11,4
	mul     s11,s11,s4
	addi    a0,s11,4
	call    __malloc
	sw      s4,0(a0)
	addi    s11,a0,4
	li      t6,0
	j       main_forCondBBlock.4

main_afterIfBBlock.7:
	add     s10,s4,s11
	li      t6,4
	mul     t6,t6,s10
	addi    a0,t6,4
	call    __malloc
	sw      s10,0(a0)
	addi    t6,a0,4
	sw      t6,44(sp)
	li      a0,12
	call    __malloc
	mv      s5,a0
	mv      t6,s5
	lw      t6,44(sp)
	sw      t6,0(s5)
	li      a5,0
	addi    t6,s5,4
	sw      a5,4(s5)
	addi    t6,s5,8
	lw      t6,44(sp)
	addi    t6,t6,-4
	lw      t6,44(sp)
	lw      t6,-4(t6)
	sw      t6,8(s5)
	lw      t6,8(s5)
	lw      s6,4(s5)
	sub     s0,t6,s6
	li      a0,12
	call    __malloc
	mv      s10,a0
	mv      t6,s10
	lw      a5,0(s5)
	sw      a5,0(s10)
	addi    t6,s10,4
	addi    t6,s6,1
	sw      t6,4(s10)
	addi    t6,s10,8
	add     t6,s6,s0
	sw      t6,8(s10)
	lw      t6,4(s10)
	addi    a3,a5,-4
	lw      a5,-4(a5)
	bgt     t6,a5,main_criticalEdge.4
	j       main_logicalOr.4

main_thenBodyBBlock.8:
	lw      t6,44(sp)
	lw      t6,40(sp)
	lw      a5,44(sp)
	sw      t6,0(a5)
	li      a0,12
	call    __malloc
	mv      s1,a0
	mv      t6,s1
	sw      s5,0(s1)
	addi    t6,s1,4
	addi    t6,s7,1
	sw      t6,4(s1)
	addi    t6,s1,8
	add     t6,s7,s4
	sw      t6,8(s1)
	lw      s0,4(s1)
	addi    t6,s5,-4
	lw      t6,-4(s5)
	bgt     s0,t6,main_criticalEdge.5
	j       main_logicalOr.5

main_elseBodyBBlock.0:
	lw      t6,44(sp)
	lw      a5,44(sp)
	lw      t6,36(sp)
	sw      t6,0(a5)
	li      a0,12
	call    __malloc
	mv      s9,a0
	mv      t6,s9
	lw      t6,32(sp)
	sw      t6,0(s9)
	addi    t6,s9,4
	addi    t6,s8,1
	sw      t6,4(s9)
	addi    t6,s9,8
	add     s11,s8,s11
	sw      s11,8(s9)
	lw      s0,4(s9)
	lw      s11,32(sp)
	addi    s11,s11,-4
	lw      s11,32(sp)
	lw      s11,-4(s11)
	bgt     s0,s11,main_criticalEdge.6
	j       main_logicalOr.6

main_afterIfBBlock.8:
	lw      s11,44(sp)
	j       main_returnBBlock.6

main_returnBBlock.6:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s11,0(s8)
	li      a5,0
	addi    t6,s8,4
	sw      a5,4(s8)
	addi    t6,s8,8
	addi    t6,s11,-4
	lw      s11,-4(s11)
	sw      s11,8(s8)
	lw      s11,8(s3)
	lw      s10,4(s3)
	sub     s11,s11,s10
	lw      t6,8(s8)
	lw      s4,4(s8)
	sub     s9,t6,s4
	blt     s11,s9,main_thenBodyBBlock.5
	j       main_afterIfBBlock.5

main_forCondBBlock.3:
	blt     t6,s10,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	slli    a5,t6,2
	add     a1,s11,a5
	lw      a3,0(s9)
	add     a5,s8,t6
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       main_forCondBBlock.3

main_afterForBBlock.3:
	j       main_returnBBlock.6

main_forCondBBlock.4:
	blt     t6,s4,main_forBodyBBlock.4
	j       main_afterForBBlock.4

main_forBodyBBlock.4:
	slli    a5,t6,2
	add     a1,s11,a5
	lw      a5,0(s1)
	add     a3,s7,t6
	slli    a3,a3,2
	add     a5,a5,a3
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       main_forCondBBlock.4

main_afterForBBlock.4:
	j       main_returnBBlock.6

main_thenBodyBBlock.9:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.9

main_afterIfBBlock.9:
	lw      s5,0(s1)
	addi    t6,s7,0
	slli    t6,t6,2
	add     t6,s5,t6
	lw      t6,0(t6)
	sw      t6,40(sp)
	lw      t6,0(s9)
	sw      t6,32(sp)
	addi    t6,s8,0
	slli    t6,t6,2
	lw      a5,32(sp)
	add     t6,a5,t6
	lw      t6,0(t6)
	sw      t6,36(sp)
	lw      t6,40(sp)
	lw      a5,36(sp)
	blt     t6,a5,main_thenBodyBBlock.8
	j       main_elseBodyBBlock.0

main_logicalOr.4:
	lw      t6,8(s10)
	slt     t6,a5,t6
	j       main_afterLogicalOr.4

main_afterLogicalOr.4:
	bne     t6,zero,main_thenBodyBBlock.9
	j       main_afterIfBBlock.9

main_thenBodyBBlock.10:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.10

main_afterIfBBlock.10:
	lw      t6,8(s1)
	sub     s6,t6,s0
	li      t6,0
	beq     s6,t6,main_thenBodyBBlock.14
	j       main_afterIfBBlock.14

main_logicalOr.5:
	lw      a5,8(s1)
	slt     t6,t6,a5
	j       main_afterLogicalOr.5

main_afterLogicalOr.5:
	bne     t6,zero,main_thenBodyBBlock.10
	j       main_afterIfBBlock.10

main_thenBodyBBlock.11:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.11

main_afterIfBBlock.11:
	li      t6,0
	j       main_forCondBBlock.5

main_forCondBBlock.5:
	blt     t6,s9,main_forBodyBBlock.5
	j       main_afterForBBlock.5

main_forBodyBBlock.5:
	lw      a3,0(s10)
	add     a5,s8,t6
	slli    a5,a5,2
	add     a3,a3,a5
	lw      a5,0(s11)
	add     a1,s4,t6
	slli    a1,a1,2
	add     a5,a5,a1
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       main_forCondBBlock.5

main_afterForBBlock.5:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.12:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.12

main_afterIfBBlock.12:
	lw      s11,52(sp)
	beq     s4,s11,main_thenBodyBBlock.22
	j       main_afterIfBBlock.22

main_logicalOr.6:
	lw      t6,8(s9)
	slt     s11,s11,t6
	j       main_afterLogicalOr.6

main_afterLogicalOr.6:
	bne     s11,zero,main_thenBodyBBlock.12
	j       main_afterIfBBlock.12

main_thenBodyBBlock.13:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.13

main_afterIfBBlock.13:
	li      s11,0
	j       main_forCondBBlock.6

main_forCondBBlock.6:
	blt     s11,s1,main_forBodyBBlock.6
	j       main_afterForBBlock.6

main_forBodyBBlock.6:
	lw      t6,0(s10)
	add     a5,s9,s11
	slli    a5,a5,2
	add     t6,t6,a5
	lw      a5,0(s8)
	add     a3,s4,s11
	slli    a3,a3,2
	add     a5,a5,a3
	lw      a5,0(a5)
	sw      a5,0(t6)
	addi    s11,s11,1
	j       main_forCondBBlock.6

main_afterForBBlock.6:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.14:
	li      t6,4
	mul     t6,t6,s11
	addi    a0,t6,4
	call    __malloc
	sw      s11,0(a0)
	addi    s9,a0,4
	li      t6,0
	j       main_forCondBBlock.7

main_afterIfBBlock.14:
	lw      t6,48(sp)
	beq     s11,t6,main_thenBodyBBlock.15
	j       main_afterIfBBlock.15

main_thenBodyBBlock.15:
	li      s11,4
	mul     s11,s11,s6
	addi    a0,s11,4
	call    __malloc
	sw      s6,0(a0)
	addi    s9,a0,4
	li      s11,0
	j       main_forCondBBlock.8

main_afterIfBBlock.15:
	add     s4,s6,s11
	li      t6,4
	mul     t6,t6,s4
	addi    a0,t6,4
	call    __malloc
	sw      s4,0(a0)
	addi    s5,a0,4
	li      a0,12
	call    __malloc
	mv      s4,a0
	mv      t6,s4
	sw      s5,0(s4)
	li      t6,0
	addi    a5,s4,4
	sw      t6,4(s4)
	addi    t6,s4,8
	addi    t6,s5,-4
	lw      t6,-4(s5)
	sw      t6,8(s4)
	lw      t6,8(s4)
	lw      a5,4(s4)
	sw      a5,28(sp)
	lw      a5,28(sp)
	sub     t6,t6,a5
	sw      t6,24(sp)
	li      a0,12
	call    __malloc
	mv      s7,a0
	mv      t6,s7
	lw      a3,0(s4)
	sw      a3,0(s7)
	addi    t6,s7,4
	lw      t6,28(sp)
	addi    t6,t6,1
	sw      t6,4(s7)
	addi    t6,s7,8
	lw      t6,24(sp)
	lw      a5,28(sp)
	add     t6,a5,t6
	sw      t6,8(s7)
	lw      t6,4(s7)
	addi    a5,a3,-4
	lw      a5,-4(a3)
	bgt     t6,a5,main_criticalEdge.7
	j       main_logicalOr.7

main_thenBodyBBlock.16:
	mv      s11,s5
	sw      a5,0(s5)
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s4,0(s8)
	addi    s11,s8,4
	addi    s11,s0,1
	sw      s11,4(s8)
	addi    s11,s8,8
	add     s11,s0,s6
	sw      s11,8(s8)
	lw      t6,4(s8)
	addi    s11,s4,-4
	lw      s11,-4(s4)
	bgt     t6,s11,main_criticalEdge.8
	j       main_logicalOr.8

main_elseBodyBBlock.1:
	mv      t6,s5
	lw      t6,36(sp)
	sw      t6,0(s5)
	li      a0,12
	call    __malloc
	mv      s9,a0
	lw      t6,32(sp)
	sw      t6,0(s9)
	addi    t6,s9,4
	addi    t6,s8,1
	sw      t6,4(s9)
	addi    t6,s9,8
	add     s11,s8,s11
	sw      s11,8(s9)
	lw      t6,4(s9)
	lw      s11,32(sp)
	addi    s11,s11,-4
	lw      s11,32(sp)
	lw      s11,-4(s11)
	bgt     t6,s11,main_criticalEdge.9
	j       main_logicalOr.9

main_afterIfBBlock.16:
	mv      s9,s5
	j       main_returnBBlock.7

main_returnBBlock.7:
	li      a0,12
	call    __malloc
	mv      s11,a0
	sw      s9,0(s11)
	li      t6,0
	addi    a5,s11,4
	sw      t6,4(s11)
	addi    t6,s11,8
	addi    t6,s9,-4
	lw      t6,-4(s9)
	sw      t6,8(s11)
	lw      t6,8(s10)
	lw      s8,4(s10)
	sub     a5,t6,s8
	lw      t6,8(s11)
	lw      s4,4(s11)
	sub     s9,t6,s4
	blt     a5,s9,main_thenBodyBBlock.11
	j       main_afterIfBBlock.11

main_forCondBBlock.7:
	blt     t6,s11,main_forBodyBBlock.7
	j       main_afterForBBlock.7

main_forBodyBBlock.7:
	slli    a5,t6,2
	add     a1,s9,a5
	add     a5,s8,t6
	slli    a3,a5,2
	lw      a5,32(sp)
	add     a5,a5,a3
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       main_forCondBBlock.7

main_afterForBBlock.7:
	j       main_returnBBlock.7

main_forCondBBlock.8:
	blt     s11,s6,main_forBodyBBlock.8
	j       main_afterForBBlock.8

main_forBodyBBlock.8:
	slli    t6,s11,2
	add     t6,s9,t6
	lw      a3,0(s1)
	add     a5,s0,s11
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(t6)
	addi    s11,s11,1
	j       main_forCondBBlock.8

main_afterForBBlock.8:
	j       main_returnBBlock.7

main_thenBodyBBlock.17:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.17

main_afterIfBBlock.17:
	lw      s4,0(s1)
	addi    t6,s0,0
	slli    t6,t6,2
	add     t6,s4,t6
	lw      a5,0(t6)
	lw      t6,36(sp)
	blt     a5,t6,main_thenBodyBBlock.16
	j       main_elseBodyBBlock.1

main_logicalOr.7:
	lw      t6,8(s7)
	slt     t6,a5,t6
	j       main_afterLogicalOr.7

main_afterLogicalOr.7:
	bne     t6,zero,main_thenBodyBBlock.17
	j       main_afterIfBBlock.17

main_thenBodyBBlock.18:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.18

main_afterIfBBlock.18:
	mv      a0,s8
	mv      a1,s9
	call    merge
	mv      s11,a0
	li      a0,12
	call    __malloc
	mv      s4,a0
	sw      s11,0(s4)
	li      a5,0
	addi    t6,s4,4
	sw      a5,4(s4)
	addi    t6,s4,8
	addi    t6,s11,-4
	lw      s11,-4(s11)
	sw      s11,8(s4)
	lw      s11,8(s7)
	lw      s8,4(s7)
	sub     s11,s11,s8
	lw      t6,8(s4)
	lw      s1,4(s4)
	sub     s9,t6,s1
	blt     s11,s9,main_thenBodyBBlock.19
	j       main_afterIfBBlock.19

main_logicalOr.8:
	lw      t6,8(s8)
	slt     s11,s11,t6
	j       main_afterLogicalOr.8

main_afterLogicalOr.8:
	bne     s11,zero,main_thenBodyBBlock.18
	j       main_afterIfBBlock.18

main_thenBodyBBlock.19:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.19

main_afterIfBBlock.19:
	li      s11,0
	j       main_forCondBBlock.9

main_forCondBBlock.9:
	blt     s11,s9,main_forBodyBBlock.9
	j       main_afterForBBlock.9

main_forBodyBBlock.9:
	lw      a5,0(s7)
	add     t6,s8,s11
	slli    t6,t6,2
	add     t6,a5,t6
	lw      a3,0(s4)
	add     a5,s1,s11
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(t6)
	addi    s11,s11,1
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
	mv      s11,a0
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s11,0(s8)
	li      a5,0
	addi    t6,s8,4
	sw      a5,4(s8)
	addi    t6,s8,8
	addi    t6,s11,-4
	lw      s11,-4(s11)
	sw      s11,8(s8)
	lw      s11,8(s7)
	lw      s9,4(s7)
	sub     t6,s11,s9
	lw      s11,8(s8)
	lw      s1,4(s8)
	sub     s4,s11,s1
	blt     t6,s4,main_thenBodyBBlock.21
	j       main_afterIfBBlock.21

main_logicalOr.9:
	lw      t6,8(s9)
	slt     s11,s11,t6
	j       main_afterLogicalOr.9

main_afterLogicalOr.9:
	bne     s11,zero,main_thenBodyBBlock.20
	j       main_afterIfBBlock.20

main_thenBodyBBlock.21:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.21

main_afterIfBBlock.21:
	li      s11,0
	j       main_forCondBBlock.10

main_forCondBBlock.10:
	blt     s11,s4,main_forBodyBBlock.10
	j       main_afterForBBlock.10

main_forBodyBBlock.10:
	lw      a5,0(s7)
	add     t6,s9,s11
	slli    t6,t6,2
	add     a5,a5,t6
	lw      a3,0(s8)
	add     t6,s1,s11
	slli    t6,t6,2
	add     t6,a3,t6
	lw      t6,0(t6)
	sw      t6,0(a5)
	addi    s11,s11,1
	j       main_forCondBBlock.10

main_afterForBBlock.10:
	j       main_afterIfBBlock.16

main_thenBodyBBlock.22:
	lw      s11,8(s9)
	sub     s8,s11,s0
	li      s11,4
	mul     s11,s11,s8
	addi    a0,s11,4
	call    __malloc
	sw      s8,0(a0)
	addi    s11,a0,4
	li      t6,0
	j       main_forCondBBlock.11

main_afterIfBBlock.22:
	lw      s11,8(s9)
	sub     s11,s11,s0
	sw      s11,20(sp)
	li      t6,0
	lw      s11,20(sp)
	beq     s11,t6,main_thenBodyBBlock.23
	j       main_afterIfBBlock.23

main_thenBodyBBlock.23:
	li      s11,4
	mul     s11,s11,s4
	addi    a0,s11,4
	call    __malloc
	sw      s4,0(a0)
	addi    s11,a0,4
	li      t6,0
	j       main_forCondBBlock.12

main_afterIfBBlock.23:
	lw      s11,20(sp)
	add     s11,s4,s11
	li      t6,4
	mul     t6,t6,s11
	addi    a0,t6,4
	call    __malloc
	sw      s11,0(a0)
	addi    s8,a0,4
	li      a0,12
	call    __malloc
	mv      s6,a0
	mv      s11,s6
	sw      s8,0(s6)
	li      s11,0
	addi    t6,s6,4
	sw      s11,4(s6)
	addi    s11,s6,8
	addi    s11,s8,-4
	lw      s11,-4(s8)
	sw      s11,8(s6)
	lw      t6,8(s6)
	lw      s11,4(s6)
	sw      s11,16(sp)
	lw      s11,16(sp)
	sub     s11,t6,s11
	sw      s11,12(sp)
	li      a0,12
	call    __malloc
	mv      s11,a0
	lw      a3,0(s6)
	sw      a3,0(s11)
	addi    t6,s11,4
	lw      t6,16(sp)
	addi    t6,t6,1
	sw      t6,4(s11)
	addi    t6,s11,8
	lw      t6,12(sp)
	lw      a5,16(sp)
	add     t6,a5,t6
	sw      t6,8(s11)
	lw      a5,4(s11)
	addi    t6,a3,-4
	lw      a3,-4(a3)
	bgt     a5,a3,main_criticalEdge.10
	j       main_logicalOr.10

main_thenBodyBBlock.24:
	mv      t6,s8
	lw      t6,40(sp)
	sw      t6,0(s8)
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s5,0(s1)
	addi    t6,s1,4
	addi    t6,s7,1
	sw      t6,4(s1)
	addi    t6,s1,8
	add     t6,s7,s4
	sw      t6,8(s1)
	lw      t6,4(s1)
	addi    a5,s5,-4
	lw      a5,-4(s5)
	bgt     t6,a5,main_criticalEdge.11
	j       main_logicalOr.11

main_elseBodyBBlock.2:
	mv      t6,s8
	sw      a5,0(s8)
	li      a0,12
	call    __malloc
	mv      s9,a0
	sw      s6,0(s9)
	addi    t6,s9,4
	addi    t6,s0,1
	sw      t6,4(s9)
	addi    t6,s9,8
	lw      t6,20(sp)
	add     t6,s0,t6
	sw      t6,8(s9)
	lw      t6,4(s9)
	addi    a5,s6,-4
	lw      a5,-4(s6)
	bgt     t6,a5,main_criticalEdge.12
	j       main_logicalOr.12

main_afterIfBBlock.24:
	mv      s11,s8
	j       main_returnBBlock.8

main_returnBBlock.8:
	li      a0,12
	call    __malloc
	mv      s8,a0
	sw      s11,0(s8)
	li      a5,0
	addi    t6,s8,4
	sw      a5,4(s8)
	addi    t6,s8,8
	addi    t6,s11,-4
	lw      s11,-4(s11)
	sw      s11,8(s8)
	lw      s11,8(s10)
	lw      s9,4(s10)
	sub     t6,s11,s9
	lw      s11,8(s8)
	lw      s4,4(s8)
	sub     s1,s11,s4
	blt     t6,s1,main_thenBodyBBlock.13
	j       main_afterIfBBlock.13

main_forCondBBlock.11:
	blt     t6,s8,main_forBodyBBlock.11
	j       main_afterForBBlock.11

main_forBodyBBlock.11:
	slli    a5,t6,2
	add     a1,s11,a5
	lw      a3,0(s9)
	add     a5,s0,t6
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       main_forCondBBlock.11

main_afterForBBlock.11:
	j       main_returnBBlock.8

main_forCondBBlock.12:
	blt     t6,s4,main_forBodyBBlock.12
	j       main_afterForBBlock.12

main_forBodyBBlock.12:
	slli    a5,t6,2
	add     a3,s11,a5
	add     a5,s7,t6
	slli    a5,a5,2
	add     a5,s5,a5
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       main_forCondBBlock.12

main_afterForBBlock.12:
	j       main_returnBBlock.8

main_thenBodyBBlock.25:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.25

main_afterIfBBlock.25:
	lw      s6,0(s9)
	addi    t6,s0,0
	slli    t6,t6,2
	add     t6,s6,t6
	lw      a5,0(t6)
	lw      t6,40(sp)
	blt     t6,a5,main_thenBodyBBlock.24
	j       main_elseBodyBBlock.2

main_logicalOr.10:
	lw      t6,8(s11)
	slt     t6,a3,t6
	j       main_afterLogicalOr.10

main_afterLogicalOr.10:
	bne     t6,zero,main_thenBodyBBlock.25
	j       main_afterIfBBlock.25

main_thenBodyBBlock.26:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.26

main_afterIfBBlock.26:
	mv      a0,s1
	mv      a1,s9
	call    merge
	mv      s9,a0
	li      a0,12
	call    __malloc
	mv      s1,a0
	sw      s9,0(s1)
	li      a5,0
	addi    t6,s1,4
	sw      a5,4(s1)
	addi    t6,s1,8
	addi    t6,s9,-4
	lw      t6,-4(s9)
	sw      t6,8(s1)
	lw      t6,8(s11)
	lw      s9,4(s11)
	sub     t6,t6,s9
	lw      a5,8(s1)
	lw      s7,4(s1)
	sub     s4,a5,s7
	blt     t6,s4,main_thenBodyBBlock.27
	j       main_afterIfBBlock.27

main_logicalOr.11:
	lw      t6,8(s1)
	slt     t6,a5,t6
	j       main_afterLogicalOr.11

main_afterLogicalOr.11:
	bne     t6,zero,main_thenBodyBBlock.26
	j       main_afterIfBBlock.26

main_thenBodyBBlock.27:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.27

main_afterIfBBlock.27:
	li      t6,0
	j       main_forCondBBlock.13

main_forCondBBlock.13:
	blt     t6,s4,main_forBodyBBlock.13
	j       main_afterForBBlock.13

main_forBodyBBlock.13:
	lw      a3,0(s11)
	add     a5,s9,t6
	slli    a5,a5,2
	add     a1,a3,a5
	lw      a3,0(s1)
	add     a5,s7,t6
	slli    a5,a5,2
	add     a5,a3,a5
	lw      a5,0(a5)
	sw      a5,0(a1)
	addi    t6,t6,1
	j       main_forCondBBlock.13

main_afterForBBlock.13:
	j       main_afterIfBBlock.24

main_thenBodyBBlock.28:
    la      a0,.str.0
	call    __println
	j       main_afterIfBBlock.28

main_afterIfBBlock.28:
	mv      a0,s1
	mv      a1,s9
	call    merge
	mv      s9,a0
	li      a0,12
	call    __malloc
	mv      s7,a0
	sw      s9,0(s7)
	li      t6,0
	addi    a5,s7,4
	sw      t6,4(s7)
	addi    t6,s7,8
	addi    t6,s9,-4
	lw      t6,-4(s9)
	sw      t6,8(s7)
	lw      t6,8(s11)
	lw      s1,4(s11)
	sub     a5,t6,s1
	lw      t6,8(s7)
	lw      s4,4(s7)
	sub     s9,t6,s4
	blt     a5,s9,main_thenBodyBBlock.29
	j       main_afterIfBBlock.29

main_logicalOr.12:
	lw      t6,8(s9)
	slt     t6,a5,t6
	j       main_afterLogicalOr.12

main_afterLogicalOr.12:
	bne     t6,zero,main_thenBodyBBlock.28
	j       main_afterIfBBlock.28

main_thenBodyBBlock.29:
    la      a0,.str.1
	call    __println
	j       main_afterIfBBlock.29

main_afterIfBBlock.29:
	li      t6,0
	j       main_forCondBBlock.14

main_forCondBBlock.14:
	blt     t6,s9,main_forBodyBBlock.14
	j       main_afterForBBlock.14

main_forBodyBBlock.14:
	lw      a3,0(s11)
	add     a5,s1,t6
	slli    a5,a5,2
	add     a3,a3,a5
	lw      a1,0(s7)
	add     a5,s4,t6
	slli    a5,a5,2
	add     a5,a1,a5
	lw      a5,0(a5)
	sw      a5,0(a3)
	addi    t6,t6,1
	j       main_forCondBBlock.14

main_afterForBBlock.14:
	j       main_afterIfBBlock.24

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
	addi    t6,zero,1
	j       main_afterLogicalOr.4

main_criticalEdge.5:
	addi    t6,zero,1
	j       main_afterLogicalOr.5

main_criticalEdge.6:
	addi    s11,zero,1
	j       main_afterLogicalOr.6

main_criticalEdge.7:
	addi    t6,zero,1
	j       main_afterLogicalOr.7

main_criticalEdge.8:
	addi    s11,zero,1
	j       main_afterLogicalOr.8

main_criticalEdge.9:
	addi    s11,zero,1
	j       main_afterLogicalOr.9

main_criticalEdge.10:
	addi    t6,zero,1
	j       main_afterLogicalOr.10

main_criticalEdge.11:
	addi    t6,zero,1
	j       main_afterLogicalOr.11

main_criticalEdge.12:
	addi    t6,zero,1
	j       main_afterLogicalOr.12


