"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AINameMapping,
	#superclass : #AIMapping,
	#instVars : [
		'names',
		'comparisonBlock'
	],
	#category : #'AI-MooseLinearAlgebra-Mapping'
}

{ #category : #'instance creation' }
AINameMapping class >> new [
	^ super new
		forEquality;
		yourself
]

{ #category : #'instance creation' }
AINameMapping class >> newUsing: aComparisonBlock [
	^ self new
		initialize;
		setComparisonBlock: aComparisonBlock;
		yourself
]

{ #category : #adding }
AINameMapping >> add: name [
	
	(self includesName: name) ifTrue: [self error].
	names addLast: name.
	^self size
]

{ #category : #accessing }
AINameMapping >> atKey: key ifAbsent: exceptionBlock [
	
	^(key
		between: 1
		and: self size)
		ifTrue: [key]
		ifFalse: [exceptionBlock value]
]

{ #category : #enumerating }
AINameMapping >> do: aBlock [
	
	1
		to: self size
		do: [:each | aBlock value: each]
]

{ #category : #'initialize-release' }
AINameMapping >> forEquality [
	
	self setComparisonBlock: [:a :b | a = b]
]

{ #category : #'initialize-release' }
AINameMapping >> forIdentity [
	
	self setComparisonBlock: [:a :b | a == b]
]

{ #category : #testing }
AINameMapping >> includesName: name [
	
	^names anySatisfy: [:each | comparisonBlock value: each value: name]
]

{ #category : #'initialize-release' }
AINameMapping >> initialize [
	
	names := OrderedCollection new
]

{ #category : #'accessing - name' }
AINameMapping >> keyForName: name ifAbsent: exceptionBlock [
	^ name isInteger
		ifTrue: [ name ]
		ifFalse: [ | idx |
			idx := names findFirst: [ :each | comparisonBlock value: name value: each ].
			idx isZero
				ifTrue: [ exceptionBlock value ].
			^ idx ]
]

{ #category : #accessing }
AINameMapping >> keyOf: anIndex ifAbsent: exceptionBlock [
	
	^self atKey: anIndex ifAbsent: exceptionBlock
]

{ #category : #'accessing - name' }
AINameMapping >> keys [
	
	^names
]

{ #category : #'accessing - name' }
AINameMapping >> nameForKey: key [
	
	^names at: key
]

{ #category : #'accessing - name' }
AINameMapping >> names [
	
	^names
]

{ #category : #'initialize-release' }
AINameMapping >> setComparisonBlock: aComparisonBlock [
	
	^comparisonBlock := aComparisonBlock
]

{ #category : #accessing }
AINameMapping >> size [
	
	^names size
]
