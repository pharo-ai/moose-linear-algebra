"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AISmartMapping,
	#superclass : #AINumberMapping,
	#instVars : [
		'parent'
	],
	#category : #'AI-LinearAlgebra-Mapping'
}

{ #category : #'instance creation' }
AISmartMapping class >> on: parent [
	
	^(self new)
		setParent: parent;
		yourself
]

{ #category : #'initialize-release' }
AISmartMapping >> isRoot [
	
	^parent isNil
]

{ #category : #'accessing - name' }
AISmartMapping >> keyForName: name ifAbsent: exceptionBlock [
	
	^name isInteger
		ifTrue: [name]
		ifFalse:
			[self isRoot
				ifTrue: [exceptionBlock value]
				ifFalse:
					[self keyOf: (parent keyForName: name ifAbsent: exceptionBlock)]]
]

{ #category : #'accessing - name' }
AISmartMapping >> nameForKey: key [
	
	^self isRoot
		ifTrue: [self error: 'key not found']
		ifFalse: [parent nameForKey: (self atKey: key)]
]

{ #category : #'initialize-release' }
AISmartMapping >> setParent: mapping [
	
	^parent := mapping
]
