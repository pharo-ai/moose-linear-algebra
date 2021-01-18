"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIArrayMatrix,
	#superclass : #AIMatrix,
	#instVars : [
		'array',
		'columnSize',
		'rowSize'
	],
	#category : #'AI-LinearAlgebra-Matrix'
}

{ #category : #accessing }
AIArrayMatrix >> at: row and: column [
	
	^array at: (row - 1) * self columnSize + column
]

{ #category : #accessing }
AIArrayMatrix >> at: row and: column put: aNumber [
	
	^array
		at: (row - 1) * self columnSize + column
		put: aNumber
]

{ #category : #private }
AIArrayMatrix >> checkInvariant [
	
	^array isCollection and: [(array size = rowSize) * columnSize]
]

{ #category : #accessing }
AIArrayMatrix >> columnSize [
	
	^columnSize
]

{ #category : #'initialize-release' }
AIArrayMatrix >> initializeRows: n columns: m [
	
	rowSize := n.
	columnSize := m.
	array := Array new: n * m.
	^self
]

{ #category : #accessing }
AIArrayMatrix >> rowSize [
	
	^rowSize
]
