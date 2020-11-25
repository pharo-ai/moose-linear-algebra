"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMatrixPath,
	#superclass : #MLVector,
	#instVars : [
		'matrix',
		'mapBlock',
		'size'
	],
	#category : #'MLLinearAlgebra-Vector'
}

{ #category : #'instance creation' }
MLMatrixPath class >> column: columnIndex on: matrix [
	
	^(self new: matrix rowSize)
		setMatrix: matrix;
		setMapBlock: [:index | index @ columnIndex];
		yourself
]

{ #category : #'instance creation' }
MLMatrixPath class >> diagonalOn: matrix [
	
	[matrix isSquare] assert.
	^(self new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [:index | index @ index];
		yourself
]

{ #category : #'instance creation' }
MLMatrixPath class >> row: rowIndex on: matrix [
	
	^(self new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [:index | rowIndex @ index];
		yourself
]

{ #category : #accessing }
MLMatrixPath >> at: index [
	
	^matrix atPoint: (mapBlock value: index)
]

{ #category : #accessing }
MLMatrixPath >> at: index put: aNumber [
	
	^matrix
		atPoint: (mapBlock value: index)
		put: aNumber
]

{ #category : #'initialize-release' }
MLMatrixPath >> initializeSize: aSize [
	
	^size := aSize
]

{ #category : #'initialize-release' }
MLMatrixPath >> setMapBlock: aBlock [
	
	^mapBlock := aBlock
]

{ #category : #'initialize-release' }
MLMatrixPath >> setMatrix: aMatrix [
	
	^matrix := aMatrix
]

{ #category : #accessing }
MLMatrixPath >> size [
	
	^size
]

{ #category : #'initialize-release' }
MLMatrixPath >> species [
	
	^matrix vectorSpecies
]
