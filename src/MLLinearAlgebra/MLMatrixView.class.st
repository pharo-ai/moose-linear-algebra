"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMatrixView,
	#superclass : #MLMatrixDecorator,
	#instVars : [
		'rowSize',
		'columnSize',
		'mapBlock'
	],
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
MLMatrixView class >> from: top to: bottom on: matrix [
	
	^(self new: bottom - top + 1)
		setMatrix: matrix;
		setMapBlock: [:row :column | row @ column - top + 1];
		yourself
]

{ #category : #'As yet unclassified' }
MLMatrixView class >> fromColumn: start to: end on: matrix [
	
	^self
		from: 1
		to: matrix rowSize @ end
		on: matrix
]

{ #category : #'instance creation' }
MLMatrixView class >> transposeOn: matrix [
	
	^(self new: matrix dimension transpose)
		setMatrix: matrix;
		setMapBlock: [:row :column | column @ row];
		yourself
]

{ #category : #accessing }
MLMatrixView >> at: row and: column [
	
	^matrix atPoint: (mapBlock value: row value: column)
]

{ #category : #accessing }
MLMatrixView >> at: row and: column put: aNumber [
	
	self noModificationError
]

{ #category : #accessing }
MLMatrixView >> columnSize [
	
	^columnSize
]

{ #category : #'initialize-release' }
MLMatrixView >> initializeRows: m columns: n [
	
	rowSize := m.
	columnSize := n
]

{ #category : #accessing }
MLMatrixView >> rowSize [
	
	^rowSize
]

{ #category : #'initialize-release' }
MLMatrixView >> setMapBlock: block [
	
	^mapBlock := block
]
