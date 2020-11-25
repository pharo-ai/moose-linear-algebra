"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLColumnMatrix,
	#superclass : #MLMatrix,
	#instVars : [
		'columns'
	],
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
MLColumnMatrix class >> onColumns: columnCollection [
	| new |
	new := self basicNew.
	new columns: columnCollection asArray.
	[ new checkInvariant ] assert.
	^ new
]

{ #category : #accessing }
MLColumnMatrix >> at: row and: column [
	
	^(columns at: column) at: row
]

{ #category : #accessing }
MLColumnMatrix >> at: row and: column put: aNumber [
	
	^(columns at: column) at: row put: aNumber
]

{ #category : #private }
MLColumnMatrix >> checkInvariant [
	
	^columns isCollection
		and:
			[(columns allSatisfy: [:vector | vector isKindOf: self vectorSpecies])
				and: [columns allSatisfy: [:vector | vector size = self rowSize]]]
]

{ #category : #'accessing vectorwise' }
MLColumnMatrix >> columnAt: column [
	
	^columns at: column
]

{ #category : #accessing }
MLColumnMatrix >> columnSize [
	
	^columns size
]

{ #category : #'accessing vectorwise' }
MLColumnMatrix >> columns [
	
	^columns
]

{ #category : #accessing }
MLColumnMatrix >> columns: anObject [
	columns := anObject
]

{ #category : #'initialize-release' }
MLColumnMatrix >> initializeRows: m columns: n [
	
	columns := Array new: n.
	1
		to: n
		do:
			[:index | 
			columns
				at: index
				put: (self vectorSpecies new: m)]
]

{ #category : #accessing }
MLColumnMatrix >> rowSize [
	
	^columns isEmpty
		ifTrue: [0]
		ifFalse: [columns last size]
]
