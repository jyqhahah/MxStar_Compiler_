	.data

	.globl  .str.0
.str.0:
	.asciz  " "

	.globl  .str.1
.str.1:
	.asciz  ""


	.text

	.globl  bubble_sort
	.p2align	2
	.type   bubble_sort, @function
bubble_sort:
	lw      a7,-4(a0)
	li      t4,0
	li      a3,0
	li      t2,0
	j       bubble_sort_forCondBlock.0

bubble_sort_forCondBlock.0:
	addi    a3,a7,-1
	blt     t4,a3,bubble_sort_forBodyBlock.0
	j       bubble_sort_afterForBlock.0

bubble_sort_forBodyBlock.0:
	li      a3,0
	j       bubble_sort_forCondBlock.1

bubble_sort_afterForBlock.0:
	jr      ra

bubble_sort_forCondBlock.1:
	sub     t5,a7,t4
	addi    t5,t5,-1
	blt     a3,t5,bubble_sort_forBodyBlock.1
	j       bubble_sort_afterForBlock.1

bubble_sort_forBodyBlock.1:
	slli    t5,a3,2
	add     t5,a0,t5
	lw      t5,0(t5)
	addi    t6,a3,1
	slli    t6,t6,2
	add     t6,a0,t6
	lw      t6,0(t6)
	blt     t5,t6,bubble_sort_thenBodyBlock.0
	j       bubble_sort_afterIfBlock.0

bubble_sort_forStepBlock.1:
	addi    a3,a3,1
	j       bubble_sort_forCondBlock.1

bubble_sort_afterForBlock.1:
	addi    t4,t4,1
	j       bubble_sort_forCondBlock.0

bubble_sort_thenBodyBlock.0:
	j       bubble_sort_forStepBlock.1

bubble_sort_afterIfBlock.0:
	slli    t2,a3,2
	add     t2,a0,t2
	lw      t2,0(t2)
	slli    t5,a3,2
	add     t6,a0,t5
	addi    t5,a3,1
	slli    t5,t5,2
	add     t5,a0,t5
	lw      t5,0(t5)
	sw      t5,0(t6)
	addi    t5,a3,1
	slli    t5,t5,2
	add     t5,a0,t5
	sw      t2,0(t5)
	j       bubble_sort_forStepBlock.1


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
	mv      s3,s4
	call    __init__
	call    __getInt
	mv      s0,a0
	li      t2,4
	mul     t2,t2,s0
	addi    a0,t2,4
	call    __malloc
	sw      s0,0(a0)
	addi    s2,a0,4
	li      t2,0
	mv      s1,t2
	j       main_forCondBlock.0

main_forCondBlock.0:
	blt     s1,s0,main_forBodyBlock.0
	j       main_afterForBlock.0

main_forBodyBlock.0:
	slli    t2,s1,2
	add     s4,s2,t2
	call    __getInt
	sw      a0,0(s4)
	addi    t2,s1,1
	mv      s1,t2
	j       main_forCondBlock.0

main_afterForBlock.0:
	mv      a0,s2
	call    bubble_sort
	li      s1,0
	j       main_forCondBlock.1

main_forCondBlock.1:
	blt     s1,s0,main_forBodyBlock.1
	j       main_afterForBlock.1

main_forBodyBlock.1:
	slli    t2,s1,2
	add     t2,s2,t2
	lw      a0,0(t2)
	call    __toString
	lui     t2,%hi(.str.0)
	addi    a1,t2,%lo(.str.0)
	call    __stringAdd
	call    __print
	addi    s1,s1,1
	j       main_forCondBlock.1

main_afterForBlock.1:
	lui     s0,%hi(.str.1)
	addi    a0,s0,%lo(.str.1)
	call    __println
	li      a0,0
	mv      s4,s3
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	jr      ra


