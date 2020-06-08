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
	li      a0,20
	call    __malloc
	li      a5,4
	sw      a5,0(a0)
	addi    a0,a0,4
	mv      s3,a0
	li      a0,44
	call    __malloc
	li      a5,5
	sw      a5,0(a0)
	addi    a0,a0,4
	mv      s1,a0
	li      a0,0
	mv      s0,a0
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	li      a0,4
	blt     s0,a0,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    a0,s0,2
	add     s4,s3,a0
	li      a0,48
	call    __malloc
	li      a5,11
	sw      a5,0(a0)
	addi    a0,a0,4
	sw      a0,0(s4)
	addi    a0,s0,1
	mv      s0,a0
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	li      a0,0
	j       main_forCondBBlock.1

main_forCondBBlock.1:
	li      a5,4
	blt     a0,a5,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	li      a5,0
	j       main_forCondBBlock.2

main_afterForBBlock.1:
	li      a0,0
	mv      s4,a0
	j       main_forCondBBlock.3

main_forCondBBlock.2:
	li      a7,10
	blt     a5,a7,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	slli    a7,a0,2
	add     a7,s3,a7
	lw      a7,0(a7)
	slli    t3,a5,2
	add     t3,a7,t3
	li      a7,888
	sw      a7,0(t3)
	addi    a5,a5,1
	j       main_forCondBBlock.2

main_afterForBBlock.2:
	addi    a0,a0,1
	j       main_forCondBBlock.1

main_forCondBBlock.3:
	li      a0,5
	blt     s4,a0,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	slli    a0,s4,2
	add     s0,s1,a0
	li      a0,8
	call    __malloc
	sw      a0,0(s0)
	li      a5,-1
	sw      a5,0(a0)
	addi    a0,s4,1
	mv      s4,a0
	j       main_forCondBBlock.3

main_afterForBBlock.3:
	addi    a0,s3,12
	lw      a5,12(s3)
	addi    a0,a5,36
	lw      a0,36(a5)
	call    __toString
	call    __println
	li      a0,0
	j       main_forCondBBlock.4

main_forCondBBlock.4:
	li      a5,3
	ble     a0,a5,main_forBodyBBlock.4
	j       main_afterForBBlock.4

main_forBodyBBlock.4:
	li      a5,0
	j       main_forCondBBlock.5

main_afterForBBlock.4:
	li      a0,0
	mv      s0,a0
	j       main_forCondBBlock.6

main_forCondBBlock.5:
	li      a7,9
	ble     a5,a7,main_forBodyBBlock.5
	j       main_afterForBBlock.5

main_forBodyBBlock.5:
	slli    a7,a0,2
	add     a7,s3,a7
	lw      a7,0(a7)
	slli    t3,a5,2
	add     a7,a7,t3
	li      t3,10
	mul     t3,a0,t3
	add     t3,t3,a5
	sw      t3,0(a7)
	addi    a5,a5,1
	j       main_forCondBBlock.5

main_afterForBBlock.5:
	addi    a0,a0,1
	j       main_forCondBBlock.4

main_forCondBBlock.6:
	li      a0,3
	ble     s0,a0,main_forBodyBBlock.6
	j       main_afterForBBlock.6

main_forBodyBBlock.6:
	li      a0,0
	mv      s4,a0
	j       main_forCondBBlock.7

main_afterForBBlock.6:
	addi    a0,s3,8
	lw      s3,8(s3)
	li      a0,0
	addi    a5,s3,40
	sw      a0,40(s3)
	li      a0,0
	call    __toString
	call    __println
	mv      a0,s1
	lw      a0,0(s1)
	li      a5,-2
	sw      a5,0(a0)
	lw      a5,40(s3)
	slli    a5,a5,2
	add     a5,s1,a5
	lw      a5,0(a5)
	li      a7,-10
	sw      a7,0(a5)
	lw      a0,0(a0)
	call    __toString
	call    __println
	addi    a0,s1,4
	lw      a0,4(s1)
	lw      a0,0(a0)
	call    __toString
	call    __println
	li      a0,0
	mv      s4,s2
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

main_forCondBBlock.7:
	li      a0,9
	ble     s4,a0,main_forBodyBBlock.7
	j       main_afterForBBlock.7

main_forBodyBBlock.7:
	slli    a0,s0,2
	add     a0,s3,a0
	lw      a0,0(a0)
	slli    a5,s4,2
	add     a0,a0,a5
	lw      a0,0(a0)
	call    __toString
	call    __println
	addi    a0,s4,1
	mv      s4,a0
	j       main_forCondBBlock.7

main_afterForBBlock.7:
	addi    a0,s0,1
	mv      s0,a0
	j       main_forCondBBlock.6


