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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #256
	mov	r2, #7168
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+24
	ldr	r2, .L4+28
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startPagePal
	.word	startPageTiles
	.word	100720640
	.word	startPageMap
	.word	waitForVBlank
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #7168
	ldr	r4, .L8+4
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L8+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #100663296
	ldr	r1, .L8+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+32
	ldr	r1, .L8+36
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+60
	mov	lr, pc
	bx	r3
	ldr	r2, .L8+64
	ldr	r3, .L8+68
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	initGame
	.word	DMANow
	.word	startPagePal
	.word	startPageTiles
	.word	100720640
	.word	startPageMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	initBullet
	.word	initTank
	.word	initEnemies
	.word	initEnergy
	.word	initEnemyBullet
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1904
	mov	r2, #100663296
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #56320
	ldr	r3, .L12+20
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	gamePagePal
	.word	gamePageTiles
	.word	100720640
	.word	gamePageMap
	.word	waitForVBlank
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	mov	r2, #67108864
	ldrh	r3, [r2]
	orr	r3, r3, #4096
	strh	r3, [r2]	@ movhi
	ldr	r0, [r4]
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L25
	mov	r2, #83886080
	ldr	r1, .L25+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #224
	mov	r2, #100663296
	ldr	r1, .L25+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7168
	mov	r1, #256
	strh	r2, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L25+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	pausePagePal
	.word	pausePageTiles
	.word	100720640
	.word	pausePageMap
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L39
	ldr	r4, .L39+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L39+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L38
.L27:
	pop	{r4, lr}
	bx	lr
.L38:
	pop	{r4, lr}
	b	goToStart
.L37:
	mov	r2, #67108864
	ldrh	r3, [r2]
	orr	r3, r3, #4096
	strh	r3, [r2]	@ movhi
	bl	goToGame
	ldrh	r3, [r4]
	b	.L28
.L40:
	.align	2
.L39:
	.word	hideSprites
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L43
	mov	r2, #83886080
	ldr	r1, .L43+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #240
	mov	r2, #100663296
	ldr	r1, .L43+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L43+12
	ldr	r1, .L43+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7168
	mov	r1, #256
	strh	r2, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	ldr	r3, .L43+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L43+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	DMANow
	.word	winpagePal
	.word	winpageTiles
	.word	100720640
	.word	winpageMap
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L47
	mov	r2, #83886080
	ldr	r1, .L47+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #624
	mov	r2, #100663296
	ldr	r1, .L47+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L47+12
	ldr	r1, .L47+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7168
	mov	r1, #256
	strh	r2, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	ldr	r3, .L47+20
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L47+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
	.word	DMANow
	.word	losePagePal
	.word	losePageTiles
	.word	100720640
	.word	losePageMap
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L77+16
	mov	r2, r0
	mov	r1, r0
	ldr	r3, .L77+20
	ldr	r4, [r3, #24]
	ldr	lr, [r3, #4]
	add	r4, r4, #1
	ldr	r5, [r3, #36]
	str	r4, [r3, #24]
	ldr	ip, [r3, #28]
	ldr	r4, [r3]
	orr	lr, lr, #16384
	ldr	r3, .L77+24
	add	ip, ip, r5, lsl #5
	strh	lr, [r0, #2]	@ movhi
	strh	r4, [r0]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	add	ip, r3, #720
.L51:
	ldr	r0, [r3, #44]
	cmp	r0, #0
	beq	.L50
	ldr	r5, [r3, #36]
	ldr	r0, [r3, #28]
	ldm	r3, {r4, lr}
	add	r0, r0, r5, lsl #5
	strh	r0, [r1, #12]	@ movhi
	strh	r4, [r1, #8]	@ movhi
	strh	lr, [r1, #10]	@ movhi
.L50:
	add	r3, r3, #48
	cmp	r3, ip
	add	r1, r1, #8
	bne	.L51
	ldr	r3, .L77+28
	add	r0, r3, #1440
.L53:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L52
	ldr	r4, [r3, #36]
	ldr	r1, [r3, #28]
	ldr	lr, [r3]
	ldr	ip, [r3, #4]
	add	r1, r1, r4, lsl #5
	strh	r1, [r2, #132]	@ movhi
	strh	lr, [r2, #128]	@ movhi
	strh	ip, [r2, #130]	@ movhi
.L52:
	add	r3, r3, #48
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L53
	ldr	r3, .L77+32
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L54
	ldr	lr, [r3, #36]
	ldr	r1, [r3, #28]
	ldr	r2, .L77+36
	ldr	ip, [r3]
	ldr	r0, [r3, #4]
	add	r1, r1, lr, lsl #5
	strh	r1, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
.L54:
	ldr	r2, [r3, #92]
	cmp	r2, #0
	beq	.L55
	ldr	lr, [r3, #84]
	ldr	r1, [r3, #76]
	ldr	r2, .L77+40
	ldr	ip, [r3, #48]
	ldr	r0, [r3, #52]
	add	r3, r1, lr, lsl #5
	strh	r3, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
.L55:
	ldr	r3, .L77+44
	ldr	r2, .L77+48
	add	r0, r3, #480
.L57:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L56
	ldr	r4, [r3, #36]
	ldr	r1, [r3, #28]
	ldr	lr, [r3]
	ldr	ip, [r3, #4]
	add	r1, r1, r4, lsl #5
	strh	r1, [r2, #4]	@ movhi
	strh	lr, [r2]	@ movhi
	strh	ip, [r2, #2]	@ movhi
.L56:
	add	r3, r3, #48
	cmp	r0, r3
	add	r2, r2, #8
	bne	.L57
	ldr	r3, .L77+52
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	updateTank
	.word	updateBullet
	.word	fireEnemyBullet
	.word	updateEnemies
	.word	shadowOAM
	.word	tank
	.word	bullet
	.word	enemies
	.word	energy
	.word	shadowOAM+368
	.word	shadowOAM+376
	.word	enemyBullet
	.word	shadowOAM+384
	.word	waitForVBlank
	.size	drawGame, .-drawGame
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawGame
	ldr	r4, .L92
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L92+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L92+8
	ldrh	r1, [r2]
	ldrh	r2, [r2, #4]
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r1, .L92+12
	ldr	r2, .L92+16
	ldr	r3, [r1]
	ldr	r2, [r2]
	sub	r3, r3, #4
	cmp	r3, r2
	bgt	.L88
.L80:
	ldr	r3, .L92+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L89
.L81:
	ldr	r3, .L92+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L90
.L82:
	ldr	r3, .L92+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L79
	ldr	r3, .L92+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
.L79:
	pop	{r4, lr}
	bx	lr
.L90:
	bl	goToWin
	b	.L82
.L89:
	bl	goToLose
	b	.L81
.L88:
	bl	goToLose
	b	.L80
.L91:
	pop	{r4, lr}
	b	goToPause
.L93:
	.align	2
.L92:
	.word	DMANow
	.word	shadowOAM
	.word	.LANCHOR0
	.word	lastRow
	.word	tank
	.word	livesRemaining
	.word	remaining
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L105
	mov	lr, pc
	bx	r3
	ldr	r3, .L105+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L105+8
	ldr	fp, .L105+12
	ldr	r5, .L105+16
	ldr	r10, .L105+20
	ldr	r9, .L105+24
	ldr	r8, .L105+28
	ldr	r7, .L105+32
	ldr	r4, .L105+36
.L95:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L96:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L96
.L98:
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L97
	.word	.L97
.L97:
	mov	lr, pc
	bx	r7
	b	.L95
.L99:
	mov	lr, pc
	bx	r8
	b	.L95
.L100:
	mov	lr, pc
	bx	r9
	b	.L95
.L101:
	mov	lr, pc
	bx	r10
	b	.L95
.L106:
	.align	2
.L105:
	.word	hideSprites
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L114
	mov	lr, pc
	bx	r3
	ldr	r3, .L114+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L114+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L107
	ldr	r3, .L114+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L113
.L107:
	pop	{r4, lr}
	bx	lr
.L113:
	ldr	r3, .L114+16
	mov	lr, pc
	bx	r3
.L115:
	.align	2
.L114:
	.word	hideSprites
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	main
	.size	win, .-win
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	arr,140,4
	.global	vOff
	.global	hOff
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
