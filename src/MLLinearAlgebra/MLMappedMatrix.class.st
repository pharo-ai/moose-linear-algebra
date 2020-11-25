"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMappedMatrix,
	#superclass : #MLMatrixDecorator,
	#instVars : [
		'columnMap',
		'rowMap'
	],
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
MLMappedMatrix class >> on: aMatrix [
	
	^self on: aMatrix rowMap: nil columnMap: nil
]

{ #category : #'instance creation' }
MLMappedMatrix class >> on: aMatrix columnMap: columnReindexing [
	
	^self on: aMatrix rowMap: nil columnMap: columnReindexing
]

{ #category : #'instance creation' }
MLMappedMatrix class >> on: aMatrix map: aReindexing [
	
	[aMatrix isSquare] assert.
	^self on: aMatrix rowMap: aReindexing columnMap: aReindexing
]

{ #category : #'instance creation' }
MLMappedMatrix class >> on: aMatrix rowMap: rowReindexing [
	
	^self on: aMatrix rowMap: rowReindexing columnMap: nil
]

{ #category : #'instance creation' }
MLMappedMatrix class >> on: aMatrix rowMap: rowReindexing columnMap: columnReindexing [
	
	^(super on: aMatrix)
		setRowMap: rowReindexing;
		setColumnMap: columnReindexing;
		yourself
]

{ #category : #accessing }
MLMappedMatrix >> at: row and: column [
	
	^matrix
		at: (rowMap at: row)
		and: (columnMap at: column)
]

{ #category : #accessing }
MLMappedMatrix >> at: row and: column put: aNumber [
	
	^matrix
		at: (rowMap at: row)
		and: (columnMap at: column)
		put: aNumber
]

{ #category : #accessing }
MLMappedMatrix >> columnSize [
	
	^columnMap size
]

{ #category : #accessing }
MLMappedMatrix >> rowSize [
	
	^rowMap size
]

{ #category : #'initialize-release' }
MLMappedMatrix >> setColumnMap: mapping [
	
	columnMap := mapping ifNil: [MLNumberMapping new: matrix columnSize]
]

{ #category : #'initialize-release' }
MLMappedMatrix >> setRowMap: mapping [
	
	rowMap := mapping ifNil: [MLNumberMapping new: matrix rowSize]
]
