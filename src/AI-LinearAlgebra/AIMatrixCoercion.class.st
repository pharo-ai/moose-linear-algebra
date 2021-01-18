"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIMatrixCoercion,
	#superclass : #AIMatrix,
	#instVars : [
		'number'
	],
	#category : #'AI-LinearAlgebra-Matrix'
}

{ #category : #'initialize-release' }
AIMatrixCoercion class >> with: aNumber [
	
	^(aNumber isKindOf: AIMatrix)
		ifTrue: [aNumber]
		ifFalse:
			[(self basicNew)
				setNumber: aNumber;
				yourself]
]

{ #category : #comparing }
AIMatrixCoercion >> = matrix [
	
	^self
		switch: matrix
		caseCoercion: [number = matrix asNumber]
		caseMatrix: [matrix = self]
]

{ #category : #converting }
AIMatrixCoercion >> asNumber [
	
	^number
]

{ #category : #accessing }
AIMatrixCoercion >> at: row and: column [
	
	^number
]

{ #category : #private }
AIMatrixCoercion >> checkInvariant [
	
	^number respondsToArithmetic
]

{ #category : #accessing }
AIMatrixCoercion >> columnSize [
	
	self noDimensionError
]

{ #category : #testing }
AIMatrixCoercion >> hasDimension: aDimension [
	
	^true
]

{ #category : #'initialize-release' }
AIMatrixCoercion >> initializeRows: m columns: n [
	
	^self noDimensionError
]

{ #category : #private }
AIMatrixCoercion >> noDimensionError [
	
	^self error: 'Coerced matrices do not have dimension.'
]

{ #category : #printing }
AIMatrixCoercion >> printOn: aStream [
	"Append to the argument aStream a sequence of characters that identifies the matrix."
	
	aStream
		print: self class;
		nextPutAll: ' with: ';
		print: number
]

{ #category : #accessing }
AIMatrixCoercion >> rowSize [
	
	self noDimensionError
]

{ #category : #'initialize-release' }
AIMatrixCoercion >> setNumber: aNumber [
	
	^number := aNumber
]

{ #category : #private }
AIMatrixCoercion >> switch: matrix caseCoercion: coercionBlock caseMatrix: matrixBlock [
	
	^(matrix isKindOf: AIMatrixCoercion)
		ifTrue: [coercionBlock value]
		ifFalse: [matrixBlock value]
]

{ #category : #enumerating }
AIMatrixCoercion >> with: matrix affect: aBlock [
	
	^self
		switch: matrix
		caseCoercion:
			[number := aBlock
				value: number
				value: matrix asNumber]
		caseMatrix: [self error]
]

{ #category : #enumerating }
AIMatrixCoercion >> with: matrix collect: aBlock [
	
	^self
		switch: matrix
		caseCoercion:
			[AIMatrixCoercion
				with:
					(aBlock
						value: number
						value: matrix asNumber)]
		caseMatrix:
			[matrix
				with: self
				collect: [:a :b | aBlock value: b value: a]]
]

{ #category : #enumerating }
AIMatrixCoercion >> with: matrix do: aBlock [
	
	^self
		switch: matrix
		caseCoercion:
			[aBlock
				value: number
				value: matrix asNumber]
		caseMatrix:
			[matrix
				with: self
				do: [:a :b | aBlock value: b value: a]]
]
