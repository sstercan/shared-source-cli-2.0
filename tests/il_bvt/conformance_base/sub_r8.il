// ==++==
//
//   
//    Copyright (c) 2006 Microsoft Corporation.  All rights reserved.
//   
//    The use and distribution terms for this software are contained in the file
//    named license.txt, which can be found in the root of this distribution.
//    By using this software in any fashion, you are agreeing to be bound by the
//    terms of this license.
//   
//    You must not remove this notice, or any other, from this software.
//   
//
// ==--==
.class public _sub {
.method public static	int32 _sub(float64,float64,float64) {
.maxstack		5
	ldarg	0
	ldarg	1
	sub
	dup
	call	int32 _sub::checkfinite(float64)
	ldc.i4		0x0
	ceq
	brtrue		COMPARE
	call	int32 _sub::checkfinite(float64)
	ldarg	2
	call	int32 _sub::checkfinite(float64)
	ceq
	br			FINISH
COMPARE:
	ldarg	2
	ceq
FINISH:
	ret
}
.method public static	int32 checkfinite(float64) {
.maxstack		3
.locals init		(class [mscorlib]System.ArithmeticException)
try_start:
	ldarg	0
	ckfinite
	pop
	leave.s	try_end
try_end:
	ldc.i4		0x0
	br			FINISH
ae:
	isinst		[mscorlib]System.ArithmeticException
	stloc			0x0
	leave			HEnd
HEnd:
	ldloc			0x0
	brfalse		FAIL
	ldarg	0
	ldc.r8		float64(0xFFF0000000000000)
	ceq
	brtrue		NINF
	ldarg	0
	ldc.r8		float64(0x7FF0000000000000)
	ceq
	brtrue		PINF
	br			NaN
NINF:
	ldc.i4		0x00000002
	br			FINISH
PINF:
	ldc.i4		0x00000003
	br			FINISH
NaN:
	ldc.i4		0x00000001
	br			FINISH
FAIL:
	ldc.i4		0xFF
	br			FINISH
FINISH:
	ret
.try try_start to try_end catch [mscorlib]System.ArithmeticException handler ae to HEnd
}
.method public static	int32 main(class [mscorlib]System.String[]) {
.entrypoint
.maxstack		20
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0xC000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xC004000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xBFF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xBFF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x4000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xBFE0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0xBFF0000000000000)
	ldc.r8		float64(0x4004000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x8000000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x0000000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x3FF0000000000000)
	ldc.r8		float64(0x3FE0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x7FEFFFFFFFFFFFFF)
	ldc.r8		float64(0xFFEFFFFFFFFFFFFF)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x7FF0000000000000)
	ldc.r8		float64(0xFFF0000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	ldc.r8		float64(0x7FF8000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x3FF8000000000000)
	ldc.r8		float64(0x0000000000000000)
	call	int32 _sub::_sub(float64,float64,float64)
	brfalse		FAIL
PASS:
	ldc.i4	0x0000
	br		END
FAIL:
	ldc.i4	0x0001
	br		END
END:
	ret
}
}
.assembly sub_r8exe{}
