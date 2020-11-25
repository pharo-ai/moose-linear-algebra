"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMatrixCoercionTest,
	#superclass : #TestCase,
	#category : #'MLLinearAlgebra-Tests'
}

{ #category : #test }
MLMatrixCoercionTest >> testFloat [
	
	| m n |
	m := MLColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2.0.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]

{ #category : #test }
MLMatrixCoercionTest >> testFraction [
	
	| m n |
	m := MLColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 1 / 2.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]

{ #category : #test }
MLMatrixCoercionTest >> testInteger [
	
	| m n |
	m := MLColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]

{ #category : #test }
MLMatrixCoercionTest >> testLargeInteger [
	
	| m n |
	m := MLColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2000000000000.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]

{ #category : #test }
MLMatrixCoercionTest >> testPoint [
	
	| m n |
	m := MLColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2 @ 2.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]
