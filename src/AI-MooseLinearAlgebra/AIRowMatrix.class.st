"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIRowMatrix,
	#superclass : #AIMatrix,
	#instVars : [
		'rows'
	],
	#category : #'AI-MooseLinearAlgebra-Matrix'
}

{ #category : #private }
AIRowMatrix class >> onRows: rowCollection [
	| new |
	new := self basicNew.
	new rows: rowCollection asArray.
	[ new checkInvariant ] assert.
	^ new
]

{ #category : #accessing }
AIRowMatrix >> at: row and: column [
	
	^(rows at: row) at: column
]

{ #category : #accessing }
AIRowMatrix >> at: row and: column put: aNumber [
	
	^(rows at: row) at: column put: aNumber
]

{ #category : #private }
AIRowMatrix >> checkInvariant [
	
	^rows isCollection
		and:
			[(rows allSatisfy: [:row | row isKindOf: self vectorSpecies])
				and: [rows allSatisfy: [:row | row size = self columnSize]]]
]

{ #category : #accessing }
AIRowMatrix >> columnSize [
	
	^rows isEmpty
		ifTrue: [0]
		ifFalse: [rows first size]
]

{ #category : #'initialize-release' }
AIRowMatrix >> initializeRows: m columns: n [
	
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
AIRowMatrix >> rowAt: rowIndex [
	
	^rows at: rowIndex
]

{ #category : #accessing }
AIRowMatrix >> rowSize [
	
	^rows size
]

{ #category : #'accessing vectorwise' }
AIRowMatrix >> rows [
	
	^rows
]

{ #category : #accessing }
AIRowMatrix >> rows: anObject [
	rows := anObject
]
