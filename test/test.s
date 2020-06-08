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
	mv      s0,s4
	mv      a6,a0
	mv      s2,a1
	mv      s3,a2
	mv      s4,a3
	beq     a6,zero,insertImpl_thenBodyBBlock.0
	j       insertImpl_afterIfBBlock.0

insertImpl_thenBodyBBlock.0:
	li      a0,16
	call    __malloc
	mv      s1,a0
	addi    a6,s1,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    ra,a0,4
	sw      ra,4(s1)
	addi    a6,s1,8
	sw      s4,8(s1)
	li      a4,1
	addi    a6,s1,12
	sw      a4,12(s1)
	mv      a6,s1
	sw      s2,0(s1)
	sw      zero,0(ra)
	addi    a6,ra,4
	sw      zero,4(ra)
	addi    a6,s2,4
	lw      s2,4(s2)
	slli    a6,s3,2
	add     s2,s2,a6
	sw      s1,0(s2)
	li      a0,0
	j       insertImpl_returnBBlock.0

insertImpl_afterIfBBlock.0:
	addi    s2,a6,8
	lw      s2,8(a6)
	beq     s2,s4,insertImpl_thenBodyBBlock.1
	j       insertImpl_afterIfBBlock.1

insertImpl_thenBodyBBlock.1:
	addi    s2,a6,12
	lw      s2,12(a6)
	addi    s2,s2,1
	sw      s2,12(a6)
	li      a0,1
	j       insertImpl_returnBBlock.0

insertImpl_afterIfBBlock.1:
	blt     s2,s4,insertImpl_thenBodyBBlock.2
	j       insertImpl_criticalEdge.0

insertImpl_thenBodyBBlock.2:
	li      a2,1
	j       insertImpl_afterIfBBlock.2

insertImpl_afterIfBBlock.2:
	addi    s2,a6,4
	lw      ra,4(a6)
	slli    s2,a2,2
	add     s2,ra,s2
	lw      a0,0(s2)
	mv      a1,a6
	mv      a3,s4
	call    insertImpl
	j       insertImpl_returnBBlock.0

insertImpl_returnBBlock.0:
	mv      s4,s0
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
	addi    a6,a0,4
	lw      ra,4(a0)
	addi    a6,ra,4
	lw      a6,4(ra)
	beq     a6,zero,findLargest_thenBodyBBlock.0
	j       findLargest_afterIfBBlock.0

findLargest_thenBodyBBlock.0:
	j       findLargest_returnBBlock.0

findLargest_afterIfBBlock.0:
	mv      a0,a6
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
	mv      s0,s4
	mv      s1,a0
	mv      s2,a1
	mv      s4,a2
	mv      s3,a3
	beq     s1,zero,eraseImpl_thenBodyBBlock.0
	j       eraseImpl_afterIfBBlock.0

eraseImpl_thenBodyBBlock.0:
	li      a0,0
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.0:
	addi    a6,s1,8
	lw      a6,8(s1)
	bgt     a6,s3,eraseImpl_thenBodyBBlock.1
	j       eraseImpl_afterIfBBlock.1

eraseImpl_thenBodyBBlock.1:
	addi    s2,s1,4
	lw      s2,4(s1)
	lw      a0,0(s2)
	mv      a1,s1
	li      a2,0
	mv      a3,s3
	call    eraseImpl
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.1:
	blt     a6,s3,eraseImpl_thenBodyBBlock.2
	j       eraseImpl_afterIfBBlock.2

eraseImpl_thenBodyBBlock.2:
	addi    s2,s1,4
	lw      a6,4(s1)
	addi    s2,a6,4
	lw      a0,4(a6)
	mv      a1,s1
	li      a2,1
	mv      a3,s3
	call    eraseImpl
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.2:
	addi    a6,s1,12
	lw      a6,12(s1)
	addi    a6,a6,-1
	sw      a6,12(s1)
	li      ra,0
	bgt     a6,ra,eraseImpl_thenBodyBBlock.3
	j       eraseImpl_afterIfBBlock.3

eraseImpl_thenBodyBBlock.3:
	li      a0,1
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.3:
	addi    a6,s1,4
	lw      ra,4(s1)
	lw      a6,0(ra)
	beq     a6,zero,eraseImpl_thenBodyBBlock.4
	j       eraseImpl_afterIfBBlock.4

eraseImpl_thenBodyBBlock.4:
	bne     s2,zero,eraseImpl_thenBodyBBlock.5
	j       eraseImpl_afterIfBBlock.5

eraseImpl_afterIfBBlock.4:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.14
	j       eraseImpl_afterIfBBlock.14

eraseImpl_thenBodyBBlock.5:
	addi    a6,s2,4
	lw      a4,4(s2)
	slli    a6,s4,2
	add     a4,a4,a6
	addi    a6,ra,4
	lw      a6,4(ra)
	sw      a6,0(a4)
	j       eraseImpl_afterIfBBlock.5

eraseImpl_afterIfBBlock.5:
	addi    a6,ra,4
	lw      a6,4(ra)
	bne     a6,zero,eraseImpl_thenBodyBBlock.6
	j       eraseImpl_afterIfBBlock.6

eraseImpl_thenBodyBBlock.6:
	sw      s2,0(a6)
	j       eraseImpl_afterIfBBlock.6

eraseImpl_afterIfBBlock.6:
	lui     s2,%hi(root)
	lw      s2,%lo(root)(s2)
	addi    a6,s2,8
	lw      s2,8(s2)
	beq     s3,s2,eraseImpl_thenBodyBBlock.7
	j       eraseImpl_afterIfBBlock.7

eraseImpl_thenBodyBBlock.7:
	lw      a6,4(ra)
	lui     s2,%hi(root)
	sw      a6,%lo(root)(s2)
	j       eraseImpl_afterIfBBlock.7

eraseImpl_afterIfBBlock.7:
	li      a0,1
	j       eraseImpl_returnBBlock.0

eraseImpl_thenBodyBBlock.8:
	lui     ra,%hi(root)
	sw      a6,%lo(root)(ra)
	j       eraseImpl_afterIfBBlock.8

eraseImpl_afterIfBBlock.8:
	addi    ra,a6,8
	lw      a4,8(a6)
	lw      s3,4(s1)
	lw      t3,0(s3)
	addi    ra,t3,8
	lw      ra,8(t3)
	bne     a4,ra,eraseImpl_thenBodyBBlock.9
	j       eraseImpl_afterIfBBlock.9

eraseImpl_thenBodyBBlock.9:
	lw      t3,0(a6)
	addi    ra,t3,4
	lw      t5,4(t3)
	addi    ra,t5,4
	addi    ra,a6,4
	lw      ra,4(a6)
	lw      t3,0(ra)
	sw      t3,4(t5)
	lw      ra,0(ra)
	bne     ra,zero,eraseImpl_thenBodyBBlock.10
	j       eraseImpl_afterIfBBlock.10

eraseImpl_afterIfBBlock.9:
	bne     s2,zero,eraseImpl_thenBodyBBlock.11
	j       eraseImpl_afterIfBBlock.11

eraseImpl_thenBodyBBlock.10:
	lw      t3,0(a6)
	sw      t3,0(ra)
	j       eraseImpl_afterIfBBlock.10

eraseImpl_afterIfBBlock.10:
	j       eraseImpl_afterIfBBlock.9

eraseImpl_thenBodyBBlock.11:
	addi    ra,s2,4
	lw      ra,4(s2)
	slli    t3,s4,2
	add     ra,ra,t3
	sw      a6,0(ra)
	j       eraseImpl_afterIfBBlock.11

eraseImpl_afterIfBBlock.11:
	sw      s2,0(a6)
	addi    s2,a6,4
	lw      s2,4(a6)
	addi    ra,s2,4
	addi    ra,s3,4
	lw      ra,4(s3)
	sw      ra,4(s2)
	lw      ra,4(s3)
	bne     ra,zero,eraseImpl_thenBodyBBlock.12
	j       eraseImpl_afterIfBBlock.12

eraseImpl_thenBodyBBlock.12:
	sw      a6,0(ra)
	j       eraseImpl_afterIfBBlock.12

eraseImpl_afterIfBBlock.12:
	lw      t3,0(s3)
	addi    ra,t3,8
	lw      ra,8(t3)
	bne     a4,ra,eraseImpl_thenBodyBBlock.13
	j       eraseImpl_afterIfBBlock.13

eraseImpl_thenBodyBBlock.13:
	sw      t3,0(s2)
	lw      s2,0(s3)
	sw      a6,0(s2)
	j       eraseImpl_afterIfBBlock.13

eraseImpl_afterIfBBlock.13:
	li      a0,1
	j       eraseImpl_returnBBlock.0

eraseImpl_returnBBlock.0:
	mv      s4,s0
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
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.15
	j       eraseImpl_afterIfBBlock.15

eraseImpl_returnBBlock.1:
	lui     ra,%hi(root)
	lw      ra,%lo(root)(ra)
	addi    a4,ra,8
	lw      ra,8(ra)
	beq     s3,ra,eraseImpl_thenBodyBBlock.8
	j       eraseImpl_afterIfBBlock.8

eraseImpl_thenBodyBBlock.15:
	j       eraseImpl_returnBBlock.2

eraseImpl_afterIfBBlock.15:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.16
	j       eraseImpl_afterIfBBlock.16

eraseImpl_returnBBlock.2:
	mv      a6,ra
	j       eraseImpl_returnBBlock.1

eraseImpl_thenBodyBBlock.16:
	j       eraseImpl_returnBBlock.3

eraseImpl_afterIfBBlock.16:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.17
	j       eraseImpl_afterIfBBlock.17

eraseImpl_returnBBlock.3:
	mv      ra,a6
	j       eraseImpl_returnBBlock.2

eraseImpl_thenBodyBBlock.17:
	j       eraseImpl_returnBBlock.4

eraseImpl_afterIfBBlock.17:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.18
	j       eraseImpl_afterIfBBlock.18

eraseImpl_returnBBlock.4:
	mv      a6,ra
	j       eraseImpl_returnBBlock.3

eraseImpl_thenBodyBBlock.18:
	j       eraseImpl_returnBBlock.5

eraseImpl_afterIfBBlock.18:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.19
	j       eraseImpl_afterIfBBlock.19

eraseImpl_returnBBlock.5:
	mv      ra,a6
	j       eraseImpl_returnBBlock.4

eraseImpl_thenBodyBBlock.19:
	j       eraseImpl_returnBBlock.6

eraseImpl_afterIfBBlock.19:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.20
	j       eraseImpl_afterIfBBlock.20

eraseImpl_returnBBlock.6:
	mv      a6,ra
	j       eraseImpl_returnBBlock.5

eraseImpl_thenBodyBBlock.20:
	j       eraseImpl_returnBBlock.7

eraseImpl_afterIfBBlock.20:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.21
	j       eraseImpl_afterIfBBlock.21

eraseImpl_returnBBlock.7:
	mv      ra,a6
	j       eraseImpl_returnBBlock.6

eraseImpl_thenBodyBBlock.21:
	j       eraseImpl_returnBBlock.8

eraseImpl_afterIfBBlock.21:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.22
	j       eraseImpl_afterIfBBlock.22

eraseImpl_returnBBlock.8:
	mv      a6,ra
	j       eraseImpl_returnBBlock.7

eraseImpl_thenBodyBBlock.22:
	j       eraseImpl_returnBBlock.9

eraseImpl_afterIfBBlock.22:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.23
	j       eraseImpl_afterIfBBlock.23

eraseImpl_returnBBlock.9:
	mv      ra,a6
	j       eraseImpl_returnBBlock.8

eraseImpl_thenBodyBBlock.23:
	j       eraseImpl_returnBBlock.10

eraseImpl_afterIfBBlock.23:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.24
	j       eraseImpl_afterIfBBlock.24

eraseImpl_returnBBlock.10:
	mv      a6,ra
	j       eraseImpl_returnBBlock.9

eraseImpl_thenBodyBBlock.24:
	j       eraseImpl_returnBBlock.11

eraseImpl_afterIfBBlock.24:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.25
	j       eraseImpl_afterIfBBlock.25

eraseImpl_returnBBlock.11:
	mv      ra,a6
	j       eraseImpl_returnBBlock.10

eraseImpl_thenBodyBBlock.25:
	j       eraseImpl_returnBBlock.12

eraseImpl_afterIfBBlock.25:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.26
	j       eraseImpl_afterIfBBlock.26

eraseImpl_returnBBlock.12:
	mv      a6,ra
	j       eraseImpl_returnBBlock.11

eraseImpl_thenBodyBBlock.26:
	j       eraseImpl_returnBBlock.13

eraseImpl_afterIfBBlock.26:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.27
	j       eraseImpl_afterIfBBlock.27

eraseImpl_returnBBlock.13:
	mv      ra,a6
	j       eraseImpl_returnBBlock.12

eraseImpl_thenBodyBBlock.27:
	j       eraseImpl_returnBBlock.14

eraseImpl_afterIfBBlock.27:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.28
	j       eraseImpl_afterIfBBlock.28

eraseImpl_returnBBlock.14:
	mv      a6,ra
	j       eraseImpl_returnBBlock.13

eraseImpl_thenBodyBBlock.28:
	j       eraseImpl_returnBBlock.15

eraseImpl_afterIfBBlock.28:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.29
	j       eraseImpl_afterIfBBlock.29

eraseImpl_returnBBlock.15:
	mv      ra,a6
	j       eraseImpl_returnBBlock.14

eraseImpl_thenBodyBBlock.29:
	j       eraseImpl_returnBBlock.16

eraseImpl_afterIfBBlock.29:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.30
	j       eraseImpl_afterIfBBlock.30

eraseImpl_returnBBlock.16:
	mv      a6,ra
	j       eraseImpl_returnBBlock.15

eraseImpl_thenBodyBBlock.30:
	j       eraseImpl_returnBBlock.17

eraseImpl_afterIfBBlock.30:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.31
	j       eraseImpl_afterIfBBlock.31

eraseImpl_returnBBlock.17:
	mv      ra,a6
	j       eraseImpl_returnBBlock.16

eraseImpl_thenBodyBBlock.31:
	j       eraseImpl_returnBBlock.18

eraseImpl_afterIfBBlock.31:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.32
	j       eraseImpl_afterIfBBlock.32

eraseImpl_returnBBlock.18:
	mv      a6,ra
	j       eraseImpl_returnBBlock.17

eraseImpl_thenBodyBBlock.32:
	j       eraseImpl_returnBBlock.19

eraseImpl_afterIfBBlock.32:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.33
	j       eraseImpl_afterIfBBlock.33

eraseImpl_returnBBlock.19:
	mv      ra,a6
	j       eraseImpl_returnBBlock.18

eraseImpl_thenBodyBBlock.33:
	j       eraseImpl_returnBBlock.20

eraseImpl_afterIfBBlock.33:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.34
	j       eraseImpl_afterIfBBlock.34

eraseImpl_returnBBlock.20:
	mv      a6,ra
	j       eraseImpl_returnBBlock.19

eraseImpl_thenBodyBBlock.34:
	j       eraseImpl_returnBBlock.21

eraseImpl_afterIfBBlock.34:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.35
	j       eraseImpl_afterIfBBlock.35

eraseImpl_returnBBlock.21:
	mv      ra,a6
	j       eraseImpl_returnBBlock.20

eraseImpl_thenBodyBBlock.35:
	j       eraseImpl_returnBBlock.22

eraseImpl_afterIfBBlock.35:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.36
	j       eraseImpl_afterIfBBlock.36

eraseImpl_returnBBlock.22:
	mv      a6,ra
	j       eraseImpl_returnBBlock.21

eraseImpl_thenBodyBBlock.36:
	j       eraseImpl_returnBBlock.23

eraseImpl_afterIfBBlock.36:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.37
	j       eraseImpl_afterIfBBlock.37

eraseImpl_returnBBlock.23:
	mv      ra,a6
	j       eraseImpl_returnBBlock.22

eraseImpl_thenBodyBBlock.37:
	j       eraseImpl_returnBBlock.24

eraseImpl_afterIfBBlock.37:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.38
	j       eraseImpl_afterIfBBlock.38

eraseImpl_returnBBlock.24:
	mv      a6,ra
	j       eraseImpl_returnBBlock.23

eraseImpl_thenBodyBBlock.38:
	j       eraseImpl_returnBBlock.25

eraseImpl_afterIfBBlock.38:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.39
	j       eraseImpl_afterIfBBlock.39

eraseImpl_returnBBlock.25:
	mv      ra,a6
	j       eraseImpl_returnBBlock.24

eraseImpl_thenBodyBBlock.39:
	j       eraseImpl_returnBBlock.26

eraseImpl_afterIfBBlock.39:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.40
	j       eraseImpl_afterIfBBlock.40

eraseImpl_returnBBlock.26:
	mv      a6,ra
	j       eraseImpl_returnBBlock.25

eraseImpl_thenBodyBBlock.40:
	j       eraseImpl_returnBBlock.27

eraseImpl_afterIfBBlock.40:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.41
	j       eraseImpl_afterIfBBlock.41

eraseImpl_returnBBlock.27:
	mv      ra,a6
	j       eraseImpl_returnBBlock.26

eraseImpl_thenBodyBBlock.41:
	j       eraseImpl_returnBBlock.28

eraseImpl_afterIfBBlock.41:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.42
	j       eraseImpl_afterIfBBlock.42

eraseImpl_returnBBlock.28:
	mv      a6,ra
	j       eraseImpl_returnBBlock.27

eraseImpl_thenBodyBBlock.42:
	j       eraseImpl_returnBBlock.29

eraseImpl_afterIfBBlock.42:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.43
	j       eraseImpl_afterIfBBlock.43

eraseImpl_returnBBlock.29:
	mv      ra,a6
	j       eraseImpl_returnBBlock.28

eraseImpl_thenBodyBBlock.43:
	j       eraseImpl_returnBBlock.30

eraseImpl_afterIfBBlock.43:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.44
	j       eraseImpl_afterIfBBlock.44

eraseImpl_returnBBlock.30:
	mv      a6,ra
	j       eraseImpl_returnBBlock.29

eraseImpl_thenBodyBBlock.44:
	j       eraseImpl_returnBBlock.31

eraseImpl_afterIfBBlock.44:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.45
	j       eraseImpl_afterIfBBlock.45

eraseImpl_returnBBlock.31:
	mv      ra,a6
	j       eraseImpl_returnBBlock.30

eraseImpl_thenBodyBBlock.45:
	j       eraseImpl_returnBBlock.32

eraseImpl_afterIfBBlock.45:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.46
	j       eraseImpl_afterIfBBlock.46

eraseImpl_returnBBlock.32:
	mv      a6,ra
	j       eraseImpl_returnBBlock.31

eraseImpl_thenBodyBBlock.46:
	j       eraseImpl_returnBBlock.33

eraseImpl_afterIfBBlock.46:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.47
	j       eraseImpl_afterIfBBlock.47

eraseImpl_returnBBlock.33:
	mv      ra,a6
	j       eraseImpl_returnBBlock.32

eraseImpl_thenBodyBBlock.47:
	j       eraseImpl_returnBBlock.34

eraseImpl_afterIfBBlock.47:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.48
	j       eraseImpl_afterIfBBlock.48

eraseImpl_returnBBlock.34:
	mv      a6,ra
	j       eraseImpl_returnBBlock.33

eraseImpl_thenBodyBBlock.48:
	j       eraseImpl_returnBBlock.35

eraseImpl_afterIfBBlock.48:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.49
	j       eraseImpl_afterIfBBlock.49

eraseImpl_returnBBlock.35:
	mv      ra,a6
	j       eraseImpl_returnBBlock.34

eraseImpl_thenBodyBBlock.49:
	j       eraseImpl_returnBBlock.36

eraseImpl_afterIfBBlock.49:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.50
	j       eraseImpl_afterIfBBlock.50

eraseImpl_returnBBlock.36:
	mv      a6,ra
	j       eraseImpl_returnBBlock.35

eraseImpl_thenBodyBBlock.50:
	j       eraseImpl_returnBBlock.37

eraseImpl_afterIfBBlock.50:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.51
	j       eraseImpl_afterIfBBlock.51

eraseImpl_returnBBlock.37:
	mv      ra,a6
	j       eraseImpl_returnBBlock.36

eraseImpl_thenBodyBBlock.51:
	j       eraseImpl_returnBBlock.38

eraseImpl_afterIfBBlock.51:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.52
	j       eraseImpl_afterIfBBlock.52

eraseImpl_returnBBlock.38:
	mv      a6,ra
	j       eraseImpl_returnBBlock.37

eraseImpl_thenBodyBBlock.52:
	j       eraseImpl_returnBBlock.39

eraseImpl_afterIfBBlock.52:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.53
	j       eraseImpl_afterIfBBlock.53

eraseImpl_returnBBlock.39:
	mv      ra,a6
	j       eraseImpl_returnBBlock.38

eraseImpl_thenBodyBBlock.53:
	j       eraseImpl_returnBBlock.40

eraseImpl_afterIfBBlock.53:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.54
	j       eraseImpl_afterIfBBlock.54

eraseImpl_returnBBlock.40:
	mv      a6,ra
	j       eraseImpl_returnBBlock.39

eraseImpl_thenBodyBBlock.54:
	j       eraseImpl_returnBBlock.41

eraseImpl_afterIfBBlock.54:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.55
	j       eraseImpl_afterIfBBlock.55

eraseImpl_returnBBlock.41:
	mv      ra,a6
	j       eraseImpl_returnBBlock.40

eraseImpl_thenBodyBBlock.55:
	j       eraseImpl_returnBBlock.42

eraseImpl_afterIfBBlock.55:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.56
	j       eraseImpl_afterIfBBlock.56

eraseImpl_returnBBlock.42:
	mv      a6,ra
	j       eraseImpl_returnBBlock.41

eraseImpl_thenBodyBBlock.56:
	j       eraseImpl_returnBBlock.43

eraseImpl_afterIfBBlock.56:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.57
	j       eraseImpl_afterIfBBlock.57

eraseImpl_returnBBlock.43:
	mv      ra,a6
	j       eraseImpl_returnBBlock.42

eraseImpl_thenBodyBBlock.57:
	j       eraseImpl_returnBBlock.44

eraseImpl_afterIfBBlock.57:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.58
	j       eraseImpl_afterIfBBlock.58

eraseImpl_returnBBlock.44:
	mv      a6,ra
	j       eraseImpl_returnBBlock.43

eraseImpl_thenBodyBBlock.58:
	j       eraseImpl_returnBBlock.45

eraseImpl_afterIfBBlock.58:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.59
	j       eraseImpl_afterIfBBlock.59

eraseImpl_returnBBlock.45:
	mv      ra,a6
	j       eraseImpl_returnBBlock.44

eraseImpl_thenBodyBBlock.59:
	j       eraseImpl_returnBBlock.46

eraseImpl_afterIfBBlock.59:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.60
	j       eraseImpl_afterIfBBlock.60

eraseImpl_returnBBlock.46:
	mv      a6,ra
	j       eraseImpl_returnBBlock.45

eraseImpl_thenBodyBBlock.60:
	j       eraseImpl_returnBBlock.47

eraseImpl_afterIfBBlock.60:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.61
	j       eraseImpl_afterIfBBlock.61

eraseImpl_returnBBlock.47:
	mv      ra,a6
	j       eraseImpl_returnBBlock.46

eraseImpl_thenBodyBBlock.61:
	j       eraseImpl_returnBBlock.48

eraseImpl_afterIfBBlock.61:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.62
	j       eraseImpl_afterIfBBlock.62

eraseImpl_returnBBlock.48:
	mv      a6,ra
	j       eraseImpl_returnBBlock.47

eraseImpl_thenBodyBBlock.62:
	j       eraseImpl_returnBBlock.49

eraseImpl_afterIfBBlock.62:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.63
	j       eraseImpl_afterIfBBlock.63

eraseImpl_returnBBlock.49:
	mv      ra,a6
	j       eraseImpl_returnBBlock.48

eraseImpl_thenBodyBBlock.63:
	j       eraseImpl_returnBBlock.50

eraseImpl_afterIfBBlock.63:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.64
	j       eraseImpl_afterIfBBlock.64

eraseImpl_returnBBlock.50:
	mv      a6,ra
	j       eraseImpl_returnBBlock.49

eraseImpl_thenBodyBBlock.64:
	j       eraseImpl_returnBBlock.51

eraseImpl_afterIfBBlock.64:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.65
	j       eraseImpl_afterIfBBlock.65

eraseImpl_returnBBlock.51:
	mv      ra,a6
	j       eraseImpl_returnBBlock.50

eraseImpl_thenBodyBBlock.65:
	j       eraseImpl_returnBBlock.52

eraseImpl_afterIfBBlock.65:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.66
	j       eraseImpl_afterIfBBlock.66

eraseImpl_returnBBlock.52:
	mv      a6,ra
	j       eraseImpl_returnBBlock.51

eraseImpl_thenBodyBBlock.66:
	j       eraseImpl_returnBBlock.53

eraseImpl_afterIfBBlock.66:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.67
	j       eraseImpl_afterIfBBlock.67

eraseImpl_returnBBlock.53:
	mv      ra,a6
	j       eraseImpl_returnBBlock.52

eraseImpl_thenBodyBBlock.67:
	j       eraseImpl_returnBBlock.54

eraseImpl_afterIfBBlock.67:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.68
	j       eraseImpl_afterIfBBlock.68

eraseImpl_returnBBlock.54:
	mv      a6,ra
	j       eraseImpl_returnBBlock.53

eraseImpl_thenBodyBBlock.68:
	j       eraseImpl_returnBBlock.55

eraseImpl_afterIfBBlock.68:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.69
	j       eraseImpl_afterIfBBlock.69

eraseImpl_returnBBlock.55:
	mv      ra,a6
	j       eraseImpl_returnBBlock.54

eraseImpl_thenBodyBBlock.69:
	j       eraseImpl_returnBBlock.56

eraseImpl_afterIfBBlock.69:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.70
	j       eraseImpl_afterIfBBlock.70

eraseImpl_returnBBlock.56:
	mv      a6,ra
	j       eraseImpl_returnBBlock.55

eraseImpl_thenBodyBBlock.70:
	j       eraseImpl_returnBBlock.57

eraseImpl_afterIfBBlock.70:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.71
	j       eraseImpl_afterIfBBlock.71

eraseImpl_returnBBlock.57:
	mv      ra,a6
	j       eraseImpl_returnBBlock.56

eraseImpl_thenBodyBBlock.71:
	j       eraseImpl_returnBBlock.58

eraseImpl_afterIfBBlock.71:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.72
	j       eraseImpl_afterIfBBlock.72

eraseImpl_returnBBlock.58:
	mv      a6,ra
	j       eraseImpl_returnBBlock.57

eraseImpl_thenBodyBBlock.72:
	j       eraseImpl_returnBBlock.59

eraseImpl_afterIfBBlock.72:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.73
	j       eraseImpl_afterIfBBlock.73

eraseImpl_returnBBlock.59:
	mv      ra,a6
	j       eraseImpl_returnBBlock.58

eraseImpl_thenBodyBBlock.73:
	j       eraseImpl_returnBBlock.60

eraseImpl_afterIfBBlock.73:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.74
	j       eraseImpl_afterIfBBlock.74

eraseImpl_returnBBlock.60:
	mv      a6,ra
	j       eraseImpl_returnBBlock.59

eraseImpl_thenBodyBBlock.74:
	j       eraseImpl_returnBBlock.61

eraseImpl_afterIfBBlock.74:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.75
	j       eraseImpl_afterIfBBlock.75

eraseImpl_returnBBlock.61:
	mv      ra,a6
	j       eraseImpl_returnBBlock.60

eraseImpl_thenBodyBBlock.75:
	j       eraseImpl_returnBBlock.62

eraseImpl_afterIfBBlock.75:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.76
	j       eraseImpl_afterIfBBlock.76

eraseImpl_returnBBlock.62:
	mv      a6,ra
	j       eraseImpl_returnBBlock.61

eraseImpl_thenBodyBBlock.76:
	j       eraseImpl_returnBBlock.63

eraseImpl_afterIfBBlock.76:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.77
	j       eraseImpl_afterIfBBlock.77

eraseImpl_returnBBlock.63:
	mv      ra,a6
	j       eraseImpl_returnBBlock.62

eraseImpl_thenBodyBBlock.77:
	j       eraseImpl_returnBBlock.64

eraseImpl_afterIfBBlock.77:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.78
	j       eraseImpl_afterIfBBlock.78

eraseImpl_returnBBlock.64:
	mv      a6,ra
	j       eraseImpl_returnBBlock.63

eraseImpl_thenBodyBBlock.78:
	j       eraseImpl_returnBBlock.65

eraseImpl_afterIfBBlock.78:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.79
	j       eraseImpl_afterIfBBlock.79

eraseImpl_returnBBlock.65:
	mv      ra,a6
	j       eraseImpl_returnBBlock.64

eraseImpl_thenBodyBBlock.79:
	j       eraseImpl_returnBBlock.66

eraseImpl_afterIfBBlock.79:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.80
	j       eraseImpl_afterIfBBlock.80

eraseImpl_returnBBlock.66:
	mv      a6,ra
	j       eraseImpl_returnBBlock.65

eraseImpl_thenBodyBBlock.80:
	j       eraseImpl_returnBBlock.67

eraseImpl_afterIfBBlock.80:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.81
	j       eraseImpl_afterIfBBlock.81

eraseImpl_returnBBlock.67:
	mv      ra,a6
	j       eraseImpl_returnBBlock.66

eraseImpl_thenBodyBBlock.81:
	j       eraseImpl_returnBBlock.68

eraseImpl_afterIfBBlock.81:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.82
	j       eraseImpl_afterIfBBlock.82

eraseImpl_returnBBlock.68:
	mv      a6,ra
	j       eraseImpl_returnBBlock.67

eraseImpl_thenBodyBBlock.82:
	j       eraseImpl_returnBBlock.69

eraseImpl_afterIfBBlock.82:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.83
	j       eraseImpl_afterIfBBlock.83

eraseImpl_returnBBlock.69:
	mv      ra,a6
	j       eraseImpl_returnBBlock.68

eraseImpl_thenBodyBBlock.83:
	j       eraseImpl_returnBBlock.70

eraseImpl_afterIfBBlock.83:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.84
	j       eraseImpl_afterIfBBlock.84

eraseImpl_returnBBlock.70:
	mv      a6,ra
	j       eraseImpl_returnBBlock.69

eraseImpl_thenBodyBBlock.84:
	j       eraseImpl_returnBBlock.71

eraseImpl_afterIfBBlock.84:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.85
	j       eraseImpl_afterIfBBlock.85

eraseImpl_returnBBlock.71:
	mv      ra,a6
	j       eraseImpl_returnBBlock.70

eraseImpl_thenBodyBBlock.85:
	j       eraseImpl_returnBBlock.72

eraseImpl_afterIfBBlock.85:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.86
	j       eraseImpl_afterIfBBlock.86

eraseImpl_returnBBlock.72:
	mv      a6,ra
	j       eraseImpl_returnBBlock.71

eraseImpl_thenBodyBBlock.86:
	j       eraseImpl_returnBBlock.73

eraseImpl_afterIfBBlock.86:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.87
	j       eraseImpl_afterIfBBlock.87

eraseImpl_returnBBlock.73:
	mv      ra,a6
	j       eraseImpl_returnBBlock.72

eraseImpl_thenBodyBBlock.87:
	j       eraseImpl_returnBBlock.74

eraseImpl_afterIfBBlock.87:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.88
	j       eraseImpl_afterIfBBlock.88

eraseImpl_returnBBlock.74:
	mv      a6,ra
	j       eraseImpl_returnBBlock.73

eraseImpl_thenBodyBBlock.88:
	j       eraseImpl_returnBBlock.75

eraseImpl_afterIfBBlock.88:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.89
	j       eraseImpl_afterIfBBlock.89

eraseImpl_returnBBlock.75:
	mv      ra,a6
	j       eraseImpl_returnBBlock.74

eraseImpl_thenBodyBBlock.89:
	j       eraseImpl_returnBBlock.76

eraseImpl_afterIfBBlock.89:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.90
	j       eraseImpl_afterIfBBlock.90

eraseImpl_returnBBlock.76:
	mv      a6,ra
	j       eraseImpl_returnBBlock.75

eraseImpl_thenBodyBBlock.90:
	j       eraseImpl_returnBBlock.77

eraseImpl_afterIfBBlock.90:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.91
	j       eraseImpl_afterIfBBlock.91

eraseImpl_returnBBlock.77:
	mv      ra,a6
	j       eraseImpl_returnBBlock.76

eraseImpl_thenBodyBBlock.91:
	j       eraseImpl_returnBBlock.78

eraseImpl_afterIfBBlock.91:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.92
	j       eraseImpl_afterIfBBlock.92

eraseImpl_returnBBlock.78:
	mv      a6,ra
	j       eraseImpl_returnBBlock.77

eraseImpl_thenBodyBBlock.92:
	j       eraseImpl_returnBBlock.79

eraseImpl_afterIfBBlock.92:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.93
	j       eraseImpl_afterIfBBlock.93

eraseImpl_returnBBlock.79:
	mv      ra,a6
	j       eraseImpl_returnBBlock.78

eraseImpl_thenBodyBBlock.93:
	j       eraseImpl_returnBBlock.80

eraseImpl_afterIfBBlock.93:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.94
	j       eraseImpl_afterIfBBlock.94

eraseImpl_returnBBlock.80:
	mv      a6,ra
	j       eraseImpl_returnBBlock.79

eraseImpl_thenBodyBBlock.94:
	j       eraseImpl_returnBBlock.81

eraseImpl_afterIfBBlock.94:
	addi    a6,ra,4
	lw      a6,4(ra)
	addi    a4,a6,4
	lw      a6,4(a6)
	beq     a6,zero,eraseImpl_thenBodyBBlock.95
	j       eraseImpl_afterIfBBlock.95

eraseImpl_returnBBlock.81:
	mv      ra,a6
	j       eraseImpl_returnBBlock.80

eraseImpl_thenBodyBBlock.95:
	j       eraseImpl_returnBBlock.82

eraseImpl_afterIfBBlock.95:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.96
	j       eraseImpl_afterIfBBlock.96

eraseImpl_returnBBlock.82:
	mv      a6,ra
	j       eraseImpl_returnBBlock.81

eraseImpl_thenBodyBBlock.96:
	j       eraseImpl_returnBBlock.83

eraseImpl_afterIfBBlock.96:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.97
	j       eraseImpl_afterIfBBlock.97

eraseImpl_returnBBlock.83:
	mv      ra,a6
	j       eraseImpl_returnBBlock.82

eraseImpl_thenBodyBBlock.97:
	j       eraseImpl_returnBBlock.84

eraseImpl_afterIfBBlock.97:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.98
	j       eraseImpl_afterIfBBlock.98

eraseImpl_returnBBlock.84:
	mv      a6,ra
	j       eraseImpl_returnBBlock.83

eraseImpl_thenBodyBBlock.98:
	j       eraseImpl_returnBBlock.85

eraseImpl_afterIfBBlock.98:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.99
	j       eraseImpl_afterIfBBlock.99

eraseImpl_returnBBlock.85:
	mv      ra,a6
	j       eraseImpl_returnBBlock.84

eraseImpl_thenBodyBBlock.99:
	j       eraseImpl_returnBBlock.86

eraseImpl_afterIfBBlock.99:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.100
	j       eraseImpl_afterIfBBlock.100

eraseImpl_returnBBlock.86:
	mv      a6,ra
	j       eraseImpl_returnBBlock.85

eraseImpl_thenBodyBBlock.100:
	j       eraseImpl_returnBBlock.87

eraseImpl_afterIfBBlock.100:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.101
	j       eraseImpl_afterIfBBlock.101

eraseImpl_returnBBlock.87:
	mv      ra,a6
	j       eraseImpl_returnBBlock.86

eraseImpl_thenBodyBBlock.101:
	j       eraseImpl_returnBBlock.88

eraseImpl_afterIfBBlock.101:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.102
	j       eraseImpl_afterIfBBlock.102

eraseImpl_returnBBlock.88:
	mv      a6,ra
	j       eraseImpl_returnBBlock.87

eraseImpl_thenBodyBBlock.102:
	j       eraseImpl_returnBBlock.89

eraseImpl_afterIfBBlock.102:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.103
	j       eraseImpl_afterIfBBlock.103

eraseImpl_returnBBlock.89:
	mv      ra,a6
	j       eraseImpl_returnBBlock.88

eraseImpl_thenBodyBBlock.103:
	j       eraseImpl_returnBBlock.90

eraseImpl_afterIfBBlock.103:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,eraseImpl_thenBodyBBlock.104
	j       eraseImpl_afterIfBBlock.104

eraseImpl_returnBBlock.90:
	mv      a6,ra
	j       eraseImpl_returnBBlock.89

eraseImpl_thenBodyBBlock.104:
	j       eraseImpl_returnBBlock.91

eraseImpl_afterIfBBlock.104:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.105
	j       eraseImpl_afterIfBBlock.105

eraseImpl_returnBBlock.91:
	mv      ra,a6
	j       eraseImpl_returnBBlock.90

eraseImpl_thenBodyBBlock.105:
	j       eraseImpl_returnBBlock.92

eraseImpl_afterIfBBlock.105:
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	lw      ra,4(ra)
	beq     ra,zero,eraseImpl_thenBodyBBlock.106
	j       eraseImpl_afterIfBBlock.106

eraseImpl_returnBBlock.92:
	mv      a6,ra
	j       eraseImpl_returnBBlock.91

eraseImpl_thenBodyBBlock.106:
	j       eraseImpl_returnBBlock.93

eraseImpl_afterIfBBlock.106:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,eraseImpl_thenBodyBBlock.107
	j       eraseImpl_afterIfBBlock.107

eraseImpl_returnBBlock.93:
	mv      ra,a6
	j       eraseImpl_returnBBlock.92

eraseImpl_thenBodyBBlock.107:
	j       eraseImpl_returnBBlock.94

eraseImpl_afterIfBBlock.107:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      a0,4(a4)
	beq     a0,zero,eraseImpl_thenBodyBBlock.108
	j       eraseImpl_afterIfBBlock.108

eraseImpl_returnBBlock.94:
	mv      a6,ra
	j       eraseImpl_returnBBlock.93

eraseImpl_thenBodyBBlock.108:
	j       eraseImpl_returnBBlock.95

eraseImpl_afterIfBBlock.108:
	addi    a6,a0,4
	lw      ra,4(a0)
	addi    a6,ra,4
	lw      a6,4(ra)
	beq     a6,zero,eraseImpl_thenBodyBBlock.109
	j       eraseImpl_afterIfBBlock.109

eraseImpl_returnBBlock.95:
	mv      ra,a6
	j       eraseImpl_returnBBlock.94

eraseImpl_thenBodyBBlock.109:
	j       eraseImpl_returnBBlock.96

eraseImpl_afterIfBBlock.109:
	mv      a0,a6
	call    findLargest
	j       eraseImpl_returnBBlock.96

eraseImpl_returnBBlock.96:
	mv      a6,a0
	j       eraseImpl_returnBBlock.95


	.globl  printTree
	.p2align	2
	.type   printTree, @function
printTree:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	mv      s0,s2
	mv      s2,a0
	beq     s2,zero,printTree_thenBodyBBlock.0
	j       printTree_afterIfBBlock.0

printTree_thenBodyBBlock.0:
	j       printTree_returnBBlock.0

printTree_afterIfBBlock.0:
	addi    a6,s2,4
	lw      a6,4(s2)
	lw      a0,0(a6)
	call    printTree
	addi    a6,s2,8
	lw      a0,8(s2)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s1,a0
	addi    a6,s2,12
	lw      a0,12(s2)
	call    __toString
	mv      a1,a0
	mv      a0,s1
	call    __stringAdd
	call    __println
	lw      a6,4(s2)
	addi    s2,a6,4
	lw      a0,4(a6)
	call    printTree
	j       printTree_returnBBlock.0

printTree_returnBBlock.0:
	mv      s2,s0
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
	mv      s0,s6
	lui     s2,%hi(root)
	sw      zero,%lo(root)(s2)
	call    __getInt
	li      s2,0
	mv      s6,s2
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	li      s2,50000
	blt     s6,s2,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    s2,a0,13
	xor     s2,a0,s2
	li      a6,2147483647
	and     a6,s2,a6
	srai    s2,a6,17
	xor     a6,a6,s2
	slli    s2,a6,5
	xor     s2,a6,s2
	li      a6,2147483647
	and     s2,s2,a6
	li      a6,128
	rem     s5,s2,a6
	slli    a6,s2,13
	xor     s2,s2,a6
	li      a6,2147483647
	and     s2,s2,a6
	srai    a6,s2,17
	xor     s2,s2,a6
	slli    a6,s2,5
	xor     s2,s2,a6
	li      a6,2147483647
	and     s1,s2,a6
	li      s2,1717986912
	blt     s1,s2,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_afterForBBlock.0:
	li      s2,0
	mv      s6,s2
	j       main_forCondBBlock.1

main_thenBodyBBlock.0:
	lui     s2,%hi(root)
	lw      s2,%lo(root)(s2)
	bne     s2,zero,main_thenBodyBBlock.2
	j       main_afterIfBBlock.2

main_elseBodyBBlock.0:
	lui     s2,%hi(root)
	lw      s3,%lo(root)(s2)
	beq     s3,zero,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_afterIfBBlock.0:
	addi    s2,s6,1
	mv      a0,s1
	mv      s6,s2
	j       main_forCondBBlock.0

main_thenBodyBBlock.1:
	li      s2,1
	j       main_returnBBlock.4

main_afterIfBBlock.1:
	li      s2,2
	j       main_returnBBlock.4

main_returnBBlock.4:
	li      a6,1
	beq     s2,a6,main_thenBodyBBlock.0
	j       main_elseBodyBBlock.0

main_thenBodyBBlock.2:
	beq     s2,zero,main_thenBodyBBlock.13
	j       main_afterIfBBlock.13

main_afterIfBBlock.2:
	li      a0,16
	call    __malloc
	mv      s2,a0
	addi    a6,s2,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    a6,a0,4
	sw      a6,4(s2)
	addi    ra,s2,8
	sw      s5,8(s2)
	li      s3,1
	addi    ra,s2,12
	sw      s3,12(s2)
	sw      zero,0(s2)
	sw      zero,0(a6)
	addi    ra,a6,4
	sw      zero,4(a6)
	lui     a6,%hi(root)
	sw      s2,%lo(root)(a6)
	j       main_returnBBlock.6

main_returnBBlock.6:
	j       main_afterIfBBlock.0

main_thenBodyBBlock.3:
	j       main_returnBBlock.8

main_afterIfBBlock.3:
	beq     s3,zero,main_thenBodyBBlock.16
	j       main_afterIfBBlock.16

main_returnBBlock.8:
	j       main_afterIfBBlock.0

main_forCondBBlock.1:
	li      s2,100000
	blt     s6,s2,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    s2,a0,13
	xor     s2,a0,s2
	li      a6,2147483647
	and     a6,s2,a6
	srai    s2,a6,17
	xor     s2,a6,s2
	slli    a6,s2,5
	xor     a6,s2,a6
	li      s2,2147483647
	and     a6,a6,s2
	li      s2,128
	rem     s5,a6,s2
	slli    s2,a6,13
	xor     a6,a6,s2
	li      s2,2147483647
	and     a6,a6,s2
	srai    s2,a6,17
	xor     s2,a6,s2
	slli    a6,s2,5
	xor     s2,s2,a6
	li      a6,2147483647
	and     s3,s2,a6
	li      s2,429496728
	blt     s3,s2,main_thenBodyBBlock.5
	j       main_afterIfBBlock.5

main_afterForBBlock.1:
	li      s2,0
	j       main_forCondBBlock.2

main_thenBodyBBlock.4:
	lui     s2,%hi(root)
	lw      s2,%lo(root)(s2)
	bne     s2,zero,main_thenBodyBBlock.6
	j       main_afterIfBBlock.6

main_elseBodyBBlock.1:
	lui     s2,%hi(root)
	lw      s4,%lo(root)(s2)
	beq     s4,zero,main_thenBodyBBlock.7
	j       main_afterIfBBlock.7

main_afterIfBBlock.4:
	addi    s2,s6,1
	mv      a0,s3
	mv      s6,s2
	j       main_forCondBBlock.1

main_thenBodyBBlock.5:
	li      s2,1
	j       main_returnBBlock.11

main_afterIfBBlock.5:
	li      s2,2
	j       main_returnBBlock.11

main_returnBBlock.11:
	li      a6,1
	beq     s2,a6,main_thenBodyBBlock.4
	j       main_elseBodyBBlock.1

main_thenBodyBBlock.6:
	beq     s2,zero,main_thenBodyBBlock.32
	j       main_afterIfBBlock.32

main_afterIfBBlock.6:
	li      a0,16
	call    __malloc
	mv      s2,a0
	addi    a6,s2,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    a6,a0,4
	sw      a6,4(s2)
	addi    ra,s2,8
	sw      s5,8(s2)
	li      ra,1
	addi    a4,s2,12
	sw      ra,12(s2)
	sw      zero,0(s2)
	sw      zero,0(a6)
	addi    ra,a6,4
	sw      zero,4(a6)
	lui     a6,%hi(root)
	sw      s2,%lo(root)(a6)
	j       main_returnBBlock.13

main_returnBBlock.13:
	j       main_afterIfBBlock.4

main_thenBodyBBlock.7:
	j       main_returnBBlock.15

main_afterIfBBlock.7:
	beq     s4,zero,main_thenBodyBBlock.35
	j       main_afterIfBBlock.35

main_returnBBlock.15:
	j       main_afterIfBBlock.4

main_forCondBBlock.2:
	li      a6,50000
	blt     s2,a6,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	slli    a6,a0,13
	xor     ra,a0,a6
	li      a6,2147483647
	and     ra,ra,a6
	srai    a6,ra,17
	xor     a6,ra,a6
	slli    ra,a6,5
	xor     ra,a6,ra
	li      a6,2147483647
	and     ra,ra,a6
	li      a6,128
	rem     s5,ra,a6
	slli    a6,ra,13
	xor     a6,ra,a6
	li      ra,2147483647
	and     ra,a6,ra
	srai    a6,ra,17
	xor     a6,ra,a6
	slli    ra,a6,5
	xor     a6,a6,ra
	li      ra,2147483647
	and     s3,a6,ra
	li      a6,858993456
	blt     s3,a6,main_thenBodyBBlock.9
	j       main_afterIfBBlock.9

main_afterForBBlock.2:
	lui     s2,%hi(root)
	lw      s3,%lo(root)(s2)
	beq     s3,zero,main_thenBodyBBlock.12
	j       main_afterIfBBlock.12

main_thenBodyBBlock.8:
	lui     a6,%hi(root)
	lw      a1,%lo(root)(a6)
	bne     a1,zero,main_thenBodyBBlock.10
	j       main_afterIfBBlock.10

main_elseBodyBBlock.2:
	lui     a6,%hi(root)
	lw      s4,%lo(root)(a6)
	beq     s4,zero,main_thenBodyBBlock.11
	j       main_afterIfBBlock.11

main_afterIfBBlock.8:
	addi    s2,s2,1
	mv      a0,s3
	j       main_forCondBBlock.2

main_thenBodyBBlock.9:
	li      a6,1
	j       main_returnBBlock.18

main_afterIfBBlock.9:
	li      a6,2
	j       main_returnBBlock.18

main_returnBBlock.18:
	li      ra,1
	beq     a6,ra,main_thenBodyBBlock.8
	j       main_elseBodyBBlock.2

main_thenBodyBBlock.10:
	beq     a1,zero,main_thenBodyBBlock.53
	j       main_afterIfBBlock.53

main_afterIfBBlock.10:
	li      a0,16
	call    __malloc
	mv      s4,a0
	addi    a6,s4,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    a6,a0,4
	sw      a6,4(s4)
	addi    ra,s4,8
	sw      s5,8(s4)
	li      ra,1
	addi    a4,s4,12
	sw      ra,12(s4)
	sw      zero,0(s4)
	sw      zero,0(a6)
	addi    ra,a6,4
	sw      zero,4(a6)
	lui     a6,%hi(root)
	sw      s4,%lo(root)(a6)
	j       main_returnBBlock.20

main_returnBBlock.20:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.11:
	j       main_returnBBlock.22

main_afterIfBBlock.11:
	beq     s4,zero,main_thenBodyBBlock.56
	j       main_afterIfBBlock.56

main_returnBBlock.22:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.12:
	j       main_returnBBlock.23

main_afterIfBBlock.12:
	addi    s2,s3,4
	lw      s2,4(s3)
	lw      s2,0(s2)
	beq     s2,zero,main_thenBodyBBlock.51
	j       main_afterIfBBlock.51

main_returnBBlock.23:
	li      a0,0
	mv      s6,s0
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
	mv      s2,a0
	addi    a6,s2,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    a6,a0,4
	sw      a6,4(s2)
	addi    ra,s2,8
	sw      s5,8(s2)
	li      ra,1
	addi    s3,s2,12
	sw      ra,12(s2)
	sw      zero,0(s2)
	sw      zero,0(a6)
	addi    ra,a6,4
	sw      zero,4(a6)
	addi    a6,zero,4
	lw      ra,4(zero)
	addi    a6,ra,-4
	sw      s2,-4(ra)
	j       main_returnBBlock.24

main_afterIfBBlock.13:
	addi    a6,s2,8
	lw      a6,8(s2)
	beq     a6,s5,main_thenBodyBBlock.14
	j       main_afterIfBBlock.14

main_thenBodyBBlock.14:
	addi    a6,s2,12
	lw      a6,12(s2)
	addi    a6,a6,1
	sw      a6,12(s2)
	j       main_returnBBlock.24

main_afterIfBBlock.14:
	blt     a6,s5,main_thenBodyBBlock.15
	j       main_criticalEdge.0

main_thenBodyBBlock.15:
	li      a6,1
	mv      s4,a6
	j       main_afterIfBBlock.15

main_afterIfBBlock.15:
	addi    a6,s2,4
	lw      a6,4(s2)
	slli    ra,s4,2
	add     a6,a6,ra
	lw      a1,0(a6)
	beq     a1,zero,main_thenBodyBBlock.75
	j       main_afterIfBBlock.75

main_returnBBlock.24:
	j       main_returnBBlock.6

main_thenBodyBBlock.16:
	j       main_returnBBlock.25

main_afterIfBBlock.16:
	addi    s2,s3,8
	lw      s2,8(s3)
	bgt     s2,s5,main_thenBodyBBlock.17
	j       main_afterIfBBlock.17

main_thenBodyBBlock.17:
	addi    s2,s3,4
	lw      s2,4(s3)
	lw      a0,0(s2)
	mv      a1,s3
	li      a2,0
	mv      a3,s5
	call    eraseImpl
	j       main_returnBBlock.25

main_afterIfBBlock.17:
	blt     s2,s5,main_thenBodyBBlock.18
	j       main_afterIfBBlock.18

main_thenBodyBBlock.18:
	addi    s2,s3,4
	lw      s2,4(s3)
	addi    a6,s2,4
	lw      a0,4(s2)
	mv      a1,s3
	li      a2,1
	mv      a3,s5
	call    eraseImpl
	j       main_returnBBlock.25

main_afterIfBBlock.18:
	addi    s2,s3,12
	lw      s2,12(s3)
	addi    s2,s2,-1
	sw      s2,12(s3)
	li      a6,0
	bgt     s2,a6,main_thenBodyBBlock.19
	j       main_afterIfBBlock.19

main_thenBodyBBlock.19:
	j       main_returnBBlock.25

main_afterIfBBlock.19:
	addi    s2,s3,4
	lw      a6,4(s3)
	lw      s2,0(a6)
	beq     s2,zero,main_thenBodyBBlock.20
	j       main_afterIfBBlock.20

main_thenBodyBBlock.20:
	bne     zero,zero,main_thenBodyBBlock.21
	j       main_afterIfBBlock.21

main_afterIfBBlock.20:
	addi    a6,s2,4
	lw      a6,4(s2)
	addi    ra,a6,4
	lw      a6,4(a6)
	beq     a6,zero,main_thenBodyBBlock.30
	j       main_afterIfBBlock.30

main_thenBodyBBlock.21:
	addi    s2,zero,4
	lw      s2,4(zero)
	addi    ra,s2,-4
	addi    ra,a6,4
	lw      ra,4(a6)
	sw      ra,-4(s2)
	j       main_afterIfBBlock.21

main_afterIfBBlock.21:
	addi    s2,a6,4
	lw      s2,4(a6)
	bne     s2,zero,main_thenBodyBBlock.22
	j       main_afterIfBBlock.22

main_thenBodyBBlock.22:
	sw      zero,0(s2)
	j       main_afterIfBBlock.22

main_afterIfBBlock.22:
	lw      s2,8(s3)
	beq     s5,s2,main_thenBodyBBlock.23
	j       main_afterIfBBlock.23

main_thenBodyBBlock.23:
	lw      a6,4(a6)
	lui     s2,%hi(root)
	sw      a6,%lo(root)(s2)
	j       main_afterIfBBlock.23

main_afterIfBBlock.23:
	j       main_returnBBlock.25

main_thenBodyBBlock.24:
	lui     a6,%hi(root)
	sw      s2,%lo(root)(a6)
	j       main_afterIfBBlock.24

main_afterIfBBlock.24:
	addi    a6,s2,8
	lw      a4,8(s2)
	lw      s3,4(s3)
	lw      ra,0(s3)
	addi    a6,ra,8
	lw      a6,8(ra)
	bne     a4,a6,main_thenBodyBBlock.25
	j       main_afterIfBBlock.25

main_thenBodyBBlock.25:
	lw      ra,0(s2)
	addi    a6,ra,4
	lw      s5,4(ra)
	addi    a6,s5,4
	addi    a6,s2,4
	lw      a6,4(s2)
	lw      ra,0(a6)
	sw      ra,4(s5)
	lw      a6,0(a6)
	bne     a6,zero,main_thenBodyBBlock.26
	j       main_afterIfBBlock.26

main_afterIfBBlock.25:
	bne     zero,zero,main_thenBodyBBlock.27
	j       main_afterIfBBlock.27

main_thenBodyBBlock.26:
	lw      ra,0(s2)
	sw      ra,0(a6)
	j       main_afterIfBBlock.26

main_afterIfBBlock.26:
	j       main_afterIfBBlock.25

main_thenBodyBBlock.27:
	addi    a6,zero,4
	lw      a6,4(zero)
	addi    ra,a6,-4
	sw      s2,-4(a6)
	j       main_afterIfBBlock.27

main_afterIfBBlock.27:
	sw      zero,0(s2)
	addi    a6,s2,4
	lw      a6,4(s2)
	addi    ra,a6,4
	addi    ra,s3,4
	lw      ra,4(s3)
	sw      ra,4(a6)
	lw      ra,4(s3)
	bne     ra,zero,main_thenBodyBBlock.28
	j       main_afterIfBBlock.28

main_thenBodyBBlock.28:
	sw      s2,0(ra)
	j       main_afterIfBBlock.28

main_afterIfBBlock.28:
	lw      ra,0(s3)
	addi    s5,ra,8
	lw      s5,8(ra)
	bne     a4,s5,main_thenBodyBBlock.29
	j       main_afterIfBBlock.29

main_thenBodyBBlock.29:
	sw      ra,0(a6)
	lw      a6,0(s3)
	sw      s2,0(a6)
	j       main_afterIfBBlock.29

main_afterIfBBlock.29:
	j       main_returnBBlock.25

main_returnBBlock.25:
	j       main_returnBBlock.8

main_thenBodyBBlock.30:
	j       main_returnBBlock.26

main_afterIfBBlock.30:
	addi    s2,a6,4
	lw      s2,4(a6)
	addi    ra,s2,4
	lw      s2,4(s2)
	beq     s2,zero,main_thenBodyBBlock.31
	j       main_afterIfBBlock.31

main_returnBBlock.26:
	lui     a6,%hi(root)
	lw      a6,%lo(root)(a6)
	addi    ra,a6,8
	lw      a6,8(a6)
	beq     s5,a6,main_thenBodyBBlock.24
	j       main_afterIfBBlock.24

main_thenBodyBBlock.31:
	j       main_returnBBlock.27

main_afterIfBBlock.31:
	addi    a6,s2,4
	lw      ra,4(s2)
	addi    a6,ra,4
	lw      a0,4(ra)
	beq     a0,zero,main_thenBodyBBlock.73
	j       main_afterIfBBlock.73

main_returnBBlock.27:
	mv      s2,a6
	j       main_returnBBlock.26

main_thenBodyBBlock.32:
	li      a0,16
	call    __malloc
	mv      s2,a0
	addi    a6,s2,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    a6,a0,4
	sw      a6,4(s2)
	addi    ra,s2,8
	sw      s5,8(s2)
	li      a4,1
	addi    ra,s2,12
	sw      a4,12(s2)
	sw      zero,0(s2)
	sw      zero,0(a6)
	addi    ra,a6,4
	sw      zero,4(a6)
	addi    a6,zero,4
	lw      a6,4(zero)
	addi    ra,a6,-4
	sw      s2,-4(a6)
	j       main_returnBBlock.28

main_afterIfBBlock.32:
	addi    a6,s2,8
	lw      a6,8(s2)
	beq     a6,s5,main_thenBodyBBlock.33
	j       main_afterIfBBlock.33

main_thenBodyBBlock.33:
	addi    a6,s2,12
	lw      a6,12(s2)
	addi    a6,a6,1
	sw      a6,12(s2)
	j       main_returnBBlock.28

main_afterIfBBlock.33:
	blt     a6,s5,main_thenBodyBBlock.34
	j       main_criticalEdge.1

main_thenBodyBBlock.34:
	li      a6,1
	mv      s4,a6
	j       main_afterIfBBlock.34

main_afterIfBBlock.34:
	addi    a6,s2,4
	lw      a6,4(s2)
	slli    ra,s4,2
	add     a6,a6,ra
	lw      a1,0(a6)
	beq     a1,zero,main_thenBodyBBlock.80
	j       main_afterIfBBlock.80

main_returnBBlock.28:
	j       main_returnBBlock.13

main_thenBodyBBlock.35:
	j       main_returnBBlock.29

main_afterIfBBlock.35:
	addi    s2,s4,8
	lw      s2,8(s4)
	bgt     s2,s5,main_thenBodyBBlock.36
	j       main_afterIfBBlock.36

main_thenBodyBBlock.36:
	addi    s2,s4,4
	lw      s2,4(s4)
	lw      a0,0(s2)
	mv      a1,s4
	li      a2,0
	mv      a3,s5
	call    eraseImpl
	j       main_returnBBlock.29

main_afterIfBBlock.36:
	blt     s2,s5,main_thenBodyBBlock.37
	j       main_afterIfBBlock.37

main_thenBodyBBlock.37:
	addi    s2,s4,4
	lw      s2,4(s4)
	addi    a6,s2,4
	lw      a0,4(s2)
	mv      a1,s4
	li      a2,1
	mv      a3,s5
	call    eraseImpl
	j       main_returnBBlock.29

main_afterIfBBlock.37:
	addi    s2,s4,12
	lw      s2,12(s4)
	addi    a6,s2,-1
	sw      a6,12(s4)
	li      s2,0
	bgt     a6,s2,main_thenBodyBBlock.38
	j       main_afterIfBBlock.38

main_thenBodyBBlock.38:
	j       main_returnBBlock.29

main_afterIfBBlock.38:
	addi    s2,s4,4
	lw      ra,4(s4)
	lw      a6,0(ra)
	beq     a6,zero,main_thenBodyBBlock.39
	j       main_afterIfBBlock.39

main_thenBodyBBlock.39:
	bne     zero,zero,main_thenBodyBBlock.40
	j       main_afterIfBBlock.40

main_afterIfBBlock.39:
	addi    s2,a6,4
	lw      s2,4(a6)
	addi    ra,s2,4
	lw      s2,4(s2)
	beq     s2,zero,main_thenBodyBBlock.49
	j       main_afterIfBBlock.49

main_thenBodyBBlock.40:
	addi    s2,zero,4
	lw      a6,4(zero)
	addi    s2,a6,-4
	addi    s2,ra,4
	lw      s2,4(ra)
	sw      s2,-4(a6)
	j       main_afterIfBBlock.40

main_afterIfBBlock.40:
	addi    s2,ra,4
	lw      s2,4(ra)
	bne     s2,zero,main_thenBodyBBlock.41
	j       main_afterIfBBlock.41

main_thenBodyBBlock.41:
	sw      zero,0(s2)
	j       main_afterIfBBlock.41

main_afterIfBBlock.41:
	lw      s2,8(s4)
	beq     s5,s2,main_thenBodyBBlock.42
	j       main_afterIfBBlock.42

main_thenBodyBBlock.42:
	lw      a6,4(ra)
	lui     s2,%hi(root)
	sw      a6,%lo(root)(s2)
	j       main_afterIfBBlock.42

main_afterIfBBlock.42:
	j       main_returnBBlock.29

main_thenBodyBBlock.43:
	lui     s2,%hi(root)
	sw      a6,%lo(root)(s2)
	j       main_afterIfBBlock.43

main_afterIfBBlock.43:
	addi    s2,a6,8
	lw      s5,8(a6)
	lw      a4,4(s4)
	lw      ra,0(a4)
	addi    s2,ra,8
	lw      s2,8(ra)
	bne     s5,s2,main_thenBodyBBlock.44
	j       main_afterIfBBlock.44

main_thenBodyBBlock.44:
	lw      ra,0(a6)
	addi    s2,ra,4
	lw      ra,4(ra)
	addi    s2,ra,4
	addi    s2,a6,4
	lw      s2,4(a6)
	lw      t3,0(s2)
	sw      t3,4(ra)
	lw      s2,0(s2)
	bne     s2,zero,main_thenBodyBBlock.45
	j       main_afterIfBBlock.45

main_afterIfBBlock.44:
	bne     zero,zero,main_thenBodyBBlock.46
	j       main_afterIfBBlock.46

main_thenBodyBBlock.45:
	lw      ra,0(a6)
	sw      ra,0(s2)
	j       main_afterIfBBlock.45

main_afterIfBBlock.45:
	j       main_afterIfBBlock.44

main_thenBodyBBlock.46:
	addi    s2,zero,4
	lw      s2,4(zero)
	addi    ra,s2,-4
	sw      a6,-4(s2)
	j       main_afterIfBBlock.46

main_afterIfBBlock.46:
	sw      zero,0(a6)
	addi    s2,a6,4
	lw      s2,4(a6)
	addi    ra,s2,4
	addi    ra,a4,4
	lw      ra,4(a4)
	sw      ra,4(s2)
	lw      ra,4(a4)
	bne     ra,zero,main_thenBodyBBlock.47
	j       main_afterIfBBlock.47

main_thenBodyBBlock.47:
	sw      a6,0(ra)
	j       main_afterIfBBlock.47

main_afterIfBBlock.47:
	lw      t3,0(a4)
	addi    ra,t3,8
	lw      ra,8(t3)
	bne     s5,ra,main_thenBodyBBlock.48
	j       main_afterIfBBlock.48

main_thenBodyBBlock.48:
	sw      t3,0(s2)
	lw      s2,0(a4)
	sw      a6,0(s2)
	j       main_afterIfBBlock.48

main_afterIfBBlock.48:
	j       main_returnBBlock.29

main_returnBBlock.29:
	j       main_returnBBlock.15

main_thenBodyBBlock.49:
	j       main_returnBBlock.30

main_afterIfBBlock.49:
	addi    a6,s2,4
	lw      ra,4(s2)
	addi    a6,ra,4
	lw      a0,4(ra)
	beq     a0,zero,main_thenBodyBBlock.50
	j       main_afterIfBBlock.50

main_returnBBlock.30:
	lui     s2,%hi(root)
	lw      s2,%lo(root)(s2)
	addi    ra,s2,8
	lw      s2,8(s2)
	beq     s5,s2,main_thenBodyBBlock.43
	j       main_afterIfBBlock.43

main_thenBodyBBlock.50:
	j       main_returnBBlock.31

main_afterIfBBlock.50:
	addi    s2,a0,4
	lw      a6,4(a0)
	addi    s2,a6,4
	lw      s2,4(a6)
	beq     s2,zero,main_thenBodyBBlock.74
	j       main_afterIfBBlock.74

main_returnBBlock.31:
	mv      a6,s2
	j       main_returnBBlock.30

main_thenBodyBBlock.51:
	j       main_returnBBlock.32

main_afterIfBBlock.51:
	addi    a6,s2,4
	lw      a6,4(s2)
	lw      s5,0(a6)
	beq     s5,zero,main_thenBodyBBlock.78
	j       main_afterIfBBlock.78

main_returnBBlock.32:
	addi    s2,s3,8
	lw      a0,8(s3)
	call    __toString
    la      s2,.str.0
	mv      a1,s2
	call    __stringAdd
	mv      s5,a0
	addi    a6,s3,12
	lw      a0,12(s3)
	call    __toString
	mv      a1,a0
	mv      a0,s5
	call    __stringAdd
	call    __println
	lw      a6,4(s3)
	addi    ra,a6,4
	lw      s3,4(a6)
	beq     s3,zero,main_thenBodyBBlock.52
	j       main_afterIfBBlock.52

main_thenBodyBBlock.52:
	j       main_returnBBlock.33

main_afterIfBBlock.52:
	addi    a6,s3,4
	lw      a6,4(s3)
	lw      s5,0(a6)
	beq     s5,zero,main_thenBodyBBlock.83
	j       main_afterIfBBlock.83

main_returnBBlock.33:
	j       main_returnBBlock.23

main_thenBodyBBlock.53:
	li      a0,16
	call    __malloc
	mv      s4,a0
	addi    a6,s4,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    a6,a0,4
	sw      a6,4(s4)
	addi    ra,s4,8
	sw      s5,8(s4)
	li      ra,1
	addi    a4,s4,12
	sw      ra,12(s4)
	sw      zero,0(s4)
	sw      zero,0(a6)
	addi    ra,a6,4
	sw      zero,4(a6)
	addi    a6,zero,4
	lw      ra,4(zero)
	addi    a6,ra,-4
	sw      s4,-4(ra)
	j       main_returnBBlock.34

main_afterIfBBlock.53:
	addi    a6,a1,8
	lw      a6,8(a1)
	beq     a6,s5,main_thenBodyBBlock.54
	j       main_afterIfBBlock.54

main_thenBodyBBlock.54:
	addi    a6,a1,12
	lw      a6,12(a1)
	addi    a6,a6,1
	sw      a6,12(a1)
	j       main_returnBBlock.34

main_afterIfBBlock.54:
	blt     a6,s5,main_thenBodyBBlock.55
	j       main_criticalEdge.2

main_thenBodyBBlock.55:
	li      a2,1
	j       main_afterIfBBlock.55

main_afterIfBBlock.55:
	addi    a6,a1,4
	lw      a6,4(a1)
	slli    ra,a2,2
	add     a6,a6,ra
	lw      a0,0(a6)
	mv      a3,s5
	call    insertImpl
	j       main_returnBBlock.34

main_returnBBlock.34:
	j       main_returnBBlock.20

main_thenBodyBBlock.56:
	j       main_returnBBlock.35

main_afterIfBBlock.56:
	addi    a6,s4,8
	lw      a6,8(s4)
	bgt     a6,s5,main_thenBodyBBlock.57
	j       main_afterIfBBlock.57

main_thenBodyBBlock.57:
	addi    a6,s4,4
	lw      a6,4(s4)
	lw      a0,0(a6)
	mv      a1,s4
	li      a2,0
	mv      a3,s5
	call    eraseImpl
	j       main_returnBBlock.35

main_afterIfBBlock.57:
	blt     a6,s5,main_thenBodyBBlock.58
	j       main_afterIfBBlock.58

main_thenBodyBBlock.58:
	addi    a6,s4,4
	lw      ra,4(s4)
	addi    a6,ra,4
	lw      a0,4(ra)
	mv      a1,s4
	li      a2,1
	mv      a3,s5
	call    eraseImpl
	j       main_returnBBlock.35

main_afterIfBBlock.58:
	addi    a6,s4,12
	lw      a6,12(s4)
	addi    ra,a6,-1
	sw      ra,12(s4)
	li      a6,0
	bgt     ra,a6,main_thenBodyBBlock.59
	j       main_afterIfBBlock.59

main_thenBodyBBlock.59:
	j       main_returnBBlock.35

main_afterIfBBlock.59:
	addi    a6,s4,4
	lw      ra,4(s4)
	lw      a6,0(ra)
	beq     a6,zero,main_thenBodyBBlock.60
	j       main_afterIfBBlock.60

main_thenBodyBBlock.60:
	bne     zero,zero,main_thenBodyBBlock.61
	j       main_afterIfBBlock.61

main_afterIfBBlock.60:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      ra,4(a4)
	beq     ra,zero,main_thenBodyBBlock.70
	j       main_afterIfBBlock.70

main_thenBodyBBlock.61:
	addi    a6,zero,4
	lw      a6,4(zero)
	addi    a4,a6,-4
	addi    a4,ra,4
	lw      a4,4(ra)
	sw      a4,-4(a6)
	j       main_afterIfBBlock.61

main_afterIfBBlock.61:
	addi    a6,ra,4
	lw      a6,4(ra)
	bne     a6,zero,main_thenBodyBBlock.62
	j       main_afterIfBBlock.62

main_thenBodyBBlock.62:
	sw      zero,0(a6)
	j       main_afterIfBBlock.62

main_afterIfBBlock.62:
	lw      a6,8(s4)
	beq     s5,a6,main_thenBodyBBlock.63
	j       main_afterIfBBlock.63

main_thenBodyBBlock.63:
	lw      a6,4(ra)
	lui     ra,%hi(root)
	sw      a6,%lo(root)(ra)
	j       main_afterIfBBlock.63

main_afterIfBBlock.63:
	j       main_returnBBlock.35

main_thenBodyBBlock.64:
	lui     ra,%hi(root)
	sw      a6,%lo(root)(ra)
	j       main_afterIfBBlock.64

main_afterIfBBlock.64:
	addi    ra,a6,8
	lw      t3,8(a6)
	lw      s5,4(s4)
	lw      ra,0(s5)
	addi    a4,ra,8
	lw      ra,8(ra)
	bne     t3,ra,main_thenBodyBBlock.65
	j       main_afterIfBBlock.65

main_thenBodyBBlock.65:
	lw      a4,0(a6)
	addi    ra,a4,4
	lw      a4,4(a4)
	addi    ra,a4,4
	addi    ra,a6,4
	lw      ra,4(a6)
	lw      t5,0(ra)
	sw      t5,4(a4)
	lw      ra,0(ra)
	bne     ra,zero,main_thenBodyBBlock.66
	j       main_afterIfBBlock.66

main_afterIfBBlock.65:
	bne     zero,zero,main_thenBodyBBlock.67
	j       main_afterIfBBlock.67

main_thenBodyBBlock.66:
	lw      a4,0(a6)
	sw      a4,0(ra)
	j       main_afterIfBBlock.66

main_afterIfBBlock.66:
	j       main_afterIfBBlock.65

main_thenBodyBBlock.67:
	addi    ra,zero,4
	lw      ra,4(zero)
	addi    a4,ra,-4
	sw      a6,-4(ra)
	j       main_afterIfBBlock.67

main_afterIfBBlock.67:
	sw      zero,0(a6)
	addi    ra,a6,4
	lw      ra,4(a6)
	addi    a4,ra,4
	addi    a4,s5,4
	lw      a4,4(s5)
	sw      a4,4(ra)
	lw      a4,4(s5)
	bne     a4,zero,main_thenBodyBBlock.68
	j       main_afterIfBBlock.68

main_thenBodyBBlock.68:
	sw      a6,0(a4)
	j       main_afterIfBBlock.68

main_afterIfBBlock.68:
	lw      t5,0(s5)
	addi    a4,t5,8
	lw      a4,8(t5)
	bne     t3,a4,main_thenBodyBBlock.69
	j       main_afterIfBBlock.69

main_thenBodyBBlock.69:
	sw      t5,0(ra)
	lw      ra,0(s5)
	sw      a6,0(ra)
	j       main_afterIfBBlock.69

main_afterIfBBlock.69:
	j       main_returnBBlock.35

main_returnBBlock.35:
	j       main_returnBBlock.22

main_thenBodyBBlock.70:
	j       main_returnBBlock.36

main_afterIfBBlock.70:
	addi    a6,ra,4
	lw      a4,4(ra)
	addi    a6,a4,4
	lw      a6,4(a4)
	beq     a6,zero,main_thenBodyBBlock.71
	j       main_afterIfBBlock.71

main_returnBBlock.36:
	lui     ra,%hi(root)
	lw      a4,%lo(root)(ra)
	addi    ra,a4,8
	lw      ra,8(a4)
	beq     s5,ra,main_thenBodyBBlock.64
	j       main_afterIfBBlock.64

main_thenBodyBBlock.71:
	j       main_returnBBlock.37

main_afterIfBBlock.71:
	addi    ra,a6,4
	lw      a4,4(a6)
	addi    ra,a4,4
	lw      a0,4(a4)
	beq     a0,zero,main_thenBodyBBlock.72
	j       main_afterIfBBlock.72

main_returnBBlock.37:
	mv      a6,ra
	j       main_returnBBlock.36

main_thenBodyBBlock.72:
	j       main_returnBBlock.38

main_afterIfBBlock.72:
	addi    a6,a0,4
	lw      a6,4(a0)
	addi    ra,a6,4
	lw      a6,4(a6)
	beq     a6,zero,main_thenBodyBBlock.79
	j       main_afterIfBBlock.79

main_returnBBlock.38:
	mv      ra,a6
	j       main_returnBBlock.37

main_thenBodyBBlock.73:
	j       main_returnBBlock.39

main_afterIfBBlock.73:
	addi    s2,a0,4
	lw      a6,4(a0)
	addi    s2,a6,4
	lw      s2,4(a6)
	beq     s2,zero,main_thenBodyBBlock.84
	j       main_afterIfBBlock.84

main_returnBBlock.39:
	mv      a6,s2
	j       main_returnBBlock.27

main_thenBodyBBlock.74:
	j       main_returnBBlock.40

main_afterIfBBlock.74:
	mv      a0,s2
	call    findLargest
	j       main_returnBBlock.40

main_returnBBlock.40:
	mv      s2,a0
	j       main_returnBBlock.31

main_thenBodyBBlock.75:
	li      a0,16
	call    __malloc
	mv      s3,a0
	addi    a6,s3,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    ra,a0,4
	sw      ra,4(s3)
	addi    a6,s3,8
	sw      s5,8(s3)
	li      a4,1
	addi    a6,s3,12
	sw      a4,12(s3)
	mv      a6,s3
	sw      s2,0(s3)
	sw      zero,0(ra)
	addi    a6,ra,4
	sw      zero,4(ra)
	lw      s2,4(s2)
	slli    a6,s4,2
	add     s2,s2,a6
	sw      s3,0(s2)
	j       main_returnBBlock.41

main_afterIfBBlock.75:
	addi    s2,a1,8
	lw      s2,8(a1)
	beq     s2,s5,main_thenBodyBBlock.76
	j       main_afterIfBBlock.76

main_thenBodyBBlock.76:
	addi    s2,a1,12
	lw      s2,12(a1)
	addi    s2,s2,1
	sw      s2,12(a1)
	j       main_returnBBlock.41

main_afterIfBBlock.76:
	blt     s2,s5,main_thenBodyBBlock.77
	j       main_criticalEdge.3

main_thenBodyBBlock.77:
	li      a2,1
	j       main_afterIfBBlock.77

main_afterIfBBlock.77:
	addi    s2,a1,4
	lw      s2,4(a1)
	slli    a6,a2,2
	add     s2,s2,a6
	lw      a0,0(s2)
	mv      a3,s5
	call    insertImpl
	j       main_returnBBlock.41

main_returnBBlock.41:
	j       main_returnBBlock.24

main_thenBodyBBlock.78:
	j       main_returnBBlock.42

main_afterIfBBlock.78:
	addi    a6,s5,4
	lw      a6,4(s5)
	lw      a0,0(a6)
	call    printTree
	addi    a6,s5,8
	lw      a0,8(s5)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s4,a0
	addi    a6,s5,12
	lw      a0,12(s5)
	call    __toString
	mv      a1,a0
	mv      a0,s4
	call    __stringAdd
	call    __println
	lw      a6,4(s5)
	addi    ra,a6,4
	lw      a0,4(a6)
	call    printTree
	j       main_returnBBlock.42

main_returnBBlock.42:
	addi    a6,s2,8
	lw      a0,8(s2)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s5,a0
	addi    a6,s2,12
	lw      a0,12(s2)
	call    __toString
	mv      a1,a0
	mv      a0,s5
	call    __stringAdd
	call    __println
	lw      s2,4(s2)
	addi    a6,s2,4
	lw      a0,4(s2)
	call    printTree
	j       main_returnBBlock.32

main_thenBodyBBlock.79:
	j       main_returnBBlock.43

main_afterIfBBlock.79:
	mv      a0,a6
	call    findLargest
	j       main_returnBBlock.43

main_returnBBlock.43:
	mv      a6,a0
	j       main_returnBBlock.38

main_thenBodyBBlock.80:
	li      a0,16
	call    __malloc
	mv      s1,a0
	addi    a6,s1,4
	li      a0,20
	call    __malloc
	li      a6,2
	sw      a6,0(a0)
	addi    ra,a0,4
	sw      ra,4(s1)
	addi    a6,s1,8
	sw      s5,8(s1)
	li      a6,1
	addi    a4,s1,12
	sw      a6,12(s1)
	mv      a6,s1
	sw      s2,0(s1)
	sw      zero,0(ra)
	addi    a6,ra,4
	sw      zero,4(ra)
	lw      a6,4(s2)
	slli    s2,s4,2
	add     s2,a6,s2
	sw      s1,0(s2)
	j       main_returnBBlock.44

main_afterIfBBlock.80:
	addi    s2,a1,8
	lw      s2,8(a1)
	beq     s2,s5,main_thenBodyBBlock.81
	j       main_afterIfBBlock.81

main_thenBodyBBlock.81:
	addi    s2,a1,12
	lw      s2,12(a1)
	addi    s2,s2,1
	sw      s2,12(a1)
	j       main_returnBBlock.44

main_afterIfBBlock.81:
	blt     s2,s5,main_thenBodyBBlock.82
	j       main_criticalEdge.4

main_thenBodyBBlock.82:
	li      a2,1
	j       main_afterIfBBlock.82

main_afterIfBBlock.82:
	addi    s2,a1,4
	lw      s2,4(a1)
	slli    a6,a2,2
	add     s2,s2,a6
	lw      a0,0(s2)
	mv      a3,s5
	call    insertImpl
	j       main_returnBBlock.44

main_returnBBlock.44:
	j       main_returnBBlock.28

main_thenBodyBBlock.83:
	j       main_returnBBlock.45

main_afterIfBBlock.83:
	addi    a6,s5,4
	lw      a6,4(s5)
	lw      a0,0(a6)
	call    printTree
	addi    a6,s5,8
	lw      a0,8(s5)
	call    __toString
	mv      a1,s2
	call    __stringAdd
	mv      s4,a0
	addi    a6,s5,12
	lw      a0,12(s5)
	call    __toString
	mv      a1,a0
	mv      a0,s4
	call    __stringAdd
	call    __println
	lw      a6,4(s5)
	addi    ra,a6,4
	lw      a0,4(a6)
	call    printTree
	j       main_returnBBlock.45

main_returnBBlock.45:
	addi    a6,s3,8
	lw      a0,8(s3)
	call    __toString
	mv      a1,s2
	call    __stringAdd
	mv      s2,a0
	addi    a6,s3,12
	lw      a0,12(s3)
	call    __toString
	mv      a1,a0
	mv      a0,s2
	call    __stringAdd
	call    __println
	lw      a6,4(s3)
	addi    s2,a6,4
	lw      a0,4(a6)
	call    printTree
	j       main_returnBBlock.33

main_thenBodyBBlock.84:
	j       main_returnBBlock.46

main_afterIfBBlock.84:
	mv      a0,s2
	call    findLargest
	j       main_returnBBlock.46

main_returnBBlock.46:
	mv      s2,a0
	j       main_returnBBlock.39

main_criticalEdge.0:
	li      a6,0
	mv      s4,a6
	j       main_afterIfBBlock.15

main_criticalEdge.1:
	li      a6,0
	mv      s4,a6
	j       main_afterIfBBlock.34

main_criticalEdge.2:
	li      a2,0
	j       main_afterIfBBlock.55

main_criticalEdge.3:
	li      a2,0
	j       main_afterIfBBlock.77

main_criticalEdge.4:
	li      a2,0
	j       main_afterIfBBlock.82


