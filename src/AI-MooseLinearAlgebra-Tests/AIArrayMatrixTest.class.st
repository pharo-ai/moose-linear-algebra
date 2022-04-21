"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIArrayMatrixTest,
	#superclass : #AIMatrixTest,
	#category : #'AI-MooseLinearAlgebra-Tests'
}

{ #category : #fixture }
AIArrayMatrixTest >> matrixClass [
	
	^AIArrayMatrix
]

{ #category : #test }
AIArrayMatrixTest >> testDeterminant [
	| matrix |
	matrix := AIArrayMatrix rows: 3 columns: 3.
	self assertBlock: [ matrix determinant ] raises: AssertionFailure.
	matrix := AIArrayMatrix rows: 2 columns: 2 withAll: #(3 6 9 2).
	self assert: matrix determinant equals: -48
]
