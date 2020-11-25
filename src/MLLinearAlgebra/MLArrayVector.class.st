"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLArrayVector,
	#superclass : #MLVector,
	#type : #variable,
	#category : #'MLLinearAlgebra-Vector'
}

{ #category : #'instance creation' }
MLArrayVector class >> new: size [
	
	^self basicNew: size
]

{ #category : #accessing }
MLArrayVector >> at: index [
	
	^self basicAt: index
]

{ #category : #accessing }
MLArrayVector >> at: index put: aNumber [
	
	^self basicAt: index put: aNumber
]

{ #category : #accessing }
MLArrayVector >> size [
	
	^self basicSize
]
