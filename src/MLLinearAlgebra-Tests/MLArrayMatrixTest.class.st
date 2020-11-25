"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLArrayMatrixTest,
	#superclass : #MLMatrixTest,
	#category : #'MLLinearAlgebra-Tests'
}

{ #category : #fixture }
MLArrayMatrixTest >> matrixClass [
	
	^MLArrayMatrix
]

{ #category : #test }
MLArrayMatrixTest >> testDeterminant [
	| matrix |
	matrix := MLArrayMatrix rows: 3 columns: 3.
	self assertBlock: [ matrix determinant ] raises: AssertionFailure.
	matrix := MLArrayMatrix rows: 2 columns: 2 withAll: #(3 6 9 2).
	self assert: matrix determinant equals: -48
]
