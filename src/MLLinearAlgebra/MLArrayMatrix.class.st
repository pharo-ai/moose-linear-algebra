"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLArrayMatrix,
	#superclass : #MLMatrix,
	#instVars : [
		'array',
		'columnSize',
		'rowSize'
	],
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #accessing }
MLArrayMatrix >> at: row and: column [
	
	^array at: (row - 1) * self columnSize + column
]

{ #category : #accessing }
MLArrayMatrix >> at: row and: column put: aNumber [
	
	^array
		at: (row - 1) * self columnSize + column
		put: aNumber
]

{ #category : #private }
MLArrayMatrix >> checkInvariant [
	
	^array isCollection and: [(array size = rowSize) * columnSize]
]

{ #category : #accessing }
MLArrayMatrix >> columnSize [
	
	^columnSize
]

{ #category : #'initialize-release' }
MLArrayMatrix >> initializeRows: n columns: m [
	
	rowSize := n.
	columnSize := m.
	array := Array new: n * m.
	^self
]

{ #category : #accessing }
MLArrayMatrix >> rowSize [
	
	^rowSize
]
