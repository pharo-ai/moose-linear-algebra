"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIArrayVector,
	#superclass : #AIVector,
	#type : #variable,
	#category : #'AI-LinearAlgebra-Vector'
}

{ #category : #'instance creation' }
AIArrayVector class >> new: size [
	
	^self basicNew: size
]

{ #category : #accessing }
AIArrayVector >> at: index [
	
	^self basicAt: index
]

{ #category : #accessing }
AIArrayVector >> at: index put: aNumber [
	
	^self basicAt: index put: aNumber
]

{ #category : #accessing }
AIArrayVector >> size [
	
	^self basicSize
]
