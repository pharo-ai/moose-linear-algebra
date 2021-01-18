"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIFloatVector,
	#superclass : #AIVector,
	#type : #variable,
	#category : #'AI-LinearAlgebra-Vector'
}

{ #category : #'instance creation' }
AIFloatVector class >> new: size [
	
	^self basicNew: size "<< 2"
]

{ #category : #accessing }
AIFloatVector >> at: anIndex [
	
	"^self floatAt: (anIndex bitShift: 2) - 3"
	^ (self basicAt: anIndex) 
]

{ #category : #accessing }
AIFloatVector >> at: anIndex put: aNumber [
	
	"^self
		floatAt: (anIndex bitShift: 2) - 3
		put: aNumber asFloat"
		
	^ self basicAt: anIndex put: aNumber asFloat
]

{ #category : #private }
AIFloatVector >> floatAt: byteIndex [
	
	<primitive: 548>
	^self primitiveFailed

]

{ #category : #private }
AIFloatVector >> floatAt: byteIndex put: float [
	
	<primitive: 549>
	^self primitiveFailed
	

]

{ #category : #accessing }
AIFloatVector >> size [
	
	^self basicSize" >> 2"
]
