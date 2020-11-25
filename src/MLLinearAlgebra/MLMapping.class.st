"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMapping,
	#superclass : #Collection,
	#category : #'MLLinearAlgebra-Mapping'
}

{ #category : #accessing }
MLMapping >> at: name [
	
	^self atKey: (self keyForName: name)
]

{ #category : #accessing }
MLMapping >> at: name ifAbsent: exceptionBlock [
	
	^self
		atKey: (self keyForName: name ifAbsent: exceptionBlock)
		ifAbsent: exceptionBlock
]

{ #category : #accessing }
MLMapping >> at: name ifPresent: unaryBlock [
	
	^unaryBlock
		value:
			(self
				at: name
				ifAbsent: [^self])
]

{ #category : #'accessing - key' }
MLMapping >> atKey: key [
	
	^self
		atKey: key
		ifAbsent: [self error: 'key not found']
]

{ #category : #'accessing - key' }
MLMapping >> atKey: aKey ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #application }
MLMapping >> convertCollection: aSequencableCollection [
	
	| collection |
	collection := aSequencableCollection species new.
	self do: [:index | collection add: (aSequencableCollection at: index)].
	^collection
]

{ #category : #application }
MLMapping >> convertMatrixColumnwise: aMatrix [
	
	^aMatrix species withAll: (MLMappedMatrix on: aMatrix columnMap: self)
]

{ #category : #application }
MLMapping >> convertMatrixRowwise: aMatrix [
	
	^aMatrix species withAll: (MLMappedMatrix on: aMatrix rowMap: self)
]

{ #category : #application }
MLMapping >> convertSquareMatrix: aMatrix [
	
	^aMatrix species withAll: (MLMappedMatrix on: aMatrix map: self)
]

{ #category : #converting }
MLMapping >> derive: aBlock [
	
	| derivate |
	derivate := MLSmartMapping new.
	derivate setParent: self.
	self do: [:index | (aBlock value: index) ifTrue: [derivate add: index]].
	^derivate
]

{ #category : #converting }
MLMapping >> deriveWithNames: names [
	
	| derivate |
	derivate := MLSmartMapping new.
	derivate setParent: self.
	names do: [:name | derivate add: (self keyForName: name)].
	^derivate
]

{ #category : #testing }
MLMapping >> includesIndex: index [
	
	self
		keyOf: index
		ifAbsent: [^false].
	^true
]

{ #category : #testing }
MLMapping >> includesKey: key [
	
	self
		atKey: key
		ifAbsent: [^false].
	^true
]

{ #category : #testing }
MLMapping >> includesName: name [
	
	self
		at: name
		ifAbsent: [^false].
	^true
]

{ #category : #'accessing - name' }
MLMapping >> keyForName: name [
	
	^self
		keyForName: name
		ifAbsent: [self error: 'key not found']
]

{ #category : #'accessing - name' }
MLMapping >> keyForName: name ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #'accessing - key' }
MLMapping >> keyOf: index [
	
	^self
		keyOf: index
		ifAbsent: [self error: 'value not found']
]

{ #category : #'accessing - key' }
MLMapping >> keyOf: anIndex ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #'accessing - key' }
MLMapping >> keys [
	
	^self subclassResponsibility
]

{ #category : #'accessing - name' }
MLMapping >> nameForKey: key [
	
	^self subclassResponsibility
]

{ #category : #'accessing - name' }
MLMapping >> nameOf: index [
	
	^self nameForKey: (self keyOf: index)
]

{ #category : #'accessing - name' }
MLMapping >> nameOf: index ifAbsent: exceptionBlock [
	
	^self nameForKey: (self keyOf: index ifAbsent: exceptionBlock)
]

{ #category : #'accessing - name' }
MLMapping >> names [
	
	^self keys collect: [:key | self nameForKey: key]
]

{ #category : #removing }
MLMapping >> remove: oldObject ifAbsent: anExceptionBlock [
	
	self shouldNotImplement
]

{ #category : #accessing }
MLMapping >> size [
	
	^self subclassResponsibility
]

{ #category : #converting }
MLMapping >> with: aCollection derive: aBlock [
	
	^self derive: [:index | aBlock value: (aCollection at: index)]
]
