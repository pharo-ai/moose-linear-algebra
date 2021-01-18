"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIVectorCoercion,
	#superclass : #AIVector,
	#instVars : [
		'number'
	],
	#category : #'AI-LinearAlgebra-Vector'
}

{ #category : #'initialize-release' }
AIVectorCoercion class >> with: aNumber [
	
	^(aNumber isKindOf: AIVector)
		ifTrue: [aNumber]
		ifFalse:
			[(self basicNew)
				setNumber: aNumber;
				yourself]
]

{ #category : #converting }
AIVectorCoercion >> asNumber [
	
	^number
]

{ #category : #accessing }
AIVectorCoercion >> at: index [
	
	^number
]

{ #category : #testing }
AIVectorCoercion >> hasSize: aSize [
	
	^true
]

{ #category : #'initialize-release' }
AIVectorCoercion >> initializeSize: aSize [
	
	^self noDimensionError
]

{ #category : #private }
AIVectorCoercion >> noDimensionError [
	
	^self error: 'Coerced matrices do not have dimension.'
]

{ #category : #printing }
AIVectorCoercion >> printOn: aStream [
	
	aStream
		print: self class;
		nextPutAll: ' with: ';
		print: number
]

{ #category : #'initialize-release' }
AIVectorCoercion >> setNumber: aNumber [
	
	^number := aNumber
]

{ #category : #accessing }
AIVectorCoercion >> size [
	
	^self noDimensionError
]

{ #category : #'mathematical functions' }
AIVectorCoercion >> sum [
	
	^self noDimensionError
]

{ #category : #private }
AIVectorCoercion >> switch: matrix caseCoercion: coercionBlock caseVector: vectorBlock [
	
	^(matrix isKindOf: AIVectorCoercion)
		ifTrue: [coercionBlock value]
		ifFalse: [vectorBlock value]
]

{ #category : #enumerating }
AIVectorCoercion >> with: vector affect: aBlock [
	
	^self
		switch: vector
		caseCoercion:
			[number := aBlock
				value: number
				value: vector asNumber]
		caseVector: [self error]
]

{ #category : #enumerating }
AIVectorCoercion >> with: vector collect: aBlock [
	
	^self
		switch: vector
		caseCoercion:
			[AIMatrixCoercion
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
AIVectorCoercion >> with: vector do: aBlock [
	
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
