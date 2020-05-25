	.text
	.file	"builtin.c"
	.globl	__toString              # -- Begin function __toString
	.p2align	2
	.type	__toString,@function
__toString:                             # @__toString
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sw	ra, 76(sp)
	sw	s0, 72(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 80
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	zero, -16(s0)
	sw	zero, -20(s0)
	lw	a0, -12(s0)
	bnez	a0, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	lw	a0, -20(s0)
	addi	a1, a0, 1
	sw	a1, -20(s0)
	slli	a0, a0, 2
	addi	a1, s0, -64
	add	a0, a1, a0
	sw	zero, 0(a0)
	j	.LBB0_2
.LBB0_2:
	lw	a0, -12(s0)
	addi	a1, zero, -1
	blt	a1, a0, .LBB0_4
	j	.LBB0_3
.LBB0_3:
	addi	a0, zero, 1
	sw	a0, -16(s0)
	lw	a0, -12(s0)
	neg	a0, a0
	sw	a0, -12(s0)
	j	.LBB0_4
.LBB0_4:
	j	.LBB0_5
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -12(s0)
	addi	a1, zero, 1
	blt	a0, a1, .LBB0_8
	j	.LBB0_6
.LBB0_6:                                #   in Loop: Header=BB0_5 Depth=1
	lw	a0, -12(s0)
	lui	a1, 419430
	addi	a1, a1, 1639
	mulh	a1, a0, a1
	srli	a2, a1, 31
	srai	a1, a1, 2
	add	a1, a1, a2
	addi	a2, zero, 10
	mul	a1, a1, a2
	sub	a0, a0, a1
	lw	a1, -20(s0)
	addi	a2, a1, 1
	sw	a2, -20(s0)
	slli	a1, a1, 2
	addi	a2, s0, -64
	add	a1, a2, a1
	sw	a0, 0(a1)
	j	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_5 Depth=1
	lw	a0, -12(s0)
	lui	a1, 419430
	addi	a1, a1, 1639
	mulh	a0, a0, a1
	srli	a1, a0, 31
	srai	a0, a0, 2
	add	a0, a0, a1
	sw	a0, -12(s0)
	j	.LBB0_5
.LBB0_8:
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	add	a0, a0, a1
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	sw	a0, -72(s0)
	sw	zero, -76(s0)
	lw	a0, -16(s0)
	beqz	a0, .LBB0_10
	j	.LBB0_9
.LBB0_9:
	lw	a0, -72(s0)
	lw	a1, -76(s0)
	addi	a2, a1, 1
	sw	a2, -76(s0)
	add	a0, a0, a1
	addi	a1, zero, 45
	sb	a1, 0(a0)
	j	.LBB0_10
.LBB0_10:
	j	.LBB0_11
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
	addi	a1, zero, 1
	blt	a0, a1, .LBB0_13
	j	.LBB0_12
.LBB0_12:                               #   in Loop: Header=BB0_11 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, -1
	sw	a0, -20(s0)
	slli	a0, a0, 2
	addi	a1, s0, -64
	add	a0, a1, a0
	lw	a0, 0(a0)
	addi	a0, a0, 48
	lw	a1, -72(s0)
	lw	a2, -76(s0)
	addi	a3, a2, 1
	sw	a3, -76(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB0_11
.LBB0_13:
	lw	a0, -72(s0)
	lw	a1, -76(s0)
	addi	a2, a1, 1
	sw	a2, -76(s0)
	add	a0, a0, a1
	sb	zero, 0(a0)
	lw	a0, -72(s0)
	lw	s0, 72(sp)
	.cfi_def_cfa sp, 80
	lw	ra, 76(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 80
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	__toString, .Lfunc_end0-__toString
	.cfi_endproc
                                        # -- End function
	.globl	__malloc                # -- Begin function __malloc
	.p2align	2
	.type	__malloc,@function
__malloc:                               # @__malloc
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	srai	a1, a0, 31
	call	malloc
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end1:
	.size	__malloc, .Lfunc_end1-__malloc
	.cfi_endproc
                                        # -- End function
	.globl	__getString             # -- Begin function __getString
	.p2align	2
	.type	__getString,@function
__getString:                            # @__getString
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	addi	a0, zero, 512
	mv	a1, zero
	call	malloc
	sw	a0, -16(s0)
	lw	a1, -16(s0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	__isoc99_scanf
	lw	a0, -16(s0)
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end2:
	.size	__getString, .Lfunc_end2-__getString
	.cfi_endproc
                                        # -- End function
	.globl	__getInt                # -- Begin function __getInt
	.p2align	2
	.type	__getInt,@function
__getInt:                               # @__getInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	addi	a1, s0, -12
	call	__isoc99_scanf
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end3:
	.size	__getInt, .Lfunc_end3-__getInt
	.cfi_endproc
                                        # -- End function
	.globl	__print                 # -- Begin function __print
	.p2align	2
	.type	__print,@function
__print:                                # @__print
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	lw	a1, -16(s0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end4:
	.size	__print, .Lfunc_end4-__print
	.cfi_endproc
                                        # -- End function
	.globl	__println               # -- Begin function __println
	.p2align	2
	.type	__println,@function
__println:                              # @__println
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	lw	a1, -16(s0)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end5:
	.size	__println, .Lfunc_end5-__println
	.cfi_endproc
                                        # -- End function
	.globl	__printInt              # -- Begin function __printInt
	.p2align	2
	.type	__printInt,@function
__printInt:                             # @__printInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end6:
	.size	__printInt, .Lfunc_end6-__printInt
	.cfi_endproc
                                        # -- End function
	.globl	__printlnInt            # -- Begin function __printlnInt
	.p2align	2
	.type	__printlnInt,@function
__printlnInt:                           # @__printlnInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	lw	s0, 8(sp)
	.cfi_def_cfa sp, 16
	lw	ra, 12(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end7:
	.size	__printlnInt, .Lfunc_end7-__printlnInt
	.cfi_endproc
                                        # -- End function
	.globl	__stringParseInt        # -- Begin function __stringParseInt
	.p2align	2
	.type	__stringParseInt,@function
__stringParseInt:                       # @__stringParseInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	addi	a2, s0, -20
	call	__isoc99_sscanf
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end8:
	.size	__stringParseInt, .Lfunc_end8-__stringParseInt
	.cfi_endproc
                                        # -- End function
	.globl	__stringLength          # -- Begin function __stringLength
	.p2align	2
	.type	__stringLength,@function
__stringLength:                         # @__stringLength
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	zero, -20(s0)
	j	.LBB9_1
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB9_3
	j	.LBB9_2
.LBB9_2:                                #   in Loop: Header=BB9_1 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB9_1
.LBB9_3:
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end9:
	.size	__stringLength, .Lfunc_end9-__stringLength
	.cfi_endproc
                                        # -- End function
	.globl	__stringOrd             # -- Begin function __stringOrd
	.p2align	2
	.type	__stringOrd,@function
__stringOrd:                            # @__stringOrd
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end10:
	.size	__stringOrd, .Lfunc_end10-__stringOrd
	.cfi_endproc
                                        # -- End function
	.globl	__stringSubstring       # -- Begin function __stringSubstring
	.p2align	2
	.type	__stringSubstring,@function
__stringSubstring:                      # @__stringSubstring
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	sw	a2, -24(s0)
	lw	a0, -24(s0)
	lw	a1, -20(s0)
	sub	a0, a0, a1
	sw	a0, -28(s0)
	sw	zero, -32(s0)
	lw	a0, -28(s0)
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	sw	a0, -40(s0)
	sw	zero, -32(s0)
	j	.LBB11_1
.LBB11_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB11_4
	j	.LBB11_2
.LBB11_2:                               #   in Loop: Header=BB11_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, -32(s0)
	lw	a2, -20(s0)
	add	a2, a1, a2
	add	a0, a0, a2
	lb	a0, 0(a0)
	lw	a2, -40(s0)
	add	a1, a2, a1
	sb	a0, 0(a1)
	j	.LBB11_3
.LBB11_3:                               #   in Loop: Header=BB11_1 Depth=1
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB11_1
.LBB11_4:
	lw	a0, -40(s0)
	lw	a1, -28(s0)
	add	a0, a0, a1
	sb	zero, 0(a0)
	lw	a0, -40(s0)
	lw	s0, 40(sp)
	.cfi_def_cfa sp, 48
	lw	ra, 44(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end11:
	.size	__stringSubstring, .Lfunc_end11-__stringSubstring
	.cfi_endproc
                                        # -- End function
	.globl	__stringAdd             # -- Begin function __stringAdd
	.p2align	2
	.type	__stringAdd,@function
__stringAdd:                            # @__stringAdd
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	sw	zero, -28(s0)
	j	.LBB12_1
.LBB12_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a1, -28(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB12_4
	j	.LBB12_2
.LBB12_2:                               #   in Loop: Header=BB12_1 Depth=1
	j	.LBB12_3
.LBB12_3:                               #   in Loop: Header=BB12_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB12_1
.LBB12_4:
	sw	zero, -32(s0)
	j	.LBB12_5
.LBB12_5:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lw	a1, -32(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB12_8
	j	.LBB12_6
.LBB12_6:                               #   in Loop: Header=BB12_5 Depth=1
	j	.LBB12_7
.LBB12_7:                               #   in Loop: Header=BB12_5 Depth=1
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB12_5
.LBB12_8:
	lw	a0, -28(s0)
	lw	a1, -32(s0)
	add	a0, a0, a1
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	sw	a0, -40(s0)
	sw	zero, -44(s0)
	j	.LBB12_9
.LBB12_9:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -44(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB12_12
	j	.LBB12_10
.LBB12_10:                              #   in Loop: Header=BB12_9 Depth=1
	lw	a0, -16(s0)
	lw	a1, -44(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	lw	a2, -40(s0)
	add	a1, a2, a1
	sb	a0, 0(a1)
	j	.LBB12_11
.LBB12_11:                              #   in Loop: Header=BB12_9 Depth=1
	lw	a0, -44(s0)
	addi	a0, a0, 1
	sw	a0, -44(s0)
	j	.LBB12_9
.LBB12_12:
	sw	zero, -48(s0)
	j	.LBB12_13
.LBB12_13:                              # =>This Inner Loop Header: Depth=1
	lw	a0, -48(s0)
	lw	a1, -32(s0)
	bge	a0, a1, .LBB12_16
	j	.LBB12_14
.LBB12_14:                              #   in Loop: Header=BB12_13 Depth=1
	lw	a0, -24(s0)
	lw	a1, -48(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	lw	a2, -40(s0)
	lw	a3, -28(s0)
	add	a1, a1, a3
	add	a1, a2, a1
	sb	a0, 0(a1)
	j	.LBB12_15
.LBB12_15:                              #   in Loop: Header=BB12_13 Depth=1
	lw	a0, -48(s0)
	addi	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB12_13
.LBB12_16:
	lw	a0, -40(s0)
	lw	a1, -28(s0)
	lw	a2, -32(s0)
	add	a1, a1, a2
	add	a0, a0, a1
	sb	zero, 0(a0)
	lw	a0, -40(s0)
	lw	s0, 40(sp)
	.cfi_def_cfa sp, 48
	lw	ra, 44(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end12:
	.size	__stringAdd, .Lfunc_end12-__stringAdd
	.cfi_endproc
                                        # -- End function
	.globl	__stringEqual           # -- Begin function __stringEqual
	.p2align	2
	.type	__stringEqual,@function
__stringEqual:                          # @__stringEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	seqz	a0, a0
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end13:
	.size	__stringEqual, .Lfunc_end13-__stringEqual
	.cfi_endproc
                                        # -- End function
	.globl	__stringNotEqual        # -- Begin function __stringNotEqual
	.p2align	2
	.type	__stringNotEqual,@function
__stringNotEqual:                       # @__stringNotEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	snez	a0, a0
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end14:
	.size	__stringNotEqual, .Lfunc_end14-__stringNotEqual
	.cfi_endproc
                                        # -- End function
	.globl	__stringLess            # -- Begin function __stringLess
	.p2align	2
	.type	__stringLess,@function
__stringLess:                           # @__stringLess
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	srli	a0, a0, 31
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end15:
	.size	__stringLess, .Lfunc_end15-__stringLess
	.cfi_endproc
                                        # -- End function
	.globl	__stringLessEqual       # -- Begin function __stringLessEqual
	.p2align	2
	.type	__stringLessEqual,@function
__stringLessEqual:                      # @__stringLessEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	slti	a0, a0, 1
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end16:
	.size	__stringLessEqual, .Lfunc_end16-__stringLessEqual
	.cfi_endproc
                                        # -- End function
	.globl	__stringGreater         # -- Begin function __stringGreater
	.p2align	2
	.type	__stringGreater,@function
__stringGreater:                        # @__stringGreater
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	sgtz	a0, a0
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end17:
	.size	__stringGreater, .Lfunc_end17-__stringGreater
	.cfi_endproc
                                        # -- End function
	.globl	__stringGreaterEqual    # -- Begin function __stringGreaterEqual
	.p2align	2
	.type	__stringGreaterEqual,@function
__stringGreaterEqual:                   # @__stringGreaterEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -24(s0)
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	call	strcmp
	not	a0, a0
	srli	a0, a0, 31
	lw	s0, 24(sp)
	.cfi_def_cfa sp, 32
	lw	ra, 28(sp)
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end18:
	.size	__stringGreaterEqual, .Lfunc_end18-__stringGreaterEqual
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%d"
	.size	.L.str.1, 3

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%s\n"
	.size	.L.str.2, 4

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
