"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIMappedMatrix,
	#superclass : #AIMatrixDecorator,
	#instVars : [
		'columnMap',
		'rowMap'
	],
	#category : #'AI-MooseLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
AIMappedMatrix class >> on: aMatrix [
	
	^self on: aMatrix rowMap: nil columnMap: nil
]

{ #category : #'instance creation' }
AIMappedMatrix class >> on: aMatrix columnMap: columnReindexing [
	
	^self on: aMatrix rowMap: nil columnMap: columnReindexing
]

{ #category : #'instance creation' }
AIMappedMatrix class >> on: aMatrix map: aReindexing [
	
	[aMatrix isSquare] assert.
	^self on: aMatrix rowMap: aReindexing columnMap: aReindexing
]

{ #category : #'instance creation' }
AIMappedMatrix class >> on: aMatrix rowMap: rowReindexing [
	
	^self on: aMatrix rowMap: rowReindexing columnMap: nil
]

{ #category : #'instance creation' }
AIMappedMatrix class >> on: aMatrix rowMap: rowReindexing columnMap: columnReindexing [
	
	^(super on: aMatrix)
		setRowMap: rowReindexing;
		setColumnMap: columnReindexing;
		yourself
]

{ #category : #accessing }
AIMappedMatrix >> at: row and: column [
	
	^matrix
		at: (rowMap at: row)
		and: (columnMap at: column)
]

{ #category : #accessing }
AIMappedMatrix >> at: row and: column put: aNumber [
	
	^matrix
		at: (rowMap at: row)
		and: (columnMap at: column)
		put: aNumber
]

{ #category : #accessing }
AIMappedMatrix >> columnSize [
	
	^columnMap size
]

{ #category : #accessing }
AIMappedMatrix >> rowSize [
	
	^rowMap size
]

{ #category : #'initialize-release' }
AIMappedMatrix >> setColumnMap: mapping [
	
	columnMap := mapping ifNil: [AINumberMapping new: matrix columnSize]
]

{ #category : #'initialize-release' }
AIMappedMatrix >> setRowMap: mapping [
	
	rowMap := mapping ifNil: [AINumberMapping new: matrix rowSize]
]
