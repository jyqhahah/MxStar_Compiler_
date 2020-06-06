	.data

	.globl  .str.0
.str.0:
	.asciz  "no solution!\n"


	.text

	.globl  check
	.p2align	2
	.type   check, @function
check:
	blt     a0,a1,check_logicalAnd.0
	j       check_criticalEdge.0

check_logicalAnd.0:
	slti    a0,a0,0
	xori    a0,a0,1
	j       check_afterLogicalAnd.0

check_afterLogicalAnd.0:
	jr      ra

check_criticalEdge.0:
	mv      a0,zero
	j       check_afterLogicalAnd.0


	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-64
	sw      ra,60(sp)
	sw      s0,56(sp)
	sw      s1,52(sp)
	sw      s2,48(sp)
	sw      s3,44(sp)
	sw      s4,40(sp)
	sw      s5,36(sp)
	sw      s6,32(sp)
	sw      s7,28(sp)
	sw      s8,24(sp)
	sw      s9,20(sp)
	sw      s10,16(sp)
	sw      s11,12(sp)
	call    __init__
	call    __getInt
	mv      s10,a0
	addi    s4,s10,-1
	addi    s11,s10,-1
	mul     s1,s10,s10
	li      t0,4
	mul     t0,t0,s1
	addi    a0,t0,4
	call    __malloc
	sw      s1,0(a0)
	addi    s3,a0,4
	li      t0,0
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	mul     a2,s10,s10
	blt     t0,a2,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    a2,t0,2
	add     a2,s3,a2
	li      s1,0
	sw      s1,0(a2)
	addi    t0,t0,1
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	mul     s1,s10,s10
	li      t0,4
	mul     t0,t0,s1
	addi    a0,t0,4
	call    __malloc
	sw      s1,0(a0)
	addi    s6,a0,4
	li      t0,0
	j       main_forCondBBlock.1

main_forCondBBlock.1:
	mul     a2,s10,s10
	blt     t0,a2,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    a2,t0,2
	add     s1,s6,a2
	li      a2,0
	sw      a2,0(s1)
	addi    t0,t0,1
	j       main_forCondBBlock.1

main_afterForBBlock.1:
	li      t0,4
	mul     t0,t0,s10
	addi    a0,t0,4
	call    __malloc
	sw      s10,0(a0)
	addi    t0,a0,4
	mv      s0,t0
	li      s1,0
	j       main_forCondBBlock.2

main_forCondBBlock.2:
	blt     s1,s10,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	slli    t0,s1,2
	add     s2,s0,t0
	li      t0,4
	mul     t0,t0,s10
	addi    a0,t0,4
	call    __malloc
	sw      s10,0(a0)
	addi    t0,a0,4
	sw      t0,0(s2)
	li      t0,0
	j       main_forCondBBlock.3

main_afterForBBlock.2:
	li      t0,0
	sw      t0,0(s3)
	li      t0,0
	sw      t0,0(s6)
	lw      t0,0(s0)
	li      a2,0
	sw      a2,0(t0)
	li      t0,0
	mv      s2,t0
	li      t0,0
	mv      s9,t0
	li      t0,0
	mv      s8,t0
	j       main_whileCondBBlock.0

main_forCondBBlock.3:
	blt     t0,s10,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	slli    a2,s1,2
	add     a2,s0,a2
	lw      a2,0(a2)
	slli    a4,t0,2
	add     a4,a2,a4
	li      a2,-1
	sw      a2,0(a4)
	addi    t0,t0,1
	j       main_forCondBBlock.3

main_afterForBBlock.3:
	addi    s1,s1,1
	j       main_forCondBBlock.2

main_whileCondBBlock.0:
	ble     s2,s9,main_whileBodyBBlock.0
	j       main_criticalEdge.0

main_whileBodyBBlock.0:
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	slli    t0,t0,2
	add     t0,s0,t0
	lw      t0,0(t0)
	slli    a2,s2,2
	add     a2,s6,a2
	lw      a2,0(a2)
	slli    a2,a2,2
	add     t0,t0,a2
	lw      s1,0(t0)
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	addi    s5,t0,-1
	slli    t0,s2,2
	add     t0,s6,t0
	lw      t0,0(t0)
	addi    s7,t0,-2
	mv      a0,s5
	mv      a1,s10
	call    check
	bne     a0,zero,main_logicalAnd.0
	j       main_criticalEdge.2

main_afterWhileBBlock.0:
	li      t0,1
	beq     a2,t0,main_thenBodyBBlock.17
	j       main_elseBodyBBlock.0

main_thenBodyBBlock.0:
	addi    a2,s9,1
	slli    t0,a2,2
	add     t0,s3,t0
	sw      s5,0(t0)
	slli    t0,a2,2
	add     t0,s6,t0
	sw      s7,0(t0)
	slli    t0,s5,2
	add     t0,s0,t0
	lw      a4,0(t0)
	slli    t0,s7,2
	add     t0,a4,t0
	addi    a4,s1,1
	sw      a4,0(t0)
	beq     s5,s4,main_logicalAnd.2
	j       main_criticalEdge.5

main_afterIfBBlock.0:
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	addi    s9,t0,-1
	slli    t0,s2,2
	add     t0,s6,t0
	lw      t0,0(t0)
	addi    s7,t0,2
	mv      a0,s9
	mv      a1,s10
	call    check
	bne     a0,zero,main_logicalAnd.3
	j       main_criticalEdge.7

main_logicalAnd.0:
	mv      a0,s7
	mv      a1,s10
	call    check
	j       main_afterLogicalAnd.0

main_afterLogicalAnd.0:
	bne     a0,zero,main_logicalAnd.1
	j       main_criticalEdge.3

main_logicalAnd.1:
	slli    t0,s5,2
	add     t0,s0,t0
	lw      t0,0(t0)
	slli    a2,s7,2
	add     t0,t0,a2
	lw      t0,0(t0)
	xori    t0,t0,-1
	seqz    t0,t0
	j       main_afterLogicalAnd.1

main_afterLogicalAnd.1:
	bne     t0,zero,main_thenBodyBBlock.0
	j       main_criticalEdge.1

main_thenBodyBBlock.1:
	li      s5,1
	j       main_afterIfBBlock.1

main_afterIfBBlock.1:
	sw      a2,8(sp)
	j       main_afterIfBBlock.0

main_logicalAnd.2:
	xor     t0,s7,s11
	seqz    t0,t0
	j       main_afterLogicalAnd.2

main_afterLogicalAnd.2:
	bne     t0,zero,main_thenBodyBBlock.1
	j       main_criticalEdge.4

main_thenBodyBBlock.2:
	lw      t0,8(sp)
	addi    t0,t0,1
	slli    a2,t0,2
	add     a2,s3,a2
	sw      s9,0(a2)
	slli    a2,t0,2
	add     a2,s6,a2
	sw      s7,0(a2)
	slli    a2,s9,2
	add     a2,s0,a2
	lw      a2,0(a2)
	slli    a4,s7,2
	add     a2,a2,a4
	addi    a4,s1,1
	sw      a4,0(a2)
	beq     s9,s4,main_logicalAnd.5
	j       main_criticalEdge.10

main_afterIfBBlock.2:
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	addi    s7,t0,1
	slli    t0,s2,2
	add     t0,s6,t0
	lw      t0,0(t0)
	addi    s5,t0,-2
	mv      a0,s7
	mv      a1,s10
	call    check
	bne     a0,zero,main_logicalAnd.6
	j       main_criticalEdge.12

main_logicalAnd.3:
	mv      a0,s7
	mv      a1,s10
	call    check
	j       main_afterLogicalAnd.3

main_afterLogicalAnd.3:
	bne     a0,zero,main_logicalAnd.4
	j       main_criticalEdge.8

main_logicalAnd.4:
	slli    t0,s9,2
	add     t0,s0,t0
	lw      a2,0(t0)
	slli    t0,s7,2
	add     t0,a2,t0
	lw      t0,0(t0)
	xori    t0,t0,-1
	seqz    t0,t0
	j       main_afterLogicalAnd.4

main_afterLogicalAnd.4:
	bne     t0,zero,main_thenBodyBBlock.2
	j       main_criticalEdge.6

main_thenBodyBBlock.3:
	li      s5,1
	j       main_afterIfBBlock.3

main_afterIfBBlock.3:
	mv      s9,t0
	sw      s5,4(sp)
	j       main_afterIfBBlock.2

main_logicalAnd.5:
	xor     a2,s7,s11
	seqz    a2,a2
	j       main_afterLogicalAnd.5

main_afterLogicalAnd.5:
	bne     a2,zero,main_thenBodyBBlock.3
	j       main_criticalEdge.9

main_thenBodyBBlock.4:
	addi    a2,s9,1
	slli    t0,a2,2
	add     t0,s3,t0
	sw      s7,0(t0)
	slli    t0,a2,2
	add     t0,s6,t0
	sw      s5,0(t0)
	slli    t0,s7,2
	add     t0,s0,t0
	lw      t0,0(t0)
	slli    a4,s5,2
	add     a4,t0,a4
	addi    t0,s1,1
	sw      t0,0(a4)
	beq     s7,s4,main_logicalAnd.8
	j       main_criticalEdge.15

main_afterIfBBlock.4:
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	addi    s5,t0,1
	slli    t0,s2,2
	add     t0,s6,t0
	lw      t0,0(t0)
	addi    s9,t0,2
	mv      a0,s5
	mv      a1,s10
	call    check
	bne     a0,zero,main_logicalAnd.9
	j       main_criticalEdge.17

main_logicalAnd.6:
	mv      a0,s5
	mv      a1,s10
	call    check
	j       main_afterLogicalAnd.6

main_afterLogicalAnd.6:
	bne     a0,zero,main_logicalAnd.7
	j       main_criticalEdge.13

main_logicalAnd.7:
	slli    t0,s7,2
	add     t0,s0,t0
	lw      a2,0(t0)
	slli    t0,s5,2
	add     t0,a2,t0
	lw      t0,0(t0)
	xori    t0,t0,-1
	seqz    t0,t0
	j       main_afterLogicalAnd.7

main_afterLogicalAnd.7:
	bne     t0,zero,main_thenBodyBBlock.4
	j       main_criticalEdge.11

main_thenBodyBBlock.5:
	li      t0,1
	j       main_afterIfBBlock.5

main_afterIfBBlock.5:
	mv      s8,a2
	mv      s7,t0
	j       main_afterIfBBlock.4

main_logicalAnd.8:
	xor     t0,s5,s11
	seqz    t0,t0
	j       main_afterLogicalAnd.8

main_afterLogicalAnd.8:
	bne     t0,zero,main_thenBodyBBlock.5
	j       main_criticalEdge.14

main_thenBodyBBlock.6:
	addi    t0,s8,1
	slli    a2,t0,2
	add     a2,s3,a2
	sw      s5,0(a2)
	slli    a2,t0,2
	add     a2,s6,a2
	sw      s9,0(a2)
	slli    a2,s5,2
	add     a2,s0,a2
	lw      a2,0(a2)
	slli    a4,s9,2
	add     a2,a2,a4
	addi    a4,s1,1
	sw      a4,0(a2)
	beq     s5,s4,main_logicalAnd.11
	j       main_criticalEdge.20

main_afterIfBBlock.6:
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	addi    s7,t0,-2
	slli    t0,s2,2
	add     t0,s6,t0
	lw      t0,0(t0)
	addi    s9,t0,-1
	mv      a0,s7
	mv      a1,s10
	call    check
	bne     a0,zero,main_logicalAnd.12
	j       main_criticalEdge.22

main_logicalAnd.9:
	mv      a0,s9
	mv      a1,s10
	call    check
	j       main_afterLogicalAnd.9

main_afterLogicalAnd.9:
	bne     a0,zero,main_logicalAnd.10
	j       main_criticalEdge.18

main_logicalAnd.10:
	slli    t0,s5,2
	add     t0,s0,t0
	lw      a2,0(t0)
	slli    t0,s9,2
	add     t0,a2,t0
	lw      t0,0(t0)
	xori    t0,t0,-1
	seqz    t0,t0
	j       main_afterLogicalAnd.10

main_afterLogicalAnd.10:
	bne     t0,zero,main_thenBodyBBlock.6
	j       main_criticalEdge.16

main_thenBodyBBlock.7:
	li      a2,1
	j       main_afterIfBBlock.7

main_afterIfBBlock.7:
	mv      s8,t0
	mv      s5,a2
	j       main_afterIfBBlock.6

main_logicalAnd.11:
	xor     a2,s9,s11
	seqz    a2,a2
	j       main_afterLogicalAnd.11

main_afterLogicalAnd.11:
	bne     a2,zero,main_thenBodyBBlock.7
	j       main_criticalEdge.19

main_thenBodyBBlock.8:
	addi    a2,s8,1
	slli    t0,a2,2
	add     t0,s3,t0
	sw      s7,0(t0)
	slli    t0,a2,2
	add     t0,s6,t0
	sw      s9,0(t0)
	slli    t0,s7,2
	add     t0,s0,t0
	lw      a4,0(t0)
	slli    t0,s9,2
	add     a4,a4,t0
	addi    t0,s1,1
	sw      t0,0(a4)
	beq     s7,s4,main_logicalAnd.14
	j       main_criticalEdge.25

main_afterIfBBlock.8:
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	addi    s5,t0,-2
	slli    t0,s2,2
	add     t0,s6,t0
	lw      t0,0(t0)
	addi    s7,t0,1
	mv      a0,s5
	mv      a1,s10
	call    check
	bne     a0,zero,main_logicalAnd.15
	j       main_criticalEdge.27

main_logicalAnd.12:
	mv      a0,s9
	mv      a1,s10
	call    check
	j       main_afterLogicalAnd.12

main_afterLogicalAnd.12:
	bne     a0,zero,main_logicalAnd.13
	j       main_criticalEdge.23

main_logicalAnd.13:
	slli    t0,s7,2
	add     t0,s0,t0
	lw      a2,0(t0)
	slli    t0,s9,2
	add     t0,a2,t0
	lw      t0,0(t0)
	xori    t0,t0,-1
	seqz    t0,t0
	j       main_afterLogicalAnd.13

main_afterLogicalAnd.13:
	bne     t0,zero,main_thenBodyBBlock.8
	j       main_criticalEdge.21

main_thenBodyBBlock.9:
	li      t0,1
	j       main_afterIfBBlock.9

main_afterIfBBlock.9:
	mv      s9,a2
	mv      s8,t0
	j       main_afterIfBBlock.8

main_logicalAnd.14:
	xor     t0,s9,s11
	seqz    t0,t0
	j       main_afterLogicalAnd.14

main_afterLogicalAnd.14:
	bne     t0,zero,main_thenBodyBBlock.9
	j       main_criticalEdge.24

main_thenBodyBBlock.10:
	addi    t0,s9,1
	slli    a2,t0,2
	add     a2,s3,a2
	sw      s5,0(a2)
	slli    a2,t0,2
	add     a2,s6,a2
	sw      s7,0(a2)
	slli    a2,s5,2
	add     a2,s0,a2
	lw      a4,0(a2)
	slli    a2,s7,2
	add     a4,a4,a2
	addi    a2,s1,1
	sw      a2,0(a4)
	beq     s5,s4,main_logicalAnd.17
	j       main_criticalEdge.30

main_afterIfBBlock.10:
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	addi    s9,t0,2
	slli    t0,s2,2
	add     t0,s6,t0
	lw      t0,0(t0)
	addi    s7,t0,-1
	mv      a0,s9
	mv      a1,s10
	call    check
	bne     a0,zero,main_logicalAnd.18
	j       main_criticalEdge.32

main_logicalAnd.15:
	mv      a0,s7
	mv      a1,s10
	call    check
	j       main_afterLogicalAnd.15

main_afterLogicalAnd.15:
	bne     a0,zero,main_logicalAnd.16
	j       main_criticalEdge.28

main_logicalAnd.16:
	slli    t0,s5,2
	add     t0,s0,t0
	lw      t0,0(t0)
	slli    a2,s7,2
	add     t0,t0,a2
	lw      t0,0(t0)
	xori    t0,t0,-1
	seqz    t0,t0
	j       main_afterLogicalAnd.16

main_afterLogicalAnd.16:
	bne     t0,zero,main_thenBodyBBlock.10
	j       main_criticalEdge.26

main_thenBodyBBlock.11:
	li      a2,1
	j       main_afterIfBBlock.11

main_afterIfBBlock.11:
	mv      s5,t0
	mv      s8,a2
	j       main_afterIfBBlock.10

main_logicalAnd.17:
	xor     a2,s7,s11
	seqz    a2,a2
	j       main_afterLogicalAnd.17

main_afterLogicalAnd.17:
	bne     a2,zero,main_thenBodyBBlock.11
	j       main_criticalEdge.29

main_thenBodyBBlock.12:
	addi    a2,s5,1
	slli    t0,a2,2
	add     t0,s3,t0
	sw      s9,0(t0)
	slli    t0,a2,2
	add     t0,s6,t0
	sw      s7,0(t0)
	slli    t0,s9,2
	add     t0,s0,t0
	lw      a4,0(t0)
	slli    t0,s7,2
	add     t0,a4,t0
	addi    a4,s1,1
	sw      a4,0(t0)
	beq     s9,s4,main_logicalAnd.20
	j       main_criticalEdge.35

main_afterIfBBlock.12:
	slli    t0,s2,2
	add     t0,s3,t0
	lw      t0,0(t0)
	addi    s7,t0,2
	slli    t0,s2,2
	add     t0,s6,t0
	lw      t0,0(t0)
	addi    s9,t0,1
	mv      a0,s7
	mv      a1,s10
	call    check
	bne     a0,zero,main_logicalAnd.21
	j       main_criticalEdge.37

main_logicalAnd.18:
	mv      a0,s7
	mv      a1,s10
	call    check
	j       main_afterLogicalAnd.18

main_afterLogicalAnd.18:
	bne     a0,zero,main_logicalAnd.19
	j       main_criticalEdge.33

main_logicalAnd.19:
	slli    t0,s9,2
	add     t0,s0,t0
	lw      t0,0(t0)
	slli    a2,s7,2
	add     t0,t0,a2
	lw      t0,0(t0)
	xori    t0,t0,-1
	seqz    t0,t0
	j       main_afterLogicalAnd.19

main_afterLogicalAnd.19:
	bne     t0,zero,main_thenBodyBBlock.12
	j       main_criticalEdge.31

main_thenBodyBBlock.13:
	li      t0,1
	j       main_afterIfBBlock.13

main_afterIfBBlock.13:
	mv      s5,a2
	mv      s8,t0
	j       main_afterIfBBlock.12

main_logicalAnd.20:
	xor     t0,s7,s11
	seqz    t0,t0
	j       main_afterLogicalAnd.20

main_afterLogicalAnd.20:
	bne     t0,zero,main_thenBodyBBlock.13
	j       main_criticalEdge.34

main_thenBodyBBlock.14:
	addi    a4,s5,1
	slli    t0,a4,2
	add     t0,s3,t0
	sw      s7,0(t0)
	slli    t0,a4,2
	add     t0,s6,t0
	sw      s9,0(t0)
	slli    t0,s7,2
	add     t0,s0,t0
	lw      t0,0(t0)
	slli    a2,s9,2
	add     t0,t0,a2
	addi    a2,s1,1
	sw      a2,0(t0)
	beq     s7,s4,main_logicalAnd.23
	j       main_criticalEdge.40

main_afterIfBBlock.14:
	li      t0,1
	beq     a2,t0,main_thenBodyBBlock.16
	j       main_afterIfBBlock.16

main_logicalAnd.21:
	mv      a0,s9
	mv      a1,s10
	call    check
	j       main_afterLogicalAnd.21

main_afterLogicalAnd.21:
	bne     a0,zero,main_logicalAnd.22
	j       main_criticalEdge.38

main_logicalAnd.22:
	slli    t0,s7,2
	add     t0,s0,t0
	lw      a2,0(t0)
	slli    t0,s9,2
	add     t0,a2,t0
	lw      t0,0(t0)
	xori    t0,t0,-1
	seqz    t0,t0
	j       main_afterLogicalAnd.22

main_afterLogicalAnd.22:
	bne     t0,zero,main_thenBodyBBlock.14
	j       main_criticalEdge.36

main_thenBodyBBlock.15:
	li      a2,1
	j       main_afterIfBBlock.15

main_afterIfBBlock.15:
	j       main_afterIfBBlock.14

main_logicalAnd.23:
	xor     t0,s9,s11
	seqz    t0,t0
	j       main_afterLogicalAnd.23

main_afterLogicalAnd.23:
	bne     t0,zero,main_thenBodyBBlock.15
	j       main_criticalEdge.39

main_thenBodyBBlock.16:
	j       main_afterWhileBBlock.0

main_afterIfBBlock.16:
	addi    t0,s2,1
	mv      s2,t0
	mv      s9,a4
	mv      s8,a2
	j       main_whileCondBBlock.0

main_thenBodyBBlock.17:
	slli    t0,s4,2
	add     t0,s0,t0
	lw      a2,0(t0)
	slli    t0,s11,2
	add     t0,a2,t0
	lw      a0,0(t0)
	call    __toString
	call    __print
	j       main_afterIfBBlock.17

main_elseBodyBBlock.0:
    la      a0,.str.0
	call    __print
	j       main_afterIfBBlock.17

main_afterIfBBlock.17:
	li      a0,0
	lw      s11,12(sp)
	lw      s10,16(sp)
	lw      s9,20(sp)
	lw      s8,24(sp)
	lw      s7,28(sp)
	lw      s6,32(sp)
	lw      s5,36(sp)
	lw      s4,40(sp)
	lw      s3,44(sp)
	lw      s2,48(sp)
	lw      s1,52(sp)
	lw      s0,56(sp)
	lw      ra,60(sp)
	addi    sp,sp,64
	jr      ra

main_criticalEdge.0:
	mv      a2,s8
	j       main_afterWhileBBlock.0

main_criticalEdge.1:
	mv      t0,s9
	sw      t0,8(sp)
	mv      s5,s8
	j       main_afterIfBBlock.0

main_criticalEdge.2:
	mv      a0,zero
	j       main_afterLogicalAnd.0

main_criticalEdge.3:
	mv      t0,zero
	j       main_afterLogicalAnd.1

main_criticalEdge.4:
	mv      s5,s8
	j       main_afterIfBBlock.1

main_criticalEdge.5:
	mv      t0,zero
	j       main_afterLogicalAnd.2

main_criticalEdge.6:
	lw      s9,8(sp)
	mv      t0,s5
	sw      t0,4(sp)
	j       main_afterIfBBlock.2

main_criticalEdge.7:
	mv      a0,zero
	j       main_afterLogicalAnd.3

main_criticalEdge.8:
	mv      t0,zero
	j       main_afterLogicalAnd.4

main_criticalEdge.9:
	j       main_afterIfBBlock.3

main_criticalEdge.10:
	mv      a2,zero
	j       main_afterLogicalAnd.5

main_criticalEdge.11:
	mv      s8,s9
	lw      t0,4(sp)
	mv      s7,t0
	j       main_afterIfBBlock.4

main_criticalEdge.12:
	mv      a0,zero
	j       main_afterLogicalAnd.6

main_criticalEdge.13:
	mv      t0,zero
	j       main_afterLogicalAnd.7

main_criticalEdge.14:
	lw      t0,4(sp)
	j       main_afterIfBBlock.5

main_criticalEdge.15:
	mv      t0,zero
	j       main_afterLogicalAnd.8

main_criticalEdge.16:
	mv      s5,s7
	j       main_afterIfBBlock.6

main_criticalEdge.17:
	mv      a0,zero
	j       main_afterLogicalAnd.9

main_criticalEdge.18:
	mv      t0,zero
	j       main_afterLogicalAnd.10

main_criticalEdge.19:
	mv      a2,s7
	j       main_afterIfBBlock.7

main_criticalEdge.20:
	mv      a2,zero
	j       main_afterLogicalAnd.11

main_criticalEdge.21:
	mv      s9,s8
	mv      s8,s5
	j       main_afterIfBBlock.8

main_criticalEdge.22:
	mv      a0,zero
	j       main_afterLogicalAnd.12

main_criticalEdge.23:
	mv      t0,zero
	j       main_afterLogicalAnd.13

main_criticalEdge.24:
	mv      t0,s5
	j       main_afterIfBBlock.9

main_criticalEdge.25:
	mv      t0,zero
	j       main_afterLogicalAnd.14

main_criticalEdge.26:
	mv      s5,s9
	j       main_afterIfBBlock.10

main_criticalEdge.27:
	mv      a0,zero
	j       main_afterLogicalAnd.15

main_criticalEdge.28:
	mv      t0,zero
	j       main_afterLogicalAnd.16

main_criticalEdge.29:
	mv      a2,s8
	j       main_afterIfBBlock.11

main_criticalEdge.30:
	mv      a2,zero
	j       main_afterLogicalAnd.17

main_criticalEdge.31:
	j       main_afterIfBBlock.12

main_criticalEdge.32:
	mv      a0,zero
	j       main_afterLogicalAnd.18

main_criticalEdge.33:
	mv      t0,zero
	j       main_afterLogicalAnd.19

main_criticalEdge.34:
	mv      t0,s8
	j       main_afterIfBBlock.13

main_criticalEdge.35:
	mv      t0,zero
	j       main_afterLogicalAnd.20

main_criticalEdge.36:
	mv      a4,s5
	mv      a2,s8
	j       main_afterIfBBlock.14

main_criticalEdge.37:
	mv      a0,zero
	j       main_afterLogicalAnd.21

main_criticalEdge.38:
	mv      t0,zero
	j       main_afterLogicalAnd.22

main_criticalEdge.39:
	mv      a2,s8
	j       main_afterIfBBlock.15

main_criticalEdge.40:
	mv      t0,zero
	j       main_afterLogicalAnd.23


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	jr      ra


