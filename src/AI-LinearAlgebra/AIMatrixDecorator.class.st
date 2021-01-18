"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIMatrixDecorator,
	#superclass : #AIMatrix,
	#instVars : [
		'matrix'
	],
	#category : #'AI-LinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
AIMatrixDecorator class >> on: aMatrix [
	
	^(self basicNew)
		setMatrix: aMatrix;
		yourself
]

{ #category : #accessing }
AIMatrixDecorator >> at: row and: column [
	
	^matrix at: row and: column
]

{ #category : #accessing }
AIMatrixDecorator >> at: row and: column put: aNumber [
	
	^matrix at: row and: column put: aNumber
]

{ #category : #private }
AIMatrixDecorator >> checkInvariant [
	
	^matrix checkInvariant
]

{ #category : #accessing }
AIMatrixDecorator >> columnSize [
	
	^matrix columnSize
]

{ #category : #'initialize-release' }
AIMatrixDecorator >> initializeRows: m columns: n [
	
	self shouldNotImplement
]

{ #category : #accessing }
AIMatrixDecorator >> rowSize [
	
	^matrix rowSize
]

{ #category : #'initialize-release' }
AIMatrixDecorator >> setMatrix: aMatrix [
	
	^matrix := aMatrix
]

{ #category : #'initialize-release' }
AIMatrixDecorator >> species [
	
	^matrix species
]
