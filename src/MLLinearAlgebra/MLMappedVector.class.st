"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMappedVector,
	#superclass : #MLVectorDecorator,
	#instVars : [
		'indices'
	],
	#category : #'MLLinearAlgebra-Vector'
}

{ #category : #'instance creation' }
MLMappedVector class >> on: aVector [
	
	^self on: aVector indices: nil
]

{ #category : #'instance creation' }
MLMappedVector class >> on: aVector indices: aReindexing [
	
	^(super on: aVector)
		setIndices: aReindexing;
		yourself
]

{ #category : #accessing }
MLMappedVector >> at: anIndex [
	
	^vector at: (indices at: anIndex)
]

{ #category : #accessing }
MLMappedVector >> at: anIndex put: aNumber [
	
	^vector
		at: (indices at: anIndex)
		put: aNumber
]

{ #category : #'initialize-release' }
MLMappedVector >> setIndices: aReindexing [
	
	indices := aReindexing ifNil: [MLNumberMapping new: vector size]
]

{ #category : #accessing }
MLMappedVector >> size [
	
	^indices size
]
