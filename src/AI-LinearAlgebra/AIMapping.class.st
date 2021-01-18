"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIMapping,
	#superclass : #Collection,
	#category : #'AI-LinearAlgebra-Mapping'
}

{ #category : #accessing }
AIMapping >> at: name [
	
	^self atKey: (self keyForName: name)
]

{ #category : #accessing }
AIMapping >> at: name ifAbsent: exceptionBlock [
	
	^self
		atKey: (self keyForName: name ifAbsent: exceptionBlock)
		ifAbsent: exceptionBlock
]

{ #category : #accessing }
AIMapping >> at: name ifPresent: unaryBlock [
	
	^unaryBlock
		value:
			(self
				at: name
				ifAbsent: [^self])
]

{ #category : #'accessing - key' }
AIMapping >> atKey: key [
	
	^self
		atKey: key
		ifAbsent: [self error: 'key not found']
]

{ #category : #'accessing - key' }
AIMapping >> atKey: aKey ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #application }
AIMapping >> convertCollection: aSequencableCollection [
	
	| collection |
	collection := aSequencableCollection species new.
	self do: [:index | collection add: (aSequencableCollection at: index)].
	^collection
]

{ #category : #application }
AIMapping >> convertMatrixColumnwise: aMatrix [
	
	^aMatrix species withAll: (AIMappedMatrix on: aMatrix columnMap: self)
]

{ #category : #application }
AIMapping >> convertMatrixRowwise: aMatrix [
	
	^aMatrix species withAll: (AIMappedMatrix on: aMatrix rowMap: self)
]

{ #category : #application }
AIMapping >> convertSquareMatrix: aMatrix [
	
	^aMatrix species withAll: (AIMappedMatrix on: aMatrix map: self)
]

{ #category : #converting }
AIMapping >> derive: aBlock [
	
	| derivate |
	derivate := AISmartMapping new.
	derivate setParent: self.
	self do: [:index | (aBlock value: index) ifTrue: [derivate add: index]].
	^derivate
]

{ #category : #converting }
AIMapping >> deriveWithNames: names [
	
	| derivate |
	derivate := AISmartMapping new.
	derivate setParent: self.
	names do: [:name | derivate add: (self keyForName: name)].
	^derivate
]

{ #category : #testing }
AIMapping >> includesIndex: index [
	
	self
		keyOf: index
		ifAbsent: [^false].
	^true
]

{ #category : #testing }
AIMapping >> includesKey: key [
	
	self
		atKey: key
		ifAbsent: [^false].
	^true
]

{ #category : #testing }
AIMapping >> includesName: name [
	
	self
		at: name
		ifAbsent: [^false].
	^true
]

{ #category : #'accessing - name' }
AIMapping >> keyForName: name [
	
	^self
		keyForName: name
		ifAbsent: [self error: 'key not found']
]

{ #category : #'accessing - name' }
AIMapping >> keyForName: name ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #'accessing - key' }
AIMapping >> keyOf: index [
	
	^self
		keyOf: index
		ifAbsent: [self error: 'value not found']
]

{ #category : #'accessing - key' }
AIMapping >> keyOf: anIndex ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #'accessing - key' }
AIMapping >> keys [
	
	^self subclassResponsibility
]

{ #category : #'accessing - name' }
AIMapping >> nameForKey: key [
	
	^self subclassResponsibility
]

{ #category : #'accessing - name' }
AIMapping >> nameOf: index [
	
	^self nameForKey: (self keyOf: index)
]

{ #category : #'accessing - name' }
AIMapping >> nameOf: index ifAbsent: exceptionBlock [
	
	^self nameForKey: (self keyOf: index ifAbsent: exceptionBlock)
]

{ #category : #'accessing - name' }
AIMapping >> names [
	
	^self keys collect: [:key | self nameForKey: key]
]

{ #category : #removing }
AIMapping >> remove: oldObject ifAbsent: anExceptionBlock [
	
	self shouldNotImplement
]

{ #category : #accessing }
AIMapping >> size [
	
	^self subclassResponsibility
]

{ #category : #converting }
AIMapping >> with: aCollection derive: aBlock [
	
	^self derive: [:index | aBlock value: (aCollection at: index)]
]
