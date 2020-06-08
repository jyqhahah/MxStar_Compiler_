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
	mv      s0,s4
	li      a0,20
	call    __malloc
	li      s4,4
	sw      s4,0(a0)
	addi    s4,a0,4
	mv      s1,s4
	li      a0,44
	call    __malloc
	li      s4,5
	sw      s4,0(a0)
	addi    s4,a0,4
	li      t1,0
	mv      s2,t1
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	li      t1,4
	blt     s2,t1,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    t1,s2,2
	add     s3,s1,t1
	li      a0,48
	call    __malloc
	li      t1,11
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,0(s3)
	addi    t1,s2,1
	mv      s2,t1
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	li      t1,0
	j       main_forCondBBlock.1

main_forCondBBlock.1:
	li      t0,4
	blt     t1,t0,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	li      t0,0
	j       main_forCondBBlock.2

main_afterForBBlock.1:
	li      t1,0
	mv      s2,t1
	j       main_forCondBBlock.3

main_forCondBBlock.2:
	li      a4,10
	blt     t0,a4,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	slli    a4,t1,2
	add     a4,s1,a4
	lw      a0,0(a4)
	slli    a4,t0,2
	add     a4,a0,a4
	li      a0,888
	sw      a0,0(a4)
	addi    t0,t0,1
	j       main_forCondBBlock.2

main_afterForBBlock.2:
	addi    t1,t1,1
	j       main_forCondBBlock.1

main_forCondBBlock.3:
	li      t1,5
	blt     s2,t1,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	slli    t1,s2,2
	add     s3,s4,t1
	li      a0,8
	call    __malloc
	sw      a0,0(s3)
	li      t1,-1
	sw      t1,0(a0)
	addi    t1,s2,1
	mv      s2,t1
	j       main_forCondBBlock.3

main_afterForBBlock.3:
	addi    t1,s1,12
	lw      t0,12(s1)
	addi    t1,t0,36
	lw      a0,36(t0)
	call    __printlnInt
	li      t1,0
	j       main_forCondBBlock.4

main_forCondBBlock.4:
	li      t0,3
	ble     t1,t0,main_forBodyBBlock.4
	j       main_afterForBBlock.4

main_forBodyBBlock.4:
	li      t0,0
	j       main_forCondBBlock.5

main_afterForBBlock.4:
	li      t1,0
	mv      s3,t1
	j       main_forCondBBlock.6

main_forCondBBlock.5:
	li      a4,9
	ble     t0,a4,main_forBodyBBlock.5
	j       main_afterForBBlock.5

main_forBodyBBlock.5:
	slli    a4,t1,2
	add     a4,s1,a4
	lw      a0,0(a4)
	slli    a4,t0,2
	add     a4,a0,a4
	li      a0,10
	mul     a0,t1,a0
	add     a0,a0,t0
	sw      a0,0(a4)
	addi    t0,t0,1
	j       main_forCondBBlock.5

main_afterForBBlock.5:
	addi    t1,t1,1
	j       main_forCondBBlock.4

main_forCondBBlock.6:
	li      t1,3
	ble     s3,t1,main_forBodyBBlock.6
	j       main_afterForBBlock.6

main_forBodyBBlock.6:
	li      t1,0
	mv      s2,t1
	j       main_forCondBBlock.7

main_afterForBBlock.6:
	addi    t1,s1,8
	lw      s1,8(s1)
	li      t1,0
	addi    t0,s1,40
	sw      t1,40(s1)
	li      a0,0
	call    __printlnInt
	lw      t1,0(s4)
	li      t0,-2
	sw      t0,0(t1)
	lw      s1,40(s1)
	slli    s1,s1,2
	add     s1,s4,s1
	lw      s1,0(s1)
	li      t0,-10
	sw      t0,0(s1)
	lw      a0,0(t1)
	call    __printlnInt
	addi    t1,s4,4
	lw      s4,4(s4)
	lw      a0,0(s4)
	call    __printlnInt
	li      a0,0
	mv      s4,s0
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

main_forCondBBlock.7:
	li      t1,9
	ble     s2,t1,main_forBodyBBlock.7
	j       main_afterForBBlock.7

main_forBodyBBlock.7:
	slli    t1,s3,2
	add     t1,s1,t1
	lw      t0,0(t1)
	slli    t1,s2,2
	add     t1,t0,t1
	lw      a0,0(t1)
	call    __printlnInt
	addi    t1,s2,1
	mv      s2,t1
	j       main_forCondBBlock.7

main_afterForBBlock.7:
	addi    t1,s3,1
	mv      s3,t1
	j       main_forCondBBlock.6


