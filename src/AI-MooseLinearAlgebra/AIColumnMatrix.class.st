"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIColumnMatrix,
	#superclass : #AIMatrix,
	#instVars : [
		'columns'
	],
	#category : #'AI-MooseLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
AIColumnMatrix class >> onColumns: columnCollection [
	| new |
	new := self basicNew.
	new columns: columnCollection asArray.
	[ new checkInvariant ] assert.
	^ new
]

{ #category : #accessing }
AIColumnMatrix >> at: row and: column [
	
	^(columns at: column) at: row
]

{ #category : #accessing }
AIColumnMatrix >> at: row and: column put: aNumber [
	
	^(columns at: column) at: row put: aNumber
]

{ #category : #private }
AIColumnMatrix >> checkInvariant [
	
	^columns isCollection
		and:
			[(columns allSatisfy: [:vector | vector isKindOf: self vectorSpecies])
				and: [columns allSatisfy: [:vector | vector size = self rowSize]]]
]

{ #category : #'accessing vectorwise' }
AIColumnMatrix >> columnAt: column [
	
	^columns at: column
]

{ #category : #accessing }
AIColumnMatrix >> columnSize [
	
	^columns size
]

{ #category : #'accessing vectorwise' }
AIColumnMatrix >> columns [
	
	^columns
]

{ #category : #accessing }
AIColumnMatrix >> columns: anObject [
	columns := anObject
]

{ #category : #'initialize-release' }
AIColumnMatrix >> initializeRows: m columns: n [
	
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
AIColumnMatrix >> rowSize [
	
	^columns isEmpty
		ifTrue: [0]
		ifFalse: [columns last size]
]
