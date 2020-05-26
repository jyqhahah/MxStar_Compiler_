	.data

	.globl  .str.0
.str.0:
	.asciz  "-1"

	.globl  .str.1
.str.1:
	.asciz  " "

	.globl  .str.2
.str.2:
	.asciz  ""

	.globl  n
	.p2align	2
n:
	.word   0

	.globl  m
	.p2align	2
m:
	.word   0

	.globl  g
	.p2align	2
g:
	.word   0

	.globl  INF
	.p2align	2
INF:
	.word   10000000


	.text

	.globl  EdgeList.init
	.p2align	2
	.type   EdgeList.init, @function
EdgeList.init:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	sw      s2,0(sp)
	mv      s1,a0
	mv      s0,a1
	mv      s2,a2
	li      a4,8
	mul     a4,a4,s2
	addi    a0,a4,4
	call    __malloc
	sw      s2,0(a0)
	addi    a4,a0,4
	sw      a4,0(s1)
	li      a4,4
	mul     a4,a4,s2
	addi    a0,a4,4
	call    __malloc
	sw      s2,0(a0)
	addi    a4,a0,4
	sw      a4,4(s1)
	li      a4,4
	mul     a4,a4,s0
	addi    a0,a4,4
	call    __malloc
	sw      s0,0(a0)
	addi    a4,a0,4
	sw      a4,8(s1)
	li      a4,0
	j       EdgeList.init_forCondBBlock.0

EdgeList.init_forCondBBlock.0:
	blt     a4,s2,EdgeList.init_forBodyBBlock.0
	j       EdgeList.init_afterForBBlock.0

EdgeList.init_forBodyBBlock.0:
	lw      a3,4(s1)
	slli    a1,a4,2
	add     a1,a3,a1
	li      a3,0
	addi    a3,a3,-1
	sw      a3,0(a1)
	addi    a4,a4,1
	j       EdgeList.init_forCondBBlock.0

EdgeList.init_afterForBBlock.0:
	li      a4,0
	j       EdgeList.init_forCondBBlock.1

EdgeList.init_forCondBBlock.1:
	blt     a4,s0,EdgeList.init_forBodyBBlock.1
	j       EdgeList.init_afterForBBlock.1

EdgeList.init_forBodyBBlock.1:
	lw      a3,8(s1)
	slli    a1,a4,2
	add     a3,a3,a1
	li      a1,0
	addi    a1,a1,-1
	sw      a1,0(a3)
	addi    a4,a4,1
	j       EdgeList.init_forCondBBlock.1

EdgeList.init_afterForBBlock.1:
	li      a4,0
	sw      a4,12(s1)
	lw      s2,0(sp)
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  EdgeList.addEdge
	.p2align	2
	.type   EdgeList.addEdge, @function
EdgeList.addEdge:
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	mv      s3,s4
	mv      s4,a0
	mv      s2,a1
	mv      s0,a2
	mv      s1,a3
	li      a0,12
	call    __malloc
	sw      s2,0(a0)
	sw      s0,4(a0)
	sw      s1,8(a0)
	lw      a4,0(s4)
	lw      a1,12(s4)
	slli    a1,a1,2
	add     a4,a4,a1
	sw      a0,0(a4)
	lw      a4,4(s4)
	lw      a1,12(s4)
	slli    a1,a1,2
	add     a1,a4,a1
	lw      a3,8(s4)
	slli    a4,s2,2
	add     a4,a3,a4
	lw      a4,0(a4)
	sw      a4,0(a1)
	lw      a1,8(s4)
	slli    a4,s2,2
	add     a1,a1,a4
	lw      a4,12(s4)
	sw      a4,0(a1)
	lw      a4,12(s4)
	addi    a4,a4,1
	sw      a4,12(s4)
	mv      s4,s3
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra


	.globl  EdgeList.nVertices
	.p2align	2
	.type   EdgeList.nVertices, @function
EdgeList.nVertices:
	lw      a4,8(a0)
	lw      a0,-4(a4)
	jr      ra


	.globl  EdgeList.nEdges
	.p2align	2
	.type   EdgeList.nEdges, @function
EdgeList.nEdges:
	lw      a4,0(a0)
	lw      a0,-4(a4)
	jr      ra


	.globl  Array_Node.Array_Node
	.p2align	2
	.type   Array_Node.Array_Node, @function
Array_Node.Array_Node:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	mv      s0,s1
	mv      s1,a0
	li      a4,0
	sw      a4,4(s1)
	li      a4,8
	li      a1,16
	mul     a4,a4,a1
	addi    a0,a4,4
	call    __malloc
	li      a4,16
	sw      a4,0(a0)
	addi    a4,a0,4
	sw      a4,0(s1)
	mv      s1,s0
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  Array_Node.push_back
	.p2align	2
	.type   Array_Node.push_back, @function
Array_Node.push_back:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	mv      s0,s2
	mv      s1,a0
	mv      s2,a1
	mv      a0,s1
	call    Array_Node.size
	lw      a4,0(s1)
	lw      a4,-4(a4)
	beq     a0,a4,Array_Node.push_back_thenBodyBBlock.0
	j       Array_Node.push_back_afterIfBBlock.0

Array_Node.push_back_thenBodyBBlock.0:
	mv      a0,s1
	call    Array_Node.doubleStorage
	j       Array_Node.push_back_afterIfBBlock.0

Array_Node.push_back_afterIfBBlock.0:
	lw      a4,0(s1)
	lw      a1,4(s1)
	slli    a1,a1,2
	add     a4,a4,a1
	sw      s2,0(a4)
	lw      a4,4(s1)
	addi    a4,a4,1
	sw      a4,4(s1)
	mv      s2,s0
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  Array_Node.pop_back
	.p2align	2
	.type   Array_Node.pop_back, @function
Array_Node.pop_back:
	lw      a4,4(a0)
	addi    a4,a4,-1
	sw      a4,4(a0)
	lw      a4,0(a0)
	lw      a1,4(a0)
	slli    a1,a1,2
	add     a4,a4,a1
	lw      a0,0(a4)
	jr      ra


	.globl  Array_Node.back
	.p2align	2
	.type   Array_Node.back, @function
Array_Node.back:
	lw      a4,0(a0)
	lw      a1,4(a0)
	addi    a1,a1,-1
	slli    a1,a1,2
	add     a4,a4,a1
	lw      a0,0(a4)
	jr      ra


	.globl  Array_Node.front
	.p2align	2
	.type   Array_Node.front, @function
Array_Node.front:
	lw      a4,0(a0)
	lw      a0,0(a4)
	jr      ra


	.globl  Array_Node.size
	.p2align	2
	.type   Array_Node.size, @function
Array_Node.size:
	lw      a0,4(a0)
	jr      ra


	.globl  Array_Node.resize
	.p2align	2
	.type   Array_Node.resize, @function
Array_Node.resize:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	mv      s0,s2
	mv      s1,a0
	mv      s2,a1
	j       Array_Node.resize_whileCondBBlock.0

Array_Node.resize_whileCondBBlock.0:
	lw      a4,0(s1)
	lw      a4,-4(a4)
	blt     a4,s2,Array_Node.resize_whileBodyBBlock.0
	j       Array_Node.resize_afterWhileBBlock.0

Array_Node.resize_whileBodyBBlock.0:
	mv      a0,s1
	call    Array_Node.doubleStorage
	j       Array_Node.resize_whileCondBBlock.0

Array_Node.resize_afterWhileBBlock.0:
	sw      s2,4(s1)
	mv      s2,s0
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  Array_Node.get
	.p2align	2
	.type   Array_Node.get, @function
Array_Node.get:
	lw      a4,0(a0)
	slli    a1,a1,2
	add     a4,a4,a1
	lw      a0,0(a4)
	jr      ra


	.globl  Array_Node.set
	.p2align	2
	.type   Array_Node.set, @function
Array_Node.set:
	lw      a4,0(a0)
	slli    a1,a1,2
	add     a4,a4,a1
	sw      a2,0(a4)
	jr      ra


	.globl  Array_Node.swap
	.p2align	2
	.type   Array_Node.swap, @function
Array_Node.swap:
	lw      a3,0(a0)
	slli    a4,a1,2
	add     a4,a3,a4
	lw      a3,0(a4)
	lw      a7,0(a0)
	slli    a4,a1,2
	add     a7,a7,a4
	lw      a4,0(a0)
	slli    a1,a2,2
	add     a4,a4,a1
	lw      a4,0(a4)
	sw      a4,0(a7)
	lw      a4,0(a0)
	slli    a1,a2,2
	add     a4,a4,a1
	sw      a3,0(a4)
	jr      ra


	.globl  Array_Node.doubleStorage
	.p2align	2
	.type   Array_Node.doubleStorage, @function
Array_Node.doubleStorage:
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	mv      s3,s4
	mv      s0,a0
	lw      s1,0(s0)
	lw      s4,4(s0)
	mv      a4,s1
	lw      a1,-4(a4)
	li      a4,2
	mul     s2,a1,a4
	li      a4,8
	mul     a4,a4,s2
	addi    a0,a4,4
	call    __malloc
	sw      s2,0(a0)
	addi    a4,a0,4
	sw      a4,0(s0)
	li      a4,0
	sw      a4,4(s0)
	j       Array_Node.doubleStorage_forCondBBlock.0

Array_Node.doubleStorage_forCondBBlock.0:
	lw      a4,4(s0)
	bne     a4,s4,Array_Node.doubleStorage_forBodyBBlock.0
	j       Array_Node.doubleStorage_afterForBBlock.0

Array_Node.doubleStorage_forBodyBBlock.0:
	lw      a1,0(s0)
	lw      a4,4(s0)
	slli    a4,a4,2
	add     a1,a1,a4
	lw      a4,4(s0)
	slli    a4,a4,2
	add     a4,s1,a4
	lw      a4,0(a4)
	sw      a4,0(a1)
	lw      a4,4(s0)
	addi    a4,a4,1
	sw      a4,4(s0)
	j       Array_Node.doubleStorage_forCondBBlock.0

Array_Node.doubleStorage_afterForBBlock.0:
	mv      s4,s3
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra


	.globl  Heap_Node.Heap_Node
	.p2align	2
	.type   Heap_Node.Heap_Node, @function
Heap_Node.Heap_Node:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	mv      s0,s2
	mv      s2,a0
	li      a0,8
	call    __malloc
	mv      s1,a0
	mv      a0,s1
	call    Array_Node.Array_Node
	sw      s1,0(s2)
	mv      s2,s0
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  Heap_Node.push
	.p2align	2
	.type   Heap_Node.push, @function
Heap_Node.push:
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	mv      s3,s4
	mv      s4,a0
	lw      a0,0(s4)
	call    Array_Node.push_back
	mv      a0,s4
	call    Heap_Node.size
	addi    a4,a0,-1
	mv      s1,a4
	li      a4,0
	j       Heap_Node.push_whileCondBBlock.0

Heap_Node.push_whileCondBBlock.0:
	li      a1,0
	bgt     s1,a1,Heap_Node.push_whileBodyBBlock.0
	j       Heap_Node.push_criticalEdge.0

Heap_Node.push_whileBodyBBlock.0:
	mv      a0,s4
	mv      a1,s1
	call    Heap_Node.pnt
	mv      s0,a0
	lw      a0,0(s4)
	mv      a1,s0
	call    Array_Node.get
	call    Node.key_
	mv      s2,a0
	lw      a0,0(s4)
	mv      a1,s1
	call    Array_Node.get
	call    Node.key_
	bge     s2,a0,Heap_Node.push_thenBodyBBlock.0
	j       Heap_Node.push_afterIfBBlock.0

Heap_Node.push_afterWhileBBlock.0:
	mv      s4,s3
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

Heap_Node.push_thenBodyBBlock.0:
	mv      a4,s0
	j       Heap_Node.push_afterWhileBBlock.0

Heap_Node.push_afterIfBBlock.0:
	lw      a0,0(s4)
	mv      a1,s0
	mv      a2,s1
	call    Array_Node.swap
	mv      s1,s0
	mv      a4,s0
	j       Heap_Node.push_whileCondBBlock.0

Heap_Node.push_criticalEdge.0:
	j       Heap_Node.push_afterWhileBBlock.0


	.globl  Heap_Node.pop
	.p2align	2
	.type   Heap_Node.pop, @function
Heap_Node.pop:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	sw      s2,0(sp)
	mv      s0,a0
	lw      a0,0(s0)
	call    Array_Node.front
	mv      s2,a0
	lw      s1,0(s0)
	mv      a0,s0
	call    Heap_Node.size
	addi    a2,a0,-1
	mv      a0,s1
	li      a1,0
	call    Array_Node.swap
	lw      a0,0(s0)
	call    Array_Node.pop_back
	mv      a0,s0
	li      a1,0
	call    Heap_Node.maxHeapify
	mv      a0,s2
	lw      s2,0(sp)
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  Heap_Node.top
	.p2align	2
	.type   Heap_Node.top, @function
Heap_Node.top:
	addi    sp,sp,-16
	sw      ra,12(sp)
	lw      a0,0(a0)
	call    Array_Node.front
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  Heap_Node.size
	.p2align	2
	.type   Heap_Node.size, @function
Heap_Node.size:
	addi    sp,sp,-16
	sw      ra,12(sp)
	lw      a0,0(a0)
	call    Array_Node.size
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra


	.globl  Heap_Node.lchild
	.p2align	2
	.type   Heap_Node.lchild, @function
Heap_Node.lchild:
	li      a4,2
	mul     a4,a1,a4
	addi    a0,a4,1
	jr      ra


	.globl  Heap_Node.rchild
	.p2align	2
	.type   Heap_Node.rchild, @function
Heap_Node.rchild:
	li      a4,2
	mul     a4,a1,a4
	addi    a0,a4,2
	jr      ra


	.globl  Heap_Node.pnt
	.p2align	2
	.type   Heap_Node.pnt, @function
Heap_Node.pnt:
	addi    a4,a1,-1
	li      a1,2
	div     a0,a4,a1
	jr      ra


	.globl  Heap_Node.maxHeapify
	.p2align	2
	.type   Heap_Node.maxHeapify, @function
Heap_Node.maxHeapify:
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	sw      s4,8(sp)
	mv      s3,s5
	mv      s2,a0
	mv      s4,a1
	mv      a0,s2
	mv      a1,s4
	call    Heap_Node.lchild
	mv      s5,a0
	mv      a0,s2
	mv      a1,s4
	call    Heap_Node.rchild
	mv      s1,a0
	mv      a0,s2
	call    Heap_Node.size
	blt     s5,a0,Heap_Node.maxHeapify_logicalAnd.0
	j       Heap_Node.maxHeapify_criticalEdge.1

Heap_Node.maxHeapify_thenBodyBBlock.0:
	j       Heap_Node.maxHeapify_afterIfBBlock.0

Heap_Node.maxHeapify_afterIfBBlock.0:
	mv      a0,s2
	call    Heap_Node.size
	blt     s1,a0,Heap_Node.maxHeapify_logicalAnd.1
	j       Heap_Node.maxHeapify_criticalEdge.3

Heap_Node.maxHeapify_logicalAnd.0:
	lw      a0,0(s2)
	mv      a1,s5
	call    Array_Node.get
	call    Node.key_
	mv      s0,a0
	lw      a0,0(s2)
	mv      a1,s4
	call    Array_Node.get
	call    Node.key_
	slt     a4,a0,s0
	j       Heap_Node.maxHeapify_afterLogicalAnd.0

Heap_Node.maxHeapify_afterLogicalAnd.0:
	bne     a4,zero,Heap_Node.maxHeapify_thenBodyBBlock.0
	j       Heap_Node.maxHeapify_criticalEdge.0

Heap_Node.maxHeapify_thenBodyBBlock.1:
	mv      s5,s1
	j       Heap_Node.maxHeapify_afterIfBBlock.1

Heap_Node.maxHeapify_afterIfBBlock.1:
	beq     s5,s4,Heap_Node.maxHeapify_thenBodyBBlock.2
	j       Heap_Node.maxHeapify_afterIfBBlock.2

Heap_Node.maxHeapify_logicalAnd.1:
	lw      a0,0(s2)
	mv      a1,s1
	call    Array_Node.get
	call    Node.key_
	mv      s0,a0
	lw      a0,0(s2)
	mv      a1,s5
	call    Array_Node.get
	call    Node.key_
	slt     a4,a0,s0
	j       Heap_Node.maxHeapify_afterLogicalAnd.1

Heap_Node.maxHeapify_afterLogicalAnd.1:
	bne     a4,zero,Heap_Node.maxHeapify_thenBodyBBlock.1
	j       Heap_Node.maxHeapify_criticalEdge.2

Heap_Node.maxHeapify_thenBodyBBlock.2:
	j       Heap_Node.maxHeapify_returnBBlock.0

Heap_Node.maxHeapify_afterIfBBlock.2:
	lw      a0,0(s2)
	mv      a1,s4
	mv      a2,s5
	call    Array_Node.swap
	mv      a0,s2
	mv      a1,s5
	call    Heap_Node.maxHeapify
	j       Heap_Node.maxHeapify_returnBBlock.0

Heap_Node.maxHeapify_returnBBlock.0:
	mv      s5,s3
	lw      s4,8(sp)
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra

Heap_Node.maxHeapify_criticalEdge.0:
	mv      s5,s4
	j       Heap_Node.maxHeapify_afterIfBBlock.0

Heap_Node.maxHeapify_criticalEdge.1:
	mv      a4,zero
	j       Heap_Node.maxHeapify_afterLogicalAnd.0

Heap_Node.maxHeapify_criticalEdge.2:
	j       Heap_Node.maxHeapify_afterIfBBlock.1

Heap_Node.maxHeapify_criticalEdge.3:
	mv      a4,zero
	j       Heap_Node.maxHeapify_afterLogicalAnd.1


	.globl  Node.key_
	.p2align	2
	.type   Node.key_, @function
Node.key_:
	lw      a1,4(a0)
	li      a4,0
	sub     a0,a4,a1
	jr      ra


	.globl  init
	.p2align	2
	.type   init, @function
init:
	addi    sp,sp,-32
	sw      ra,28(sp)
	sw      s0,24(sp)
	sw      s1,20(sp)
	sw      s2,16(sp)
	sw      s3,12(sp)
	mv      s3,s4
	call    __getInt
	lui     a4,%hi(n)
	sw      a0,%lo(n)(a4)
	call    __getInt
	lui     a4,%hi(m)
	sw      a0,%lo(m)(a4)
	li      a0,16
	call    __malloc
	lui     a4,%hi(g)
	sw      a0,%lo(g)(a4)
	lui     a4,%hi(g)
	lw      a0,%lo(g)(a4)
	lui     a4,%hi(n)
	lw      a1,%lo(n)(a4)
	lui     a4,%hi(m)
	lw      a2,%lo(m)(a4)
	call    EdgeList.init
	li      a4,0
	mv      s1,a4
	li      a4,0
	li      a4,0
	li      a4,0
	j       init_forCondBBlock.0

init_forCondBBlock.0:
	lui     a4,%hi(m)
	lw      a4,%lo(m)(a4)
	blt     s1,a4,init_forBodyBBlock.0
	j       init_afterForBBlock.0

init_forBodyBBlock.0:
	call    __getInt
	mv      s4,a0
	call    __getInt
	mv      s2,a0
	call    __getInt
	mv      s0,a0
	lui     a4,%hi(g)
	lw      a0,%lo(g)(a4)
	mv      a1,s4
	mv      a2,s2
	mv      a3,s0
	call    EdgeList.addEdge
	addi    a4,s1,1
	mv      s1,a4
	mv      a4,s4
	mv      a4,s2
	mv      a4,s0
	j       init_forCondBBlock.0

init_afterForBBlock.0:
	mv      s4,s3
	lw      s3,12(sp)
	lw      s2,16(sp)
	lw      s1,20(sp)
	lw      s0,24(sp)
	lw      ra,28(sp)
	addi    sp,sp,32
	jr      ra


	.globl  dijkstra
	.p2align	2
	.type   dijkstra, @function
dijkstra:
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
	sw      s8,8(sp)
	mv      s8,s9
	mv      s9,a0
	lui     s5,%hi(n)
	lw      s2,%lo(n)(s5)
	li      s5,4
	mul     s5,s5,s2
	addi    a0,s5,4
	call    __malloc
	sw      s2,0(a0)
	addi    s6,a0,4
	lui     s5,%hi(n)
	lw      s2,%lo(n)(s5)
	li      s5,4
	mul     s5,s5,s2
	addi    a0,s5,4
	call    __malloc
	sw      s2,0(a0)
	addi    s4,a0,4
	li      s5,0
	j       dijkstra_forCondBBlock.0

dijkstra_forCondBBlock.0:
	lui     a4,%hi(n)
	lw      a4,%lo(n)(a4)
	blt     s5,a4,dijkstra_forBodyBBlock.0
	j       dijkstra_afterForBBlock.0

dijkstra_forBodyBBlock.0:
	slli    a4,s5,2
	add     a1,s4,a4
	lui     a4,%hi(INF)
	lw      a4,%lo(INF)(a4)
	sw      a4,0(a1)
	slli    a4,s5,2
	add     a4,s6,a4
	li      a1,0
	sw      a1,0(a4)
	addi    s5,s5,1
	j       dijkstra_forCondBBlock.0

dijkstra_afterForBBlock.0:
	slli    s5,s9,2
	add     a4,s4,s5
	li      s5,0
	sw      s5,0(a4)
	li      a0,4
	call    __malloc
	mv      s5,a0
	mv      a0,s5
	call    Heap_Node.Heap_Node
	li      a0,8
	call    __malloc
	mv      a1,a0
	li      a4,0
	sw      a4,4(a1)
	sw      s9,0(a1)
	mv      a0,s5
	call    Heap_Node.push
	mv      a0,zero
	li      a4,0
	li      s2,0
	li      a4,0
	mv      s9,a4
	li      a4,0
	mv      s0,a4
	li      a4,0
	mv      s3,a4
	j       dijkstra_whileCondBBlock.0

dijkstra_whileCondBBlock.0:
	mv      a0,s5
	call    Heap_Node.size
	li      a4,0
	bne     a0,a4,dijkstra_whileBodyBBlock.0
	j       dijkstra_afterWhileBBlock.0

dijkstra_whileBodyBBlock.0:
	mv      a0,s5
	call    Heap_Node.pop
	lw      s1,0(a0)
	slli    a4,s1,2
	add     a4,s6,a4
	lw      a1,0(a4)
	li      a4,1
	beq     a1,a4,dijkstra_thenBodyBBlock.0
	j       dijkstra_afterIfBBlock.0

dijkstra_afterWhileBBlock.0:
	mv      a0,s4
	mv      s9,s8
	lw      s8,8(sp)
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

dijkstra_thenBodyBBlock.0:
	mv      a4,s1
	mv      a4,s9
	mv      s9,a4
	mv      a4,s0
	mv      s0,a4
	mv      a4,s3
	mv      s3,a4
	j       dijkstra_whileCondBBlock.0

dijkstra_afterIfBBlock.0:
	slli    a4,s1,2
	add     a1,s6,a4
	li      a4,1
	sw      a4,0(a1)
	lui     a4,%hi(g)
	lw      a4,%lo(g)(a4)
	lw      a4,8(a4)
	slli    a1,s1,2
	add     a4,a4,a1
	lw      a4,0(a4)
	mv      s2,a4
	mv      a1,s9
	mv      a2,s0
	mv      a3,s3
	j       dijkstra_forCondBBlock.1

dijkstra_forCondBBlock.1:
	li      a4,0
	addi    a4,a4,-1
	bne     s2,a4,dijkstra_forBodyBBlock.1
	j       dijkstra_afterForBBlock.1

dijkstra_forBodyBBlock.1:
	lui     a4,%hi(g)
	lw      a4,%lo(g)(a4)
	lw      a1,0(a4)
	slli    a4,s2,2
	add     a4,a1,a4
	lw      a4,0(a4)
	lw      s7,4(a4)
	lui     a4,%hi(g)
	lw      a4,%lo(g)(a4)
	lw      a1,0(a4)
	slli    a4,s2,2
	add     a4,a1,a4
	lw      a4,0(a4)
	lw      s0,8(a4)
	slli    a4,s1,2
	add     a4,s4,a4
	lw      a4,0(a4)
	add     s9,a4,s0
	slli    a4,s7,2
	add     a4,s4,a4
	lw      a4,0(a4)
	bge     s9,a4,dijkstra_thenBodyBBlock.1
	j       dijkstra_afterIfBBlock.1

dijkstra_forStepBBlock.1:
	lui     a4,%hi(g)
	lw      a4,%lo(g)(a4)
	lw      a1,4(a4)
	slli    a4,s2,2
	add     a4,a1,a4
	lw      a4,0(a4)
	mv      s2,a4
	mv      a1,s7
	mv      a2,s0
	mv      a3,s9
	j       dijkstra_forCondBBlock.1

dijkstra_afterForBBlock.1:
	mv      a4,s1
	mv      s9,a1
	mv      s0,a2
	mv      s3,a3
	j       dijkstra_whileCondBBlock.0

dijkstra_thenBodyBBlock.1:
	j       dijkstra_forStepBBlock.1

dijkstra_afterIfBBlock.1:
	slli    a4,s7,2
	add     a4,s4,a4
	sw      s9,0(a4)
	li      a0,8
	call    __malloc
	mv      s3,a0
	sw      s7,0(s3)
	slli    a4,s7,2
	add     a4,s4,a4
	lw      a4,0(a4)
	sw      a4,4(s3)
	mv      a0,s5
	mv      a1,s3
	call    Heap_Node.push
	mv      a0,s3
	j       dijkstra_forStepBBlock.1


	.globl  main
	.p2align	2
	.type   main, @function
main:
	addi    sp,sp,-16
	sw      ra,12(sp)
	sw      s0,8(sp)
	sw      s1,4(sp)
	sw      s2,0(sp)
	call    __init__
	call    init
	li      a4,0
	mv      s1,a4
	li      a4,0
	mv      a4,zero
	j       main_forCondBBlock.0

main_forCondBBlock.0:
	lui     a4,%hi(n)
	lw      a4,%lo(n)(a4)
	blt     s1,a4,main_forBodyBBlock.0
	j       main_afterForBBlock.0

main_forBodyBBlock.0:
	mv      a0,s1
	call    dijkstra
	mv      s2,a0
	li      a4,0
	mv      s0,a4
	j       main_forCondBBlock.1

main_afterForBBlock.0:
	li      a0,0
	lw      s2,0(sp)
	lw      s1,4(sp)
	lw      s0,8(sp)
	lw      ra,12(sp)
	addi    sp,sp,16
	jr      ra

main_forCondBBlock.1:
	lui     a4,%hi(n)
	lw      a4,%lo(n)(a4)
	blt     s0,a4,main_forBodyBBlock.1
	j       main_afterForBBlock.1

main_forBodyBBlock.1:
	slli    a4,s0,2
	add     a4,s2,a4
	lw      a4,0(a4)
	lui     a1,%hi(INF)
	lw      a1,%lo(INF)(a1)
	beq     a4,a1,main_thenBodyBBlock.0
	j       main_elseBodyBBlock.0

main_afterForBBlock.1:
    la      a0,.str.2
	call    __println
	addi    a4,s1,1
	mv      s1,a4
	mv      a4,s0
	mv      a4,s2
	j       main_forCondBBlock.0

main_thenBodyBBlock.0:
    la      a0,.str.0
	call    __print
	j       main_afterIfBBlock.0

main_elseBodyBBlock.0:
	slli    a4,s0,2
	add     a4,s2,a4
	lw      a0,0(a4)
	call    __toString
	call    __print
	j       main_afterIfBBlock.0

main_afterIfBBlock.0:
    la      a0,.str.1
	call    __print
	addi    a4,s0,1
	mv      s0,a4
	j       main_forCondBBlock.1


	.globl  __init__
	.p2align	2
	.type   __init__, @function
__init__:
	jr      ra


