"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIVectorDecorator,
	#superclass : #AIVector,
	#instVars : [
		'vector'
	],
	#category : #'AI-LinearAlgebra-Vector'
}

{ #category : #'instance creation' }
AIVectorDecorator class >> on: aVector [
	
	^(self basicNew)
		setVector: aVector asVector;
		yourself
]

{ #category : #accessing }
AIVectorDecorator >> at: index [
	
	^vector at: index
]

{ #category : #accessing }
AIVectorDecorator >> at: index put: aNumber [
	
	^vector at: index put: aNumber
]

{ #category : #'initialize-release' }
AIVectorDecorator >> initializeSize: aSize [
	
	^self shouldNotImplement
]

{ #category : #'initialize-release' }
AIVectorDecorator >> setVector: aVector [
	
	^vector := aVector
]

{ #category : #accessing }
AIVectorDecorator >> size [
	
	^vector size
]

{ #category : #private }
AIVectorDecorator >> species [
	
	^vector species
]
