	.data

	.globl  .str.0
.str.0:
	.asciz  ": "

	.globl  root
	.p2align	2
root:
	.word   0


	.text

	.globl  insertImpl
	.p2align	2
	.type   insertImpl, @function
insertImpl:
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	mv      s2,s4
	mv      s0,a0
	mv      s3,a1
	mv      s4,a2
	mv      s1,a3
	beq     s0,zero,insertImpl_thenBodyBBlock.0
	j       insertImpl_afterIfBBlock.0

insertImpl_thenBodyBBlock.0:
	li      a0,16
	call    __malloc
	mv      s0,a0
	addi    a5,s0,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a5,a0,4
	sw      a5,4(s0)
	addi    a6,s0,8
	sw      s1,8(s0)
	li      a6,1
	addi    t2,s0,12
	sw      a6,12(s0)
	sw      s3,0(s0)
	sw      zero,0(a5)
	addi    a6,a5,4
	sw      zero,4(a5)
	addi    a5,s3,4
	lw      a6,4(s3)
	slli    a5,s4,2
	add     a5,a6,a5
	sw      s0,0(a5)
	li      a0,0
	j       insertImpl_returnBBlock.0

insertImpl_afterIfBBlock.0:
	addi    a5,s0,8
	lw      a5,8(s0)
	beq     a5,s1,insertImpl_thenBodyBBlock.1
	j       insertImpl_afterIfBBlock.1

insertImpl_thenBodyBBlock.1:
	addi    a5,s0,12
	lw      a5,12(s0)
	addi    a5,a5,1
	sw      a5,12(s0)
	li      a0,1
	j       insertImpl_returnBBlock.0

insertImpl_afterIfBBlock.1:
	blt     a5,s1,insertImpl_thenBodyBBlock.2
	j       insertImpl_criticalEdge.0

insertImpl_thenBodyBBlock.2:
	li      a2,1
	j       insertImpl_afterIfBBlock.2

insertImpl_afterIfBBlock.2:
	addi    a5,s0,4
	lw      a5,4(s0)
	slli    a6,a2,2
	add     a5,a5,a6
	lw      a0,0(a5)
	mv      a1,s0
	mv      a3,s1
	call    insertImpl
	j       insertImpl_returnBBlock.0

insertImpl_returnBBlock.0:
	mv      s4,s2
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

insertImpl_criticalEdge.0:
	li      a2,0
	j       insertImpl_afterIfBBlock.2


	.globl  findLargest
	.p2align	2
	.type   findLargest, @function
findLargest:
	addi    sp,sp,-16
	sw      ra,12(sp)
	addi    a5,a0,4
	lw      a5,4(a0)
	addi    a6,a5,4
	lw      a5,4(a5)
	beq     a5,zero,findLargest_thenBodyBBlock.0
	j       findLargest_afterIfBBlock.0

findLargest_thenBodyBBlock.0:
	j       findLargest_returnBBlock.0

findLargest_afterIfBBlock.0:
	mv      a0,a5
	call    findLargest
	j       findLargest_returnBBlock.0

findLargest_returnBBlock.0:
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  eraseImpl
	.p2align	2
	.type   eraseImpl, @function
eraseImpl:
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	mv      s2,s4
	mv      s0,a0
	mv      s3,a1
	mv      s1,a2
	mv      s4,a3
	beq     s0,zero,eraseImpl_thenBodyBBlock.0
	j       eraseImpl_afterIfBBlock.0

eraseImpl_thenBodyBBlock.0:
	li      a0,0
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.0:
	addi    a5,s0,8
	lw      a5,8(s0)
	bgt     a5,s4,eraseImpl_thenBodyBBlock.1
	j       eraseImpl_afterIfBBlock.1

eraseImpl_thenBodyBBlock.1:
	addi    a5,s0,4
	lw      a5,4(s0)
	lw      a0,0(a5)
	mv      a1,s0
	li      a2,0
	mv      a3,s4
	call    eraseImpl
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.1:
	blt     a5,s4,eraseImpl_thenBodyBBlock.2
	j       eraseImpl_afterIfBBlock.2

eraseImpl_thenBodyBBlock.2:
	addi    a5,s0,4
	lw      a5,4(s0)
	addi    a6,a5,4
	lw      a0,4(a5)
	mv      a1,s0
	li      a2,1
	mv      a3,s4
	call    eraseImpl
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.2:
	addi    a5,s0,12
	lw      a5,12(s0)
	addi    a6,a5,-1
	sw      a6,12(s0)
	li      a5,0
	bgt     a6,a5,eraseImpl_thenBodyBBlock.3
	j       eraseImpl_afterIfBBlock.3

eraseImpl_thenBodyBBlock.3:
	li      a0,1
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.3:
	addi    a5,s0,4
	lw      a5,4(s0)
	lw      a6,0(a5)
	beq     a6,zero,eraseImpl_thenBodyBBlock.4
	j       eraseImpl_afterIfBBlock.4

eraseImpl_thenBodyBBlock.4:
	bne     s3,zero,eraseImpl_thenBodyBBlock.5
	j       eraseImpl_afterIfBBlock.5

eraseImpl_afterIfBBlock.4:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.14
	j       eraseImpl_afterIfBBlock.14

eraseImpl_thenBodyBBlock.5:
	addi    s0,s3,4
	lw      s0,4(s3)
	slli    a6,s1,2
	add     s0,s0,a6
	addi    a6,a5,4
	lw      a6,4(a5)
	sw      a6,0(s0)
	j       eraseImpl_afterIfBBlock.5

eraseImpl_afterIfBBlock.5:
	addi    s0,a5,4
	lw      s0,4(a5)
	bne     s0,zero,eraseImpl_thenBodyBBlock.6
	j       eraseImpl_afterIfBBlock.6

eraseImpl_thenBodyBBlock.6:
	sw      s3,0(s0)
	j       eraseImpl_afterIfBBlock.6

eraseImpl_afterIfBBlock.6:
	lui     s0,%hi(root)
	lw      s0,%lo(root)(s0)
	addi    a6,s0,8
	lw      s0,8(s0)
	beq     s4,s0,eraseImpl_thenBodyBBlock.7
	j       eraseImpl_afterIfBBlock.7

eraseImpl_thenBodyBBlock.7:
	lw      a5,4(a5)
	lui     s0,%hi(root)
	sw      a5,%lo(root)(s0)
	j       eraseImpl_afterIfBBlock.7

eraseImpl_afterIfBBlock.7:
	li      a0,1
	j       eraseImpl_returnBBlock.0

eraseImpl_thenBodyBBlock.8:
	lui     a5,%hi(root)
	sw      a6,%lo(root)(a5)
	j       eraseImpl_afterIfBBlock.8

eraseImpl_afterIfBBlock.8:
	addi    a5,a6,8
	lw      t1,8(a6)
	lw      t2,4(s0)
	lw      a5,0(t2)
	addi    s0,a5,8
	lw      s0,8(a5)
	bne     t1,s0,eraseImpl_thenBodyBBlock.9
	j       eraseImpl_afterIfBBlock.9

eraseImpl_thenBodyBBlock.9:
	lw      a5,0(a6)
	addi    s0,a5,4
	lw      a5,4(a5)
	addi    s0,a5,4
	addi    s0,a6,4
	lw      s0,4(a6)
	lw      s4,0(s0)
	sw      s4,4(a5)
	lw      s0,0(s0)
	bne     s0,zero,eraseImpl_thenBodyBBlock.10
	j       eraseImpl_afterIfBBlock.10

eraseImpl_afterIfBBlock.9:
	bne     s3,zero,eraseImpl_thenBodyBBlock.11
	j       eraseImpl_afterIfBBlock.11

eraseImpl_thenBodyBBlock.10:
	lw      a5,0(a6)
	sw      a5,0(s0)
	j       eraseImpl_afterIfBBlock.10

eraseImpl_afterIfBBlock.10:
	j       eraseImpl_afterIfBBlock.9

eraseImpl_thenBodyBBlock.11:
	addi    s0,s3,4
	lw      a5,4(s3)
	slli    s0,s1,2
	add     s0,a5,s0
	sw      a6,0(s0)
	j       eraseImpl_afterIfBBlock.11

eraseImpl_afterIfBBlock.11:
	sw      s3,0(a6)
	addi    s0,a6,4
	lw      s0,4(a6)
	addi    a5,s0,4
	addi    a5,t2,4
	lw      a5,4(t2)
	sw      a5,4(s0)
	lw      a5,4(t2)
	bne     a5,zero,eraseImpl_thenBodyBBlock.12
	j       eraseImpl_afterIfBBlock.12

eraseImpl_thenBodyBBlock.12:
	sw      a6,0(a5)
	j       eraseImpl_afterIfBBlock.12

eraseImpl_afterIfBBlock.12:
	lw      s4,0(t2)
	addi    a5,s4,8
	lw      a5,8(s4)
	bne     t1,a5,eraseImpl_thenBodyBBlock.13
	j       eraseImpl_afterIfBBlock.13

eraseImpl_thenBodyBBlock.13:
	sw      s4,0(s0)
	lw      s0,0(t2)
	sw      a6,0(s0)
	j       eraseImpl_afterIfBBlock.13

eraseImpl_afterIfBBlock.13:
	li      a0,1
	j       eraseImpl_returnBBlock.0

eraseImpl_returnBBlock.0:
	mv      s4,s2
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

eraseImpl_thenBodyBBlock.14:
	j       eraseImpl_returnBBlock.1

eraseImpl_afterIfBBlock.14:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.15
	j       eraseImpl_afterIfBBlock.15

eraseImpl_returnBBlock.1:
	lui     a5,%hi(root)
	lw      t2,%lo(root)(a5)
	addi    a5,t2,8
	lw      a5,8(t2)
	beq     s4,a5,eraseImpl_thenBodyBBlock.8
	j       eraseImpl_afterIfBBlock.8

eraseImpl_thenBodyBBlock.15:
	j       eraseImpl_returnBBlock.2

eraseImpl_afterIfBBlock.15:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.16
	j       eraseImpl_afterIfBBlock.16

eraseImpl_returnBBlock.2:
	mv      a6,a5
	j       eraseImpl_returnBBlock.1

eraseImpl_thenBodyBBlock.16:
	j       eraseImpl_returnBBlock.3

eraseImpl_afterIfBBlock.16:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.17
	j       eraseImpl_afterIfBBlock.17

eraseImpl_returnBBlock.3:
	mv      a5,a6
	j       eraseImpl_returnBBlock.2

eraseImpl_thenBodyBBlock.17:
	j       eraseImpl_returnBBlock.4

eraseImpl_afterIfBBlock.17:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.18
	j       eraseImpl_afterIfBBlock.18

eraseImpl_returnBBlock.4:
	mv      a6,a5
	j       eraseImpl_returnBBlock.3

eraseImpl_thenBodyBBlock.18:
	j       eraseImpl_returnBBlock.5

eraseImpl_afterIfBBlock.18:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.19
	j       eraseImpl_afterIfBBlock.19

eraseImpl_returnBBlock.5:
	mv      a5,a6
	j       eraseImpl_returnBBlock.4

eraseImpl_thenBodyBBlock.19:
	j       eraseImpl_returnBBlock.6

eraseImpl_afterIfBBlock.19:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.20
	j       eraseImpl_afterIfBBlock.20

eraseImpl_returnBBlock.6:
	mv      a6,a5
	j       eraseImpl_returnBBlock.5

eraseImpl_thenBodyBBlock.20:
	j       eraseImpl_returnBBlock.7

eraseImpl_afterIfBBlock.20:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.21
	j       eraseImpl_afterIfBBlock.21

eraseImpl_returnBBlock.7:
	mv      a5,a6
	j       eraseImpl_returnBBlock.6

eraseImpl_thenBodyBBlock.21:
	j       eraseImpl_returnBBlock.8

eraseImpl_afterIfBBlock.21:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.22
	j       eraseImpl_afterIfBBlock.22

eraseImpl_returnBBlock.8:
	mv      a6,a5
	j       eraseImpl_returnBBlock.7

eraseImpl_thenBodyBBlock.22:
	j       eraseImpl_returnBBlock.9

eraseImpl_afterIfBBlock.22:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.23
	j       eraseImpl_afterIfBBlock.23

eraseImpl_returnBBlock.9:
	mv      a5,a6
	j       eraseImpl_returnBBlock.8

eraseImpl_thenBodyBBlock.23:
	j       eraseImpl_returnBBlock.10

eraseImpl_afterIfBBlock.23:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.24
	j       eraseImpl_afterIfBBlock.24

eraseImpl_returnBBlock.10:
	mv      a6,a5
	j       eraseImpl_returnBBlock.9

eraseImpl_thenBodyBBlock.24:
	j       eraseImpl_returnBBlock.11

eraseImpl_afterIfBBlock.24:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.25
	j       eraseImpl_afterIfBBlock.25

eraseImpl_returnBBlock.11:
	mv      a5,a6
	j       eraseImpl_returnBBlock.10

eraseImpl_thenBodyBBlock.25:
	j       eraseImpl_returnBBlock.12

eraseImpl_afterIfBBlock.25:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.26
	j       eraseImpl_afterIfBBlock.26

eraseImpl_returnBBlock.12:
	mv      a6,a5
	j       eraseImpl_returnBBlock.11

eraseImpl_thenBodyBBlock.26:
	j       eraseImpl_returnBBlock.13

eraseImpl_afterIfBBlock.26:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.27
	j       eraseImpl_afterIfBBlock.27

eraseImpl_returnBBlock.13:
	mv      a5,a6
	j       eraseImpl_returnBBlock.12

eraseImpl_thenBodyBBlock.27:
	j       eraseImpl_returnBBlock.14

eraseImpl_afterIfBBlock.27:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.28
	j       eraseImpl_afterIfBBlock.28

eraseImpl_returnBBlock.14:
	mv      a6,a5
	j       eraseImpl_returnBBlock.13

eraseImpl_thenBodyBBlock.28:
	j       eraseImpl_returnBBlock.15

eraseImpl_afterIfBBlock.28:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.29
	j       eraseImpl_afterIfBBlock.29

eraseImpl_returnBBlock.15:
	mv      a5,a6
	j       eraseImpl_returnBBlock.14

eraseImpl_thenBodyBBlock.29:
	j       eraseImpl_returnBBlock.16

eraseImpl_afterIfBBlock.29:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.30
	j       eraseImpl_afterIfBBlock.30

eraseImpl_returnBBlock.16:
	mv      a6,a5
	j       eraseImpl_returnBBlock.15

eraseImpl_thenBodyBBlock.30:
	j       eraseImpl_returnBBlock.17

eraseImpl_afterIfBBlock.30:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.31
	j       eraseImpl_afterIfBBlock.31

eraseImpl_returnBBlock.17:
	mv      a5,a6
	j       eraseImpl_returnBBlock.16

eraseImpl_thenBodyBBlock.31:
	j       eraseImpl_returnBBlock.18

eraseImpl_afterIfBBlock.31:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.32
	j       eraseImpl_afterIfBBlock.32

eraseImpl_returnBBlock.18:
	mv      a6,a5
	j       eraseImpl_returnBBlock.17

eraseImpl_thenBodyBBlock.32:
	j       eraseImpl_returnBBlock.19

eraseImpl_afterIfBBlock.32:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.33
	j       eraseImpl_afterIfBBlock.33

eraseImpl_returnBBlock.19:
	mv      a5,a6
	j       eraseImpl_returnBBlock.18

eraseImpl_thenBodyBBlock.33:
	j       eraseImpl_returnBBlock.20

eraseImpl_afterIfBBlock.33:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.34
	j       eraseImpl_afterIfBBlock.34

eraseImpl_returnBBlock.20:
	mv      a6,a5
	j       eraseImpl_returnBBlock.19

eraseImpl_thenBodyBBlock.34:
	j       eraseImpl_returnBBlock.21

eraseImpl_afterIfBBlock.34:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.35
	j       eraseImpl_afterIfBBlock.35

eraseImpl_returnBBlock.21:
	mv      a5,a6
	j       eraseImpl_returnBBlock.20

eraseImpl_thenBodyBBlock.35:
	j       eraseImpl_returnBBlock.22

eraseImpl_afterIfBBlock.35:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.36
	j       eraseImpl_afterIfBBlock.36

eraseImpl_returnBBlock.22:
	mv      a6,a5
	j       eraseImpl_returnBBlock.21

eraseImpl_thenBodyBBlock.36:
	j       eraseImpl_returnBBlock.23

eraseImpl_afterIfBBlock.36:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.37
	j       eraseImpl_afterIfBBlock.37

eraseImpl_returnBBlock.23:
	mv      a5,a6
	j       eraseImpl_returnBBlock.22

eraseImpl_thenBodyBBlock.37:
	j       eraseImpl_returnBBlock.24

eraseImpl_afterIfBBlock.37:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.38
	j       eraseImpl_afterIfBBlock.38

eraseImpl_returnBBlock.24:
	mv      a6,a5
	j       eraseImpl_returnBBlock.23

eraseImpl_thenBodyBBlock.38:
	j       eraseImpl_returnBBlock.25

eraseImpl_afterIfBBlock.38:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.39
	j       eraseImpl_afterIfBBlock.39

eraseImpl_returnBBlock.25:
	mv      a5,a6
	j       eraseImpl_returnBBlock.24

eraseImpl_thenBodyBBlock.39:
	j       eraseImpl_returnBBlock.26

eraseImpl_afterIfBBlock.39:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.40
	j       eraseImpl_afterIfBBlock.40

eraseImpl_returnBBlock.26:
	mv      a6,a5
	j       eraseImpl_returnBBlock.25

eraseImpl_thenBodyBBlock.40:
	j       eraseImpl_returnBBlock.27

eraseImpl_afterIfBBlock.40:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.41
	j       eraseImpl_afterIfBBlock.41

eraseImpl_returnBBlock.27:
	mv      a5,a6
	j       eraseImpl_returnBBlock.26

eraseImpl_thenBodyBBlock.41:
	j       eraseImpl_returnBBlock.28

eraseImpl_afterIfBBlock.41:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.42
	j       eraseImpl_afterIfBBlock.42

eraseImpl_returnBBlock.28:
	mv      a6,a5
	j       eraseImpl_returnBBlock.27

eraseImpl_thenBodyBBlock.42:
	j       eraseImpl_returnBBlock.29

eraseImpl_afterIfBBlock.42:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.43
	j       eraseImpl_afterIfBBlock.43

eraseImpl_returnBBlock.29:
	mv      a5,a6
	j       eraseImpl_returnBBlock.28

eraseImpl_thenBodyBBlock.43:
	j       eraseImpl_returnBBlock.30

eraseImpl_afterIfBBlock.43:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.44
	j       eraseImpl_afterIfBBlock.44

eraseImpl_returnBBlock.30:
	mv      a6,a5
	j       eraseImpl_returnBBlock.29

eraseImpl_thenBodyBBlock.44:
	j       eraseImpl_returnBBlock.31

eraseImpl_afterIfBBlock.44:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.45
	j       eraseImpl_afterIfBBlock.45

eraseImpl_returnBBlock.31:
	mv      a5,a6
	j       eraseImpl_returnBBlock.30

eraseImpl_thenBodyBBlock.45:
	j       eraseImpl_returnBBlock.32

eraseImpl_afterIfBBlock.45:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.46
	j       eraseImpl_afterIfBBlock.46

eraseImpl_returnBBlock.32:
	mv      a6,a5
	j       eraseImpl_returnBBlock.31

eraseImpl_thenBodyBBlock.46:
	j       eraseImpl_returnBBlock.33

eraseImpl_afterIfBBlock.46:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.47
	j       eraseImpl_afterIfBBlock.47

eraseImpl_returnBBlock.33:
	mv      a5,a6
	j       eraseImpl_returnBBlock.32

eraseImpl_thenBodyBBlock.47:
	j       eraseImpl_returnBBlock.34

eraseImpl_afterIfBBlock.47:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.48
	j       eraseImpl_afterIfBBlock.48

eraseImpl_returnBBlock.34:
	mv      a6,a5
	j       eraseImpl_returnBBlock.33

eraseImpl_thenBodyBBlock.48:
	j       eraseImpl_returnBBlock.35

eraseImpl_afterIfBBlock.48:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.49
	j       eraseImpl_afterIfBBlock.49

eraseImpl_returnBBlock.35:
	mv      a5,a6
	j       eraseImpl_returnBBlock.34

eraseImpl_thenBodyBBlock.49:
	j       eraseImpl_returnBBlock.36

eraseImpl_afterIfBBlock.49:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.50
	j       eraseImpl_afterIfBBlock.50

eraseImpl_returnBBlock.36:
	mv      a6,a5
	j       eraseImpl_returnBBlock.35

eraseImpl_thenBodyBBlock.50:
	j       eraseImpl_returnBBlock.37

eraseImpl_afterIfBBlock.50:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.51
	j       eraseImpl_afterIfBBlock.51

eraseImpl_returnBBlock.37:
	mv      a5,a6
	j       eraseImpl_returnBBlock.36

eraseImpl_thenBodyBBlock.51:
	j       eraseImpl_returnBBlock.38

eraseImpl_afterIfBBlock.51:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.52
	j       eraseImpl_afterIfBBlock.52

eraseImpl_returnBBlock.38:
	mv      a6,a5
	j       eraseImpl_returnBBlock.37

eraseImpl_thenBodyBBlock.52:
	j       eraseImpl_returnBBlock.39

eraseImpl_afterIfBBlock.52:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.53
	j       eraseImpl_afterIfBBlock.53

eraseImpl_returnBBlock.39:
	mv      a5,a6
	j       eraseImpl_returnBBlock.38

eraseImpl_thenBodyBBlock.53:
	j       eraseImpl_returnBBlock.40

eraseImpl_afterIfBBlock.53:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.54
	j       eraseImpl_afterIfBBlock.54

eraseImpl_returnBBlock.40:
	mv      a6,a5
	j       eraseImpl_returnBBlock.39

eraseImpl_thenBodyBBlock.54:
	j       eraseImpl_returnBBlock.41

eraseImpl_afterIfBBlock.54:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.55
	j       eraseImpl_afterIfBBlock.55

eraseImpl_returnBBlock.41:
	mv      a5,a6
	j       eraseImpl_returnBBlock.40

eraseImpl_thenBodyBBlock.55:
	j       eraseImpl_returnBBlock.42

eraseImpl_afterIfBBlock.55:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.56
	j       eraseImpl_afterIfBBlock.56

eraseImpl_returnBBlock.42:
	mv      a6,a5
	j       eraseImpl_returnBBlock.41

eraseImpl_thenBodyBBlock.56:
	j       eraseImpl_returnBBlock.43

eraseImpl_afterIfBBlock.56:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.57
	j       eraseImpl_afterIfBBlock.57

eraseImpl_returnBBlock.43:
	mv      a5,a6
	j       eraseImpl_returnBBlock.42

eraseImpl_thenBodyBBlock.57:
	j       eraseImpl_returnBBlock.44

eraseImpl_afterIfBBlock.57:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.58
	j       eraseImpl_afterIfBBlock.58

eraseImpl_returnBBlock.44:
	mv      a6,a5
	j       eraseImpl_returnBBlock.43

eraseImpl_thenBodyBBlock.58:
	j       eraseImpl_returnBBlock.45

eraseImpl_afterIfBBlock.58:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.59
	j       eraseImpl_afterIfBBlock.59

eraseImpl_returnBBlock.45:
	mv      a5,a6
	j       eraseImpl_returnBBlock.44

eraseImpl_thenBodyBBlock.59:
	j       eraseImpl_returnBBlock.46

eraseImpl_afterIfBBlock.59:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.60
	j       eraseImpl_afterIfBBlock.60

eraseImpl_returnBBlock.46:
	mv      a6,a5
	j       eraseImpl_returnBBlock.45

eraseImpl_thenBodyBBlock.60:
	j       eraseImpl_returnBBlock.47

eraseImpl_afterIfBBlock.60:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.61
	j       eraseImpl_afterIfBBlock.61

eraseImpl_returnBBlock.47:
	mv      a5,a6
	j       eraseImpl_returnBBlock.46

eraseImpl_thenBodyBBlock.61:
	j       eraseImpl_returnBBlock.48

eraseImpl_afterIfBBlock.61:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.62
	j       eraseImpl_afterIfBBlock.62

eraseImpl_returnBBlock.48:
	mv      a6,a5
	j       eraseImpl_returnBBlock.47

eraseImpl_thenBodyBBlock.62:
	j       eraseImpl_returnBBlock.49

eraseImpl_afterIfBBlock.62:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.63
	j       eraseImpl_afterIfBBlock.63

eraseImpl_returnBBlock.49:
	mv      a5,a6
	j       eraseImpl_returnBBlock.48

eraseImpl_thenBodyBBlock.63:
	j       eraseImpl_returnBBlock.50

eraseImpl_afterIfBBlock.63:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.64
	j       eraseImpl_afterIfBBlock.64

eraseImpl_returnBBlock.50:
	mv      a6,a5
	j       eraseImpl_returnBBlock.49

eraseImpl_thenBodyBBlock.64:
	j       eraseImpl_returnBBlock.51

eraseImpl_afterIfBBlock.64:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.65
	j       eraseImpl_afterIfBBlock.65

eraseImpl_returnBBlock.51:
	mv      a5,a6
	j       eraseImpl_returnBBlock.50

eraseImpl_thenBodyBBlock.65:
	j       eraseImpl_returnBBlock.52

eraseImpl_afterIfBBlock.65:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.66
	j       eraseImpl_afterIfBBlock.66

eraseImpl_returnBBlock.52:
	mv      a6,a5
	j       eraseImpl_returnBBlock.51

eraseImpl_thenBodyBBlock.66:
	j       eraseImpl_returnBBlock.53

eraseImpl_afterIfBBlock.66:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.67
	j       eraseImpl_afterIfBBlock.67

eraseImpl_returnBBlock.53:
	mv      a5,a6
	j       eraseImpl_returnBBlock.52

eraseImpl_thenBodyBBlock.67:
	j       eraseImpl_returnBBlock.54

eraseImpl_afterIfBBlock.67:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.68
	j       eraseImpl_afterIfBBlock.68

eraseImpl_returnBBlock.54:
	mv      a6,a5
	j       eraseImpl_returnBBlock.53

eraseImpl_thenBodyBBlock.68:
	j       eraseImpl_returnBBlock.55

eraseImpl_afterIfBBlock.68:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.69
	j       eraseImpl_afterIfBBlock.69

eraseImpl_returnBBlock.55:
	mv      a5,a6
	j       eraseImpl_returnBBlock.54

eraseImpl_thenBodyBBlock.69:
	j       eraseImpl_returnBBlock.56

eraseImpl_afterIfBBlock.69:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.70
	j       eraseImpl_afterIfBBlock.70

eraseImpl_returnBBlock.56:
	mv      a6,a5
	j       eraseImpl_returnBBlock.55

eraseImpl_thenBodyBBlock.70:
	j       eraseImpl_returnBBlock.57

eraseImpl_afterIfBBlock.70:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.71
	j       eraseImpl_afterIfBBlock.71

eraseImpl_returnBBlock.57:
	mv      a5,a6
	j       eraseImpl_returnBBlock.56

eraseImpl_thenBodyBBlock.71:
	j       eraseImpl_returnBBlock.58

eraseImpl_afterIfBBlock.71:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.72
	j       eraseImpl_afterIfBBlock.72

eraseImpl_returnBBlock.58:
	mv      a6,a5
	j       eraseImpl_returnBBlock.57

eraseImpl_thenBodyBBlock.72:
	j       eraseImpl_returnBBlock.59

eraseImpl_afterIfBBlock.72:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.73
	j       eraseImpl_afterIfBBlock.73

eraseImpl_returnBBlock.59:
	mv      a5,a6
	j       eraseImpl_returnBBlock.58

eraseImpl_thenBodyBBlock.73:
	j       eraseImpl_returnBBlock.60

eraseImpl_afterIfBBlock.73:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.74
	j       eraseImpl_afterIfBBlock.74

eraseImpl_returnBBlock.60:
	mv      a6,a5
	j       eraseImpl_returnBBlock.59

eraseImpl_thenBodyBBlock.74:
	j       eraseImpl_returnBBlock.61

eraseImpl_afterIfBBlock.74:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.75
	j       eraseImpl_afterIfBBlock.75

eraseImpl_returnBBlock.61:
	mv      a5,a6
	j       eraseImpl_returnBBlock.60

eraseImpl_thenBodyBBlock.75:
	j       eraseImpl_returnBBlock.62

eraseImpl_afterIfBBlock.75:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.76
	j       eraseImpl_afterIfBBlock.76

eraseImpl_returnBBlock.62:
	mv      a6,a5
	j       eraseImpl_returnBBlock.61

eraseImpl_thenBodyBBlock.76:
	j       eraseImpl_returnBBlock.63

eraseImpl_afterIfBBlock.76:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.77
	j       eraseImpl_afterIfBBlock.77

eraseImpl_returnBBlock.63:
	mv      a5,a6
	j       eraseImpl_returnBBlock.62

eraseImpl_thenBodyBBlock.77:
	j       eraseImpl_returnBBlock.64

eraseImpl_afterIfBBlock.77:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.78
	j       eraseImpl_afterIfBBlock.78

eraseImpl_returnBBlock.64:
	mv      a6,a5
	j       eraseImpl_returnBBlock.63

eraseImpl_thenBodyBBlock.78:
	j       eraseImpl_returnBBlock.65

eraseImpl_afterIfBBlock.78:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.79
	j       eraseImpl_afterIfBBlock.79

eraseImpl_returnBBlock.65:
	mv      a5,a6
	j       eraseImpl_returnBBlock.64

eraseImpl_thenBodyBBlock.79:
	j       eraseImpl_returnBBlock.66

eraseImpl_afterIfBBlock.79:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.80
	j       eraseImpl_afterIfBBlock.80

eraseImpl_returnBBlock.66:
	mv      a6,a5
	j       eraseImpl_returnBBlock.65

eraseImpl_thenBodyBBlock.80:
	j       eraseImpl_returnBBlock.67

eraseImpl_afterIfBBlock.80:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.81
	j       eraseImpl_afterIfBBlock.81

eraseImpl_returnBBlock.67:
	mv      a5,a6
	j       eraseImpl_returnBBlock.66

eraseImpl_thenBodyBBlock.81:
	j       eraseImpl_returnBBlock.68

eraseImpl_afterIfBBlock.81:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.82
	j       eraseImpl_afterIfBBlock.82

eraseImpl_returnBBlock.68:
	mv      a6,a5
	j       eraseImpl_returnBBlock.67

eraseImpl_thenBodyBBlock.82:
	j       eraseImpl_returnBBlock.69

eraseImpl_afterIfBBlock.82:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.83
	j       eraseImpl_afterIfBBlock.83

eraseImpl_returnBBlock.69:
	mv      a5,a6
	j       eraseImpl_returnBBlock.68

eraseImpl_thenBodyBBlock.83:
	j       eraseImpl_returnBBlock.70

eraseImpl_afterIfBBlock.83:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.84
	j       eraseImpl_afterIfBBlock.84

eraseImpl_returnBBlock.70:
	mv      a6,a5
	j       eraseImpl_returnBBlock.69

eraseImpl_thenBodyBBlock.84:
	j       eraseImpl_returnBBlock.71

eraseImpl_afterIfBBlock.84:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.85
	j       eraseImpl_afterIfBBlock.85

eraseImpl_returnBBlock.71:
	mv      a5,a6
	j       eraseImpl_returnBBlock.70

eraseImpl_thenBodyBBlock.85:
	j       eraseImpl_returnBBlock.72

eraseImpl_afterIfBBlock.85:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.86
	j       eraseImpl_afterIfBBlock.86

eraseImpl_returnBBlock.72:
	mv      a6,a5
	j       eraseImpl_returnBBlock.71

eraseImpl_thenBodyBBlock.86:
	j       eraseImpl_returnBBlock.73

eraseImpl_afterIfBBlock.86:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.87
	j       eraseImpl_afterIfBBlock.87

eraseImpl_returnBBlock.73:
	mv      a5,a6
	j       eraseImpl_returnBBlock.72

eraseImpl_thenBodyBBlock.87:
	j       eraseImpl_returnBBlock.74

eraseImpl_afterIfBBlock.87:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.88
	j       eraseImpl_afterIfBBlock.88

eraseImpl_returnBBlock.74:
	mv      a6,a5
	j       eraseImpl_returnBBlock.73

eraseImpl_thenBodyBBlock.88:
	j       eraseImpl_returnBBlock.75

eraseImpl_afterIfBBlock.88:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.89
	j       eraseImpl_afterIfBBlock.89

eraseImpl_returnBBlock.75:
	mv      a5,a6
	j       eraseImpl_returnBBlock.74

eraseImpl_thenBodyBBlock.89:
	j       eraseImpl_returnBBlock.76

eraseImpl_afterIfBBlock.89:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.90
	j       eraseImpl_afterIfBBlock.90

eraseImpl_returnBBlock.76:
	mv      a6,a5
	j       eraseImpl_returnBBlock.75

eraseImpl_thenBodyBBlock.90:
	j       eraseImpl_returnBBlock.77

eraseImpl_afterIfBBlock.90:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.91
	j       eraseImpl_afterIfBBlock.91

eraseImpl_returnBBlock.77:
	mv      a5,a6
	j       eraseImpl_returnBBlock.76

eraseImpl_thenBodyBBlock.91:
	j       eraseImpl_returnBBlock.78

eraseImpl_afterIfBBlock.91:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.92
	j       eraseImpl_afterIfBBlock.92

eraseImpl_returnBBlock.78:
	mv      a6,a5
	j       eraseImpl_returnBBlock.77

eraseImpl_thenBodyBBlock.92:
	j       eraseImpl_returnBBlock.79

eraseImpl_afterIfBBlock.92:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.93
	j       eraseImpl_afterIfBBlock.93

eraseImpl_returnBBlock.79:
	mv      a5,a6
	j       eraseImpl_returnBBlock.78

eraseImpl_thenBodyBBlock.93:
	j       eraseImpl_returnBBlock.80

eraseImpl_afterIfBBlock.93:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.94
	j       eraseImpl_afterIfBBlock.94

eraseImpl_returnBBlock.80:
	mv      a6,a5
	j       eraseImpl_returnBBlock.79

eraseImpl_thenBodyBBlock.94:
	j       eraseImpl_returnBBlock.81

eraseImpl_afterIfBBlock.94:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.95
	j       eraseImpl_afterIfBBlock.95

eraseImpl_returnBBlock.81:
	mv      a5,a6
	j       eraseImpl_returnBBlock.80

eraseImpl_thenBodyBBlock.95:
	j       eraseImpl_returnBBlock.82

eraseImpl_afterIfBBlock.95:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.96
	j       eraseImpl_afterIfBBlock.96

eraseImpl_returnBBlock.82:
	mv      a6,a5
	j       eraseImpl_returnBBlock.81

eraseImpl_thenBodyBBlock.96:
	j       eraseImpl_returnBBlock.83

eraseImpl_afterIfBBlock.96:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.97
	j       eraseImpl_afterIfBBlock.97

eraseImpl_returnBBlock.83:
	mv      a5,a6
	j       eraseImpl_returnBBlock.82

eraseImpl_thenBodyBBlock.97:
	j       eraseImpl_returnBBlock.84

eraseImpl_afterIfBBlock.97:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.98
	j       eraseImpl_afterIfBBlock.98

eraseImpl_returnBBlock.84:
	mv      a6,a5
	j       eraseImpl_returnBBlock.83

eraseImpl_thenBodyBBlock.98:
	j       eraseImpl_returnBBlock.85

eraseImpl_afterIfBBlock.98:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.99
	j       eraseImpl_afterIfBBlock.99

eraseImpl_returnBBlock.85:
	mv      a5,a6
	j       eraseImpl_returnBBlock.84

eraseImpl_thenBodyBBlock.99:
	j       eraseImpl_returnBBlock.86

eraseImpl_afterIfBBlock.99:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.100
	j       eraseImpl_afterIfBBlock.100

eraseImpl_returnBBlock.86:
	mv      a6,a5
	j       eraseImpl_returnBBlock.85

eraseImpl_thenBodyBBlock.100:
	j       eraseImpl_returnBBlock.87

eraseImpl_afterIfBBlock.100:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.101
	j       eraseImpl_afterIfBBlock.101

eraseImpl_returnBBlock.87:
	mv      a5,a6
	j       eraseImpl_returnBBlock.86

eraseImpl_thenBodyBBlock.101:
	j       eraseImpl_returnBBlock.88

eraseImpl_afterIfBBlock.101:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.102
	j       eraseImpl_afterIfBBlock.102

eraseImpl_returnBBlock.88:
	mv      a6,a5
	j       eraseImpl_returnBBlock.87

eraseImpl_thenBodyBBlock.102:
	j       eraseImpl_returnBBlock.89

eraseImpl_afterIfBBlock.102:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.103
	j       eraseImpl_afterIfBBlock.103

eraseImpl_returnBBlock.89:
	mv      a5,a6
	j       eraseImpl_returnBBlock.88

eraseImpl_thenBodyBBlock.103:
	j       eraseImpl_returnBBlock.90

eraseImpl_afterIfBBlock.103:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.104
	j       eraseImpl_afterIfBBlock.104

eraseImpl_returnBBlock.90:
	mv      a6,a5
	j       eraseImpl_returnBBlock.89

eraseImpl_thenBodyBBlock.104:
	j       eraseImpl_returnBBlock.91

eraseImpl_afterIfBBlock.104:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.105
	j       eraseImpl_afterIfBBlock.105

eraseImpl_returnBBlock.91:
	mv      a5,a6
	j       eraseImpl_returnBBlock.90

eraseImpl_thenBodyBBlock.105:
	j       eraseImpl_returnBBlock.92

eraseImpl_afterIfBBlock.105:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.106
	j       eraseImpl_afterIfBBlock.106

eraseImpl_returnBBlock.92:
	mv      a6,a5
	j       eraseImpl_returnBBlock.91

eraseImpl_thenBodyBBlock.106:
	j       eraseImpl_returnBBlock.93

eraseImpl_afterIfBBlock.106:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.107
	j       eraseImpl_afterIfBBlock.107

eraseImpl_returnBBlock.93:
	mv      a5,a6
	j       eraseImpl_returnBBlock.92

eraseImpl_thenBodyBBlock.107:
	j       eraseImpl_returnBBlock.94

eraseImpl_afterIfBBlock.107:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.108
	j       eraseImpl_afterIfBBlock.108

eraseImpl_returnBBlock.94:
	mv      a6,a5
	j       eraseImpl_returnBBlock.93

eraseImpl_thenBodyBBlock.108:
	j       eraseImpl_returnBBlock.95

eraseImpl_afterIfBBlock.108:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.109
	j       eraseImpl_afterIfBBlock.109

eraseImpl_returnBBlock.95:
	mv      a5,a6
	j       eraseImpl_returnBBlock.94

eraseImpl_thenBodyBBlock.109:
	j       eraseImpl_returnBBlock.96

eraseImpl_afterIfBBlock.109:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.110
	j       eraseImpl_afterIfBBlock.110

eraseImpl_returnBBlock.96:
	mv      a6,a5
	j       eraseImpl_returnBBlock.95

eraseImpl_thenBodyBBlock.110:
	j       eraseImpl_returnBBlock.97

eraseImpl_afterIfBBlock.110:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.111
	j       eraseImpl_afterIfBBlock.111

eraseImpl_returnBBlock.97:
	mv      a5,a6
	j       eraseImpl_returnBBlock.96

eraseImpl_thenBodyBBlock.111:
	j       eraseImpl_returnBBlock.98

eraseImpl_afterIfBBlock.111:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.112
	j       eraseImpl_afterIfBBlock.112

eraseImpl_returnBBlock.98:
	mv      a6,a5
	j       eraseImpl_returnBBlock.97

eraseImpl_thenBodyBBlock.112:
	j       eraseImpl_returnBBlock.99

eraseImpl_afterIfBBlock.112:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a6,4(t2)
	beq     a6,zero,eraseImpl_thenBodyBBlock.113
	j       eraseImpl_afterIfBBlock.113

eraseImpl_returnBBlock.99:
	mv      a5,a6
	j       eraseImpl_returnBBlock.98

eraseImpl_thenBodyBBlock.113:
	j       eraseImpl_returnBBlock.100

eraseImpl_afterIfBBlock.113:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.114
	j       eraseImpl_afterIfBBlock.114

eraseImpl_returnBBlock.100:
	mv      a6,a5
	j       eraseImpl_returnBBlock.99

eraseImpl_thenBodyBBlock.114:
	j       eraseImpl_returnBBlock.101

eraseImpl_afterIfBBlock.114:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.115
	j       eraseImpl_afterIfBBlock.115

eraseImpl_returnBBlock.101:
	mv      a5,a6
	j       eraseImpl_returnBBlock.100

eraseImpl_thenBodyBBlock.115:
	j       eraseImpl_returnBBlock.102

eraseImpl_afterIfBBlock.115:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,eraseImpl_thenBodyBBlock.116
	j       eraseImpl_afterIfBBlock.116

eraseImpl_returnBBlock.102:
	mv      a6,a5
	j       eraseImpl_returnBBlock.101

eraseImpl_thenBodyBBlock.116:
	j       eraseImpl_returnBBlock.103

eraseImpl_afterIfBBlock.116:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.117
	j       eraseImpl_afterIfBBlock.117

eraseImpl_returnBBlock.103:
	mv      a5,a6
	j       eraseImpl_returnBBlock.102

eraseImpl_thenBodyBBlock.117:
	j       eraseImpl_returnBBlock.104

eraseImpl_afterIfBBlock.117:
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.118
	j       eraseImpl_afterIfBBlock.118

eraseImpl_returnBBlock.104:
	mv      a6,a5
	j       eraseImpl_returnBBlock.103

eraseImpl_thenBodyBBlock.118:
	j       eraseImpl_returnBBlock.105

eraseImpl_afterIfBBlock.118:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a0,4(t2)
	beq     a0,zero,eraseImpl_thenBodyBBlock.119
	j       eraseImpl_afterIfBBlock.119

eraseImpl_returnBBlock.105:
	mv      a5,a6
	j       eraseImpl_returnBBlock.104

eraseImpl_thenBodyBBlock.119:
	j       eraseImpl_returnBBlock.106

eraseImpl_afterIfBBlock.119:
	addi    a5,a0,4
	lw      a5,4(a0)
	addi    a6,a5,4
	lw      a5,4(a5)
	beq     a5,zero,eraseImpl_thenBodyBBlock.120
	j       eraseImpl_afterIfBBlock.120

eraseImpl_returnBBlock.106:
	mv      a6,a5
	j       eraseImpl_returnBBlock.105

eraseImpl_thenBodyBBlock.120:
	j       eraseImpl_returnBBlock.107

eraseImpl_afterIfBBlock.120:
	mv      a0,a5
	call    findLargest
	j       eraseImpl_returnBBlock.107

eraseImpl_returnBBlock.107:
	mv      a5,a0
	j       eraseImpl_returnBBlock.106


	.globl  printTree
	.p2align	2
	.type   printTree, @function
printTree:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	mv      s1,a0
	beq     s1,zero,printTree_thenBodyBBlock.0
	j       printTree_afterIfBBlock.0

printTree_thenBodyBBlock.0:
	j       printTree_returnBBlock.0

printTree_afterIfBBlock.0:
	addi    s0,s1,4
	lw      s0,4(s1)
	lw      a0,0(s0)
	call    printTree
	addi    s0,s1,8
	lw      a0,8(s1)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s0,a0
	addi    a5,s1,12
	lw      a0,12(s1)
	call    __toString
	mv      a1,a0
	mv      a0,s0
	call    __stringAdd
	call    __println
	lw      s0,4(s1)
	addi    a5,s0,4
	lw      a0,4(s0)
	call    printTree
	j       printTree_returnBBlock.0

printTree_returnBBlock.0:
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


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
	sw      s4,8(sp)
	sw      s5,4(sp)
	mv      s5,s6
	lui     s0,%hi(root)
	sw      zero,%lo(root)(s0)
	call    __getInt
	li      s0,0
	mv      s3,s0
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	li      s0,50000
	blt     s3,s0,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    s0,a0,13
	xor     a5,a0,s0
	li      s0,2147483647
	and     a5,a5,s0
	srai    s0,a5,17
	xor     a5,a5,s0
	slli    s0,a5,5
	xor     a5,a5,s0
	li      s0,2147483647
	and     s0,a5,s0
	li      a5,128
	rem     s2,s0,a5
	slli    a5,s0,13
	xor     s0,s0,a5
	li      a5,2147483647
	and     a5,s0,a5
	srai    s0,a5,17
	xor     s0,a5,s0
	slli    a5,s0,5
	xor     a5,s0,a5
	li      s0,2147483647
	and     s6,a5,s0
	li      s0,1717986912
	blt     s6,s0,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_afterForBBlock.0:
	li      s0,0
	mv      s1,s0
	j       main_forCondBBlock.1

main_thenBodyBBlock.0:
	lui     s0,%hi(root)
	lw      s0,%lo(root)(s0)
	bne     s0,zero,main_thenBodyBBlock.2
	j       main_afterIfBBlock.2

main_elseBodyBBlock.0:
	lui     s0,%hi(root)
	lw      s4,%lo(root)(s0)
	beq     s4,zero,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_afterIfBBlock.0:
	addi    s0,s3,1
	mv      a0,s6
	mv      s3,s0
	j       main_forCondBBlock.0

main_thenBodyBBlock.1:
	li      s0,1
	j       main_returnBBlock.4

main_afterIfBBlock.1:
	li      s0,2
	j       main_returnBBlock.4

main_returnBBlock.4:
	li      a5,1
	beq     s0,a5,main_thenBodyBBlock.0
	j       main_elseBodyBBlock.0

main_thenBodyBBlock.2:
	beq     s0,zero,main_thenBodyBBlock.13
	j       main_afterIfBBlock.13

main_afterIfBBlock.2:
	li      a0,16
	call    __malloc
	mv      s0,a0
	addi    a5,s0,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a5,a0,4
	sw      a5,4(s0)
	addi    a6,s0,8
	sw      s2,8(s0)
	li      a6,1
	addi    t2,s0,12
	sw      a6,12(s0)
	sw      zero,0(s0)
	sw      zero,0(a5)
	addi    a6,a5,4
	sw      zero,4(a5)
	lui     a5,%hi(root)
	sw      s0,%lo(root)(a5)
	j       main_returnBBlock.6

main_returnBBlock.6:
	j       main_afterIfBBlock.0

main_thenBodyBBlock.3:
	j       main_returnBBlock.8

main_afterIfBBlock.3:
	beq     s4,zero,main_thenBodyBBlock.16
	j       main_afterIfBBlock.16

main_returnBBlock.8:
	j       main_afterIfBBlock.0

main_forCondBBlock.1:
	li      s0,100000
	blt     s1,s0,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    s0,a0,13
	xor     a5,a0,s0
	li      s0,2147483647
	and     s0,a5,s0
	srai    a5,s0,17
	xor     a5,s0,a5
	slli    s0,a5,5
	xor     s0,a5,s0
	li      a5,2147483647
	and     s0,s0,a5
	li      a5,128
	rem     s2,s0,a5
	slli    a5,s0,13
	xor     s0,s0,a5
	li      a5,2147483647
	and     a5,s0,a5
	srai    s0,a5,17
	xor     s0,a5,s0
	slli    a5,s0,5
	xor     s0,s0,a5
	li      a5,2147483647
	and     s4,s0,a5
	li      s0,429496728
	blt     s4,s0,main_thenBodyBBlock.5
	j       main_afterIfBBlock.5

main_afterForBBlock.1:
	li      s0,0
	j       main_forCondBBlock.2

main_thenBodyBBlock.4:
	lui     s0,%hi(root)
	lw      s3,%lo(root)(s0)
	bne     s3,zero,main_thenBodyBBlock.6
	j       main_afterIfBBlock.6

main_elseBodyBBlock.1:
	lui     s0,%hi(root)
	lw      s3,%lo(root)(s0)
	beq     s3,zero,main_thenBodyBBlock.7
	j       main_afterIfBBlock.7

main_afterIfBBlock.4:
	addi    s0,s1,1
	mv      a0,s4
	mv      s1,s0
	j       main_forCondBBlock.1

main_thenBodyBBlock.5:
	li      s0,1
	j       main_returnBBlock.11

main_afterIfBBlock.5:
	li      s0,2
	j       main_returnBBlock.11

main_returnBBlock.11:
	li      a5,1
	beq     s0,a5,main_thenBodyBBlock.4
	j       main_elseBodyBBlock.1

main_thenBodyBBlock.6:
	beq     s3,zero,main_thenBodyBBlock.32
	j       main_afterIfBBlock.32

main_afterIfBBlock.6:
	li      a0,16
	call    __malloc
	mv      s0,a0
	addi    a5,s0,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a5,a0,4
	sw      a5,4(s0)
	addi    a6,s0,8
	sw      s2,8(s0)
	li      a6,1
	addi    t2,s0,12
	sw      a6,12(s0)
	sw      zero,0(s0)
	sw      zero,0(a5)
	addi    a6,a5,4
	sw      zero,4(a5)
	lui     a5,%hi(root)
	sw      s0,%lo(root)(a5)
	j       main_returnBBlock.13

main_returnBBlock.13:
	j       main_afterIfBBlock.4

main_thenBodyBBlock.7:
	j       main_returnBBlock.15

main_afterIfBBlock.7:
	beq     s3,zero,main_thenBodyBBlock.35
	j       main_afterIfBBlock.35

main_returnBBlock.15:
	j       main_afterIfBBlock.4

main_forCondBBlock.2:
	li      a5,50000
	blt     s0,a5,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	slli    a5,a0,13
	xor     a5,a0,a5
	li      a6,2147483647
	and     a6,a5,a6
	srai    a5,a6,17
	xor     a5,a6,a5
	slli    a6,a5,5
	xor     a5,a5,a6
	li      a6,2147483647
	and     a6,a5,a6
	li      a5,128
	rem     s4,a6,a5
	slli    a5,a6,13
	xor     a6,a6,a5
	li      a5,2147483647
	and     a5,a6,a5
	srai    a6,a5,17
	xor     a6,a5,a6
	slli    a5,a6,5
	xor     a5,a6,a5
	li      a6,2147483647
	and     s6,a5,a6
	li      a5,858993456
	blt     s6,a5,main_thenBodyBBlock.9
	j       main_afterIfBBlock.9

main_afterForBBlock.2:
	lui     s0,%hi(root)
	lw      s1,%lo(root)(s0)
	beq     s1,zero,main_thenBodyBBlock.12
	j       main_afterIfBBlock.12

main_thenBodyBBlock.8:
	lui     a5,%hi(root)
	lw      s3,%lo(root)(a5)
	bne     s3,zero,main_thenBodyBBlock.10
	j       main_afterIfBBlock.10

main_elseBodyBBlock.2:
	lui     a5,%hi(root)
	lw      s1,%lo(root)(a5)
	beq     s1,zero,main_thenBodyBBlock.11
	j       main_afterIfBBlock.11

main_afterIfBBlock.8:
	addi    s0,s0,1
	mv      a0,s6
	j       main_forCondBBlock.2

main_thenBodyBBlock.9:
	li      a5,1
	j       main_returnBBlock.18

main_afterIfBBlock.9:
	li      a5,2
	j       main_returnBBlock.18

main_returnBBlock.18:
	li      a6,1
	beq     a5,a6,main_thenBodyBBlock.8
	j       main_elseBodyBBlock.2

main_thenBodyBBlock.10:
	beq     s3,zero,main_thenBodyBBlock.51
	j       main_afterIfBBlock.51

main_afterIfBBlock.10:
	li      a0,16
	call    __malloc
	mv      s1,a0
	addi    a5,s1,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a5,a0,4
	sw      a5,4(s1)
	addi    a6,s1,8
	sw      s4,8(s1)
	li      a6,1
	addi    t2,s1,12
	sw      a6,12(s1)
	sw      zero,0(s1)
	sw      zero,0(a5)
	addi    a6,a5,4
	sw      zero,4(a5)
	lui     a5,%hi(root)
	sw      s1,%lo(root)(a5)
	j       main_returnBBlock.20

main_returnBBlock.20:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.11:
	j       main_returnBBlock.22

main_afterIfBBlock.11:
	beq     s1,zero,main_thenBodyBBlock.56
	j       main_afterIfBBlock.56

main_returnBBlock.22:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.12:
	j       main_returnBBlock.23

main_afterIfBBlock.12:
	addi    s0,s1,4
	lw      s0,4(s1)
	lw      s0,0(s0)
	beq     s0,zero,main_thenBodyBBlock.54
	j       main_afterIfBBlock.54

main_returnBBlock.23:
	li      a0,0
	mv      s6,s5
	lw      s5,4(sp)
	lw      s4,8(sp)
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

main_thenBodyBBlock.13:
	li      a0,16
	call    __malloc
	mv      s0,a0
	addi    a5,s0,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a5,a0,4
	sw      a5,4(s0)
	addi    a6,s0,8
	sw      s2,8(s0)
	li      a6,1
	addi    t2,s0,12
	sw      a6,12(s0)
	sw      zero,0(s0)
	sw      zero,0(a5)
	addi    a6,a5,4
	sw      zero,4(a5)
	addi    a5,zero,4
	lw      a6,4(zero)
	addi    a5,a6,-4
	sw      s0,-4(a6)
	j       main_returnBBlock.24

main_afterIfBBlock.13:
	addi    a5,s0,8
	lw      a5,8(s0)
	beq     a5,s2,main_thenBodyBBlock.14
	j       main_afterIfBBlock.14

main_thenBodyBBlock.14:
	addi    a5,s0,12
	lw      a5,12(s0)
	addi    a5,a5,1
	sw      a5,12(s0)
	j       main_returnBBlock.24

main_afterIfBBlock.14:
	blt     a5,s2,main_thenBodyBBlock.15
	j       main_criticalEdge.0

main_thenBodyBBlock.15:
	li      a5,1
	mv      s4,a5
	j       main_afterIfBBlock.15

main_afterIfBBlock.15:
	addi    a5,s0,4
	lw      a5,4(s0)
	slli    a6,s4,2
	add     a5,a5,a6
	lw      a1,0(a5)
	beq     a1,zero,main_thenBodyBBlock.73
	j       main_afterIfBBlock.73

main_returnBBlock.24:
	j       main_returnBBlock.6

main_thenBodyBBlock.16:
	j       main_returnBBlock.25

main_afterIfBBlock.16:
	addi    s0,s4,8
	lw      s0,8(s4)
	bgt     s0,s2,main_thenBodyBBlock.17
	j       main_afterIfBBlock.17

main_thenBodyBBlock.17:
	addi    s0,s4,4
	lw      s0,4(s4)
	lw      a0,0(s0)
	mv      a1,s4
	li      a2,0
	mv      a3,s2
	call    eraseImpl
	j       main_returnBBlock.25

main_afterIfBBlock.17:
	blt     s0,s2,main_thenBodyBBlock.18
	j       main_afterIfBBlock.18

main_thenBodyBBlock.18:
	addi    s0,s4,4
	lw      s0,4(s4)
	addi    a5,s0,4
	lw      a0,4(s0)
	mv      a1,s4
	li      a2,1
	mv      a3,s2
	call    eraseImpl
	j       main_returnBBlock.25

main_afterIfBBlock.18:
	addi    s0,s4,12
	lw      s0,12(s4)
	addi    s0,s0,-1
	sw      s0,12(s4)
	li      a5,0
	bgt     s0,a5,main_thenBodyBBlock.19
	j       main_afterIfBBlock.19

main_thenBodyBBlock.19:
	j       main_returnBBlock.25

main_afterIfBBlock.19:
	addi    s0,s4,4
	lw      a5,4(s4)
	lw      s0,0(a5)
	beq     s0,zero,main_thenBodyBBlock.20
	j       main_afterIfBBlock.20

main_thenBodyBBlock.20:
	bne     zero,zero,main_thenBodyBBlock.21
	j       main_afterIfBBlock.21

main_afterIfBBlock.20:
	addi    a5,s0,4
	lw      a5,4(s0)
	addi    a6,a5,4
	lw      a5,4(a5)
	beq     a5,zero,main_thenBodyBBlock.30
	j       main_afterIfBBlock.30

main_thenBodyBBlock.21:
	addi    s0,zero,4
	lw      a6,4(zero)
	addi    s0,a6,-4
	addi    s0,a5,4
	lw      s0,4(a5)
	sw      s0,-4(a6)
	j       main_afterIfBBlock.21

main_afterIfBBlock.21:
	addi    s0,a5,4
	lw      s0,4(a5)
	bne     s0,zero,main_thenBodyBBlock.22
	j       main_afterIfBBlock.22

main_thenBodyBBlock.22:
	sw      zero,0(s0)
	j       main_afterIfBBlock.22

main_afterIfBBlock.22:
	lw      s0,8(s4)
	beq     s2,s0,main_thenBodyBBlock.23
	j       main_afterIfBBlock.23

main_thenBodyBBlock.23:
	lw      a5,4(a5)
	lui     s0,%hi(root)
	sw      a5,%lo(root)(s0)
	j       main_afterIfBBlock.23

main_afterIfBBlock.23:
	j       main_returnBBlock.25

main_thenBodyBBlock.24:
	lui     a5,%hi(root)
	sw      s0,%lo(root)(a5)
	j       main_afterIfBBlock.24

main_afterIfBBlock.24:
	addi    a5,s0,8
	lw      t1,8(s0)
	lw      t2,4(s4)
	lw      a5,0(t2)
	addi    a6,a5,8
	lw      a5,8(a5)
	bne     t1,a5,main_thenBodyBBlock.25
	j       main_afterIfBBlock.25

main_thenBodyBBlock.25:
	lw      a5,0(s0)
	addi    a6,a5,4
	lw      s4,4(a5)
	addi    a5,s4,4
	addi    a5,s0,4
	lw      a5,4(s0)
	lw      a6,0(a5)
	sw      a6,4(s4)
	lw      a5,0(a5)
	bne     a5,zero,main_thenBodyBBlock.26
	j       main_afterIfBBlock.26

main_afterIfBBlock.25:
	bne     zero,zero,main_thenBodyBBlock.27
	j       main_afterIfBBlock.27

main_thenBodyBBlock.26:
	lw      a6,0(s0)
	sw      a6,0(a5)
	j       main_afterIfBBlock.26

main_afterIfBBlock.26:
	j       main_afterIfBBlock.25

main_thenBodyBBlock.27:
	addi    a5,zero,4
	lw      a5,4(zero)
	addi    a6,a5,-4
	sw      s0,-4(a5)
	j       main_afterIfBBlock.27

main_afterIfBBlock.27:
	sw      zero,0(s0)
	addi    a5,s0,4
	lw      a5,4(s0)
	addi    a6,a5,4
	addi    a6,t2,4
	lw      a6,4(t2)
	sw      a6,4(a5)
	lw      a6,4(t2)
	bne     a6,zero,main_thenBodyBBlock.28
	j       main_afterIfBBlock.28

main_thenBodyBBlock.28:
	sw      s0,0(a6)
	j       main_afterIfBBlock.28

main_afterIfBBlock.28:
	lw      a6,0(t2)
	addi    s4,a6,8
	lw      s4,8(a6)
	bne     t1,s4,main_thenBodyBBlock.29
	j       main_afterIfBBlock.29

main_thenBodyBBlock.29:
	sw      a6,0(a5)
	lw      a5,0(t2)
	sw      s0,0(a5)
	j       main_afterIfBBlock.29

main_afterIfBBlock.29:
	j       main_returnBBlock.25

main_returnBBlock.25:
	j       main_returnBBlock.8

main_thenBodyBBlock.30:
	j       main_returnBBlock.26

main_afterIfBBlock.30:
	addi    s0,a5,4
	lw      s0,4(a5)
	addi    a6,s0,4
	lw      s0,4(s0)
	beq     s0,zero,main_thenBodyBBlock.31
	j       main_afterIfBBlock.31

main_returnBBlock.26:
	lui     a5,%hi(root)
	lw      a5,%lo(root)(a5)
	addi    a6,a5,8
	lw      a5,8(a5)
	beq     s2,a5,main_thenBodyBBlock.24
	j       main_afterIfBBlock.24

main_thenBodyBBlock.31:
	j       main_returnBBlock.27

main_afterIfBBlock.31:
	addi    a5,s0,4
	lw      a6,4(s0)
	addi    a5,a6,4
	lw      a0,4(a6)
	beq     a0,zero,main_thenBodyBBlock.76
	j       main_afterIfBBlock.76

main_returnBBlock.27:
	mv      s0,a5
	j       main_returnBBlock.26

main_thenBodyBBlock.32:
	li      a0,16
	call    __malloc
	mv      s0,a0
	addi    a5,s0,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a5,a0,4
	sw      a5,4(s0)
	addi    a6,s0,8
	sw      s2,8(s0)
	li      a6,1
	addi    t2,s0,12
	sw      a6,12(s0)
	sw      zero,0(s0)
	sw      zero,0(a5)
	addi    a6,a5,4
	sw      zero,4(a5)
	addi    a5,zero,4
	lw      a5,4(zero)
	addi    a6,a5,-4
	sw      s0,-4(a5)
	j       main_returnBBlock.28

main_afterIfBBlock.32:
	addi    s0,s3,8
	lw      s0,8(s3)
	beq     s0,s2,main_thenBodyBBlock.33
	j       main_afterIfBBlock.33

main_thenBodyBBlock.33:
	addi    s0,s3,12
	lw      s0,12(s3)
	addi    s0,s0,1
	sw      s0,12(s3)
	j       main_returnBBlock.28

main_afterIfBBlock.33:
	blt     s0,s2,main_thenBodyBBlock.34
	j       main_criticalEdge.1

main_thenBodyBBlock.34:
	li      s0,1
	j       main_afterIfBBlock.34

main_afterIfBBlock.34:
	addi    a5,s3,4
	lw      a5,4(s3)
	slli    a6,s0,2
	add     a5,a5,a6
	lw      a1,0(a5)
	beq     a1,zero,main_thenBodyBBlock.77
	j       main_afterIfBBlock.77

main_returnBBlock.28:
	j       main_returnBBlock.13

main_thenBodyBBlock.35:
	j       main_returnBBlock.29

main_afterIfBBlock.35:
	addi    s0,s3,8
	lw      s0,8(s3)
	bgt     s0,s2,main_thenBodyBBlock.36
	j       main_afterIfBBlock.36

main_thenBodyBBlock.36:
	addi    s0,s3,4
	lw      s0,4(s3)
	lw      a0,0(s0)
	mv      a1,s3
	li      a2,0
	mv      a3,s2
	call    eraseImpl
	j       main_returnBBlock.29

main_afterIfBBlock.36:
	blt     s0,s2,main_thenBodyBBlock.37
	j       main_afterIfBBlock.37

main_thenBodyBBlock.37:
	addi    s0,s3,4
	lw      a5,4(s3)
	addi    s0,a5,4
	lw      a0,4(a5)
	mv      a1,s3
	li      a2,1
	mv      a3,s2
	call    eraseImpl
	j       main_returnBBlock.29

main_afterIfBBlock.37:
	addi    s0,s3,12
	lw      s0,12(s3)
	addi    a5,s0,-1
	sw      a5,12(s3)
	li      s0,0
	bgt     a5,s0,main_thenBodyBBlock.38
	j       main_afterIfBBlock.38

main_thenBodyBBlock.38:
	j       main_returnBBlock.29

main_afterIfBBlock.38:
	addi    s0,s3,4
	lw      a5,4(s3)
	lw      s0,0(a5)
	beq     s0,zero,main_thenBodyBBlock.39
	j       main_afterIfBBlock.39

main_thenBodyBBlock.39:
	bne     zero,zero,main_thenBodyBBlock.40
	j       main_afterIfBBlock.40

main_afterIfBBlock.39:
	addi    a5,s0,4
	lw      a5,4(s0)
	addi    a6,a5,4
	lw      a5,4(a5)
	beq     a5,zero,main_thenBodyBBlock.49
	j       main_afterIfBBlock.49

main_thenBodyBBlock.40:
	addi    s0,zero,4
	lw      a6,4(zero)
	addi    s0,a6,-4
	addi    s0,a5,4
	lw      s0,4(a5)
	sw      s0,-4(a6)
	j       main_afterIfBBlock.40

main_afterIfBBlock.40:
	addi    s0,a5,4
	lw      s0,4(a5)
	bne     s0,zero,main_thenBodyBBlock.41
	j       main_afterIfBBlock.41

main_thenBodyBBlock.41:
	sw      zero,0(s0)
	j       main_afterIfBBlock.41

main_afterIfBBlock.41:
	lw      s0,8(s3)
	beq     s2,s0,main_thenBodyBBlock.42
	j       main_afterIfBBlock.42

main_thenBodyBBlock.42:
	lw      s0,4(a5)
	lui     a5,%hi(root)
	sw      s0,%lo(root)(a5)
	j       main_afterIfBBlock.42

main_afterIfBBlock.42:
	j       main_returnBBlock.29

main_thenBodyBBlock.43:
	lui     a5,%hi(root)
	sw      s0,%lo(root)(a5)
	j       main_afterIfBBlock.43

main_afterIfBBlock.43:
	addi    a5,s0,8
	lw      t1,8(s0)
	lw      t2,4(s3)
	lw      a6,0(t2)
	addi    a5,a6,8
	lw      a5,8(a6)
	bne     t1,a5,main_thenBodyBBlock.44
	j       main_afterIfBBlock.44

main_thenBodyBBlock.44:
	lw      a6,0(s0)
	addi    a5,a6,4
	lw      a0,4(a6)
	addi    a5,a0,4
	addi    a5,s0,4
	lw      a5,4(s0)
	lw      a6,0(a5)
	sw      a6,4(a0)
	lw      a5,0(a5)
	bne     a5,zero,main_thenBodyBBlock.45
	j       main_afterIfBBlock.45

main_afterIfBBlock.44:
	bne     zero,zero,main_thenBodyBBlock.46
	j       main_afterIfBBlock.46

main_thenBodyBBlock.45:
	lw      a6,0(s0)
	sw      a6,0(a5)
	j       main_afterIfBBlock.45

main_afterIfBBlock.45:
	j       main_afterIfBBlock.44

main_thenBodyBBlock.46:
	addi    a5,zero,4
	lw      a5,4(zero)
	addi    a6,a5,-4
	sw      s0,-4(a5)
	j       main_afterIfBBlock.46

main_afterIfBBlock.46:
	sw      zero,0(s0)
	addi    a5,s0,4
	lw      a5,4(s0)
	addi    a6,a5,4
	addi    a6,t2,4
	lw      a6,4(t2)
	sw      a6,4(a5)
	lw      a6,4(t2)
	bne     a6,zero,main_thenBodyBBlock.47
	j       main_afterIfBBlock.47

main_thenBodyBBlock.47:
	sw      s0,0(a6)
	j       main_afterIfBBlock.47

main_afterIfBBlock.47:
	lw      a0,0(t2)
	addi    a6,a0,8
	lw      a6,8(a0)
	bne     t1,a6,main_thenBodyBBlock.48
	j       main_afterIfBBlock.48

main_thenBodyBBlock.48:
	sw      a0,0(a5)
	lw      a5,0(t2)
	sw      s0,0(a5)
	j       main_afterIfBBlock.48

main_afterIfBBlock.48:
	j       main_returnBBlock.29

main_returnBBlock.29:
	j       main_returnBBlock.15

main_thenBodyBBlock.49:
	j       main_returnBBlock.30

main_afterIfBBlock.49:
	addi    s0,a5,4
	lw      s0,4(a5)
	addi    a6,s0,4
	lw      s0,4(s0)
	beq     s0,zero,main_thenBodyBBlock.50
	j       main_afterIfBBlock.50

main_returnBBlock.30:
	lui     a5,%hi(root)
	lw      a6,%lo(root)(a5)
	addi    a5,a6,8
	lw      a5,8(a6)
	beq     s2,a5,main_thenBodyBBlock.43
	j       main_afterIfBBlock.43

main_thenBodyBBlock.50:
	j       main_returnBBlock.31

main_afterIfBBlock.50:
	addi    a5,s0,4
	lw      a5,4(s0)
	addi    a6,a5,4
	lw      a0,4(a5)
	beq     a0,zero,main_thenBodyBBlock.80
	j       main_afterIfBBlock.80

main_returnBBlock.31:
	mv      s0,a5
	j       main_returnBBlock.30

main_thenBodyBBlock.51:
	li      a0,16
	call    __malloc
	mv      s1,a0
	addi    a5,s1,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a5,a0,4
	sw      a5,4(s1)
	addi    a6,s1,8
	sw      s4,8(s1)
	li      a6,1
	addi    t2,s1,12
	sw      a6,12(s1)
	sw      zero,0(s1)
	sw      zero,0(a5)
	addi    a6,a5,4
	sw      zero,4(a5)
	addi    a5,zero,4
	lw      a5,4(zero)
	addi    a6,a5,-4
	sw      s1,-4(a5)
	j       main_returnBBlock.32

main_afterIfBBlock.51:
	addi    a5,s3,8
	lw      a5,8(s3)
	beq     a5,s4,main_thenBodyBBlock.52
	j       main_afterIfBBlock.52

main_thenBodyBBlock.52:
	addi    a5,s3,12
	lw      a5,12(s3)
	addi    a5,a5,1
	sw      a5,12(s3)
	j       main_returnBBlock.32

main_afterIfBBlock.52:
	blt     a5,s4,main_thenBodyBBlock.53
	j       main_criticalEdge.2

main_thenBodyBBlock.53:
	li      a5,1
	mv      s1,a5
	j       main_afterIfBBlock.53

main_afterIfBBlock.53:
	addi    a5,s3,4
	lw      a5,4(s3)
	slli    a6,s1,2
	add     a5,a5,a6
	lw      a1,0(a5)
	beq     a1,zero,main_thenBodyBBlock.81
	j       main_afterIfBBlock.81

main_returnBBlock.32:
	j       main_returnBBlock.20

main_thenBodyBBlock.54:
	j       main_returnBBlock.33

main_afterIfBBlock.54:
	addi    a5,s0,4
	lw      a5,4(s0)
	lw      s4,0(a5)
	beq     s4,zero,main_thenBodyBBlock.84
	j       main_afterIfBBlock.84

main_returnBBlock.33:
	addi    s0,s1,8
	lw      a0,8(s1)
	call    __toString
    la      s4,.str.0
	mv      a1,s4
	call    __stringAdd
	mv      s0,a0
	addi    a5,s1,12
	lw      a0,12(s1)
	call    __toString
	mv      a1,a0
	mv      a0,s0
	call    __stringAdd
	call    __println
	lw      s0,4(s1)
	addi    a5,s0,4
	lw      s1,4(s0)
	beq     s1,zero,main_thenBodyBBlock.55
	j       main_afterIfBBlock.55

main_thenBodyBBlock.55:
	j       main_returnBBlock.34

main_afterIfBBlock.55:
	addi    s0,s1,4
	lw      s0,4(s1)
	lw      s3,0(s0)
	beq     s3,zero,main_thenBodyBBlock.86
	j       main_afterIfBBlock.86

main_returnBBlock.34:
	j       main_returnBBlock.23

main_thenBodyBBlock.56:
	j       main_returnBBlock.35

main_afterIfBBlock.56:
	addi    a5,s1,8
	lw      a5,8(s1)
	bgt     a5,s4,main_thenBodyBBlock.57
	j       main_afterIfBBlock.57

main_thenBodyBBlock.57:
	addi    a5,s1,4
	lw      a5,4(s1)
	lw      a0,0(a5)
	mv      a1,s1
	li      a2,0
	mv      a3,s4
	call    eraseImpl
	j       main_returnBBlock.35

main_afterIfBBlock.57:
	blt     a5,s4,main_thenBodyBBlock.58
	j       main_afterIfBBlock.58

main_thenBodyBBlock.58:
	addi    a5,s1,4
	lw      a5,4(s1)
	addi    a6,a5,4
	lw      a0,4(a5)
	mv      a1,s1
	li      a2,1
	mv      a3,s4
	call    eraseImpl
	j       main_returnBBlock.35

main_afterIfBBlock.58:
	addi    a5,s1,12
	lw      a5,12(s1)
	addi    a6,a5,-1
	sw      a6,12(s1)
	li      a5,0
	bgt     a6,a5,main_thenBodyBBlock.59
	j       main_afterIfBBlock.59

main_thenBodyBBlock.59:
	j       main_returnBBlock.35

main_afterIfBBlock.59:
	addi    a5,s1,4
	lw      t2,4(s1)
	lw      a6,0(t2)
	beq     a6,zero,main_thenBodyBBlock.60
	j       main_afterIfBBlock.60

main_thenBodyBBlock.60:
	bne     zero,zero,main_thenBodyBBlock.61
	j       main_afterIfBBlock.61

main_afterIfBBlock.60:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,main_thenBodyBBlock.70
	j       main_afterIfBBlock.70

main_thenBodyBBlock.61:
	addi    a5,zero,4
	lw      a6,4(zero)
	addi    a5,a6,-4
	addi    a5,t2,4
	lw      a5,4(t2)
	sw      a5,-4(a6)
	j       main_afterIfBBlock.61

main_afterIfBBlock.61:
	addi    a5,t2,4
	lw      a5,4(t2)
	bne     a5,zero,main_thenBodyBBlock.62
	j       main_afterIfBBlock.62

main_thenBodyBBlock.62:
	sw      zero,0(a5)
	j       main_afterIfBBlock.62

main_afterIfBBlock.62:
	lw      a5,8(s1)
	beq     s4,a5,main_thenBodyBBlock.63
	j       main_afterIfBBlock.63

main_thenBodyBBlock.63:
	lw      a5,4(t2)
	lui     a6,%hi(root)
	sw      a5,%lo(root)(a6)
	j       main_afterIfBBlock.63

main_afterIfBBlock.63:
	j       main_returnBBlock.35

main_thenBodyBBlock.64:
	lui     a5,%hi(root)
	sw      a6,%lo(root)(a5)
	j       main_afterIfBBlock.64

main_afterIfBBlock.64:
	addi    a5,a6,8
	lw      s4,8(a6)
	lw      t1,4(s1)
	lw      a5,0(t1)
	addi    t2,a5,8
	lw      a5,8(a5)
	bne     s4,a5,main_thenBodyBBlock.65
	j       main_afterIfBBlock.65

main_thenBodyBBlock.65:
	lw      a5,0(a6)
	addi    t2,a5,4
	lw      t2,4(a5)
	addi    a5,t2,4
	addi    a5,a6,4
	lw      a5,4(a6)
	lw      a0,0(a5)
	sw      a0,4(t2)
	lw      a5,0(a5)
	bne     a5,zero,main_thenBodyBBlock.66
	j       main_afterIfBBlock.66

main_afterIfBBlock.65:
	bne     zero,zero,main_thenBodyBBlock.67
	j       main_afterIfBBlock.67

main_thenBodyBBlock.66:
	lw      t2,0(a6)
	sw      t2,0(a5)
	j       main_afterIfBBlock.66

main_afterIfBBlock.66:
	j       main_afterIfBBlock.65

main_thenBodyBBlock.67:
	addi    a5,zero,4
	lw      t2,4(zero)
	addi    a5,t2,-4
	sw      a6,-4(t2)
	j       main_afterIfBBlock.67

main_afterIfBBlock.67:
	sw      zero,0(a6)
	addi    a5,a6,4
	lw      a5,4(a6)
	addi    t2,a5,4
	addi    t2,t1,4
	lw      t2,4(t1)
	sw      t2,4(a5)
	lw      t2,4(t1)
	bne     t2,zero,main_thenBodyBBlock.68
	j       main_afterIfBBlock.68

main_thenBodyBBlock.68:
	sw      a6,0(t2)
	j       main_afterIfBBlock.68

main_afterIfBBlock.68:
	lw      a0,0(t1)
	addi    t2,a0,8
	lw      t2,8(a0)
	bne     s4,t2,main_thenBodyBBlock.69
	j       main_afterIfBBlock.69

main_thenBodyBBlock.69:
	sw      a0,0(a5)
	lw      a5,0(t1)
	sw      a6,0(a5)
	j       main_afterIfBBlock.69

main_afterIfBBlock.69:
	j       main_returnBBlock.35

main_returnBBlock.35:
	j       main_returnBBlock.22

main_thenBodyBBlock.70:
	j       main_returnBBlock.36

main_afterIfBBlock.70:
	addi    a6,a5,4
	lw      a6,4(a5)
	addi    t2,a6,4
	lw      a6,4(a6)
	beq     a6,zero,main_thenBodyBBlock.71
	j       main_afterIfBBlock.71

main_returnBBlock.36:
	lui     a5,%hi(root)
	lw      a5,%lo(root)(a5)
	addi    t2,a5,8
	lw      a5,8(a5)
	beq     s4,a5,main_thenBodyBBlock.64
	j       main_afterIfBBlock.64

main_thenBodyBBlock.71:
	j       main_returnBBlock.37

main_afterIfBBlock.71:
	addi    a5,a6,4
	lw      t2,4(a6)
	addi    a5,t2,4
	lw      a5,4(t2)
	beq     a5,zero,main_thenBodyBBlock.72
	j       main_afterIfBBlock.72

main_returnBBlock.37:
	mv      a6,a5
	j       main_returnBBlock.36

main_thenBodyBBlock.72:
	j       main_returnBBlock.38

main_afterIfBBlock.72:
	addi    a6,a5,4
	lw      t2,4(a5)
	addi    a6,t2,4
	lw      a0,4(t2)
	beq     a0,zero,main_thenBodyBBlock.88
	j       main_afterIfBBlock.88

main_returnBBlock.38:
	mv      a5,a6
	j       main_returnBBlock.37

main_thenBodyBBlock.73:
	li      a0,16
	call    __malloc
	mv      s1,a0
	addi    a5,s1,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a6,a0,4
	sw      a6,4(s1)
	addi    a5,s1,8
	sw      s2,8(s1)
	li      a5,1
	addi    t2,s1,12
	sw      a5,12(s1)
	mv      a5,s1
	sw      s0,0(s1)
	sw      zero,0(a6)
	addi    a5,a6,4
	sw      zero,4(a6)
	lw      s0,4(s0)
	slli    a5,s4,2
	add     s0,s0,a5
	sw      s1,0(s0)
	j       main_returnBBlock.39

main_afterIfBBlock.73:
	addi    s0,a1,8
	lw      s0,8(a1)
	beq     s0,s2,main_thenBodyBBlock.74
	j       main_afterIfBBlock.74

main_thenBodyBBlock.74:
	addi    s0,a1,12
	lw      s0,12(a1)
	addi    s0,s0,1
	sw      s0,12(a1)
	j       main_returnBBlock.39

main_afterIfBBlock.74:
	blt     s0,s2,main_thenBodyBBlock.75
	j       main_criticalEdge.3

main_thenBodyBBlock.75:
	li      a2,1
	j       main_afterIfBBlock.75

main_afterIfBBlock.75:
	addi    s0,a1,4
	lw      s0,4(a1)
	slli    a5,a2,2
	add     s0,s0,a5
	lw      a0,0(s0)
	mv      a3,s2
	call    insertImpl
	j       main_returnBBlock.39

main_returnBBlock.39:
	j       main_returnBBlock.24

main_thenBodyBBlock.76:
	j       main_returnBBlock.40

main_afterIfBBlock.76:
	addi    s0,a0,4
	lw      a5,4(a0)
	addi    s0,a5,4
	lw      s0,4(a5)
	beq     s0,zero,main_thenBodyBBlock.89
	j       main_afterIfBBlock.89

main_returnBBlock.40:
	mv      a5,s0
	j       main_returnBBlock.27

main_thenBodyBBlock.77:
	li      a0,16
	call    __malloc
	mv      s6,a0
	addi    a5,s6,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a6,a0,4
	sw      a6,4(s6)
	addi    a5,s6,8
	sw      s2,8(s6)
	li      t2,1
	addi    a5,s6,12
	sw      t2,12(s6)
	mv      a5,s6
	sw      s3,0(s6)
	sw      zero,0(a6)
	addi    a5,a6,4
	sw      zero,4(a6)
	lw      a5,4(s3)
	slli    s0,s0,2
	add     s0,a5,s0
	sw      s6,0(s0)
	j       main_returnBBlock.41

main_afterIfBBlock.77:
	addi    s0,a1,8
	lw      s0,8(a1)
	beq     s0,s2,main_thenBodyBBlock.78
	j       main_afterIfBBlock.78

main_thenBodyBBlock.78:
	addi    s0,a1,12
	lw      s0,12(a1)
	addi    s0,s0,1
	sw      s0,12(a1)
	j       main_returnBBlock.41

main_afterIfBBlock.78:
	blt     s0,s2,main_thenBodyBBlock.79
	j       main_criticalEdge.4

main_thenBodyBBlock.79:
	li      a2,1
	j       main_afterIfBBlock.79

main_afterIfBBlock.79:
	addi    s0,a1,4
	lw      a5,4(a1)
	slli    s0,a2,2
	add     s0,a5,s0
	lw      a0,0(s0)
	mv      a3,s2
	call    insertImpl
	j       main_returnBBlock.41

main_returnBBlock.41:
	j       main_returnBBlock.28

main_thenBodyBBlock.80:
	j       main_returnBBlock.42

main_afterIfBBlock.80:
	addi    s0,a0,4
	lw      s0,4(a0)
	addi    a5,s0,4
	lw      s0,4(s0)
	beq     s0,zero,main_thenBodyBBlock.90
	j       main_afterIfBBlock.90

main_returnBBlock.42:
	mv      a5,s0
	j       main_returnBBlock.31

main_thenBodyBBlock.81:
	li      a0,16
	call    __malloc
	mv      s2,a0
	addi    a5,s2,4
	li      a0,20
	call    __malloc
	li      a5,2
	sw      a5,0(a0)
	addi    a6,a0,4
	sw      a6,4(s2)
	addi    a5,s2,8
	sw      s4,8(s2)
	li      a5,1
	addi    t2,s2,12
	sw      a5,12(s2)
	mv      a5,s2
	sw      s3,0(s2)
	sw      zero,0(a6)
	addi    a5,a6,4
	sw      zero,4(a6)
	lw      a6,4(s3)
	slli    a5,s1,2
	add     a5,a6,a5
	sw      s2,0(a5)
	j       main_returnBBlock.43

main_afterIfBBlock.81:
	addi    a5,a1,8
	lw      a5,8(a1)
	beq     a5,s4,main_thenBodyBBlock.82
	j       main_afterIfBBlock.82

main_thenBodyBBlock.82:
	addi    a5,a1,12
	lw      a5,12(a1)
	addi    a5,a5,1
	sw      a5,12(a1)
	j       main_returnBBlock.43

main_afterIfBBlock.82:
	blt     a5,s4,main_thenBodyBBlock.83
	j       main_criticalEdge.5

main_thenBodyBBlock.83:
	li      a2,1
	j       main_afterIfBBlock.83

main_afterIfBBlock.83:
	addi    a5,a1,4
	lw      a5,4(a1)
	slli    a6,a2,2
	add     a5,a5,a6
	lw      a0,0(a5)
	mv      a3,s4
	call    insertImpl
	j       main_returnBBlock.43

main_returnBBlock.43:
	j       main_returnBBlock.32

main_thenBodyBBlock.84:
	j       main_returnBBlock.44

main_afterIfBBlock.84:
	addi    a5,s4,4
	lw      a5,4(s4)
	lw      a0,0(a5)
	call    printTree
	addi    a5,s4,8
	lw      a0,8(s4)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s3,a0
	addi    a5,s4,12
	lw      a0,12(s4)
	call    __toString
	mv      a1,a0
	mv      a0,s3
	call    __stringAdd
	call    __println
	lw      a5,4(s4)
	addi    a6,a5,4
	lw      a0,4(a5)
	call    printTree
	j       main_returnBBlock.44

main_returnBBlock.44:
	addi    a5,s0,8
	lw      a0,8(s0)
	call    __toString
    la      s4,.str.0
	mv      a1,s4
	call    __stringAdd
	mv      s3,a0
	addi    a5,s0,12
	lw      a0,12(s0)
	call    __toString
	mv      a1,a0
	mv      a0,s3
	call    __stringAdd
	call    __println
	lw      a5,4(s0)
	addi    s0,a5,4
	lw      s3,4(a5)
	beq     s3,zero,main_thenBodyBBlock.85
	j       main_afterIfBBlock.85

main_thenBodyBBlock.85:
	j       main_returnBBlock.45

main_afterIfBBlock.85:
	addi    s0,s3,4
	lw      s0,4(s3)
	lw      a0,0(s0)
	call    printTree
	addi    s0,s3,8
	lw      a0,8(s3)
	call    __toString
	mv      a1,s4
	call    __stringAdd
	mv      s0,a0
	addi    a5,s3,12
	lw      a0,12(s3)
	call    __toString
	mv      a1,a0
	mv      a0,s0
	call    __stringAdd
	call    __println
	lw      a5,4(s3)
	addi    s0,a5,4
	lw      a0,4(a5)
	call    printTree
	j       main_returnBBlock.45

main_returnBBlock.45:
	j       main_returnBBlock.33

main_thenBodyBBlock.86:
	j       main_returnBBlock.46

main_afterIfBBlock.86:
	addi    s0,s3,4
	lw      s0,4(s3)
	lw      a0,0(s0)
	call    printTree
	addi    s0,s3,8
	lw      a0,8(s3)
	call    __toString
	mv      a1,s4
	call    __stringAdd
	mv      s0,a0
	addi    a5,s3,12
	lw      a0,12(s3)
	call    __toString
	mv      a1,a0
	mv      a0,s0
	call    __stringAdd
	call    __println
	lw      s0,4(s3)
	addi    a5,s0,4
	lw      a0,4(s0)
	call    printTree
	j       main_returnBBlock.46

main_returnBBlock.46:
	addi    s0,s1,8
	lw      a0,8(s1)
	call    __toString
	mv      a1,s4
	call    __stringAdd
	mv      s0,a0
	addi    a5,s1,12
	lw      a0,12(s1)
	call    __toString
	mv      a1,a0
	mv      a0,s0
	call    __stringAdd
	call    __println
	lw      s0,4(s1)
	addi    a5,s0,4
	lw      s1,4(s0)
	beq     s1,zero,main_thenBodyBBlock.87
	j       main_afterIfBBlock.87

main_thenBodyBBlock.87:
	j       main_returnBBlock.47

main_afterIfBBlock.87:
	addi    s0,s1,4
	lw      s0,4(s1)
	lw      a0,0(s0)
	call    printTree
	addi    s0,s1,8
	lw      a0,8(s1)
	call    __toString
	mv      a1,s4
	call    __stringAdd
	mv      s0,a0
	addi    a5,s1,12
	lw      a0,12(s1)
	call    __toString
	mv      a1,a0
	mv      a0,s0
	call    __stringAdd
	call    __println
	lw      s0,4(s1)
	addi    a5,s0,4
	lw      a0,4(s0)
	call    printTree
	j       main_returnBBlock.47

main_returnBBlock.47:
	j       main_returnBBlock.34

main_thenBodyBBlock.88:
	j       main_returnBBlock.48

main_afterIfBBlock.88:
	addi    a5,a0,4
	lw      a6,4(a0)
	addi    a5,a6,4
	lw      a5,4(a6)
	beq     a5,zero,main_thenBodyBBlock.91
	j       main_afterIfBBlock.91

main_returnBBlock.48:
	mv      a6,a5
	j       main_returnBBlock.38

main_thenBodyBBlock.89:
	j       main_returnBBlock.49

main_afterIfBBlock.89:
	mv      a0,s0
	call    findLargest
	j       main_returnBBlock.49

main_returnBBlock.49:
	mv      s0,a0
	j       main_returnBBlock.40

main_thenBodyBBlock.90:
	j       main_returnBBlock.50

main_afterIfBBlock.90:
	mv      a0,s0
	call    findLargest
	j       main_returnBBlock.50

main_returnBBlock.50:
	mv      s0,a0
	j       main_returnBBlock.42

main_thenBodyBBlock.91:
	j       main_returnBBlock.51

main_afterIfBBlock.91:
	mv      a0,a5
	call    findLargest
	j       main_returnBBlock.51

main_returnBBlock.51:
	mv      a5,a0
	j       main_returnBBlock.48

main_criticalEdge.0:
	li      a5,0
	mv      s4,a5
	j       main_afterIfBBlock.15

main_criticalEdge.1:
	li      s0,0
	j       main_afterIfBBlock.34

main_criticalEdge.2:
	li      a5,0
	mv      s1,a5
	j       main_afterIfBBlock.53

main_criticalEdge.3:
	li      a2,0
	j       main_afterIfBBlock.75

main_criticalEdge.4:
	li      a2,0
	j       main_afterIfBBlock.79

main_criticalEdge.5:
	li      a2,0
	j       main_afterIfBBlock.83


