"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLVectorDecorator,
	#superclass : #MLVector,
	#instVars : [
		'vector'
	],
	#category : #'MLLinearAlgebra-Vector'
}

{ #category : #'instance creation' }
MLVectorDecorator class >> on: aVector [
	
	^(self basicNew)
		setVector: aVector asVector;
		yourself
]

{ #category : #accessing }
MLVectorDecorator >> at: index [
	
	^vector at: index
]

{ #category : #accessing }
MLVectorDecorator >> at: index put: aNumber [
	
	^vector at: index put: aNumber
]

{ #category : #'initialize-release' }
MLVectorDecorator >> initializeSize: aSize [
	
	^self shouldNotImplement
]

{ #category : #'initialize-release' }
MLVectorDecorator >> setVector: aVector [
	
	^vector := aVector
]

{ #category : #accessing }
MLVectorDecorator >> size [
	
	^vector size
]

{ #category : #private }
MLVectorDecorator >> species [
	
	^vector species
]
