EXTERN SQRT
.ORIG	x3000

LD	R0, VALUE
JSR	SQRT
ST	R0, DEST
	HALT

VALUE .FILL	x30000
DEST  .FILL	x0025
	.END