	.data

	.globl  .str.0
.str.0:
	.asciz  "no solution!\n"


	.text

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
	mv      s5,s8
	call    __getInt
	mv      s2,a0
	addi    s0,s2,-1
	addi    s6,s2,-1
	mul     s1,s2,s2
	li      a3,4
	mul     a3,a3,s1
	addi    a0,a3,4
	call    __malloc
	sw      s1,0(a0)
	addi    s3,a0,4
	li      a3,0
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	mul     t3,s2,s2
	blt     a3,t3,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    t3,a3,2
	add     t3,s3,t3
	li      ra,0
	sw      ra,0(t3)
	addi    a3,a3,1
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	mul     s1,s2,s2
	li      a3,4
	mul     a3,a3,s1
	addi    a0,a3,4
	call    __malloc
	sw      s1,0(a0)
	addi    s4,a0,4
	li      a3,0
	j       main_forCondBBlock.1

main_forCondBBlock.1:
	mul     t3,s2,s2
	blt     a3,t3,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    t3,a3,2
	add     t3,s4,t3
	li      ra,0
	sw      ra,0(t3)
	addi    a3,a3,1
	j       main_forCondBBlock.1

main_afterForBBlock.1:
	li      a3,4
	mul     a3,a3,s2
	addi    a0,a3,4
	call    __malloc
	sw      s2,0(a0)
	addi    a3,a0,4
	mv      s1,a3
	li      a3,0
	mv      s7,a3
	j       main_forCondBBlock.2

main_forCondBBlock.2:
	blt     s7,s2,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	slli    a3,s7,2
	add     s8,s1,a3
	li      a3,4
	mul     a3,a3,s2
	addi    a0,a3,4
	call    __malloc
	sw      s2,0(a0)
	addi    a3,a0,4
	sw      a3,0(s8)
	li      a3,0
	j       main_forCondBBlock.3

main_afterForBBlock.2:
	li      a3,0
	sw      a3,0(s3)
	li      a3,0
	sw      a3,0(s4)
	lw      a3,0(s1)
	li      t3,0
	sw      t3,0(a3)
	li      a0,0
	li      ra,0
	li      t0,0
	j       main_whileCondBBlock.0

main_forCondBBlock.3:
	blt     a3,s2,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	slli    t3,s7,2
	add     t3,s1,t3
	lw      t3,0(t3)
	slli    ra,a3,2
	add     t3,t3,ra
	li      ra,-1
	sw      ra,0(t3)
	addi    a3,a3,1
	j       main_forCondBBlock.3

main_afterForBBlock.3:
	addi    a3,s7,1
	mv      s7,a3
	j       main_forCondBBlock.2

main_whileCondBBlock.0:
	ble     a0,ra,main_whileBodyBBlock.0
	j       main_criticalEdge.0

main_whileBodyBBlock.0:
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	slli    a3,a3,2
	add     a3,s1,a3
	lw      t3,0(a3)
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	slli    a3,a3,2
	add     a3,t3,a3
	lw      t3,0(a3)
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	addi    a7,a3,-1
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	addi    t4,a3,-2
	blt     a7,s2,main_logicalAnd.24
	j       main_criticalEdge.41

main_afterWhileBBlock.0:
	li      a3,1
	beq     t0,a3,main_thenBodyBBlock.17
	j       main_elseBodyBBlock.0

main_thenBodyBBlock.0:
	addi    ra,ra,1
	slli    a3,ra,2
	add     a3,s3,a3
	sw      a7,0(a3)
	slli    a3,ra,2
	add     a3,s4,a3
	sw      t4,0(a3)
	slli    a3,a7,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,t4,2
	add     t5,t5,a3
	addi    a3,t3,1
	sw      a3,0(t5)
	beq     a7,s0,main_logicalAnd.2
	j       main_criticalEdge.5

main_afterIfBBlock.0:
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	addi    t4,a3,-1
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	addi    a7,a3,2
	blt     t4,s2,main_logicalAnd.26
	j       main_criticalEdge.43

main_logicalAnd.0:
	blt     t4,s2,main_logicalAnd.25
	j       main_criticalEdge.42

main_afterLogicalAnd.0:
	bne     a3,zero,main_logicalAnd.1
	j       main_criticalEdge.3

main_logicalAnd.1:
	slli    a3,a7,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,t4,2
	add     a3,t5,a3
	lw      a3,0(a3)
	xori    a3,a3,-1
	seqz    a3,a3
	j       main_afterLogicalAnd.1

main_afterLogicalAnd.1:
	bne     a3,zero,main_thenBodyBBlock.0
	j       main_criticalEdge.1

main_thenBodyBBlock.1:
	li      t0,1
	j       main_afterIfBBlock.1

main_afterIfBBlock.1:
	j       main_afterIfBBlock.0

main_logicalAnd.2:
	xor     a3,t4,s6
	seqz    a3,a3
	j       main_afterLogicalAnd.2

main_afterLogicalAnd.2:
	bne     a3,zero,main_thenBodyBBlock.1
	j       main_criticalEdge.4

main_thenBodyBBlock.2:
	addi    ra,ra,1
	slli    a3,ra,2
	add     a3,s3,a3
	sw      t4,0(a3)
	slli    a3,ra,2
	add     a3,s4,a3
	sw      a7,0(a3)
	slli    a3,t4,2
	add     a3,s1,a3
	lw      a3,0(a3)
	slli    t5,a7,2
	add     t5,a3,t5
	addi    a3,t3,1
	sw      a3,0(t5)
	beq     t4,s0,main_logicalAnd.5
	j       main_criticalEdge.10

main_afterIfBBlock.2:
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	addi    a7,a3,1
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	addi    t4,a3,-2
	blt     a7,s2,main_logicalAnd.28
	j       main_criticalEdge.45

main_logicalAnd.3:
	blt     a7,s2,main_logicalAnd.27
	j       main_criticalEdge.44

main_afterLogicalAnd.3:
	bne     a3,zero,main_logicalAnd.4
	j       main_criticalEdge.8

main_logicalAnd.4:
	slli    a3,t4,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,a7,2
	add     a3,t5,a3
	lw      a3,0(a3)
	xori    a3,a3,-1
	seqz    a3,a3
	j       main_afterLogicalAnd.4

main_afterLogicalAnd.4:
	bne     a3,zero,main_thenBodyBBlock.2
	j       main_criticalEdge.6

main_thenBodyBBlock.3:
	li      t0,1
	j       main_afterIfBBlock.3

main_afterIfBBlock.3:
	j       main_afterIfBBlock.2

main_logicalAnd.5:
	xor     a3,a7,s6
	seqz    a3,a3
	j       main_afterLogicalAnd.5

main_afterLogicalAnd.5:
	bne     a3,zero,main_thenBodyBBlock.3
	j       main_criticalEdge.9

main_thenBodyBBlock.4:
	addi    ra,ra,1
	slli    a3,ra,2
	add     a3,s3,a3
	sw      a7,0(a3)
	slli    a3,ra,2
	add     a3,s4,a3
	sw      t4,0(a3)
	slli    a3,a7,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,t4,2
	add     a3,t5,a3
	addi    t5,t3,1
	sw      t5,0(a3)
	beq     a7,s0,main_logicalAnd.8
	j       main_criticalEdge.15

main_afterIfBBlock.4:
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	addi    a7,a3,1
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	addi    t4,a3,2
	blt     a7,s2,main_logicalAnd.30
	j       main_criticalEdge.47

main_logicalAnd.6:
	blt     t4,s2,main_logicalAnd.29
	j       main_criticalEdge.46

main_afterLogicalAnd.6:
	bne     a3,zero,main_logicalAnd.7
	j       main_criticalEdge.13

main_logicalAnd.7:
	slli    a3,a7,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,t4,2
	add     a3,t5,a3
	lw      a3,0(a3)
	xori    a3,a3,-1
	seqz    a3,a3
	j       main_afterLogicalAnd.7

main_afterLogicalAnd.7:
	bne     a3,zero,main_thenBodyBBlock.4
	j       main_criticalEdge.11

main_thenBodyBBlock.5:
	li      t0,1
	j       main_afterIfBBlock.5

main_afterIfBBlock.5:
	j       main_afterIfBBlock.4

main_logicalAnd.8:
	xor     a3,t4,s6
	seqz    a3,a3
	j       main_afterLogicalAnd.8

main_afterLogicalAnd.8:
	bne     a3,zero,main_thenBodyBBlock.5
	j       main_criticalEdge.14

main_thenBodyBBlock.6:
	addi    ra,ra,1
	slli    a3,ra,2
	add     a3,s3,a3
	sw      a7,0(a3)
	slli    a3,ra,2
	add     a3,s4,a3
	sw      t4,0(a3)
	slli    a3,a7,2
	add     a3,s1,a3
	lw      a3,0(a3)
	slli    t5,t4,2
	add     t5,a3,t5
	addi    a3,t3,1
	sw      a3,0(t5)
	beq     a7,s0,main_logicalAnd.11
	j       main_criticalEdge.20

main_afterIfBBlock.6:
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	addi    a7,a3,-2
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	addi    t4,a3,-1
	blt     a7,s2,main_logicalAnd.32
	j       main_criticalEdge.49

main_logicalAnd.9:
	blt     t4,s2,main_logicalAnd.31
	j       main_criticalEdge.48

main_afterLogicalAnd.9:
	bne     a3,zero,main_logicalAnd.10
	j       main_criticalEdge.18

main_logicalAnd.10:
	slli    a3,a7,2
	add     a3,s1,a3
	lw      a3,0(a3)
	slli    t5,t4,2
	add     a3,a3,t5
	lw      a3,0(a3)
	xori    a3,a3,-1
	seqz    a3,a3
	j       main_afterLogicalAnd.10

main_afterLogicalAnd.10:
	bne     a3,zero,main_thenBodyBBlock.6
	j       main_criticalEdge.16

main_thenBodyBBlock.7:
	li      t0,1
	j       main_afterIfBBlock.7

main_afterIfBBlock.7:
	j       main_afterIfBBlock.6

main_logicalAnd.11:
	xor     a3,t4,s6
	seqz    a3,a3
	j       main_afterLogicalAnd.11

main_afterLogicalAnd.11:
	bne     a3,zero,main_thenBodyBBlock.7
	j       main_criticalEdge.19

main_thenBodyBBlock.8:
	addi    ra,ra,1
	slli    a3,ra,2
	add     a3,s3,a3
	sw      a7,0(a3)
	slli    a3,ra,2
	add     a3,s4,a3
	sw      t4,0(a3)
	slli    a3,a7,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,t4,2
	add     a3,t5,a3
	addi    t5,t3,1
	sw      t5,0(a3)
	beq     a7,s0,main_logicalAnd.14
	j       main_criticalEdge.25

main_afterIfBBlock.8:
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	addi    a7,a3,-2
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	addi    t4,a3,1
	blt     a7,s2,main_logicalAnd.34
	j       main_criticalEdge.51

main_logicalAnd.12:
	blt     t4,s2,main_logicalAnd.33
	j       main_criticalEdge.50

main_afterLogicalAnd.12:
	bne     a3,zero,main_logicalAnd.13
	j       main_criticalEdge.23

main_logicalAnd.13:
	slli    a3,a7,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,t4,2
	add     a3,t5,a3
	lw      a3,0(a3)
	xori    a3,a3,-1
	seqz    a3,a3
	j       main_afterLogicalAnd.13

main_afterLogicalAnd.13:
	bne     a3,zero,main_thenBodyBBlock.8
	j       main_criticalEdge.21

main_thenBodyBBlock.9:
	li      t0,1
	j       main_afterIfBBlock.9

main_afterIfBBlock.9:
	j       main_afterIfBBlock.8

main_logicalAnd.14:
	xor     a3,t4,s6
	seqz    a3,a3
	j       main_afterLogicalAnd.14

main_afterLogicalAnd.14:
	bne     a3,zero,main_thenBodyBBlock.9
	j       main_criticalEdge.24

main_thenBodyBBlock.10:
	addi    ra,ra,1
	slli    a3,ra,2
	add     a3,s3,a3
	sw      a7,0(a3)
	slli    a3,ra,2
	add     a3,s4,a3
	sw      t4,0(a3)
	slli    a3,a7,2
	add     a3,s1,a3
	lw      a3,0(a3)
	slli    t5,t4,2
	add     a3,a3,t5
	addi    t5,t3,1
	sw      t5,0(a3)
	beq     a7,s0,main_logicalAnd.17
	j       main_criticalEdge.30

main_afterIfBBlock.10:
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	addi    a7,a3,2
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	addi    t4,a3,-1
	blt     a7,s2,main_logicalAnd.36
	j       main_criticalEdge.53

main_logicalAnd.15:
	blt     t4,s2,main_logicalAnd.35
	j       main_criticalEdge.52

main_afterLogicalAnd.15:
	bne     a3,zero,main_logicalAnd.16
	j       main_criticalEdge.28

main_logicalAnd.16:
	slli    a3,a7,2
	add     a3,s1,a3
	lw      a3,0(a3)
	slli    t5,t4,2
	add     a3,a3,t5
	lw      a3,0(a3)
	xori    a3,a3,-1
	seqz    a3,a3
	j       main_afterLogicalAnd.16

main_afterLogicalAnd.16:
	bne     a3,zero,main_thenBodyBBlock.10
	j       main_criticalEdge.26

main_thenBodyBBlock.11:
	li      t0,1
	j       main_afterIfBBlock.11

main_afterIfBBlock.11:
	j       main_afterIfBBlock.10

main_logicalAnd.17:
	xor     a3,t4,s6
	seqz    a3,a3
	j       main_afterLogicalAnd.17

main_afterLogicalAnd.17:
	bne     a3,zero,main_thenBodyBBlock.11
	j       main_criticalEdge.29

main_thenBodyBBlock.12:
	addi    ra,ra,1
	slli    a3,ra,2
	add     a3,s3,a3
	sw      a7,0(a3)
	slli    a3,ra,2
	add     a3,s4,a3
	sw      t4,0(a3)
	slli    a3,a7,2
	add     a3,s1,a3
	lw      a3,0(a3)
	slli    t5,t4,2
	add     t5,a3,t5
	addi    a3,t3,1
	sw      a3,0(t5)
	beq     a7,s0,main_logicalAnd.20
	j       main_criticalEdge.35

main_afterIfBBlock.12:
	slli    a3,a0,2
	add     a3,s3,a3
	lw      a3,0(a3)
	addi    a7,a3,2
	slli    a3,a0,2
	add     a3,s4,a3
	lw      a3,0(a3)
	addi    t4,a3,1
	blt     a7,s2,main_logicalAnd.38
	j       main_criticalEdge.55

main_logicalAnd.18:
	blt     t4,s2,main_logicalAnd.37
	j       main_criticalEdge.54

main_afterLogicalAnd.18:
	bne     a3,zero,main_logicalAnd.19
	j       main_criticalEdge.33

main_logicalAnd.19:
	slli    a3,a7,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,t4,2
	add     a3,t5,a3
	lw      a3,0(a3)
	xori    a3,a3,-1
	seqz    a3,a3
	j       main_afterLogicalAnd.19

main_afterLogicalAnd.19:
	bne     a3,zero,main_thenBodyBBlock.12
	j       main_criticalEdge.31

main_thenBodyBBlock.13:
	li      t0,1
	j       main_afterIfBBlock.13

main_afterIfBBlock.13:
	j       main_afterIfBBlock.12

main_logicalAnd.20:
	xor     a3,t4,s6
	seqz    a3,a3
	j       main_afterLogicalAnd.20

main_afterLogicalAnd.20:
	bne     a3,zero,main_thenBodyBBlock.13
	j       main_criticalEdge.34

main_thenBodyBBlock.14:
	addi    ra,ra,1
	slli    a3,ra,2
	add     a3,s3,a3
	sw      a7,0(a3)
	slli    a3,ra,2
	add     a3,s4,a3
	sw      t4,0(a3)
	slli    a3,a7,2
	add     a3,s1,a3
	lw      t5,0(a3)
	slli    a3,t4,2
	add     a3,t5,a3
	addi    t3,t3,1
	sw      t3,0(a3)
	beq     a7,s0,main_logicalAnd.23
	j       main_criticalEdge.40

main_afterIfBBlock.14:
	li      a3,1
	beq     t0,a3,main_thenBodyBBlock.16
	j       main_afterIfBBlock.16

main_logicalAnd.21:
	blt     t4,s2,main_logicalAnd.39
	j       main_criticalEdge.56

main_afterLogicalAnd.21:
	bne     a3,zero,main_logicalAnd.22
	j       main_criticalEdge.38

main_logicalAnd.22:
	slli    a3,a7,2
	add     a3,s1,a3
	lw      a3,0(a3)
	slli    t5,t4,2
	add     a3,a3,t5
	lw      a3,0(a3)
	xori    a3,a3,-1
	seqz    a3,a3
	j       main_afterLogicalAnd.22

main_afterLogicalAnd.22:
	bne     a3,zero,main_thenBodyBBlock.14
	j       main_criticalEdge.36

main_thenBodyBBlock.15:
	li      t0,1
	j       main_afterIfBBlock.15

main_afterIfBBlock.15:
	j       main_afterIfBBlock.14

main_logicalAnd.23:
	xor     a3,t4,s6
	seqz    a3,a3
	j       main_afterLogicalAnd.23

main_afterLogicalAnd.23:
	bne     a3,zero,main_thenBodyBBlock.15
	j       main_criticalEdge.39

main_thenBodyBBlock.16:
	j       main_afterWhileBBlock.0

main_afterIfBBlock.16:
	addi    a0,a0,1
	j       main_whileCondBBlock.0

main_thenBodyBBlock.17:
	slli    a3,s0,2
	add     a3,s1,a3
	lw      t3,0(a3)
	slli    a3,s6,2
	add     a3,t3,a3
	lw      a0,0(a3)
	call    __toString
	call    __print
	j       main_afterIfBBlock.17

main_elseBodyBBlock.0:
    la      a0,.str.0
	call    __print
	j       main_afterIfBBlock.17

main_afterIfBBlock.17:
	li      a0,0
	mv      s8,s5
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

main_logicalAnd.24:
	slti    a3,a7,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.24

main_afterLogicalAnd.24:
	bne     a3,zero,main_logicalAnd.0
	j       main_criticalEdge.2

main_logicalAnd.25:
	slti    a3,t4,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.25

main_afterLogicalAnd.25:
	j       main_afterLogicalAnd.0

main_logicalAnd.26:
	slti    a3,t4,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.26

main_afterLogicalAnd.26:
	bne     a3,zero,main_logicalAnd.3
	j       main_criticalEdge.7

main_logicalAnd.27:
	slti    a3,a7,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.27

main_afterLogicalAnd.27:
	j       main_afterLogicalAnd.3

main_logicalAnd.28:
	slti    a3,a7,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.28

main_afterLogicalAnd.28:
	bne     a3,zero,main_logicalAnd.6
	j       main_criticalEdge.12

main_logicalAnd.29:
	slti    a3,t4,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.29

main_afterLogicalAnd.29:
	j       main_afterLogicalAnd.6

main_logicalAnd.30:
	slti    a3,a7,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.30

main_afterLogicalAnd.30:
	bne     a3,zero,main_logicalAnd.9
	j       main_criticalEdge.17

main_logicalAnd.31:
	slti    a3,t4,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.31

main_afterLogicalAnd.31:
	j       main_afterLogicalAnd.9

main_logicalAnd.32:
	slti    a3,a7,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.32

main_afterLogicalAnd.32:
	bne     a3,zero,main_logicalAnd.12
	j       main_criticalEdge.22

main_logicalAnd.33:
	slti    a3,t4,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.33

main_afterLogicalAnd.33:
	j       main_afterLogicalAnd.12

main_logicalAnd.34:
	slti    a3,a7,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.34

main_afterLogicalAnd.34:
	bne     a3,zero,main_logicalAnd.15
	j       main_criticalEdge.27

main_logicalAnd.35:
	slti    a3,t4,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.35

main_afterLogicalAnd.35:
	j       main_afterLogicalAnd.15

main_logicalAnd.36:
	slti    a3,a7,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.36

main_afterLogicalAnd.36:
	bne     a3,zero,main_logicalAnd.18
	j       main_criticalEdge.32

main_logicalAnd.37:
	slti    a3,t4,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.37

main_afterLogicalAnd.37:
	j       main_afterLogicalAnd.18

main_logicalAnd.38:
	slti    a3,a7,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.38

main_afterLogicalAnd.38:
	bne     a3,zero,main_logicalAnd.21
	j       main_criticalEdge.37

main_logicalAnd.39:
	slti    a3,t4,0
	xori    a3,a3,1
	j       main_afterLogicalAnd.39

main_afterLogicalAnd.39:
	j       main_afterLogicalAnd.21

main_criticalEdge.0:
	j       main_afterWhileBBlock.0

main_criticalEdge.1:
	j       main_afterIfBBlock.0

main_criticalEdge.2:
	mv      a3,zero
	j       main_afterLogicalAnd.0

main_criticalEdge.3:
	mv      a3,zero
	j       main_afterLogicalAnd.1

main_criticalEdge.4:
	j       main_afterIfBBlock.1

main_criticalEdge.5:
	mv      a3,zero
	j       main_afterLogicalAnd.2

main_criticalEdge.6:
	j       main_afterIfBBlock.2

main_criticalEdge.7:
	mv      a3,zero
	j       main_afterLogicalAnd.3

main_criticalEdge.8:
	mv      a3,zero
	j       main_afterLogicalAnd.4

main_criticalEdge.9:
	j       main_afterIfBBlock.3

main_criticalEdge.10:
	mv      a3,zero
	j       main_afterLogicalAnd.5

main_criticalEdge.11:
	j       main_afterIfBBlock.4

main_criticalEdge.12:
	mv      a3,zero
	j       main_afterLogicalAnd.6

main_criticalEdge.13:
	mv      a3,zero
	j       main_afterLogicalAnd.7

main_criticalEdge.14:
	j       main_afterIfBBlock.5

main_criticalEdge.15:
	mv      a3,zero
	j       main_afterLogicalAnd.8

main_criticalEdge.16:
	j       main_afterIfBBlock.6

main_criticalEdge.17:
	mv      a3,zero
	j       main_afterLogicalAnd.9

main_criticalEdge.18:
	mv      a3,zero
	j       main_afterLogicalAnd.10

main_criticalEdge.19:
	j       main_afterIfBBlock.7

main_criticalEdge.20:
	mv      a3,zero
	j       main_afterLogicalAnd.11

main_criticalEdge.21:
	j       main_afterIfBBlock.8

main_criticalEdge.22:
	mv      a3,zero
	j       main_afterLogicalAnd.12

main_criticalEdge.23:
	mv      a3,zero
	j       main_afterLogicalAnd.13

main_criticalEdge.24:
	j       main_afterIfBBlock.9

main_criticalEdge.25:
	mv      a3,zero
	j       main_afterLogicalAnd.14

main_criticalEdge.26:
	j       main_afterIfBBlock.10

main_criticalEdge.27:
	mv      a3,zero
	j       main_afterLogicalAnd.15

main_criticalEdge.28:
	mv      a3,zero
	j       main_afterLogicalAnd.16

main_criticalEdge.29:
	j       main_afterIfBBlock.11

main_criticalEdge.30:
	mv      a3,zero
	j       main_afterLogicalAnd.17

main_criticalEdge.31:
	j       main_afterIfBBlock.12

main_criticalEdge.32:
	mv      a3,zero
	j       main_afterLogicalAnd.18

main_criticalEdge.33:
	mv      a3,zero
	j       main_afterLogicalAnd.19

main_criticalEdge.34:
	j       main_afterIfBBlock.13

main_criticalEdge.35:
	mv      a3,zero
	j       main_afterLogicalAnd.20

main_criticalEdge.36:
	j       main_afterIfBBlock.14

main_criticalEdge.37:
	mv      a3,zero
	j       main_afterLogicalAnd.21

main_criticalEdge.38:
	mv      a3,zero
	j       main_afterLogicalAnd.22

main_criticalEdge.39:
	j       main_afterIfBBlock.15

main_criticalEdge.40:
	mv      a3,zero
	j       main_afterLogicalAnd.23

main_criticalEdge.41:
	mv      a3,zero
	j       main_afterLogicalAnd.24

main_criticalEdge.42:
	mv      a3,zero
	j       main_afterLogicalAnd.25

main_criticalEdge.43:
	mv      a3,zero
	j       main_afterLogicalAnd.26

main_criticalEdge.44:
	mv      a3,zero
	j       main_afterLogicalAnd.27

main_criticalEdge.45:
	mv      a3,zero
	j       main_afterLogicalAnd.28

main_criticalEdge.46:
	mv      a3,zero
	j       main_afterLogicalAnd.29

main_criticalEdge.47:
	mv      a3,zero
	j       main_afterLogicalAnd.30

main_criticalEdge.48:
	mv      a3,zero
	j       main_afterLogicalAnd.31

main_criticalEdge.49:
	mv      a3,zero
	j       main_afterLogicalAnd.32

main_criticalEdge.50:
	mv      a3,zero
	j       main_afterLogicalAnd.33

main_criticalEdge.51:
	mv      a3,zero
	j       main_afterLogicalAnd.34

main_criticalEdge.52:
	mv      a3,zero
	j       main_afterLogicalAnd.35

main_criticalEdge.53:
	mv      a3,zero
	j       main_afterLogicalAnd.36

main_criticalEdge.54:
	mv      a3,zero
	j       main_afterLogicalAnd.37

main_criticalEdge.55:
	mv      a3,zero
	j       main_afterLogicalAnd.38

main_criticalEdge.56:
	mv      a3,zero
	j       main_afterLogicalAnd.39


