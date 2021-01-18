"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIMatrixCoercionTest,
	#superclass : #TestCase,
	#category : #'AI-LinearAlgebra-Tests'
}

{ #category : #test }
AIMatrixCoercionTest >> testFloat [
	
	| m n |
	m := AIColumnMatrix
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
AIMatrixCoercionTest >> testFraction [
	
	| m n |
	m := AIColumnMatrix
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
AIMatrixCoercionTest >> testInteger [
	
	| m n |
	m := AIColumnMatrix
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
AIMatrixCoercionTest >> testLargeInteger [
	
	| m n |
	m := AIColumnMatrix
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
AIMatrixCoercionTest >> testPoint [
	
	| m n |
	m := AIColumnMatrix
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
