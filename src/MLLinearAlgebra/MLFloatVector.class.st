"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLFloatVector,
	#superclass : #MLVector,
	#type : #variable,
	#category : #'MLLinearAlgebra-Vector'
}

{ #category : #'instance creation' }
MLFloatVector class >> new: size [
	
	^self basicNew: size "<< 2"
]

{ #category : #accessing }
MLFloatVector >> at: anIndex [
	
	"^self floatAt: (anIndex bitShift: 2) - 3"
	^ (self basicAt: anIndex) 
]

{ #category : #accessing }
MLFloatVector >> at: anIndex put: aNumber [
	
	"^self
		floatAt: (anIndex bitShift: 2) - 3
		put: aNumber asFloat"
		
	^ self basicAt: anIndex put: aNumber asFloat
]

{ #category : #private }
MLFloatVector >> floatAt: byteIndex [
	
	<primitive: 548>
	^self primitiveFailed

]

{ #category : #private }
MLFloatVector >> floatAt: byteIndex put: float [
	
	<primitive: 549>
	^self primitiveFailed
	

]

{ #category : #accessing }
MLFloatVector >> size [
	
	^self basicSize" >> 2"
]
