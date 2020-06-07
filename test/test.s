	.data

	.globl  .str.0
.str.0:
	.asciz  "Four score and seven years ago"

	.globl  .str.1
.str.1:
	.asciz  "HongKong"

	.globl  .str.2
.str.2:
	.asciz  "naive!\n"

	.globl  .str.3
.str.3:
	.asciz  "fast!\n"

	.globl  .str.4
.str.4:
	.asciz  "too young\\too simple."

	.globl  .str.5
.str.5:
	.asciz  "wukefengggao\n"

	.globl  .str.6
.str.6:
	.asciz  "Four score and seven years ago\n\\\""

	.globl  .str.7
.str.7:
	.asciz  "too young!\\"

	.globl  .str.8
.str.8:
	.asciz  "test"


	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
    la      t1,.str.0
    la      t1,.str.5
	li      a0,4
	call    __malloc
	li      a0,28
	call    __malloc
	li      t1,3
	sw      t1,0(a0)
	addi    s11,a0,4
	li      a0,12
	call    __malloc
	li      t1,1
	sw      t1,0(a0)
	addi    s6,a0,4
	addi    s8,s6,4
	mv      s5,s6
	j       main_creatorCondBlock.0

main_creatorCondBlock.0:
	bne     s5,s8,main_creatorBodyBlock.0
	j       main_afterCreatorBlock.0

main_creatorBodyBlock.0:
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    s3,a0,4
	addi    s4,s3,8
	mv      s10,s3
	j       main_creatorCondBlock.1

main_afterCreatorBlock.0:
	li      a0,12
	call    __malloc
	mv      s5,a0
    la      t1,.str.6
	lw      t1,8(s11)
	lw      t1,4(s6)
	lw      t1,8(t1)
	lw      t1,12(t1)
	li      a0,12
	call    __malloc
	li      t1,0
	j       main_forCondBBlock.3

main_creatorCondBlock.1:
	bne     s10,s4,main_creatorBodyBlock.1
	j       main_afterCreatorBlock.1

main_creatorBodyBlock.1:
	li      a0,28
	call    __malloc
	li      t1,3
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,0(s10)
	addi    s10,s10,4
	j       main_creatorCondBlock.1

main_afterCreatorBlock.1:
	sw      s3,0(s5)
	addi    s5,s5,4
	j       main_creatorCondBlock.0

main_forCondBBlock.0:
	li      t1,3
	blt     t6,t1,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    t1,t6,2
	add     t1,s11,t1
	lw      t3,0(t1)
	li      ra,0
	j       main_forCondBBlock.4

main_afterForBBlock.0:
	mv      t1,zero
	mv      t3,zero
	mv      t1,zero
	li      ra,0
	li      t6,0
	j       main_forCondBBlock.1

main_forCondBBlock.1:
	li      t1,3
	blt     t6,t1,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    t1,t6,2
	add     t1,s11,t1
	lw      t3,0(t1)
	li      ra,0
	j       main_forCondBBlock.5

main_afterForBBlock.1:
	j       main_forCondBBlock.2

main_forCondBBlock.2:
	j       main_forCondBBlock.2

main_forCondBBlock.3:
	lw      t3,0(zero)
	blt     t1,t3,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	lw      t3,4(a0)
	addi    t3,t3,1
	sw      t3,4(a0)
	addi    t1,t1,1
	j       main_forCondBBlock.3

main_afterForBBlock.3:
	mv      t1,zero
	mv      t3,zero
	mv      t1,zero
	li      ra,0
	li      t6,0
	j       main_forCondBBlock.0

main_forCondBBlock.4:
	lw      t1,0(t3)
	blt     ra,t1,main_forBodyBBlock.4
	j       main_afterForBBlock.4

main_forBodyBBlock.4:
	lw      t1,4(s5)
	addi    t1,t1,1
	sw      t1,4(s5)
	addi    ra,ra,1
	j       main_forCondBBlock.4

main_afterForBBlock.4:
	addi    t6,t6,1
	mv      t1,s5
	mv      t1,s5
	j       main_forCondBBlock.0

main_forCondBBlock.5:
	lw      t1,0(t3)
	blt     ra,t1,main_forBodyBBlock.5
	j       main_afterForBBlock.5

main_forBodyBBlock.5:
	lw      t1,4(s5)
	addi    t1,t1,1
	sw      t1,4(s5)
	addi    ra,ra,1
	j       main_forCondBBlock.5

main_afterForBBlock.5:
	addi    t6,t6,1
	mv      t1,s5
	mv      t1,s5
	j       main_forCondBBlock.1


