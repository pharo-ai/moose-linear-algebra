"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLRowMatrix,
	#superclass : #MLMatrix,
	#instVars : [
		'rows'
	],
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #private }
MLRowMatrix class >> onRows: rowCollection [
	| new |
	new := self basicNew.
	new rows: rowCollection asArray.
	[ new checkInvariant ] assert.
	^ new
]

{ #category : #accessing }
MLRowMatrix >> at: row and: column [
	
	^(rows at: row) at: column
]

{ #category : #accessing }
MLRowMatrix >> at: row and: column put: aNumber [
	
	^(rows at: row) at: column put: aNumber
]

{ #category : #private }
MLRowMatrix >> checkInvariant [
	
	^rows isCollection
		and:
			[(rows allSatisfy: [:row | row isKindOf: self vectorSpecies])
				and: [rows allSatisfy: [:row | row size = self columnSize]]]
]

{ #category : #accessing }
MLRowMatrix >> columnSize [
	
	^rows isEmpty
		ifTrue: [0]
		ifFalse: [rows first size]
]

{ #category : #'initialize-release' }
MLRowMatrix >> initializeRows: m columns: n [
	
	rows := Array new: m.
	1
		to: m
		do:
			[:index | 
			rows
				at: index
				put: (self vectorSpecies new: n)]
]

{ #category : #'accessing vectorwise' }
MLRowMatrix >> rowAt: rowIndex [
	
	^rows at: rowIndex
]

{ #category : #accessing }
MLRowMatrix >> rowSize [
	
	^rows size
]

{ #category : #'accessing vectorwise' }
MLRowMatrix >> rows [
	
	^rows
]

{ #category : #accessing }
MLRowMatrix >> rows: anObject [
	rows := anObject
]
