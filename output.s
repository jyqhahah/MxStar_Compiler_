	.text

	.globl  main
	.p2align	2
	.type   main, @function
main:
	mv      ra_0,ra
	mv      calleeSaved_1,s0
	mv      calleeSaved_2,s1
	mv      calleeSaved_3,s2
	mv      calleeSaved_4,s3
	mv      calleeSaved_5,s4
	mv      calleeSaved_6,s5
	mv      calleeSaved_7,s6
	mv      calleeSaved_8,s7
	mv      calleeSaved_9,s8
	mv      calleeSaved_10,s9
	mv      calleeSaved_11,s10
	mv      calleeSaved_12,s11
	call    __init__
	li      tmp_13,5
	sw      tmp_13,0(a$.0_14)
	lw      c.0_15,0(c$.0_16)
	lw      a.0_17,0(a$.0_14)
	addi    suffixIncr.0_18,a.0_17,1
	sw      suffixIncr.0_18,0(a$.0_14)
	sw      a.0_17,0(c$.0_16)
	lw      b.0_19,0(b$.0_20)
	lw      c.1_21,0(c$.0_16)
	sw      c.1_21,0(b$.0_20)
	lw      b.1_22,0(b$.0_20)
	lw      c.2_23,0(c$.0_16)
	add     add.0_24,b.1_22,c.2_23
	lw      a.1_25,0(a$.0_14)
	add     add.1_26,add.0_24,a.1_25
	sw      add.1_26,0(returnValue$.0_27)
	j       main_returnBBlock.0

main_returnBBlock.0:
	lw      returnValue.0_28,0(returnValue$.0_27)
	mv      a0,returnValue.0_28
	mv      s11,calleeSaved_12
	mv      s10,calleeSaved_11
	mv      s9,calleeSaved_10
	mv      s8,calleeSaved_9
	mv      s7,calleeSaved_8
	mv      s6,calleeSaved_7
	mv      s5,calleeSaved_6
	mv      s4,calleeSaved_5
	mv      s3,calleeSaved_4
	mv      s2,calleeSaved_3
	mv      s1,calleeSaved_2
	mv      s0,calleeSaved_1
	mv      ra,ra_0
	jr      ra


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	mv      ra_0,ra
	mv      calleeSaved_1,s0
	mv      calleeSaved_2,s1
	mv      calleeSaved_3,s2
	mv      calleeSaved_4,s3
	mv      calleeSaved_5,s4
	mv      calleeSaved_6,s5
	mv      calleeSaved_7,s6
	mv      calleeSaved_8,s7
	mv      calleeSaved_9,s8
	mv      calleeSaved_10,s9
	mv      calleeSaved_11,s10
	mv      calleeSaved_12,s11
	j       __init___returnBBlock.0

__init___returnBBlock.0:
	mv      s11,calleeSaved_12
	mv      s10,calleeSaved_11
	mv      s9,calleeSaved_10
	mv      s8,calleeSaved_9
	mv      s7,calleeSaved_8
	mv      s6,calleeSaved_7
	mv      s5,calleeSaved_6
	mv      s4,calleeSaved_5
	mv      s3,calleeSaved_4
	mv      s2,calleeSaved_3
	mv      s1,calleeSaved_2
	mv      s0,calleeSaved_1
	mv      ra,ra_0
	jr      ra


