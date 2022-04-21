"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIUnboundedMatrix,
	#superclass : #AIMatrixDecorator,
	#instVars : [
		'backgroundValue'
	],
	#category : #'AI-MooseLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
AIUnboundedMatrix class >> on: matrix with: defaultValue [
	
	^(self on: matrix)
		backgroundValue: defaultValue;
		yourself
]

{ #category : #'initialize-release' }
AIUnboundedMatrix >> at: row and: column [
	
	^[matrix at: row and: column]
		on: "SubscriptOutOfBoundsError" Error
		do: [:ex | backgroundValue]
]

{ #category : #'initialize-release' }
AIUnboundedMatrix >> at: row and: column put: aNumber [
	
	^[matrix at: row and: column put: aNumber]
		on: "SubscriptOutOfBoundsError" Error
		do: [:ex | backgroundValue]
]

{ #category : #accessing }
AIUnboundedMatrix >> backgroundValue [
	
	^backgroundValue
]

{ #category : #accessing }
AIUnboundedMatrix >> backgroundValue: anObject [
	
	backgroundValue := anObject
]
