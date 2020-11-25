"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMatrixTest,
	#superclass : #TestCase,
	#category : #'MLLinearAlgebra-Tests'
}

{ #category : #testing }
MLMatrixTest class >> isAbstract [
	
	^self name = #MLMatrixTest
]

{ #category : #fixture }
MLMatrixTest >> matrixClass [
	"comment stating purpose of message"
	
	^self subclassResponsibility
]

{ #category : #test }
MLMatrixTest >> testAccessors [
	"comment stating purpose of message"

	| m |
	m := self matrixClass new: 2 @ 3.
	m at: 1 and: 2 put: 12.
	m at: 2 and: 1 put: 21.
	self assert: (m at: 1 and: 2) equals: 12.
	self assert: (m at: 2 and: 1) equals: 21.
	m at: 1 and: 3 put: 13.
	self assert: (m at: 1 and: 3) equals: 13.
	self assert: (m atPoint: 1 @ 3) equals: 13
]

{ #category : #test }
MLMatrixTest >> testAddWithMatrix [
	"comment stating purpose of message"

	| m n mn |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	n := self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)).
	mn := self matrixClass withAll: #(#(11 22) #(33 44) #(55 66)).
	self assert: m + n equals: mn.
	m += n.
	self assert: m equals: mn.
	self assert: n equals: (self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)))
]

{ #category : #test }
MLMatrixTest >> testAddWithNumber [
	"comment stating purpose of message"

	| m m10 |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	m10 := self matrixClass withAll: #(#(11 12) #(13 14) #(15 16)).
	self assert: m + 10 equals: m10.
	self assert: 10 + m equals: m10.	"no longer Double in Pharo"	"self assert: m + 10.0d = m10."	"self assert: 10.0d + m = m10."
	m += 10.
	self assert: m equals: m10
]

{ #category : #test }
MLMatrixTest >> testArithmeticUnity [
	| a |
	a := self matrixClass new: 2 withAll: #(1 2 3 4).
	self assert: MLMatrix unity * a equals: a.
	self assert: (MLMatrix unity + a) asArray equals: #(2 3 4 5).
	self assert: MLMatrix unity * MLMatrix unity equals: MLMatrix unity.
	self assert: (MLMatrix unity + MLMatrix unity) asNumber equals: 2.
	self assert: MLMatrix unity + MLMatrix zero equals: MLMatrix unity
]

{ #category : #test }
MLMatrixTest >> testArithmeticZero [
	| a |
	a := self matrixClass new: 2 withAll: #(1 2 3 4).
	self assert: MLMatrix zero * a equals: MLMatrix zero.
	self assert: MLMatrix zero + a equals: a.
	self assert: MLMatrix zero * MLMatrix zero equals: MLMatrix zero.
	self assert: MLMatrix zero + MLMatrix zero equals: MLMatrix zero.
	self assert: MLMatrix unity * MLMatrix zero equals: MLMatrix zero
]

{ #category : #test }
MLMatrixTest >> testDimension [
	"comment stating purpose of message"

	| m |
	m := self matrixClass new: 3 @ 7.
	self assert: m rowSize equals: 3.
	self assert: m columnSize equals: 7.
	self assert: m dimension equals: 3 @ 7
]

{ #category : #test }
MLMatrixTest >> testIsZero [
	"comment stating purpose of message"
	
	| m |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	self assert: m isZero not
]

{ #category : #test }
MLMatrixTest >> testMatrixMultiplicationDimension [
	"comment stating purpose of message"

	| a b |
	a := self matrixClass withAll: #(#(1 2 3) #(4 5 6)).
	b := self matrixClass withAll: #(#(6 -1) #(3 2) #(0 -3)).
	self assert: (a *~ b) dimension equals: 2 @ 2.
	self assert: (b *~ a) dimension equals: 3 @ 3.
	self assert: (a transposed *~ a) dimension equals: 3 @ 3.
	self assert: (b transposed *~ b) dimension equals: 2 @ 2
]

{ #category : #test }
MLMatrixTest >> testMatrixMultiplicationValues [
	"comment stating purpose of message"

	| a b |
	a := self matrixClass withAll: #(#(1 2 3) #(4 5 6)).
	b := self matrixClass withAll: #(#(6 -1) #(3 2) #(0 -3)).
	self assert: a *~ b equals: (self matrixClass withAll: #(#(12 -6) #(39 -12))).
	self assert: b *~ a equals: (self matrixClass withAll: #(#(2 7 12) #(11 16 21) #(-12 -15 -18))).
	self assert: a transposed *~ a equals: (self matrixClass withAll: #(#(17 22 27) #(22 29 36) #(27 36 45))).
	self assert: b transposed *~ b equals: (self matrixClass withAll: #(#(45 0) #(0 14)))
]

{ #category : #test }
MLMatrixTest >> testMultWithMatrix [
	"comment stating purpose of message"

	| m n mn |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	n := self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)).
	mn := self matrixClass withAll: #(#(10 40) #(90 160) #(250 360)).
	self assert: m * n equals: mn.
	m *= n.
	self assert: m equals: mn.
	self assert: n equals: (self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)))
]

{ #category : #test }
MLMatrixTest >> testMultWithNumber [
	"comment stating purpose of message"

	| m m10 |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	m10 := self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)).
	self assert: m * 10 equals: m10.
	self assert: 10 * m equals: m10.	"no longer Double in Pharo"	"self assert: m * 10.0d = m10.
	self assert: 10.0d * m = m10."
	m *= 10.
	self assert: m equals: m10
]

{ #category : #test }
MLMatrixTest >> testReadDenseTextFrom [
	| matrix text stream |
	matrix := MLArrayMatrix withAll: #(#(2.3 0 4.2) #(0 1.3 2.2) #(3.8 0 0.5) #(0 0 0)).
	text := '4 3\2.3 0 4.2\0 1.3 2.2\3.8 0 0.5\0 0 0\' withCRs.
	stream := ReadStream on: text.
	self assert: matrix equals: (self matrixClass readFromDenseText: stream)
]

{ #category : #test }
MLMatrixTest >> testReadSparseTextFrom [
	| matrix text stream |
	matrix := MLArrayMatrix withAll: #(#(2.3 0 4.2) #(0 1.3 2.2) #(3.8 0 0.5) #(0 0 0)).
	matrix := matrix transposed.
	text := '4 3 6\2\0 2.3\2 3.8\1\1 1.3\3\0 4.2\1 2.2\2 0.5\' withCRs.
	stream := ReadStream on: text.
	self assert: matrix equals: (self matrixClass readFromSparseText: stream)
]

{ #category : #test }
MLMatrixTest >> testRowColumnSize [
	"comment stating purpose of message"

	| m |
	m := self matrixClass rows: 3 columns: 7.
	self assert: m rowSize equals: 3.
	self assert: m columnSize equals: 7.
	self assert: m dimension equals: 3 @ 7
]

{ #category : #test }
MLMatrixTest >> testStoreDenseTextOn [
	| matrix text stream |
	matrix := self matrixClass withAll: #(#(2.3 0 4.2) #(0 1.3 2.2) #(3.8 0 0.5) #(0 0 0)).
	text := '4 3\2.3 0 4.2\0 1.3 2.2\3.8 0 0.5\0 0 0\' withCRs.
	stream := WriteStream on: String new.
	matrix storeDenseTextOn: stream.
	self assert: stream contents equals: text
]

{ #category : #test }
MLMatrixTest >> testStoreSparseTextOn [
	| matrix text stream |
	matrix := self matrixClass withAll: #(#(2.3 0 4.2) #(0 1.3 2.2) #(3.8 0 0.5) #(0 0 0)).
	matrix := matrix transposed.
	text := '4 3 6\2\0 2.3\2 3.8\1\1 1.3\3\0 4.2\1 2.2\2 0.5\' withCRs.
	stream := WriteStream on: String new.
	matrix storeSparseTextOn: stream.
	self assert: stream contents equals: text
]
