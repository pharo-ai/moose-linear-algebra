"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIBooleanVector,
	#superclass : #AIVector,
	#instVars : [
		'bits',
		'size'
	],
	#category : #'AI-MooseLinearAlgebra-Vector'
}

{ #category : #'logical operations' }
AIBooleanVector >> & booleanVector [
	
	[self size = booleanVector size] assert.
	^(self class new: self size)
		setBits: (self getBits bitAnd: booleanVector getBits);
		yourself
]

{ #category : #accessing }
AIBooleanVector >> at: index [
	
	^bits allMask: (1 bitShift: index - 1)
]

{ #category : #accessing }
AIBooleanVector >> at: index put: boolean [
	^ bits := boolean
		ifTrue: [ bits maskSet: 1 << (index - 1) ]
		ifFalse: [ bits maskClear: 1 << (index - 1) ]
]

{ #category : #private }
AIBooleanVector >> bits [
	
	^bits
]

{ #category : #private }
AIBooleanVector >> getBits [
	
	^bits
]

{ #category : #'initialize-release' }
AIBooleanVector >> initializeSize: aSize [
	
	bits := 0.
	size := aSize
]

{ #category : #'logical operations' }
AIBooleanVector >> not [
	
	^(self class new: self size)
		setBits: self getBits bitInvert;
		yourself
]

{ #category : #private }
AIBooleanVector >> setBits: integer [
	
	^bits := integer
]

{ #category : #accessing }
AIBooleanVector >> size [
	
	^size
]

{ #category : #'logical operations' }
AIBooleanVector >> | booleanVector [
	
	[self size = booleanVector size] assert.
	^(self class new: self size)
		setBits: (self getBits bitOr: booleanVector getBits);
		yourself
]
