"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLNameMapping,
	#superclass : #MLMapping,
	#instVars : [
		'names',
		'comparisonBlock'
	],
	#category : #'MLLinearAlgebra-Mapping'
}

{ #category : #'instance creation' }
MLNameMapping class >> new [
	^ super new
		forEquality;
		yourself
]

{ #category : #'instance creation' }
MLNameMapping class >> newUsing: aComparisonBlock [
	^ self new
		initialize;
		setComparisonBlock: aComparisonBlock;
		yourself
]

{ #category : #adding }
MLNameMapping >> add: name [
	
	(self includesName: name) ifTrue: [self error].
	names addLast: name.
	^self size
]

{ #category : #accessing }
MLNameMapping >> atKey: key ifAbsent: exceptionBlock [
	
	^(key
		between: 1
		and: self size)
		ifTrue: [key]
		ifFalse: [exceptionBlock value]
]

{ #category : #enumerating }
MLNameMapping >> do: aBlock [
	
	1
		to: self size
		do: [:each | aBlock value: each]
]

{ #category : #'initialize-release' }
MLNameMapping >> forEquality [
	
	self setComparisonBlock: [:a :b | a = b]
]

{ #category : #'initialize-release' }
MLNameMapping >> forIdentity [
	
	self setComparisonBlock: [:a :b | a == b]
]

{ #category : #testing }
MLNameMapping >> includesName: name [
	
	^names anySatisfy: [:each | comparisonBlock value: each value: name]
]

{ #category : #'initialize-release' }
MLNameMapping >> initialize [
	
	names := OrderedCollection new
]

{ #category : #'accessing - name' }
MLNameMapping >> keyForName: name ifAbsent: exceptionBlock [
	^ name isInteger
		ifTrue: [ name ]
		ifFalse: [ | idx |
			idx := names findFirst: [ :each | comparisonBlock value: name value: each ].
			idx isZero
				ifTrue: [ exceptionBlock value ].
			^ idx ]
]

{ #category : #accessing }
MLNameMapping >> keyOf: anIndex ifAbsent: exceptionBlock [
	
	^self atKey: anIndex ifAbsent: exceptionBlock
]

{ #category : #'accessing - name' }
MLNameMapping >> keys [
	
	^names
]

{ #category : #'accessing - name' }
MLNameMapping >> nameForKey: key [
	
	^names at: key
]

{ #category : #'accessing - name' }
MLNameMapping >> names [
	
	^names
]

{ #category : #'initialize-release' }
MLNameMapping >> setComparisonBlock: aComparisonBlock [
	
	^comparisonBlock := aComparisonBlock
]

{ #category : #accessing }
MLNameMapping >> size [
	
	^names size
]
