"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIMappedVector,
	#superclass : #AIVectorDecorator,
	#instVars : [
		'indices'
	],
	#category : #'AI-MooseLinearAlgebra-Vector'
}

{ #category : #'instance creation' }
AIMappedVector class >> on: aVector [
	
	^self on: aVector indices: nil
]

{ #category : #'instance creation' }
AIMappedVector class >> on: aVector indices: aReindexing [
	
	^(super on: aVector)
		setIndices: aReindexing;
		yourself
]

{ #category : #accessing }
AIMappedVector >> at: anIndex [
	
	^vector at: (indices at: anIndex)
]

{ #category : #accessing }
AIMappedVector >> at: anIndex put: aNumber [
	
	^vector
		at: (indices at: anIndex)
		put: aNumber
]

{ #category : #'initialize-release' }
AIMappedVector >> setIndices: aReindexing [
	
	indices := aReindexing ifNil: [AINumberMapping new: vector size]
]

{ #category : #accessing }
AIMappedVector >> size [
	
	^indices size
]
