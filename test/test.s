	.data

	.globl  .str.0
.str.0:
	.asciz  "toInt: "

	.globl  .str.1
.str.1:
	.asciz  "substr: "

	.globl  .str.2
.str.2:
	.asciz  " "

	.globl  .str.3
.str.3:
	.asciz  ""

	.globl  .str.4
.str.4:
	.asciz  "BY Kipsora"

	.globl  reed
	.p2align	2
reed:
	.word   12883127

	.globl  n
	.p2align	2
n:
	.word   0


	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
	mv      a2,s5
	call    __getInt
	lui     a2,%hi(n)
	sw      a0,%lo(n)(a2)
    la      a0,.str.4
	call    __println
	li      a0,4
	call    __malloc
	mv      s10,a0
	lui     a2,%hi(n)
	lw      s9,%lo(n)(a2)
	li      a2,4
	mul     a2,a2,s9
	addi    a0,a2,4
	call    __malloc
	sw      s9,0(a0)
	addi    a2,a0,4
	sw      a2,0(s10)
	li      s6,0
	li      s0,0
	li      s9,0
	li      s1,0
	j       main_forCondBBlock.1

main_creatorCondBBlock.0:
	bne     s0,s1,main_creatorBodyBBlock.0
	j       main_afterCreatorBBlock.0

main_creatorBodyBBlock.0:
	li      a0,16
	call    __malloc
	li      a2,3
	sw      a2,0(a0)
	addi    a2,a0,4
	sw      a2,0(s0)
	addi    s0,s0,4
	j       main_creatorCondBBlock.0

main_afterCreatorBBlock.0:
	sw      s9,0(s5)
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	j       main_forCondBBlock.0

main_forCondBBlock.1:
	lui     a2,%hi(n)
	lw      a2,%lo(n)(a2)
	blt     s6,a2,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	lw      a2,0(s10)
	slli    t0,s0,2
	add     s0,a2,t0
	mul     a2,s6,s6
	add     a2,s6,a2
	addi    a2,a2,3
	ori    s11,a2,13
	li      a2,4
	mul     a2,a2,s11
	addi    a0,a2,4
	call    __malloc
	sw      s11,0(a0)
	addi    a2,a0,4
	sw      a2,0(s0)
	li      s0,0
	j       main_forCondBBlock.2

main_afterForBBlock.1:
	li      s7,0
	li      s11,0
	li      s0,0
	li      s2,0
	li      s6,0
	li      s4,0
	li      s1,0
	li      a2,0
	li      s9,0
	li      t0,0
	j       main_forCondBBlock.3

main_forCondBBlock.2:
	mul     a2,s6,s6
	add     a2,s6,a2
	addi    a2,a2,2
	ori    a2,a2,13
	blt     s0,a2,main_forBodyBBlock.2
	j       main_afterForBBlock.2

main_forBodyBBlock.2:
	lw      a2,0(s10)
	slli    t0,s6,2
	add     a2,a2,t0
	lw      a2,0(a2)
	slli    t0,s0,2
	add     s1,a2,t0
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	slli    a2,a2,5
	add     a2,t0,a2
	li      t0,1727317
	add     a2,a2,t0
	lui     t0,%hi(reed)
	sw      a2,%lo(reed)(t0)
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	li      a2,1772371
	rem     t0,t0,a2
	li      a2,1000
	blt     t0,a2,main_thenBodyBBlock.1
	j       main_afterIfBBlock.1

main_afterForBBlock.2:
	addi    s6,s6,1
	j       main_forCondBBlock.1

main_thenBodyBBlock.1:
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	li      s9,818277
	add     a2,a2,s9
	xor     s9,t0,a2
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	li      t0,18217
	sub     a2,a2,t0
	or      t0,s9,a2
	lui     a2,%hi(reed)
	sw      t0,%lo(reed)(a2)
	j       main_afterIfBBlock.1

main_afterIfBBlock.1:
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	li      t0,-268435457
	and     s9,a2,t0
	mv      a0,s9
	call    __toString
	sw      a0,0(s1)
	addi    s0,s0,1
	li      s1,1073741824
	j       main_forCondBBlock.2

main_forCondBBlock.3:
	lui     ra,%hi(n)
	lw      ra,%lo(n)(ra)
	blt     s7,ra,main_forBodyBBlock.3
	j       main_afterForBBlock.3

main_forBodyBBlock.3:
	li      s11,0
	j       main_forCondBBlock.4

main_afterForBBlock.3:
	li      a0,16
	call    __malloc
	li      a2,3
	sw      a2,0(a0)
	addi    s9,a0,4
	addi    s1,s9,12
	mv      s0,s9
	j       main_creatorCondBBlock.0

main_forCondBBlock.4:
	mul     ra,s7,s7
	sub     a5,s11,ra
	addi    ra,s7,3
	blt     a5,ra,main_forBodyBBlock.4
	j       main_afterForBBlock.4

main_forBodyBBlock.4:
	lw      t0,0(s10)
	slli    a2,s7,2
	add     a2,t0,a2
	lw      a2,0(a2)
	slli    t0,s11,2
	add     a2,a2,t0
	lw      a0,0(a2)
	call    __println
    la      s9,.str.0
	lw      a2,0(s10)
	slli    t0,s7,2
	add     a2,a2,t0
	lw      a2,0(a2)
	slli    t0,s11,2
	add     a2,a2,t0
	lw      a0,0(a2)
	call    __stringParseInt
	call    __toString
	mv      a1,a0
	mv      a0,s9
	call    __stringAdd
	call    __println
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	slli    a2,a2,5
	add     t0,t0,a2
	li      a2,1727317
	add     t0,t0,a2
	lui     a2,%hi(reed)
	sw      t0,%lo(reed)(a2)
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	li      a2,1772371
	rem     a2,t0,a2
	li      t0,1000
	blt     a2,t0,main_thenBodyBBlock.3
	j       main_afterIfBBlock.3

main_afterForBBlock.4:
	addi    s7,s7,1
	j       main_forCondBBlock.3

main_thenBodyBBlock.2:
	mv      s2,s6
	mv      s6,s0
	mv      s1,s0
	j       main_afterIfBBlock.2

main_afterIfBBlock.2:
    la      s0,.str.1
	lw      t0,0(s10)
	slli    a2,s7,2
	add     a2,t0,a2
	lw      t0,0(a2)
	slli    a2,s11,2
	add     a2,t0,a2
	lw      a0,0(a2)
	mv      a1,s2
	mv      a2,s6
	call    __stringSubstring
	mv      a1,a0
	mv      a0,s0
	call    __stringAdd
	call    __println
	li      s0,0
	j       main_forCondBBlock.5

main_forCondBBlock.5:
	addi    s3,s0,1
	lw      a2,0(s10)
	slli    t0,s7,2
	add     a2,a2,t0
	lw      a2,0(a2)
	slli    t0,s11,2
	add     a2,a2,t0
	lw      a0,0(a2)
	call    __stringLength
	addi    a2,a0,1
	blt     s3,a2,main_forBodyBBlock.5
	j       main_afterForBBlock.5

main_forBodyBBlock.5:
	lw      a2,0(s10)
	slli    t0,s7,2
	add     a2,a2,t0
	lw      a2,0(a2)
	slli    t0,s11,2
	add     a2,a2,t0
	lw      a0,0(a2)
	mv      a1,s0
	call    __stringOrd
	call    __toString
    la      a1,.str.2
	call    __stringAdd
	call    __print
	addi    s0,s0,2
	j       main_forCondBBlock.5

main_afterForBBlock.5:
    la      a0,.str.3
	call    __println
	addi    s11,s11,1
	li      a2,1073741824
	li      t0,1073741824
	j       main_forCondBBlock.4

main_thenBodyBBlock.3:
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	lui     t0,%hi(reed)
	lw      s9,%lo(reed)(t0)
	li      t0,818277
	add     t0,s9,t0
	xor     s9,a2,t0
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	li      t0,18217
	sub     a2,a2,t0
	or      a2,s9,a2
	lui     t0,%hi(reed)
	sw      a2,%lo(reed)(t0)
	j       main_afterIfBBlock.3

main_afterIfBBlock.3:
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	li      a2,-268435457
	and     s4,t0,a2
	lw      a2,0(s10)
	slli    t0,s7,2
	add     a2,a2,t0
	lw      t0,0(a2)
	slli    a2,s11,2
	add     a2,t0,a2
	lw      a0,0(a2)
	call    __stringLength
	rem     s0,s4,a0
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	lui     t0,%hi(reed)
	lw      t0,%lo(reed)(t0)
	slli    t0,t0,5
	add     a2,a2,t0
	li      t0,1727317
	add     a2,a2,t0
	lui     t0,%hi(reed)
	sw      a2,%lo(reed)(t0)
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	li      a2,1772371
	rem     t0,t0,a2
	li      a2,1000
	blt     t0,a2,main_thenBodyBBlock.4
	j       main_afterIfBBlock.4

main_thenBodyBBlock.4:
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	lui     a2,%hi(reed)
	lw      a2,%lo(reed)(a2)
	li      s9,818277
	add     a2,a2,s9
	xor     s9,t0,a2
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	li      a2,18217
	sub     a2,t0,a2
	or      a2,s9,a2
	lui     t0,%hi(reed)
	sw      a2,%lo(reed)(t0)
	j       main_afterIfBBlock.4

main_afterIfBBlock.4:
	lui     a2,%hi(reed)
	lw      t0,%lo(reed)(a2)
	li      a2,-268435457
	and     s9,t0,a2
	lw      a2,0(s10)
	slli    t0,s7,2
	add     a2,a2,t0
	lw      t0,0(a2)
	slli    a2,s11,2
	add     a2,t0,a2
	lw      a0,0(a2)
	call    __stringLength
	rem     s6,s9,a0
	bgt     s0,s6,main_thenBodyBBlock.2
	j       main_criticalEdge.0

main_criticalEdge.0:
	mv      s2,s0
	j       main_afterIfBBlock.2


