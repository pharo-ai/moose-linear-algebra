"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLVectorCoercion,
	#superclass : #MLVector,
	#instVars : [
		'number'
	],
	#category : #'MLLinearAlgebra-Vector'
}

{ #category : #'initialize-release' }
MLVectorCoercion class >> with: aNumber [
	
	^(aNumber isKindOf: MLVector)
		ifTrue: [aNumber]
		ifFalse:
			[(self basicNew)
				setNumber: aNumber;
				yourself]
]

{ #category : #converting }
MLVectorCoercion >> asNumber [
	
	^number
]

{ #category : #accessing }
MLVectorCoercion >> at: index [
	
	^number
]

{ #category : #testing }
MLVectorCoercion >> hasSize: aSize [
	
	^true
]

{ #category : #'initialize-release' }
MLVectorCoercion >> initializeSize: aSize [
	
	^self noDimensionError
]

{ #category : #private }
MLVectorCoercion >> noDimensionError [
	
	^self error: 'Coerced matrices do not have dimension.'
]

{ #category : #printing }
MLVectorCoercion >> printOn: aStream [
	
	aStream
		print: self class;
		nextPutAll: ' with: ';
		print: number
]

{ #category : #'initialize-release' }
MLVectorCoercion >> setNumber: aNumber [
	
	^number := aNumber
]

{ #category : #accessing }
MLVectorCoercion >> size [
	
	^self noDimensionError
]

{ #category : #'mathematical functions' }
MLVectorCoercion >> sum [
	
	^self noDimensionError
]

{ #category : #private }
MLVectorCoercion >> switch: matrix caseCoercion: coercionBlock caseVector: vectorBlock [
	
	^(matrix isKindOf: MLVectorCoercion)
		ifTrue: [coercionBlock value]
		ifFalse: [vectorBlock value]
]

{ #category : #enumerating }
MLVectorCoercion >> with: vector affect: aBlock [
	
	^self
		switch: vector
		caseCoercion:
			[number := aBlock
				value: number
				value: vector asNumber]
		caseVector: [self error]
]

{ #category : #enumerating }
MLVectorCoercion >> with: vector collect: aBlock [
	
	^self
		switch: vector
		caseCoercion:
			[MLMatrixCoercion
				with:
					(aBlock
						value: number
						value: vector asNumber)]
		caseVector:
			[vector
				with: self
				collect: [:a :b | aBlock value: b value: a]]
]

{ #category : #enumerating }
MLVectorCoercion >> with: vector do: aBlock [
	
	^self
		switch: vector
		caseCoercion:
			[aBlock
				value: number
				value: vector asNumber]
		caseVector:
			[vector
				with: self
				do: [:a :b | aBlock value: b value: a]]
]
