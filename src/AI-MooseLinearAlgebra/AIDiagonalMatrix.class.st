"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIDiagonalMatrix,
	#superclass : #AISymetricMatrix,
	#category : #'AI-MooseLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
AIDiagonalMatrix class >> withDiagonal: vector [
	
	| newMatrix |
	newMatrix := self new: vector size.
	1
		to: vector size
		do:
			[:index | 
			newMatrix
				at: index
				and: index
				put: (vector at: index)].
	^newMatrix
]

{ #category : #accessing }
AIDiagonalMatrix >> at: row and: column [
	
	^row = column
		ifTrue: [partialColumns at: column]
		ifFalse: [0]
]

{ #category : #accessing }
AIDiagonalMatrix >> at: row and: column put: aNumber [
	
	^row = column
		ifTrue: [partialColumns at: column put: aNumber]
		ifFalse:
			[aNumber isZero
				ifFalse:
					[self error: ('can not put <1p> off diagonal' expandMacrosWith: aNumber)].
			aNumber]
]

{ #category : #private }
AIDiagonalMatrix >> checkInvariant [
	
	^partialColumns isCollection	"(DiagonalMatrix new: 10) checkInvariant"
]

{ #category : #'initialize-release' }
AIDiagonalMatrix >> initializeRows: m columns: n [
	
	m = n ifFalse: [Array new noMatchError].
	partialColumns := Array new: m.
	^self
]
