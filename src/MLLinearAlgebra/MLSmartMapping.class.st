"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLSmartMapping,
	#superclass : #MLNumberMapping,
	#instVars : [
		'parent'
	],
	#category : #'MLLinearAlgebra-Mapping'
}

{ #category : #'instance creation' }
MLSmartMapping class >> on: parent [
	
	^(self new)
		setParent: parent;
		yourself
]

{ #category : #'initialize-release' }
MLSmartMapping >> isRoot [
	
	^parent isNil
]

{ #category : #'accessing - name' }
MLSmartMapping >> keyForName: name ifAbsent: exceptionBlock [
	
	^name isInteger
		ifTrue: [name]
		ifFalse:
			[self isRoot
				ifTrue: [exceptionBlock value]
				ifFalse:
					[self keyOf: (parent keyForName: name ifAbsent: exceptionBlock)]]
]

{ #category : #'accessing - name' }
MLSmartMapping >> nameForKey: key [
	
	^self isRoot
		ifTrue: [self error: 'key not found']
		ifFalse: [parent nameForKey: (self atKey: key)]
]

{ #category : #'initialize-release' }
MLSmartMapping >> setParent: mapping [
	
	^parent := mapping
]
