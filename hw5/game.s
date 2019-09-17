	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #30
	mov	r0, #89
	mov	ip, #5
	mov	r3, #10
	mov	lr, #65
	mov	r1, #2
	ldr	r2, .L4
	str	r4, [r2]
	ldr	r2, .L4+4
	str	r0, [r2]
	ldr	r2, .L4+8
	ldr	r0, .L4+12
	str	ip, [r2]
	ldr	r2, .L4+16
	str	r3, [r0]
	ldr	ip, .L4+20
	str	r3, [r2]
	ldr	r0, .L4+24
	ldr	r2, .L4+28
	str	lr, [ip]
	str	r3, [r0]
	pop	{r4, lr}
	str	r1, [r2]
	bx	lr
.L5:
	.align	2
.L4:
	.word	remaining
	.word	lastCol
	.word	firstCol
	.word	lastColDel
	.word	firstColDel
	.word	lastRow
	.word	lastRowDel
	.word	livesRemaining
	.size	initGame, .-initGame
	.align	2
	.global	initTank
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTank, %function
initTank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r1, #20
	mov	r5, #2
	mov	r4, #130
	mov	lr, #120
	mov	ip, #1
	mov	r0, #8
	ldr	r3, .L8
	str	r5, [r3, #12]
	stm	r3, {r4, lr}
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #40]
	str	r0, [r3, #28]
	str	r2, [r3, #44]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	tank
	.size	initTank, .-initTank
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, r5, r6, lr}
	mov	r0, #10
	mov	r6, #2
	mov	r2, #0
	mov	r5, #6
	ldr	r4, .L14
	ldr	r3, [r4, #16]
	ldr	ip, [r4, #4]
	add	lr, r3, r3, lsr #31
	ldr	r3, .L14+4
	add	ip, ip, lr, asr r1
	ldr	r4, [r4]
	sub	ip, ip, #5
	add	lr, r3, #720
.L11:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r6, [r3, #12]
	str	r1, [r3, #8]
	str	r2, [r3, #44]
	str	r2, [r3, #36]
	str	r1, [r3, #40]
	str	r5, [r3, #28]
	stm	r3, {r4, ip}
	add	r3, r3, #48
	cmp	r3, lr
	bne	.L11
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	tank
	.word	bullet
	.size	initBullet, .-initBullet
	.align	2
	.global	initEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyBullet, %function
initEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	push	{r4, r5, lr}
	mov	r0, #5
	mov	r1, #0
	mov	r5, #7
	ldr	r4, .L20
	ldr	r3, [r4, #256]
	ldr	ip, [r4, #244]
	add	lr, r3, r3, lsr #31
	ldr	r3, .L20+4
	add	ip, ip, lr, asr r2
	ldr	r4, [r4, #240]
	sub	ip, ip, #2
	add	lr, r3, #480
.L17:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r1, [r3, #44]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	str	r5, [r3, #28]
	stm	r3, {r4, ip}
	add	r3, r3, #48
	cmp	r3, lr
	bne	.L17
	pop	{r4, r5, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	enemies
	.word	enemyBullet
	.size	initEnemyBullet, .-initEnemyBullet
	.align	2
	.global	initEnergy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnergy, %function
initEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #6
	mov	r2, #1
	mov	lr, #140
	mov	r5, #200
	mov	r4, #210
	mov	ip, #5
	mov	r0, #0
	ldr	r3, .L24
	str	lr, [r3]
	str	lr, [r3, #48]
	str	r5, [r3, #4]
	str	r4, [r3, #52]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #64]
	str	r1, [r3, #68]
	str	r2, [r3, #44]
	str	r2, [r3, #40]
	str	r2, [r3, #92]
	str	r2, [r3, #88]
	str	ip, [r3, #28]
	str	ip, [r3, #76]
	str	r0, [r3, #36]
	str	r0, [r3, #84]
	pop	{r4, r5, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	energy
	.size	initEnergy, .-initEnergy
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L48
	mov	r0, r2
	mov	r5, #5
	mvn	r1, #7
	mov	lr, #10
	mov	ip, #8
	mov	r7, #1
	mov	r8, #4
	mov	r6, #2
	mov	r9, #3
	b	.L27
.L28:
	sub	r4, r2, #6
	cmp	r4, #5
	bls	.L44
	sub	r4, r2, #12
	cmp	r4, #5
	bls	.L45
	sub	r4, r2, #18
	cmp	r4, #5
	bls	.L46
	cmp	r2, #24
	moveq	r1, #5
	addeq	r5, r5, #13
	addne	r1, r1, #13
	cmp	r2, #29
	str	r8, [r3, #28]
	str	r0, [r3, #36]
	str	r6, [r3, #40]
	str	r5, [r3]
	stmib	r3, {r1, lr}
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r7, [r3, #44]
	str	r0, [r3, #24]
	beq	.L47
.L41:
	add	r2, r2, #1
	add	r3, r3, #48
.L27:
	cmp	r2, #5
	bhi	.L28
	str	r0, [r3, #28]
	str	r0, [r3, #36]
	str	r6, [r3, #40]
	add	r1, r1, #13
.L29:
	str	r5, [r3]
	stmib	r3, {r1, lr}
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r7, [r3, #44]
	str	r0, [r3, #24]
	b	.L41
.L47:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L44:
	cmp	r2, #6
	addeq	r5, r5, #13
	moveq	r1, #5
	addne	r1, r1, #13
	str	r7, [r3, #28]
	str	r0, [r3, #36]
	str	r6, [r3, #40]
	b	.L29
.L46:
	cmp	r2, #18
	addeq	r5, r5, #13
	moveq	r1, #5
	addne	r1, r1, #13
	str	r9, [r3, #28]
	str	r0, [r3, #36]
	str	r6, [r3, #40]
	b	.L29
.L45:
	cmp	r2, #12
	addeq	r5, r5, #13
	moveq	r1, #5
	addne	r1, r1, #13
	str	r6, [r3, #28]
	str	r0, [r3, #36]
	str	r7, [r3, #40]
	b	.L29
.L49:
	.align	2
.L48:
	.word	enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	updateTank
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTank, %function
updateTank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L76
	ldrh	r3, [r3, #48]
	tst	r3, #16
	sub	sp, sp, #20
	bne	.L51
	ldr	r3, .L76+4
	add	r0, r3, #12
	ldr	r1, [r3, #4]
	ldm	r0, {r0, r2}
	add	r2, r1, r2
	rsb	ip, r0, #240
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	bgt	.L51
.L52:
	mov	r3, #0
	ldr	r2, .L76+8
	ldr	r1, .L76+12
	ldrh	r2, [r2]
	ldrh	r0, [r1]
	ldr	lr, .L76+16
	and	r2, r2, #1
	and	r0, r0, #1
.L55:
	cmp	r2, #0
	beq	.L53
	cmp	r0, #0
	add	r1, r3, r3, lsl #1
	bne	.L53
	ldr	ip, [lr, r1, lsl #4]
	cmp	ip, #0
	lsl	r1, r1, #4
	beq	.L74
.L53:
	add	r3, r3, #1
	cmp	r3, #15
	bne	.L55
.L54:
	mov	r9, #0
	ldr	fp, .L76+20
	ldr	r8, .L76+24
	ldr	r6, .L76+4
.L60:
	ldr	r5, .L76+28
	sub	r3, r5, #16
	ldr	r4, .L76+32
	mov	r7, #0
	add	r10, r9, r3
	b	.L59
.L56:
	cmp	r3, #131
	ldrheq	r3, [r5]
	streq	r7, [r4, #44]
	orreq	r3, r3, #512
	streq	r7, [r4, #36]
	add	r4, r4, #48
	strheq	r3, [r5]	@ movhi
	cmp	r4, r8
	add	r5, r5, #8
	beq	.L75
.L59:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldr	r3, [r4]
	beq	.L56
	add	r1, r4, #16
	ldm	r1, {r1, r2}
	ldr	r0, [r4, #4]
	sub	r1, r1, #3
	sub	r2, r2, #2
	stmib	sp, {r0, r2}
	str	r3, [sp]
	str	r1, [sp, #12]
	ldr	r3, [r6, #16]
	ldr	r2, [r6, #20]
	ldm	r6, {r0, r1}
	ldr	ip, .L76+36
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L73
	ldrh	r3, [r10]
	orr	r3, r3, #512
	strh	r3, [r10]	@ movhi
	ldr	r1, .L76+40
	ldrh	r2, [r5]
	ldr	r3, [r1]
	orr	r2, r2, #512
	sub	r3, r3, #1
	str	r7, [fp, #44]
	str	r7, [r4, #44]
	str	r7, [r4, #36]
	strh	r2, [r5]	@ movhi
	str	r3, [r1]
.L73:
	ldr	r3, [r4]
	b	.L56
.L51:
	ldr	r3, .L76
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L52
	ldr	r3, .L76+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #12]
	cmp	r2, r1
	subge	r2, r2, r1
	strge	r2, [r3, #4]
	b	.L52
.L75:
	add	r9, r9, #8
	cmp	r9, #16
	add	fp, fp, #48
	bne	.L60
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L74:
	mov	r4, #1
	ldr	ip, .L76+4
	ldr	r3, [ip, #16]
	ldr	lr, .L76+44
	add	r2, r3, r3, lsr #31
	ldr	r3, [ip, #4]
	add	r0, lr, r1
	add	r3, r3, r2, asr r4
	ldr	r2, [r0, #16]
	ldr	r5, [ip]
	add	r2, r2, r2, lsr #31
	sub	r3, r3, r2, asr r4
	str	r5, [lr, r1]
	str	r3, [r0, #4]
	str	r4, [r0, #44]
	b	.L54
.L77:
	.align	2
.L76:
	.word	67109120
	.word	tank
	.word	oldButtons
	.word	buttons
	.word	bullet+44
	.word	energy
	.word	enemyBullet+480
	.word	shadowOAM+384
	.word	enemyBullet
	.word	collision
	.word	livesRemaining
	.word	bullet
	.size	updateTank, .-updateTank
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L82
	add	r0, r3, #720
.L79:
	ldr	r2, [r3, #-8]
	ldr	r1, [r3]
	sub	r2, r2, r1
	str	r2, [r3, #-8]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L79
	bx	lr
.L83:
	.align	2
.L82:
	.word	bullet+8
	.size	updateBullet, .-updateBullet
	.align	2
	.global	fireEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L88
	add	r0, r3, #480
.L85:
	ldr	r2, [r3, #-8]
	ldr	r1, [r3]
	add	r2, r2, r1
	str	r2, [r3, #-8]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L85
	bx	lr
.L89:
	.align	2
.L88:
	.word	enemyBullet+8
	.size	fireEnemyBullet, .-fireEnemyBullet
	.global	__aeabi_idivmod
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L157
	ldr	r3, .L157+4
	ldr	r2, [r2, #24]
	smull	r1, r0, r2, r3
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	asr	r6, r2, #31
	rsb	r3, r6, r0, asr #4
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #3
	sub	sp, sp, #28
	beq	.L150
	ldr	r3, .L157+8
	str	r3, [sp, #20]
	add	fp, r3, #1440
.L91:
	mov	r10, #0
	ldr	r8, .L157+12
	ldr	r6, .L157+8
	ldr	r9, .L157+16
	b	.L104
.L110:
	add	r6, r6, #48
	cmp	r6, fp
	add	r8, r8, #8
	beq	.L155
.L104:
	ldr	r3, [r6, #44]
	cmp	r3, #0
	beq	.L110
	ldr	r4, .L157+20
	ldr	r5, .L157+12
	add	r7, r4, #720
	b	.L109
.L106:
	cmp	r3, #0
	ldrheq	r2, [r5, #8]
	streq	r3, [r4, #44]
	orreq	r2, r2, #512
	streq	r3, [r4, #36]
	add	r4, r4, #48
	strheq	r2, [r5, #8]	@ movhi
	cmp	r4, r7
	add	r5, r5, #8
	beq	.L110
.L109:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldr	r3, [r4]
	beq	.L106
	add	r1, r4, #16
	ldm	r1, {r1, r2}
	ldr	r0, [r4, #4]
	sub	r2, r2, #2
	stmib	sp, {r0, r2}
	sub	r1, r1, #3
	str	r3, [sp]
	str	r1, [sp, #12]
	ldr	ip, .L157+24
	ldr	r3, [r6, #16]
	ldr	r2, [r6, #20]
	ldm	r6, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L154
	ldrh	r3, [r8, #128]
	orr	r3, r3, #512
	strh	r3, [r8, #128]	@ movhi
	ldr	r3, [r9]
	ldrh	r2, [r5, #8]
	sub	r3, r3, #1
	orr	r2, r2, #512
	str	r10, [r4, #44]
	str	r10, [r4, #36]
	str	r10, [r6, #44]
	strh	r2, [r5, #8]	@ movhi
	str	r3, [r9]
.L154:
	ldr	r3, [r4]
	b	.L106
.L155:
	ldr	r2, .L157+28
	ldr	r1, .L157+32
	ldrh	r0, [r2]
	ldrh	r1, [r1]
	ldr	r2, [sp, #20]
	mov	r3, #0
	ldr	ip, [r2, #284]
	ldr	lr, .L157+36
	and	r1, r1, #1
	and	r0, r0, #1
	b	.L114
.L156:
	ldr	r2, [r9]
	cmp	r2, #20
	beq	.L111
	ldr	r2, [r9]
	cmp	r2, #15
	beq	.L111
	ldr	r2, [r9]
	cmp	r2, #5
	beq	.L111
	ldr	r2, [r9]
	cmp	r2, #3
	beq	.L111
.L112:
	add	r3, r3, #1
	cmp	r3, #10
	beq	.L90
.L114:
	ldr	r2, [r9]
	cmp	r2, #25
	bne	.L156
.L111:
	cmp	r1, #0
	beq	.L112
	cmp	r0, #0
	bne	.L112
	cmp	ip, #0
	add	r2, r3, r3, lsl #1
	beq	.L112
	ldr	r4, [lr, r2, lsl #4]
	cmp	r4, #0
	lsl	r2, r2, #4
	bne	.L112
	ldr	r4, [sp, #20]
	ldr	r3, [r4, #256]
	add	r1, r3, r3, lsr #31
	mov	r3, r4
	mov	lr, #1
	ldr	ip, .L157+40
	ldr	r3, [r3, #244]
	add	r0, ip, r2
	add	r3, r3, r1, asr lr
	ldr	r1, [r0, #16]
	ldr	r4, [r4, #240]
	add	r1, r1, r1, lsr #31
	sub	r3, r3, r1, asr lr
	str	r4, [ip, r2]
	str	r3, [r0, #4]
	str	lr, [r0, #44]
.L90:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L150:
	ldr	r5, .L157+44
	ldr	r3, [r5]
	cmp	r3, #239
	ldr	r3, .L157+8
	ble	.L92
	str	r3, [sp, #20]
	add	fp, r3, #1440
.L94:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L93
	add	r0, r3, #8
	ldm	r0, {r0, r2}
	ldr	r1, [r3]
	rsb	r2, r2, #0
	add	r1, r1, r0
	str	r1, [r3]
	str	r2, [r3, #12]
.L93:
	add	r3, r3, #48
	cmp	r3, fp
	bne	.L94
	ldr	r3, .L157+48
	ldr	r2, [r3]
	rsb	r2, r2, #0
	str	r2, [r3]
	ldr	r2, .L157+52
	ldr	r1, [r2]
	rsb	r1, r1, #0
	str	r1, [r2]
	ldr	r0, .L157+56
	ldr	r1, .L157+60
	ldr	ip, [r1]
	ldr	r1, [r0]
	add	r1, r1, ip
	str	r1, [r0]
	ldr	r8, .L157+64
.L95:
	ldr	r1, [r3]
	ldr	r3, [r5]
	add	r3, r3, r1
	str	r3, [r5]
	ldr	r2, [r2]
	ldr	r3, [r8]
	add	r3, r3, r2
	str	r3, [r8]
	b	.L91
.L92:
	str	r3, [sp, #20]
	ldr	r3, [r3]
	cmp	r3, #5
	ldr	r8, .L157+64
	bgt	.L151
.L96:
	ldr	r0, .L157+4
	mov	r9, r0
	smull	r1, r3, r2, r0
	ldr	r4, .L157+8
	rsb	r6, r6, r3, asr #3
	add	r6, r6, r6, lsl #2
	ldr	r7, .L157+68
	sub	r6, r2, r6, lsl #2
	add	fp, r4, #1440
.L102:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L100
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	cmp	r6, #0
	add	r3, r3, r2
	str	r3, [r4, #4]
	bne	.L100
	ldr	r2, [r4, #24]
	smull	r3, r1, r9, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #2
	bne	.L100
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	str	r1, [r4, #36]
.L100:
	add	r4, r4, #48
	cmp	r4, fp
	bne	.L102
	ldr	r3, .L157+48
	ldr	r2, .L157+52
	b	.L95
.L151:
	ldr	r3, [r8]
	cmp	r3, #2
	bgt	.L96
	ldr	r2, [sp, #20]
	mov	r3, r2
	add	fp, r2, #1440
.L98:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L97
	add	r0, r3, #8
	ldm	r0, {r0, r2}
	ldr	r1, [r3]
	rsb	r2, r2, #0
	add	r1, r1, r0
	str	r1, [r3]
	str	r2, [r3, #12]
.L97:
	add	r3, r3, #48
	cmp	r3, fp
	bne	.L98
	ldr	r3, .L157+48
	ldr	r2, [r3]
	rsb	r2, r2, #0
	str	r2, [r3]
	ldr	r2, .L157+52
	ldr	r1, [r2]
	rsb	r1, r1, #0
	str	r1, [r2]
	ldr	r0, .L157+56
	ldr	r1, .L157+60
	ldr	ip, [r1]
	ldr	r1, [r0]
	add	r1, r1, ip
	str	r1, [r0]
	b	.L95
.L158:
	.align	2
.L157:
	.word	tank
	.word	1717986919
	.word	enemies
	.word	shadowOAM
	.word	remaining
	.word	bullet
	.word	collision
	.word	buttons
	.word	oldButtons
	.word	enemyBullet+44
	.word	enemyBullet
	.word	lastCol
	.word	lastColDel
	.word	firstColDel
	.word	lastRow
	.word	lastRowDel
	.word	firstCol
	.word	__aeabi_idivmod
	.size	updateEnemies, .-updateEnemies
	.comm	livesRemaining,4,4
	.comm	lastRowDel,4,4
	.comm	lastRow,4,4
	.comm	firstColDel,4,4
	.comm	lastColDel,4,4
	.comm	firstCol,4,4
	.comm	lastCol,4,4
	.comm	remaining,4,4
	.comm	enemyBullet,480,4
	.comm	bullet,720,4
	.comm	enemies,1440,4
	.comm	energy,96,4
	.comm	tank,48,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
