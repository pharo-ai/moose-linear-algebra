"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIMatrixView,
	#superclass : #AIMatrixDecorator,
	#instVars : [
		'rowSize',
		'columnSize',
		'mapBlock'
	],
	#category : #'AI-MooseLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
AIMatrixView class >> from: top to: bottom on: matrix [
	
	^(self new: bottom - top + 1)
		setMatrix: matrix;
		setMapBlock: [:row :column | row @ column - top + 1];
		yourself
]

{ #category : #'As yet unclassified' }
AIMatrixView class >> fromColumn: start to: end on: matrix [
	
	^self
		from: 1
		to: matrix rowSize @ end
		on: matrix
]

{ #category : #'instance creation' }
AIMatrixView class >> transposeOn: matrix [
	
	^(self new: matrix dimension transpose)
		setMatrix: matrix;
		setMapBlock: [:row :column | column @ row];
		yourself
]

{ #category : #accessing }
AIMatrixView >> at: row and: column [
	
	^matrix atPoint: (mapBlock value: row value: column)
]

{ #category : #accessing }
AIMatrixView >> at: row and: column put: aNumber [
	
	self noModificationError
]

{ #category : #accessing }
AIMatrixView >> columnSize [
	
	^columnSize
]

{ #category : #'initialize-release' }
AIMatrixView >> initializeRows: m columns: n [
	
	rowSize := m.
	columnSize := n
]

{ #category : #accessing }
AIMatrixView >> rowSize [
	
	^rowSize
]

{ #category : #'initialize-release' }
AIMatrixView >> setMapBlock: block [
	
	^mapBlock := block
]
