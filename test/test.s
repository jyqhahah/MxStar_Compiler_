	.data

	.globl  .str.0
.str.0:
	.asciz  " "

	.globl  .str.1
.str.1:
	.asciz  ""


	.text

	.globl  bubble_sort
	.p2align	2
	.type   bubble_sort, @function
bubble_sort:
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
	mv      a.0_13,a0
	sw      a.0_13,0(a$.0_14)
	lw      a.1_15,0(a$.0_14)
	lw      size.0_16,-4(a.1_15)
	sw      size.0_16,0(n$.0_17)
	lw      i.0_18,0(i$.0_19)
	li      tmp_20,0
	sw      tmp_20,0(i$.0_19)
	j       bubble_sort_forCondBBlock.0

bubble_sort_forCondBBlock.0:
	lw      i.1_21,0(i$.0_19)
	lw      n.0_22,0(n$.0_17)
	addi    sub.0_23,n.0_22,-1
	blt     i.1_21,sub.0_23,bubble_sort_forBodyBBlock.0
	j       bubble_sort_afterForBBlock.0

bubble_sort_forBodyBBlock.0:
	lw      j.0_24,0(j$.0_25)
	li      tmp_26,0
	sw      tmp_26,0(j$.0_25)
	j       bubble_sort_forCondBBlock.1

bubble_sort_forStepBBlock.0:
	lw      i.3_27,0(i$.0_19)
	addi    prefixIncr.1_28,i.3_27,1
	sw      prefixIncr.1_28,0(i$.0_19)
	j       bubble_sort_forCondBBlock.0

bubble_sort_afterForBBlock.0:
	j       bubble_sort_returnBBlock.0

bubble_sort_forCondBBlock.1:
	lw      j.1_29,0(j$.0_25)
	lw      n.1_30,0(n$.0_17)
	lw      i.2_31,0(i$.0_19)
	sub     sub.1_32,n.1_30,i.2_31
	addi    sub.2_33,sub.1_32,-1
	blt     j.1_29,sub.2_33,bubble_sort_forBodyBBlock.1
	j       bubble_sort_afterForBBlock.1

bubble_sort_forBodyBBlock.1:
	j       bubble_sort_ifCondBBlock.0

bubble_sort_forStepBBlock.1:
	lw      j.8_34,0(j$.0_25)
	addi    prefixIncr.0_35,j.8_34,1
	sw      prefixIncr.0_35,0(j$.0_25)
	j       bubble_sort_forCondBBlock.1

bubble_sort_afterForBBlock.1:
	j       bubble_sort_forStepBBlock.0

bubble_sort_ifCondBBlock.0:
	lw      a.2_36,0(a$.0_14)
	lw      j.2_37,0(j$.0_25)
	slli    tmp_38,j.2_37,2
	add     element$.0_39,a.2_36,tmp_38
	lw      element.0_40,0(element$.0_39)
	lw      a.3_41,0(a$.0_14)
	lw      j.3_42,0(j$.0_25)
	addi    add.0_43,j.3_42,1
	slli    tmp_44,add.0_43,2
	add     element$.1_45,a.3_41,tmp_44
	lw      element.1_46,0(element$.1_45)
	blt     element.0_40,element.1_46,bubble_sort_thenBodyBBlock.0
	j       bubble_sort_afterIfBBlock.0

bubble_sort_thenBodyBBlock.0:
	j       bubble_sort_forCondBBlock.1

bubble_sort_afterIfBBlock.0:
	lw      a.4_47,0(a$.0_14)
	lw      j.4_48,0(j$.0_25)
	slli    tmp_49,j.4_48,2
	add     element$.2_50,a.4_47,tmp_49
	lw      element.2_51,0(element$.2_50)
	sw      element.2_51,0(t$.0_52)
	lw      a.5_53,0(a$.0_14)
	lw      j.5_54,0(j$.0_25)
	slli    tmp_55,j.5_54,2
	add     element$.3_56,a.5_53,tmp_55
	lw      element.3_57,0(element$.3_56)
	lw      a.6_58,0(a$.0_14)
	lw      j.6_59,0(j$.0_25)
	addi    add.1_60,j.6_59,1
	slli    tmp_61,add.1_60,2
	add     element$.4_62,a.6_58,tmp_61
	lw      element.4_63,0(element$.4_62)
	sw      element.4_63,0(element$.3_56)
	lw      a.7_64,0(a$.0_14)
	lw      j.7_65,0(j$.0_25)
	addi    add.2_66,j.7_65,1
	slli    tmp_67,add.2_66,2
	add     element$.5_68,a.7_64,tmp_67
	lw      element.5_69,0(element$.5_68)
	lw      t.0_70,0(t$.0_52)
	sw      t.0_70,0(element$.5_68)
	j       bubble_sort_forStepBBlock.1

bubble_sort_returnBBlock.0:
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
	call    __getInt
	mv      call.0_13,a0
	sw      call.0_13,0(n$.0_14)
	lw      n.0_15,0(n$.0_14)
	li      tmp_17,4
	mul     mul.0_16,tmp_17,n.0_15
	addi    add.0_18,mul.0_16,4
	mv      a0,add.0_18
	call    __malloc
	mv      malloc8.0_19,a0
	mv      malloc32.0_20,malloc8.0_19
	sw      n.0_15,0(malloc32.0_20)
	addi    arrayHead32.0_21,malloc32.0_20,4
	sw      arrayHead32.0_21,0(a$.0_22)
	lw      i.0_23,0(i$.0_24)
	li      tmp_25,0
	sw      tmp_25,0(i$.0_24)
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	lw      i.1_26,0(i$.0_24)
	lw      n.1_27,0(n$.0_14)
	blt     i.1_26,n.1_27,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	lw      a.0_28,0(a$.0_22)
	lw      i.2_29,0(i$.0_24)
	slli    tmp_30,i.2_29,2
	add     element$.0_31,a.0_28,tmp_30
	lw      element.0_32,0(element$.0_31)
	call    __getInt
	mv      call.1_33,a0
	sw      call.1_33,0(element$.0_31)
	j       main_forStepBBlock.0

main_forStepBBlock.0:
	lw      i.3_34,0(i$.0_24)
	addi    prefixIncr.0_35,i.3_34,1
	sw      prefixIncr.0_35,0(i$.0_24)
	j       main_forCondBBlock.0

main_afterForBBlock.0:
	lw      a.1_36,0(a$.0_22)
	mv      a0,a.1_36
	call    bubble_sort
	lw      i.4_37,0(i$.0_24)
	li      tmp_38,0
	sw      tmp_38,0(i$.0_24)
	j       main_forCondBBlock.1

main_forCondBBlock.1:
	lw      i.5_39,0(i$.0_24)
	lw      n.2_40,0(n$.0_14)
	blt     i.5_39,n.2_40,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	lw      a.2_41,0(a$.0_22)
	lw      i.6_42,0(i$.0_24)
	slli    tmp_43,i.6_42,2
	add     element$.1_44,a.2_41,tmp_43
	lw      element.1_45,0(element$.1_44)
	mv      a0,element.1_45
	call    __toString
	mv      call.2_46,a0
	lui     tmp_47,%hi(.str.0)
	addi    __stringLiteral.0_48,tmp_47,%lo(.str.0)
	mv      a0,call.2_46
	mv      a1,__stringLiteral.0_48
	call    __stringAdd
	mv      add.1_49,a0
	mv      a0,add.1_49
	call    __print
	j       main_forStepBBlock.1

main_forStepBBlock.1:
	lw      i.7_50,0(i$.0_24)
	addi    prefixIncr.1_51,i.7_50,1
	sw      prefixIncr.1_51,0(i$.0_24)
	j       main_forCondBBlock.1

main_afterForBBlock.1:
	lui     tmp_52,%hi(.str.1)
	addi    __stringLiteral.1_53,tmp_52,%lo(.str.1)
	mv      a0,__stringLiteral.1_53
	call    __println
	li      tmp_54,0
	sw      tmp_54,0(returnValue$.0_55)
	j       main_returnBBlock.0

main_returnBBlock.0:
	lw      returnValue.0_56,0(returnValue$.0_55)
	mv      a0,returnValue.0_56
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


