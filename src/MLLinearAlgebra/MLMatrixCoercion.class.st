"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMatrixCoercion,
	#superclass : #MLMatrix,
	#instVars : [
		'number'
	],
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #'initialize-release' }
MLMatrixCoercion class >> with: aNumber [
	
	^(aNumber isKindOf: MLMatrix)
		ifTrue: [aNumber]
		ifFalse:
			[(self basicNew)
				setNumber: aNumber;
				yourself]
]

{ #category : #comparing }
MLMatrixCoercion >> = matrix [
	
	^self
		switch: matrix
		caseCoercion: [number = matrix asNumber]
		caseMatrix: [matrix = self]
]

{ #category : #converting }
MLMatrixCoercion >> asNumber [
	
	^number
]

{ #category : #accessing }
MLMatrixCoercion >> at: row and: column [
	
	^number
]

{ #category : #private }
MLMatrixCoercion >> checkInvariant [
	
	^number respondsToArithmetic
]

{ #category : #accessing }
MLMatrixCoercion >> columnSize [
	
	self noDimensionError
]

{ #category : #testing }
MLMatrixCoercion >> hasDimension: aDimension [
	
	^true
]

{ #category : #'initialize-release' }
MLMatrixCoercion >> initializeRows: m columns: n [
	
	^self noDimensionError
]

{ #category : #private }
MLMatrixCoercion >> noDimensionError [
	
	^self error: 'Coerced matrices do not have dimension.'
]

{ #category : #printing }
MLMatrixCoercion >> printOn: aStream [
	"Append to the argument aStream a sequence of characters that identifies the matrix."
	
	aStream
		print: self class;
		nextPutAll: ' with: ';
		print: number
]

{ #category : #accessing }
MLMatrixCoercion >> rowSize [
	
	self noDimensionError
]

{ #category : #'initialize-release' }
MLMatrixCoercion >> setNumber: aNumber [
	
	^number := aNumber
]

{ #category : #private }
MLMatrixCoercion >> switch: matrix caseCoercion: coercionBlock caseMatrix: matrixBlock [
	
	^(matrix isKindOf: MLMatrixCoercion)
		ifTrue: [coercionBlock value]
		ifFalse: [matrixBlock value]
]

{ #category : #enumerating }
MLMatrixCoercion >> with: matrix affect: aBlock [
	
	^self
		switch: matrix
		caseCoercion:
			[number := aBlock
				value: number
				value: matrix asNumber]
		caseMatrix: [self error]
]

{ #category : #enumerating }
MLMatrixCoercion >> with: matrix collect: aBlock [
	
	^self
		switch: matrix
		caseCoercion:
			[MLMatrixCoercion
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
MLMatrixCoercion >> with: matrix do: aBlock [
	
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
