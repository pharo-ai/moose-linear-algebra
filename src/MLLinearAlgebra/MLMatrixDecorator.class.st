"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMatrixDecorator,
	#superclass : #MLMatrix,
	#instVars : [
		'matrix'
	],
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
MLMatrixDecorator class >> on: aMatrix [
	
	^(self basicNew)
		setMatrix: aMatrix;
		yourself
]

{ #category : #accessing }
MLMatrixDecorator >> at: row and: column [
	
	^matrix at: row and: column
]

{ #category : #accessing }
MLMatrixDecorator >> at: row and: column put: aNumber [
	
	^matrix at: row and: column put: aNumber
]

{ #category : #private }
MLMatrixDecorator >> checkInvariant [
	
	^matrix checkInvariant
]

{ #category : #accessing }
MLMatrixDecorator >> columnSize [
	
	^matrix columnSize
]

{ #category : #'initialize-release' }
MLMatrixDecorator >> initializeRows: m columns: n [
	
	self shouldNotImplement
]

{ #category : #accessing }
MLMatrixDecorator >> rowSize [
	
	^matrix rowSize
]

{ #category : #'initialize-release' }
MLMatrixDecorator >> setMatrix: aMatrix [
	
	^matrix := aMatrix
]

{ #category : #'initialize-release' }
MLMatrixDecorator >> species [
	
	^matrix species
]
