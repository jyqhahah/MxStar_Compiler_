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
	mv      t1,a0
	mv      s2,a1
	mv      s3,a2
	mv      s1,a3
	beq     t1,zero,insertImpl_thenBodyBBlock.0
	j       insertImpl_afterIfBBlock.0

insertImpl_thenBodyBBlock.0:
	li      a0,16
	call    __malloc
	mv      s4,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s4)
	sw      s1,8(s4)
	li      t1,1
	sw      t1,12(s4)
	sw      s2,0(s4)
	lw      t1,4(s4)
	sw      zero,0(t1)
	lw      t1,4(s4)
	sw      zero,4(t1)
	lw      t1,4(s2)
	slli    s2,s3,2
	add     t1,t1,s2
	sw      s4,0(t1)
	li      a0,0
	j       insertImpl_returnBBlock.0

insertImpl_afterIfBBlock.0:
	lw      s2,8(t1)
	beq     s2,s1,insertImpl_thenBodyBBlock.1
	j       insertImpl_afterIfBBlock.1

insertImpl_thenBodyBBlock.1:
	lw      s2,12(t1)
	addi    s2,s2,1
	sw      s2,12(t1)
	li      a0,1
	j       insertImpl_returnBBlock.0

insertImpl_afterIfBBlock.1:
	lw      s2,8(t1)
	blt     s2,s1,insertImpl_thenBodyBBlock.2
	j       insertImpl_criticalEdge.0

insertImpl_thenBodyBBlock.2:
	li      a2,1
	j       insertImpl_afterIfBBlock.2

insertImpl_afterIfBBlock.2:
	lw      a3,4(t1)
	slli    s2,a2,2
	add     s2,a3,s2
	lw      a0,0(s2)
	mv      a1,t1
	mv      a3,s1
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
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,findLargest_thenBodyBBlock.0
	j       findLargest_afterIfBBlock.0

findLargest_thenBodyBBlock.0:
	j       findLargest_returnBBlock.0

findLargest_afterIfBBlock.0:
	lw      t1,4(a0)
	lw      a0,4(t1)
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
	mv      s2,a0
	mv      s1,a1
	mv      s3,a2
	mv      s4,a3
	beq     s2,zero,eraseImpl_thenBodyBBlock.0
	j       eraseImpl_afterIfBBlock.0

eraseImpl_thenBodyBBlock.0:
	li      a0,0
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.0:
	lw      t1,8(s2)
	bgt     t1,s4,eraseImpl_thenBodyBBlock.1
	j       eraseImpl_afterIfBBlock.1

eraseImpl_thenBodyBBlock.1:
	lw      t1,4(s2)
	lw      a0,0(t1)
	mv      a1,s2
	li      a2,0
	mv      a3,s4
	call    eraseImpl
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.1:
	lw      t1,8(s2)
	blt     t1,s4,eraseImpl_thenBodyBBlock.2
	j       eraseImpl_afterIfBBlock.2

eraseImpl_thenBodyBBlock.2:
	lw      t1,4(s2)
	lw      a0,4(t1)
	mv      a1,s2
	li      a2,1
	mv      a3,s4
	call    eraseImpl
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.2:
	lw      t1,12(s2)
	addi    t1,t1,-1
	sw      t1,12(s2)
	lw      t1,12(s2)
	li      a3,0
	bgt     t1,a3,eraseImpl_thenBodyBBlock.3
	j       eraseImpl_afterIfBBlock.3

eraseImpl_thenBodyBBlock.3:
	li      a0,1
	j       eraseImpl_returnBBlock.0

eraseImpl_afterIfBBlock.3:
	lw      t1,4(s2)
	lw      t1,0(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.4
	j       eraseImpl_afterIfBBlock.4

eraseImpl_thenBodyBBlock.4:
	bne     s1,zero,eraseImpl_thenBodyBBlock.5
	j       eraseImpl_afterIfBBlock.5

eraseImpl_afterIfBBlock.4:
	lw      t1,4(s2)
	lw      a0,0(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.14
	j       eraseImpl_afterIfBBlock.14

eraseImpl_thenBodyBBlock.5:
	lw      a3,4(s1)
	slli    t1,s3,2
	add     a3,a3,t1
	lw      t1,4(s2)
	lw      t1,4(t1)
	sw      t1,0(a3)
	j       eraseImpl_afterIfBBlock.5

eraseImpl_afterIfBBlock.5:
	lw      t1,4(s2)
	lw      t1,4(t1)
	bne     t1,zero,eraseImpl_thenBodyBBlock.6
	j       eraseImpl_afterIfBBlock.6

eraseImpl_thenBodyBBlock.6:
	lw      t1,4(s2)
	lw      t1,4(t1)
	sw      s1,0(t1)
	j       eraseImpl_afterIfBBlock.6

eraseImpl_afterIfBBlock.6:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	lw      t1,8(t1)
	beq     s4,t1,eraseImpl_thenBodyBBlock.7
	j       eraseImpl_afterIfBBlock.7

eraseImpl_thenBodyBBlock.7:
	lw      t1,4(s2)
	lw      t1,4(t1)
	lui     s2,%hi(root)
	sw      t1,%lo(root)(s2)
	j       eraseImpl_afterIfBBlock.7

eraseImpl_afterIfBBlock.7:
	li      a0,1
	j       eraseImpl_returnBBlock.0

eraseImpl_thenBodyBBlock.8:
	lui     t1,%hi(root)
	sw      a0,%lo(root)(t1)
	j       eraseImpl_afterIfBBlock.8

eraseImpl_afterIfBBlock.8:
	lw      a3,8(a0)
	lw      t1,4(s2)
	lw      t1,0(t1)
	lw      t1,8(t1)
	bne     a3,t1,eraseImpl_thenBodyBBlock.9
	j       eraseImpl_afterIfBBlock.9

eraseImpl_thenBodyBBlock.9:
	lw      t1,0(a0)
	lw      a3,4(t1)
	lw      t1,4(a0)
	lw      t1,0(t1)
	sw      t1,4(a3)
	lw      t1,4(a0)
	lw      t1,0(t1)
	bne     t1,zero,eraseImpl_thenBodyBBlock.10
	j       eraseImpl_afterIfBBlock.10

eraseImpl_afterIfBBlock.9:
	bne     s1,zero,eraseImpl_thenBodyBBlock.11
	j       eraseImpl_afterIfBBlock.11

eraseImpl_thenBodyBBlock.10:
	lw      t1,4(a0)
	lw      t1,0(t1)
	lw      a3,0(a0)
	sw      a3,0(t1)
	j       eraseImpl_afterIfBBlock.10

eraseImpl_afterIfBBlock.10:
	j       eraseImpl_afterIfBBlock.9

eraseImpl_thenBodyBBlock.11:
	lw      t1,4(s1)
	slli    a3,s3,2
	add     t1,t1,a3
	sw      a0,0(t1)
	j       eraseImpl_afterIfBBlock.11

eraseImpl_afterIfBBlock.11:
	sw      s1,0(a0)
	lw      t1,4(a0)
	lw      a3,4(s2)
	lw      a3,4(a3)
	sw      a3,4(t1)
	lw      t1,4(s2)
	lw      t1,4(t1)
	bne     t1,zero,eraseImpl_thenBodyBBlock.12
	j       eraseImpl_afterIfBBlock.12

eraseImpl_thenBodyBBlock.12:
	lw      t1,4(s2)
	lw      t1,4(t1)
	sw      a0,0(t1)
	j       eraseImpl_afterIfBBlock.12

eraseImpl_afterIfBBlock.12:
	lw      a3,8(a0)
	lw      t1,4(s2)
	lw      t1,0(t1)
	lw      t1,8(t1)
	bne     a3,t1,eraseImpl_thenBodyBBlock.13
	j       eraseImpl_afterIfBBlock.13

eraseImpl_thenBodyBBlock.13:
	lw      t1,4(a0)
	lw      a3,4(s2)
	lw      a3,0(a3)
	sw      a3,0(t1)
	lw      t1,4(s2)
	lw      t1,0(t1)
	sw      a0,0(t1)
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
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.15
	j       eraseImpl_afterIfBBlock.15

eraseImpl_returnBBlock.1:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	lw      t1,8(t1)
	beq     s4,t1,eraseImpl_thenBodyBBlock.8
	j       eraseImpl_afterIfBBlock.8

eraseImpl_thenBodyBBlock.15:
	j       eraseImpl_returnBBlock.2

eraseImpl_afterIfBBlock.15:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.16
	j       eraseImpl_afterIfBBlock.16

eraseImpl_returnBBlock.2:
	j       eraseImpl_returnBBlock.1

eraseImpl_thenBodyBBlock.16:
	j       eraseImpl_returnBBlock.3

eraseImpl_afterIfBBlock.16:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.17
	j       eraseImpl_afterIfBBlock.17

eraseImpl_returnBBlock.3:
	j       eraseImpl_returnBBlock.2

eraseImpl_thenBodyBBlock.17:
	j       eraseImpl_returnBBlock.4

eraseImpl_afterIfBBlock.17:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.18
	j       eraseImpl_afterIfBBlock.18

eraseImpl_returnBBlock.4:
	j       eraseImpl_returnBBlock.3

eraseImpl_thenBodyBBlock.18:
	j       eraseImpl_returnBBlock.5

eraseImpl_afterIfBBlock.18:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.19
	j       eraseImpl_afterIfBBlock.19

eraseImpl_returnBBlock.5:
	j       eraseImpl_returnBBlock.4

eraseImpl_thenBodyBBlock.19:
	j       eraseImpl_returnBBlock.6

eraseImpl_afterIfBBlock.19:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.20
	j       eraseImpl_afterIfBBlock.20

eraseImpl_returnBBlock.6:
	j       eraseImpl_returnBBlock.5

eraseImpl_thenBodyBBlock.20:
	j       eraseImpl_returnBBlock.7

eraseImpl_afterIfBBlock.20:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.21
	j       eraseImpl_afterIfBBlock.21

eraseImpl_returnBBlock.7:
	j       eraseImpl_returnBBlock.6

eraseImpl_thenBodyBBlock.21:
	j       eraseImpl_returnBBlock.8

eraseImpl_afterIfBBlock.21:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.22
	j       eraseImpl_afterIfBBlock.22

eraseImpl_returnBBlock.8:
	j       eraseImpl_returnBBlock.7

eraseImpl_thenBodyBBlock.22:
	j       eraseImpl_returnBBlock.9

eraseImpl_afterIfBBlock.22:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.23
	j       eraseImpl_afterIfBBlock.23

eraseImpl_returnBBlock.9:
	j       eraseImpl_returnBBlock.8

eraseImpl_thenBodyBBlock.23:
	j       eraseImpl_returnBBlock.10

eraseImpl_afterIfBBlock.23:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.24
	j       eraseImpl_afterIfBBlock.24

eraseImpl_returnBBlock.10:
	j       eraseImpl_returnBBlock.9

eraseImpl_thenBodyBBlock.24:
	j       eraseImpl_returnBBlock.11

eraseImpl_afterIfBBlock.24:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.25
	j       eraseImpl_afterIfBBlock.25

eraseImpl_returnBBlock.11:
	j       eraseImpl_returnBBlock.10

eraseImpl_thenBodyBBlock.25:
	j       eraseImpl_returnBBlock.12

eraseImpl_afterIfBBlock.25:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.26
	j       eraseImpl_afterIfBBlock.26

eraseImpl_returnBBlock.12:
	j       eraseImpl_returnBBlock.11

eraseImpl_thenBodyBBlock.26:
	j       eraseImpl_returnBBlock.13

eraseImpl_afterIfBBlock.26:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.27
	j       eraseImpl_afterIfBBlock.27

eraseImpl_returnBBlock.13:
	j       eraseImpl_returnBBlock.12

eraseImpl_thenBodyBBlock.27:
	j       eraseImpl_returnBBlock.14

eraseImpl_afterIfBBlock.27:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.28
	j       eraseImpl_afterIfBBlock.28

eraseImpl_returnBBlock.14:
	j       eraseImpl_returnBBlock.13

eraseImpl_thenBodyBBlock.28:
	j       eraseImpl_returnBBlock.15

eraseImpl_afterIfBBlock.28:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.29
	j       eraseImpl_afterIfBBlock.29

eraseImpl_returnBBlock.15:
	j       eraseImpl_returnBBlock.14

eraseImpl_thenBodyBBlock.29:
	j       eraseImpl_returnBBlock.16

eraseImpl_afterIfBBlock.29:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.30
	j       eraseImpl_afterIfBBlock.30

eraseImpl_returnBBlock.16:
	j       eraseImpl_returnBBlock.15

eraseImpl_thenBodyBBlock.30:
	j       eraseImpl_returnBBlock.17

eraseImpl_afterIfBBlock.30:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.31
	j       eraseImpl_afterIfBBlock.31

eraseImpl_returnBBlock.17:
	j       eraseImpl_returnBBlock.16

eraseImpl_thenBodyBBlock.31:
	j       eraseImpl_returnBBlock.18

eraseImpl_afterIfBBlock.31:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.32
	j       eraseImpl_afterIfBBlock.32

eraseImpl_returnBBlock.18:
	j       eraseImpl_returnBBlock.17

eraseImpl_thenBodyBBlock.32:
	j       eraseImpl_returnBBlock.19

eraseImpl_afterIfBBlock.32:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.33
	j       eraseImpl_afterIfBBlock.33

eraseImpl_returnBBlock.19:
	j       eraseImpl_returnBBlock.18

eraseImpl_thenBodyBBlock.33:
	j       eraseImpl_returnBBlock.20

eraseImpl_afterIfBBlock.33:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.34
	j       eraseImpl_afterIfBBlock.34

eraseImpl_returnBBlock.20:
	j       eraseImpl_returnBBlock.19

eraseImpl_thenBodyBBlock.34:
	j       eraseImpl_returnBBlock.21

eraseImpl_afterIfBBlock.34:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.35
	j       eraseImpl_afterIfBBlock.35

eraseImpl_returnBBlock.21:
	j       eraseImpl_returnBBlock.20

eraseImpl_thenBodyBBlock.35:
	j       eraseImpl_returnBBlock.22

eraseImpl_afterIfBBlock.35:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.36
	j       eraseImpl_afterIfBBlock.36

eraseImpl_returnBBlock.22:
	j       eraseImpl_returnBBlock.21

eraseImpl_thenBodyBBlock.36:
	j       eraseImpl_returnBBlock.23

eraseImpl_afterIfBBlock.36:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.37
	j       eraseImpl_afterIfBBlock.37

eraseImpl_returnBBlock.23:
	j       eraseImpl_returnBBlock.22

eraseImpl_thenBodyBBlock.37:
	j       eraseImpl_returnBBlock.24

eraseImpl_afterIfBBlock.37:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.38
	j       eraseImpl_afterIfBBlock.38

eraseImpl_returnBBlock.24:
	j       eraseImpl_returnBBlock.23

eraseImpl_thenBodyBBlock.38:
	j       eraseImpl_returnBBlock.25

eraseImpl_afterIfBBlock.38:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.39
	j       eraseImpl_afterIfBBlock.39

eraseImpl_returnBBlock.25:
	j       eraseImpl_returnBBlock.24

eraseImpl_thenBodyBBlock.39:
	j       eraseImpl_returnBBlock.26

eraseImpl_afterIfBBlock.39:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.40
	j       eraseImpl_afterIfBBlock.40

eraseImpl_returnBBlock.26:
	j       eraseImpl_returnBBlock.25

eraseImpl_thenBodyBBlock.40:
	j       eraseImpl_returnBBlock.27

eraseImpl_afterIfBBlock.40:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.41
	j       eraseImpl_afterIfBBlock.41

eraseImpl_returnBBlock.27:
	j       eraseImpl_returnBBlock.26

eraseImpl_thenBodyBBlock.41:
	j       eraseImpl_returnBBlock.28

eraseImpl_afterIfBBlock.41:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.42
	j       eraseImpl_afterIfBBlock.42

eraseImpl_returnBBlock.28:
	j       eraseImpl_returnBBlock.27

eraseImpl_thenBodyBBlock.42:
	j       eraseImpl_returnBBlock.29

eraseImpl_afterIfBBlock.42:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.43
	j       eraseImpl_afterIfBBlock.43

eraseImpl_returnBBlock.29:
	j       eraseImpl_returnBBlock.28

eraseImpl_thenBodyBBlock.43:
	j       eraseImpl_returnBBlock.30

eraseImpl_afterIfBBlock.43:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.44
	j       eraseImpl_afterIfBBlock.44

eraseImpl_returnBBlock.30:
	j       eraseImpl_returnBBlock.29

eraseImpl_thenBodyBBlock.44:
	j       eraseImpl_returnBBlock.31

eraseImpl_afterIfBBlock.44:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.45
	j       eraseImpl_afterIfBBlock.45

eraseImpl_returnBBlock.31:
	j       eraseImpl_returnBBlock.30

eraseImpl_thenBodyBBlock.45:
	j       eraseImpl_returnBBlock.32

eraseImpl_afterIfBBlock.45:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.46
	j       eraseImpl_afterIfBBlock.46

eraseImpl_returnBBlock.32:
	j       eraseImpl_returnBBlock.31

eraseImpl_thenBodyBBlock.46:
	j       eraseImpl_returnBBlock.33

eraseImpl_afterIfBBlock.46:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.47
	j       eraseImpl_afterIfBBlock.47

eraseImpl_returnBBlock.33:
	j       eraseImpl_returnBBlock.32

eraseImpl_thenBodyBBlock.47:
	j       eraseImpl_returnBBlock.34

eraseImpl_afterIfBBlock.47:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.48
	j       eraseImpl_afterIfBBlock.48

eraseImpl_returnBBlock.34:
	j       eraseImpl_returnBBlock.33

eraseImpl_thenBodyBBlock.48:
	j       eraseImpl_returnBBlock.35

eraseImpl_afterIfBBlock.48:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.49
	j       eraseImpl_afterIfBBlock.49

eraseImpl_returnBBlock.35:
	j       eraseImpl_returnBBlock.34

eraseImpl_thenBodyBBlock.49:
	j       eraseImpl_returnBBlock.36

eraseImpl_afterIfBBlock.49:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.50
	j       eraseImpl_afterIfBBlock.50

eraseImpl_returnBBlock.36:
	j       eraseImpl_returnBBlock.35

eraseImpl_thenBodyBBlock.50:
	j       eraseImpl_returnBBlock.37

eraseImpl_afterIfBBlock.50:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.51
	j       eraseImpl_afterIfBBlock.51

eraseImpl_returnBBlock.37:
	j       eraseImpl_returnBBlock.36

eraseImpl_thenBodyBBlock.51:
	j       eraseImpl_returnBBlock.38

eraseImpl_afterIfBBlock.51:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.52
	j       eraseImpl_afterIfBBlock.52

eraseImpl_returnBBlock.38:
	j       eraseImpl_returnBBlock.37

eraseImpl_thenBodyBBlock.52:
	j       eraseImpl_returnBBlock.39

eraseImpl_afterIfBBlock.52:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.53
	j       eraseImpl_afterIfBBlock.53

eraseImpl_returnBBlock.39:
	j       eraseImpl_returnBBlock.38

eraseImpl_thenBodyBBlock.53:
	j       eraseImpl_returnBBlock.40

eraseImpl_afterIfBBlock.53:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.54
	j       eraseImpl_afterIfBBlock.54

eraseImpl_returnBBlock.40:
	j       eraseImpl_returnBBlock.39

eraseImpl_thenBodyBBlock.54:
	j       eraseImpl_returnBBlock.41

eraseImpl_afterIfBBlock.54:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.55
	j       eraseImpl_afterIfBBlock.55

eraseImpl_returnBBlock.41:
	j       eraseImpl_returnBBlock.40

eraseImpl_thenBodyBBlock.55:
	j       eraseImpl_returnBBlock.42

eraseImpl_afterIfBBlock.55:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.56
	j       eraseImpl_afterIfBBlock.56

eraseImpl_returnBBlock.42:
	j       eraseImpl_returnBBlock.41

eraseImpl_thenBodyBBlock.56:
	j       eraseImpl_returnBBlock.43

eraseImpl_afterIfBBlock.56:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.57
	j       eraseImpl_afterIfBBlock.57

eraseImpl_returnBBlock.43:
	j       eraseImpl_returnBBlock.42

eraseImpl_thenBodyBBlock.57:
	j       eraseImpl_returnBBlock.44

eraseImpl_afterIfBBlock.57:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.58
	j       eraseImpl_afterIfBBlock.58

eraseImpl_returnBBlock.44:
	j       eraseImpl_returnBBlock.43

eraseImpl_thenBodyBBlock.58:
	j       eraseImpl_returnBBlock.45

eraseImpl_afterIfBBlock.58:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.59
	j       eraseImpl_afterIfBBlock.59

eraseImpl_returnBBlock.45:
	j       eraseImpl_returnBBlock.44

eraseImpl_thenBodyBBlock.59:
	j       eraseImpl_returnBBlock.46

eraseImpl_afterIfBBlock.59:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.60
	j       eraseImpl_afterIfBBlock.60

eraseImpl_returnBBlock.46:
	j       eraseImpl_returnBBlock.45

eraseImpl_thenBodyBBlock.60:
	j       eraseImpl_returnBBlock.47

eraseImpl_afterIfBBlock.60:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.61
	j       eraseImpl_afterIfBBlock.61

eraseImpl_returnBBlock.47:
	j       eraseImpl_returnBBlock.46

eraseImpl_thenBodyBBlock.61:
	j       eraseImpl_returnBBlock.48

eraseImpl_afterIfBBlock.61:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.62
	j       eraseImpl_afterIfBBlock.62

eraseImpl_returnBBlock.48:
	j       eraseImpl_returnBBlock.47

eraseImpl_thenBodyBBlock.62:
	j       eraseImpl_returnBBlock.49

eraseImpl_afterIfBBlock.62:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.63
	j       eraseImpl_afterIfBBlock.63

eraseImpl_returnBBlock.49:
	j       eraseImpl_returnBBlock.48

eraseImpl_thenBodyBBlock.63:
	j       eraseImpl_returnBBlock.50

eraseImpl_afterIfBBlock.63:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.64
	j       eraseImpl_afterIfBBlock.64

eraseImpl_returnBBlock.50:
	j       eraseImpl_returnBBlock.49

eraseImpl_thenBodyBBlock.64:
	j       eraseImpl_returnBBlock.51

eraseImpl_afterIfBBlock.64:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.65
	j       eraseImpl_afterIfBBlock.65

eraseImpl_returnBBlock.51:
	j       eraseImpl_returnBBlock.50

eraseImpl_thenBodyBBlock.65:
	j       eraseImpl_returnBBlock.52

eraseImpl_afterIfBBlock.65:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.66
	j       eraseImpl_afterIfBBlock.66

eraseImpl_returnBBlock.52:
	j       eraseImpl_returnBBlock.51

eraseImpl_thenBodyBBlock.66:
	j       eraseImpl_returnBBlock.53

eraseImpl_afterIfBBlock.66:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.67
	j       eraseImpl_afterIfBBlock.67

eraseImpl_returnBBlock.53:
	j       eraseImpl_returnBBlock.52

eraseImpl_thenBodyBBlock.67:
	j       eraseImpl_returnBBlock.54

eraseImpl_afterIfBBlock.67:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.68
	j       eraseImpl_afterIfBBlock.68

eraseImpl_returnBBlock.54:
	j       eraseImpl_returnBBlock.53

eraseImpl_thenBodyBBlock.68:
	j       eraseImpl_returnBBlock.55

eraseImpl_afterIfBBlock.68:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.69
	j       eraseImpl_afterIfBBlock.69

eraseImpl_returnBBlock.55:
	j       eraseImpl_returnBBlock.54

eraseImpl_thenBodyBBlock.69:
	j       eraseImpl_returnBBlock.56

eraseImpl_afterIfBBlock.69:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.70
	j       eraseImpl_afterIfBBlock.70

eraseImpl_returnBBlock.56:
	j       eraseImpl_returnBBlock.55

eraseImpl_thenBodyBBlock.70:
	j       eraseImpl_returnBBlock.57

eraseImpl_afterIfBBlock.70:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.71
	j       eraseImpl_afterIfBBlock.71

eraseImpl_returnBBlock.57:
	j       eraseImpl_returnBBlock.56

eraseImpl_thenBodyBBlock.71:
	j       eraseImpl_returnBBlock.58

eraseImpl_afterIfBBlock.71:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.72
	j       eraseImpl_afterIfBBlock.72

eraseImpl_returnBBlock.58:
	j       eraseImpl_returnBBlock.57

eraseImpl_thenBodyBBlock.72:
	j       eraseImpl_returnBBlock.59

eraseImpl_afterIfBBlock.72:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.73
	j       eraseImpl_afterIfBBlock.73

eraseImpl_returnBBlock.59:
	j       eraseImpl_returnBBlock.58

eraseImpl_thenBodyBBlock.73:
	j       eraseImpl_returnBBlock.60

eraseImpl_afterIfBBlock.73:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.74
	j       eraseImpl_afterIfBBlock.74

eraseImpl_returnBBlock.60:
	j       eraseImpl_returnBBlock.59

eraseImpl_thenBodyBBlock.74:
	j       eraseImpl_returnBBlock.61

eraseImpl_afterIfBBlock.74:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,eraseImpl_thenBodyBBlock.75
	j       eraseImpl_afterIfBBlock.75

eraseImpl_returnBBlock.61:
	j       eraseImpl_returnBBlock.60

eraseImpl_thenBodyBBlock.75:
	j       eraseImpl_returnBBlock.62

eraseImpl_afterIfBBlock.75:
	lw      t1,4(a0)
	lw      a0,4(t1)
	call    findLargest
	j       eraseImpl_returnBBlock.62

eraseImpl_returnBBlock.62:
	j       eraseImpl_returnBBlock.61


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
	lw      t1,4(s2)
	lw      a0,0(t1)
	call    printTree
	lw      a0,8(s2)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s1,a0
	lw      a0,12(s2)
	call    __toString
	mv      a1,a0
	mv      a0,s1
	call    __stringAdd
	call    __println
	lw      t1,4(s2)
	lw      a0,4(t1)
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
	lui     t1,%hi(root)
	sw      zero,%lo(root)(t1)
	call    __getInt
	li      t1,0
	mv      s5,t1
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	li      t1,50000
	blt     s5,t1,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	slli    t1,a0,13
	xor     t1,a0,t1
	li      s6,2147483647
	and     s6,t1,s6
	srai    t1,s6,17
	xor     s6,s6,t1
	slli    t1,s6,5
	xor     t1,s6,t1
	li      s6,2147483647
	and     t1,t1,s6
	li      s6,128
	rem     s2,t1,s6
	slli    s6,t1,13
	xor     s6,t1,s6
	li      t1,2147483647
	and     s6,s6,t1
	srai    t1,s6,17
	xor     s6,s6,t1
	slli    t1,s6,5
	xor     t1,s6,t1
	li      s6,2147483647
	and     s1,t1,s6
	li      t1,1717986912
	blt     s1,t1,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_afterForBBlock.0:
	li      t1,0
	mv      s3,t1
	j       main_forCondBBlock.1

main_thenBodyBBlock.0:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	bne     t1,zero,main_thenBodyBBlock.2
	j       main_afterIfBBlock.2

main_elseBodyBBlock.0:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	beq     t1,zero,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_afterIfBBlock.0:
	addi    t1,s5,1
	mv      a0,s1
	mv      s5,t1
	j       main_forCondBBlock.0

main_thenBodyBBlock.1:
	li      t1,1
	j       main_returnBBlock.4

main_afterIfBBlock.1:
	li      t1,2
	j       main_returnBBlock.4

main_returnBBlock.4:
	li      s6,1
	beq     t1,s6,main_thenBodyBBlock.0
	j       main_elseBodyBBlock.0

main_thenBodyBBlock.2:
	lui     t1,%hi(root)
	lw      s3,%lo(root)(t1)
	beq     s3,zero,main_thenBodyBBlock.13
	j       main_afterIfBBlock.13

main_afterIfBBlock.2:
	li      a0,16
	call    __malloc
	mv      s6,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s6)
	sw      s2,8(s6)
	li      t1,1
	sw      t1,12(s6)
	sw      zero,0(s6)
	lw      t1,4(s6)
	sw      zero,0(t1)
	lw      t1,4(s6)
	sw      zero,4(t1)
	lui     t1,%hi(root)
	sw      s6,%lo(root)(t1)
	j       main_returnBBlock.6

main_returnBBlock.6:
	j       main_afterIfBBlock.0

main_thenBodyBBlock.3:
	j       main_returnBBlock.8

main_afterIfBBlock.3:
	lui     t1,%hi(root)
	lw      s6,%lo(root)(t1)
	beq     s6,zero,main_thenBodyBBlock.16
	j       main_afterIfBBlock.16

main_returnBBlock.8:
	j       main_afterIfBBlock.0

main_forCondBBlock.1:
	li      t1,100000
	blt     s3,t1,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    t1,a0,13
	xor     t1,a0,t1
	li      s6,2147483647
	and     t1,t1,s6
	srai    s6,t1,17
	xor     t1,t1,s6
	slli    s6,t1,5
	xor     t1,t1,s6
	li      s6,2147483647
	and     s6,t1,s6
	li      t1,128
	rem     s2,s6,t1
	slli    t1,s6,13
	xor     s6,s6,t1
	li      t1,2147483647
	and     t1,s6,t1
	srai    s6,t1,17
	xor     t1,t1,s6
	slli    s6,t1,5
	xor     t1,t1,s6
	li      s6,2147483647
	and     s4,t1,s6
	li      t1,429496728
	blt     s4,t1,main_thenBodyBBlock.5
	j       main_afterIfBBlock.5

main_afterForBBlock.1:
	li      s6,0
	j       main_forCondBBlock.2

main_thenBodyBBlock.4:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	bne     t1,zero,main_thenBodyBBlock.6
	j       main_afterIfBBlock.6

main_elseBodyBBlock.1:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	beq     t1,zero,main_thenBodyBBlock.7
	j       main_afterIfBBlock.7

main_afterIfBBlock.4:
	addi    t1,s3,1
	mv      a0,s4
	mv      s3,t1
	j       main_forCondBBlock.1

main_thenBodyBBlock.5:
	li      t1,1
	j       main_returnBBlock.11

main_afterIfBBlock.5:
	li      t1,2
	j       main_returnBBlock.11

main_returnBBlock.11:
	li      s6,1
	beq     t1,s6,main_thenBodyBBlock.4
	j       main_elseBodyBBlock.1

main_thenBodyBBlock.6:
	lui     t1,%hi(root)
	lw      s1,%lo(root)(t1)
	beq     s1,zero,main_thenBodyBBlock.32
	j       main_afterIfBBlock.32

main_afterIfBBlock.6:
	li      a0,16
	call    __malloc
	mv      s6,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s6)
	sw      s2,8(s6)
	li      t1,1
	sw      t1,12(s6)
	sw      zero,0(s6)
	lw      t1,4(s6)
	sw      zero,0(t1)
	lw      t1,4(s6)
	sw      zero,4(t1)
	lui     t1,%hi(root)
	sw      s6,%lo(root)(t1)
	j       main_returnBBlock.13

main_returnBBlock.13:
	j       main_afterIfBBlock.4

main_thenBodyBBlock.7:
	j       main_returnBBlock.15

main_afterIfBBlock.7:
	lui     t1,%hi(root)
	lw      s6,%lo(root)(t1)
	beq     s6,zero,main_thenBodyBBlock.35
	j       main_afterIfBBlock.35

main_returnBBlock.15:
	j       main_afterIfBBlock.4

main_forCondBBlock.2:
	li      t1,50000
	blt     s6,t1,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	slli    t1,a0,13
	xor     t1,a0,t1
	li      s2,2147483647
	and     t1,t1,s2
	srai    s2,t1,17
	xor     t1,t1,s2
	slli    s2,t1,5
	xor     s2,t1,s2
	li      t1,2147483647
	and     s2,s2,t1
	li      t1,128
	rem     s1,s2,t1
	slli    t1,s2,13
	xor     s2,s2,t1
	li      t1,2147483647
	and     s2,s2,t1
	srai    t1,s2,17
	xor     s2,s2,t1
	slli    t1,s2,5
	xor     s2,s2,t1
	li      t1,2147483647
	and     s2,s2,t1
	li      t1,858993456
	blt     s2,t1,main_thenBodyBBlock.9
	j       main_afterIfBBlock.9

main_afterForBBlock.2:
	lui     t1,%hi(root)
	lw      s2,%lo(root)(t1)
	beq     s2,zero,main_thenBodyBBlock.12
	j       main_afterIfBBlock.12

main_thenBodyBBlock.8:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	bne     t1,zero,main_thenBodyBBlock.10
	j       main_afterIfBBlock.10

main_elseBodyBBlock.2:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	beq     t1,zero,main_thenBodyBBlock.11
	j       main_afterIfBBlock.11

main_afterIfBBlock.8:
	addi    s6,s6,1
	mv      a0,s2
	j       main_forCondBBlock.2

main_thenBodyBBlock.9:
	li      t1,1
	j       main_returnBBlock.18

main_afterIfBBlock.9:
	li      t1,2
	j       main_returnBBlock.18

main_returnBBlock.18:
	li      a3,1
	beq     t1,a3,main_thenBodyBBlock.8
	j       main_elseBodyBBlock.2

main_thenBodyBBlock.10:
	lui     t1,%hi(root)
	lw      a1,%lo(root)(t1)
	beq     a1,zero,main_thenBodyBBlock.53
	j       main_afterIfBBlock.53

main_afterIfBBlock.10:
	li      a0,16
	call    __malloc
	mv      s3,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s3)
	sw      s1,8(s3)
	li      t1,1
	sw      t1,12(s3)
	sw      zero,0(s3)
	lw      t1,4(s3)
	sw      zero,0(t1)
	lw      t1,4(s3)
	sw      zero,4(t1)
	lui     t1,%hi(root)
	sw      s3,%lo(root)(t1)
	j       main_returnBBlock.20

main_returnBBlock.20:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.11:
	j       main_returnBBlock.22

main_afterIfBBlock.11:
	lui     t1,%hi(root)
	lw      a0,%lo(root)(t1)
	mv      a1,zero
	li      a2,-1
	mv      a3,s1
	call    eraseImpl
	j       main_returnBBlock.22

main_returnBBlock.22:
	j       main_afterIfBBlock.8

main_thenBodyBBlock.12:
	j       main_returnBBlock.23

main_afterIfBBlock.12:
	lw      t1,4(s2)
	lw      s6,0(t1)
	beq     s6,zero,main_thenBodyBBlock.51
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
	mv      s6,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s6)
	sw      s2,8(s6)
	li      t1,1
	sw      t1,12(s6)
	sw      zero,0(s6)
	lw      t1,4(s6)
	sw      zero,0(t1)
	lw      t1,4(s6)
	sw      zero,4(t1)
	lw      t1,4(zero)
	sw      s6,-4(t1)
	j       main_returnBBlock.24

main_afterIfBBlock.13:
	lw      t1,8(s3)
	beq     t1,s2,main_thenBodyBBlock.14
	j       main_afterIfBBlock.14

main_thenBodyBBlock.14:
	lw      t1,12(s3)
	addi    t1,t1,1
	sw      t1,12(s3)
	j       main_returnBBlock.24

main_afterIfBBlock.14:
	lw      t1,8(s3)
	blt     t1,s2,main_thenBodyBBlock.15
	j       main_criticalEdge.0

main_thenBodyBBlock.15:
	li      t1,1
	mv      s4,t1
	j       main_afterIfBBlock.15

main_afterIfBBlock.15:
	lw      t1,4(s3)
	slli    s6,s4,2
	add     t1,t1,s6
	lw      a1,0(t1)
	beq     a1,zero,main_thenBodyBBlock.56
	j       main_afterIfBBlock.56

main_returnBBlock.24:
	j       main_returnBBlock.6

main_thenBodyBBlock.16:
	j       main_returnBBlock.25

main_afterIfBBlock.16:
	lw      t1,8(s6)
	bgt     t1,s2,main_thenBodyBBlock.17
	j       main_afterIfBBlock.17

main_thenBodyBBlock.17:
	lw      t1,4(s6)
	lw      a0,0(t1)
	mv      a1,s6
	li      a2,0
	mv      a3,s2
	call    eraseImpl
	j       main_returnBBlock.25

main_afterIfBBlock.17:
	lw      t1,8(s6)
	blt     t1,s2,main_thenBodyBBlock.18
	j       main_afterIfBBlock.18

main_thenBodyBBlock.18:
	lw      t1,4(s6)
	lw      a0,4(t1)
	mv      a1,s6
	li      a2,1
	mv      a3,s2
	call    eraseImpl
	j       main_returnBBlock.25

main_afterIfBBlock.18:
	lw      t1,12(s6)
	addi    t1,t1,-1
	sw      t1,12(s6)
	lw      a3,12(s6)
	li      t1,0
	bgt     a3,t1,main_thenBodyBBlock.19
	j       main_afterIfBBlock.19

main_thenBodyBBlock.19:
	j       main_returnBBlock.25

main_afterIfBBlock.19:
	lw      t1,4(s6)
	lw      t1,0(t1)
	beq     t1,zero,main_thenBodyBBlock.20
	j       main_afterIfBBlock.20

main_thenBodyBBlock.20:
	bne     zero,zero,main_thenBodyBBlock.21
	j       main_afterIfBBlock.21

main_afterIfBBlock.20:
	lw      t1,4(s6)
	lw      a0,0(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,main_thenBodyBBlock.30
	j       main_afterIfBBlock.30

main_thenBodyBBlock.21:
	lw      a3,4(zero)
	lw      t1,4(s6)
	lw      t1,4(t1)
	sw      t1,-4(a3)
	j       main_afterIfBBlock.21

main_afterIfBBlock.21:
	lw      t1,4(s6)
	lw      t1,4(t1)
	bne     t1,zero,main_thenBodyBBlock.22
	j       main_afterIfBBlock.22

main_thenBodyBBlock.22:
	lw      t1,4(s6)
	lw      t1,4(t1)
	sw      zero,0(t1)
	j       main_afterIfBBlock.22

main_afterIfBBlock.22:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	lw      t1,8(t1)
	beq     s2,t1,main_thenBodyBBlock.23
	j       main_afterIfBBlock.23

main_thenBodyBBlock.23:
	lw      t1,4(s6)
	lw      s6,4(t1)
	lui     t1,%hi(root)
	sw      s6,%lo(root)(t1)
	j       main_afterIfBBlock.23

main_afterIfBBlock.23:
	j       main_returnBBlock.25

main_thenBodyBBlock.24:
	lui     t1,%hi(root)
	sw      a0,%lo(root)(t1)
	j       main_afterIfBBlock.24

main_afterIfBBlock.24:
	lw      s2,8(a0)
	lw      t1,4(s6)
	lw      t1,0(t1)
	lw      t1,8(t1)
	bne     s2,t1,main_thenBodyBBlock.25
	j       main_afterIfBBlock.25

main_thenBodyBBlock.25:
	lw      t1,0(a0)
	lw      s2,4(t1)
	lw      t1,4(a0)
	lw      t1,0(t1)
	sw      t1,4(s2)
	lw      t1,4(a0)
	lw      t1,0(t1)
	bne     t1,zero,main_thenBodyBBlock.26
	j       main_afterIfBBlock.26

main_afterIfBBlock.25:
	bne     zero,zero,main_thenBodyBBlock.27
	j       main_afterIfBBlock.27

main_thenBodyBBlock.26:
	lw      t1,4(a0)
	lw      t1,0(t1)
	lw      s2,0(a0)
	sw      s2,0(t1)
	j       main_afterIfBBlock.26

main_afterIfBBlock.26:
	j       main_afterIfBBlock.25

main_thenBodyBBlock.27:
	lw      t1,4(zero)
	sw      a0,-4(t1)
	j       main_afterIfBBlock.27

main_afterIfBBlock.27:
	sw      zero,0(a0)
	lw      t1,4(a0)
	lw      s2,4(s6)
	lw      s2,4(s2)
	sw      s2,4(t1)
	lw      t1,4(s6)
	lw      t1,4(t1)
	bne     t1,zero,main_thenBodyBBlock.28
	j       main_afterIfBBlock.28

main_thenBodyBBlock.28:
	lw      t1,4(s6)
	lw      t1,4(t1)
	sw      a0,0(t1)
	j       main_afterIfBBlock.28

main_afterIfBBlock.28:
	lw      s2,8(a0)
	lw      t1,4(s6)
	lw      t1,0(t1)
	lw      t1,8(t1)
	bne     s2,t1,main_thenBodyBBlock.29
	j       main_afterIfBBlock.29

main_thenBodyBBlock.29:
	lw      s2,4(a0)
	lw      t1,4(s6)
	lw      t1,0(t1)
	sw      t1,0(s2)
	lw      t1,4(s6)
	lw      t1,0(t1)
	sw      a0,0(t1)
	j       main_afterIfBBlock.29

main_afterIfBBlock.29:
	j       main_returnBBlock.25

main_returnBBlock.25:
	j       main_returnBBlock.8

main_thenBodyBBlock.30:
	j       main_returnBBlock.26

main_afterIfBBlock.30:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,main_thenBodyBBlock.31
	j       main_afterIfBBlock.31

main_returnBBlock.26:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	lw      t1,8(t1)
	beq     s2,t1,main_thenBodyBBlock.24
	j       main_afterIfBBlock.24

main_thenBodyBBlock.31:
	j       main_returnBBlock.27

main_afterIfBBlock.31:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,main_thenBodyBBlock.59
	j       main_afterIfBBlock.59

main_returnBBlock.27:
	j       main_returnBBlock.26

main_thenBodyBBlock.32:
	li      a0,16
	call    __malloc
	mv      s6,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s6)
	sw      s2,8(s6)
	li      t1,1
	sw      t1,12(s6)
	sw      zero,0(s6)
	lw      t1,4(s6)
	sw      zero,0(t1)
	lw      t1,4(s6)
	sw      zero,4(t1)
	lw      t1,4(zero)
	sw      s6,-4(t1)
	j       main_returnBBlock.28

main_afterIfBBlock.32:
	lw      t1,8(s1)
	beq     t1,s2,main_thenBodyBBlock.33
	j       main_afterIfBBlock.33

main_thenBodyBBlock.33:
	lw      t1,12(s1)
	addi    t1,t1,1
	sw      t1,12(s1)
	j       main_returnBBlock.28

main_afterIfBBlock.33:
	lw      t1,8(s1)
	blt     t1,s2,main_thenBodyBBlock.34
	j       main_criticalEdge.1

main_thenBodyBBlock.34:
	li      t1,1
	mv      s6,t1
	j       main_afterIfBBlock.34

main_afterIfBBlock.34:
	lw      a3,4(s1)
	slli    t1,s6,2
	add     t1,a3,t1
	lw      a1,0(t1)
	beq     a1,zero,main_thenBodyBBlock.60
	j       main_afterIfBBlock.60

main_returnBBlock.28:
	j       main_returnBBlock.13

main_thenBodyBBlock.35:
	j       main_returnBBlock.29

main_afterIfBBlock.35:
	lw      t1,8(s6)
	bgt     t1,s2,main_thenBodyBBlock.36
	j       main_afterIfBBlock.36

main_thenBodyBBlock.36:
	lw      t1,4(s6)
	lw      a0,0(t1)
	mv      a1,s6
	li      a2,0
	mv      a3,s2
	call    eraseImpl
	j       main_returnBBlock.29

main_afterIfBBlock.36:
	lw      t1,8(s6)
	blt     t1,s2,main_thenBodyBBlock.37
	j       main_afterIfBBlock.37

main_thenBodyBBlock.37:
	lw      t1,4(s6)
	lw      a0,4(t1)
	mv      a1,s6
	li      a2,1
	mv      a3,s2
	call    eraseImpl
	j       main_returnBBlock.29

main_afterIfBBlock.37:
	lw      t1,12(s6)
	addi    t1,t1,-1
	sw      t1,12(s6)
	lw      a3,12(s6)
	li      t1,0
	bgt     a3,t1,main_thenBodyBBlock.38
	j       main_afterIfBBlock.38

main_thenBodyBBlock.38:
	j       main_returnBBlock.29

main_afterIfBBlock.38:
	lw      t1,4(s6)
	lw      t1,0(t1)
	beq     t1,zero,main_thenBodyBBlock.39
	j       main_afterIfBBlock.39

main_thenBodyBBlock.39:
	bne     zero,zero,main_thenBodyBBlock.40
	j       main_afterIfBBlock.40

main_afterIfBBlock.39:
	lw      t1,4(s6)
	lw      a0,0(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,main_thenBodyBBlock.49
	j       main_afterIfBBlock.49

main_thenBodyBBlock.40:
	lw      t1,4(zero)
	lw      a3,4(s6)
	lw      a3,4(a3)
	sw      a3,-4(t1)
	j       main_afterIfBBlock.40

main_afterIfBBlock.40:
	lw      t1,4(s6)
	lw      t1,4(t1)
	bne     t1,zero,main_thenBodyBBlock.41
	j       main_afterIfBBlock.41

main_thenBodyBBlock.41:
	lw      t1,4(s6)
	lw      t1,4(t1)
	sw      zero,0(t1)
	j       main_afterIfBBlock.41

main_afterIfBBlock.41:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	lw      t1,8(t1)
	beq     s2,t1,main_thenBodyBBlock.42
	j       main_afterIfBBlock.42

main_thenBodyBBlock.42:
	lw      t1,4(s6)
	lw      s6,4(t1)
	lui     t1,%hi(root)
	sw      s6,%lo(root)(t1)
	j       main_afterIfBBlock.42

main_afterIfBBlock.42:
	j       main_returnBBlock.29

main_thenBodyBBlock.43:
	lui     t1,%hi(root)
	sw      a0,%lo(root)(t1)
	j       main_afterIfBBlock.43

main_afterIfBBlock.43:
	lw      s2,8(a0)
	lw      t1,4(s6)
	lw      t1,0(t1)
	lw      t1,8(t1)
	bne     s2,t1,main_thenBodyBBlock.44
	j       main_afterIfBBlock.44

main_thenBodyBBlock.44:
	lw      t1,0(a0)
	lw      s2,4(t1)
	lw      t1,4(a0)
	lw      t1,0(t1)
	sw      t1,4(s2)
	lw      t1,4(a0)
	lw      t1,0(t1)
	bne     t1,zero,main_thenBodyBBlock.45
	j       main_afterIfBBlock.45

main_afterIfBBlock.44:
	bne     zero,zero,main_thenBodyBBlock.46
	j       main_afterIfBBlock.46

main_thenBodyBBlock.45:
	lw      t1,4(a0)
	lw      t1,0(t1)
	lw      s2,0(a0)
	sw      s2,0(t1)
	j       main_afterIfBBlock.45

main_afterIfBBlock.45:
	j       main_afterIfBBlock.44

main_thenBodyBBlock.46:
	lw      t1,4(zero)
	sw      a0,-4(t1)
	j       main_afterIfBBlock.46

main_afterIfBBlock.46:
	sw      zero,0(a0)
	lw      s2,4(a0)
	lw      t1,4(s6)
	lw      t1,4(t1)
	sw      t1,4(s2)
	lw      t1,4(s6)
	lw      t1,4(t1)
	bne     t1,zero,main_thenBodyBBlock.47
	j       main_afterIfBBlock.47

main_thenBodyBBlock.47:
	lw      t1,4(s6)
	lw      t1,4(t1)
	sw      a0,0(t1)
	j       main_afterIfBBlock.47

main_afterIfBBlock.47:
	lw      s2,8(a0)
	lw      t1,4(s6)
	lw      t1,0(t1)
	lw      t1,8(t1)
	bne     s2,t1,main_thenBodyBBlock.48
	j       main_afterIfBBlock.48

main_thenBodyBBlock.48:
	lw      s2,4(a0)
	lw      t1,4(s6)
	lw      t1,0(t1)
	sw      t1,0(s2)
	lw      t1,4(s6)
	lw      t1,0(t1)
	sw      a0,0(t1)
	j       main_afterIfBBlock.48

main_afterIfBBlock.48:
	j       main_returnBBlock.29

main_returnBBlock.29:
	j       main_returnBBlock.15

main_thenBodyBBlock.49:
	j       main_returnBBlock.30

main_afterIfBBlock.49:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,main_thenBodyBBlock.50
	j       main_afterIfBBlock.50

main_returnBBlock.30:
	lui     t1,%hi(root)
	lw      t1,%lo(root)(t1)
	lw      t1,8(t1)
	beq     s2,t1,main_thenBodyBBlock.43
	j       main_afterIfBBlock.43

main_thenBodyBBlock.50:
	j       main_returnBBlock.31

main_afterIfBBlock.50:
	lw      t1,4(a0)
	lw      a0,4(t1)
	lw      t1,4(a0)
	lw      t1,4(t1)
	beq     t1,zero,main_thenBodyBBlock.63
	j       main_afterIfBBlock.63

main_returnBBlock.31:
	j       main_returnBBlock.30

main_thenBodyBBlock.51:
	j       main_returnBBlock.32

main_afterIfBBlock.51:
	lw      t1,4(s6)
	lw      s1,0(t1)
	beq     s1,zero,main_thenBodyBBlock.64
	j       main_afterIfBBlock.64

main_returnBBlock.32:
	lw      a0,8(s2)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s6,a0
	lw      a0,12(s2)
	call    __toString
	mv      a1,a0
	mv      a0,s6
	call    __stringAdd
	call    __println
	lw      t1,4(s2)
	lw      s6,4(t1)
	beq     s6,zero,main_thenBodyBBlock.52
	j       main_afterIfBBlock.52

main_thenBodyBBlock.52:
	j       main_returnBBlock.33

main_afterIfBBlock.52:
	lw      t1,4(s6)
	lw      a0,0(t1)
	call    printTree
	lw      a0,8(s6)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s2,a0
	lw      a0,12(s6)
	call    __toString
	mv      a1,a0
	mv      a0,s2
	call    __stringAdd
	call    __println
	lw      t1,4(s6)
	lw      a0,4(t1)
	call    printTree
	j       main_returnBBlock.33

main_returnBBlock.33:
	j       main_returnBBlock.23

main_thenBodyBBlock.53:
	li      a0,16
	call    __malloc
	mv      s3,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s3)
	sw      s1,8(s3)
	li      t1,1
	sw      t1,12(s3)
	sw      zero,0(s3)
	lw      t1,4(s3)
	sw      zero,0(t1)
	lw      t1,4(s3)
	sw      zero,4(t1)
	lw      t1,4(zero)
	sw      s3,-4(t1)
	j       main_returnBBlock.34

main_afterIfBBlock.53:
	lw      t1,8(a1)
	beq     t1,s1,main_thenBodyBBlock.54
	j       main_afterIfBBlock.54

main_thenBodyBBlock.54:
	lw      t1,12(a1)
	addi    t1,t1,1
	sw      t1,12(a1)
	j       main_returnBBlock.34

main_afterIfBBlock.54:
	lw      t1,8(a1)
	blt     t1,s1,main_thenBodyBBlock.55
	j       main_criticalEdge.2

main_thenBodyBBlock.55:
	li      a2,1
	j       main_afterIfBBlock.55

main_afterIfBBlock.55:
	lw      t1,4(a1)
	slli    a3,a2,2
	add     t1,t1,a3
	lw      a0,0(t1)
	mv      a3,s1
	call    insertImpl
	j       main_returnBBlock.34

main_returnBBlock.34:
	j       main_returnBBlock.20

main_thenBodyBBlock.56:
	li      a0,16
	call    __malloc
	mv      s6,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s6)
	sw      s2,8(s6)
	li      t1,1
	sw      t1,12(s6)
	sw      s3,0(s6)
	lw      t1,4(s6)
	sw      zero,0(t1)
	lw      t1,4(s6)
	sw      zero,4(t1)
	lw      t1,4(s3)
	slli    s2,s4,2
	add     t1,t1,s2
	sw      s6,0(t1)
	j       main_returnBBlock.35

main_afterIfBBlock.56:
	lw      t1,8(a1)
	beq     t1,s2,main_thenBodyBBlock.57
	j       main_afterIfBBlock.57

main_thenBodyBBlock.57:
	lw      t1,12(a1)
	addi    t1,t1,1
	sw      t1,12(a1)
	j       main_returnBBlock.35

main_afterIfBBlock.57:
	lw      t1,8(a1)
	blt     t1,s2,main_thenBodyBBlock.58
	j       main_criticalEdge.3

main_thenBodyBBlock.58:
	li      a2,1
	j       main_afterIfBBlock.58

main_afterIfBBlock.58:
	lw      s6,4(a1)
	slli    t1,a2,2
	add     t1,s6,t1
	lw      a0,0(t1)
	mv      a3,s2
	call    insertImpl
	j       main_returnBBlock.35

main_returnBBlock.35:
	j       main_returnBBlock.24

main_thenBodyBBlock.59:
	j       main_returnBBlock.36

main_afterIfBBlock.59:
	lw      t1,4(a0)
	lw      a0,4(t1)
	call    findLargest
	j       main_returnBBlock.36

main_returnBBlock.36:
	j       main_returnBBlock.27

main_thenBodyBBlock.60:
	li      a0,16
	call    __malloc
	mv      s5,a0
	li      a0,20
	call    __malloc
	li      t1,2
	sw      t1,0(a0)
	addi    t1,a0,4
	sw      t1,4(s5)
	sw      s2,8(s5)
	li      t1,1
	sw      t1,12(s5)
	sw      s1,0(s5)
	lw      t1,4(s5)
	sw      zero,0(t1)
	lw      t1,4(s5)
	sw      zero,4(t1)
	lw      s2,4(s1)
	slli    t1,s6,2
	add     t1,s2,t1
	sw      s5,0(t1)
	j       main_returnBBlock.37

main_afterIfBBlock.60:
	lw      t1,8(a1)
	beq     t1,s2,main_thenBodyBBlock.61
	j       main_afterIfBBlock.61

main_thenBodyBBlock.61:
	lw      t1,12(a1)
	addi    t1,t1,1
	sw      t1,12(a1)
	j       main_returnBBlock.37

main_afterIfBBlock.61:
	lw      t1,8(a1)
	blt     t1,s2,main_thenBodyBBlock.62
	j       main_criticalEdge.4

main_thenBodyBBlock.62:
	li      a2,1
	j       main_afterIfBBlock.62

main_afterIfBBlock.62:
	lw      t1,4(a1)
	slli    s6,a2,2
	add     t1,t1,s6
	lw      a0,0(t1)
	mv      a3,s2
	call    insertImpl
	j       main_returnBBlock.37

main_returnBBlock.37:
	j       main_returnBBlock.28

main_thenBodyBBlock.63:
	j       main_returnBBlock.38

main_afterIfBBlock.63:
	lw      t1,4(a0)
	lw      a0,4(t1)
	call    findLargest
	j       main_returnBBlock.38

main_returnBBlock.38:
	j       main_returnBBlock.31

main_thenBodyBBlock.64:
	j       main_returnBBlock.39

main_afterIfBBlock.64:
	lw      t1,4(s1)
	lw      a0,0(t1)
	call    printTree
	lw      a0,8(s1)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s3,a0
	lw      a0,12(s1)
	call    __toString
	mv      a1,a0
	mv      a0,s3
	call    __stringAdd
	call    __println
	lw      t1,4(s1)
	lw      a0,4(t1)
	call    printTree
	j       main_returnBBlock.39

main_returnBBlock.39:
	lw      a0,8(s6)
	call    __toString
    la      a1,.str.0
	call    __stringAdd
	mv      s1,a0
	lw      a0,12(s6)
	call    __toString
	mv      a1,a0
	mv      a0,s1
	call    __stringAdd
	call    __println
	lw      t1,4(s6)
	lw      a0,4(t1)
	call    printTree
	j       main_returnBBlock.32

main_criticalEdge.0:
	li      t1,0
	mv      s4,t1
	j       main_afterIfBBlock.15

main_criticalEdge.1:
	li      t1,0
	mv      s6,t1
	j       main_afterIfBBlock.34

main_criticalEdge.2:
	li      a2,0
	j       main_afterIfBBlock.55

main_criticalEdge.3:
	li      a2,0
	j       main_afterIfBBlock.58

main_criticalEdge.4:
	li      a2,0
	j       main_afterIfBBlock.62


