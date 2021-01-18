"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AISymetricMatrix,
	#superclass : #AIMatrix,
	#instVars : [
		'partialColumns'
	],
	#category : #'AI-LinearAlgebra-Matrix'
}

{ #category : #accessing }
AISymetricMatrix >> at: row and: column [
	
	^row < column
		ifTrue: [(partialColumns at: column) at: row]
		ifFalse: [(partialColumns at: row) at: column]
]

{ #category : #accessing }
AISymetricMatrix >> at: row and: column put: aNumber [
	
	^row < column
		ifTrue: [(partialColumns at: column) at: row put: aNumber]
		ifFalse: [(partialColumns at: row) at: column put: aNumber]
]

{ #category : #private }
AISymetricMatrix >> checkInvariant [
	
	^partialColumns isCollection
		and:
			[(partialColumns
				allSatisfy: [:vector | vector isKindOf: self vectorSpecies])
				and:
					[(1 to: self columnSize)
						allSatisfy: [:index | (partialColumns at: index) size = index]]]	"(SymetricMatrix new: 10) checkInvariant"
]

{ #category : #accessing }
AISymetricMatrix >> columnSize [
	
	^partialColumns size
]

{ #category : #'initialize-release' }
AISymetricMatrix >> initializeRows: m columns: n [
	
	m = n ifFalse: [Array new noMatchError].
	partialColumns := Array new: n.
	1
		to: n
		do:
			[:index | 
			partialColumns
				at: index
				put: (self vectorSpecies new: index)]
]

{ #category : #testing }
AISymetricMatrix >> isSquare [
	"Each symatric matrix is square."
	
	^true
]

{ #category : #testing }
AISymetricMatrix >> isSymetric [
	"Each symetric matrix is symatric."
	
	^true
]

{ #category : #accessing }
AISymetricMatrix >> partialColumns [
	^ partialColumns
]

{ #category : #accessing }
AISymetricMatrix >> partialColumns: anObject [
	partialColumns := anObject
]

{ #category : #accessing }
AISymetricMatrix >> rowSize [
	
	^partialColumns size	"since we are square"
]

{ #category : #'matrix functions' }
AISymetricMatrix >> transposed [
	"Answer self, since symatric matrices are invariant under transposition."
	
	^self
]

{ #category : #enumerating }
AISymetricMatrix >> upperTriangleDoWithIndices: aBlock [
	
	1
		to: self columnSize
		do:
			[:column | 
			1
				to: column
				do:
					[:row | 
					aBlock
						value: (self at: row and: column)
						value: row
						value: column]]
]
