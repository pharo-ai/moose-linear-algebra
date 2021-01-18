"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIMatrixPath,
	#superclass : #AIVector,
	#instVars : [
		'matrix',
		'mapBlock',
		'size'
	],
	#category : #'AI-LinearAlgebra-Vector'
}

{ #category : #'instance creation' }
AIMatrixPath class >> column: columnIndex on: matrix [
	
	^(self new: matrix rowSize)
		setMatrix: matrix;
		setMapBlock: [:index | index @ columnIndex];
		yourself
]

{ #category : #'instance creation' }
AIMatrixPath class >> diagonalOn: matrix [
	
	[matrix isSquare] assert.
	^(self new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [:index | index @ index];
		yourself
]

{ #category : #'instance creation' }
AIMatrixPath class >> row: rowIndex on: matrix [
	
	^(self new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [:index | rowIndex @ index];
		yourself
]

{ #category : #accessing }
AIMatrixPath >> at: index [
	
	^matrix atPoint: (mapBlock value: index)
]

{ #category : #accessing }
AIMatrixPath >> at: index put: aNumber [
	
	^matrix
		atPoint: (mapBlock value: index)
		put: aNumber
]

{ #category : #'initialize-release' }
AIMatrixPath >> initializeSize: aSize [
	
	^size := aSize
]

{ #category : #'initialize-release' }
AIMatrixPath >> setMapBlock: aBlock [
	
	^mapBlock := aBlock
]

{ #category : #'initialize-release' }
AIMatrixPath >> setMatrix: aMatrix [
	
	^matrix := aMatrix
]

{ #category : #accessing }
AIMatrixPath >> size [
	
	^size
]

{ #category : #'initialize-release' }
AIMatrixPath >> species [
	
	^matrix vectorSpecies
]
