"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLUnboundedMatrix,
	#superclass : #MLMatrixDecorator,
	#instVars : [
		'backgroundValue'
	],
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #'instance creation' }
MLUnboundedMatrix class >> on: matrix with: defaultValue [
	
	^(self on: matrix)
		backgroundValue: defaultValue;
		yourself
]

{ #category : #'initialize-release' }
MLUnboundedMatrix >> at: row and: column [
	
	^[matrix at: row and: column]
		on: "SubscriptOutOfBoundsError" Error
		do: [:ex | backgroundValue]
]

{ #category : #'initialize-release' }
MLUnboundedMatrix >> at: row and: column put: aNumber [
	
	^[matrix at: row and: column put: aNumber]
		on: "SubscriptOutOfBoundsError" Error
		do: [:ex | backgroundValue]
]

{ #category : #accessing }
MLUnboundedMatrix >> backgroundValue [
	
	^backgroundValue
]

{ #category : #accessing }
MLUnboundedMatrix >> backgroundValue: anObject [
	
	backgroundValue := anObject
]
