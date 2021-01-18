"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIAccumulator,
	#superclass : #Object,
	#instVars : [
		'accumulateBlock',
		'size',
		'value',
		'index'
	],
	#category : #'AI-LinearAlgebra-Accumulator'
}

{ #category : #'instance creation' }
AIAccumulator class >> extreme [
	
	^self
		value: 0
		using:
			[:extreme :each | 
			extreme abs > each abs
				ifTrue: [extreme]
				ifFalse: [each]]
]

{ #category : #'instance creation' }
AIAccumulator class >> maximum [
	
	^self
		value: AIUnlimited negative
		using: [:max :each | max max: each]
]

{ #category : #'instance creation' }
AIAccumulator class >> minimum [
	
	^self
		value: AIUnlimited positive
		using: [:min :each | min min: each]
]

{ #category : #'instance creation' }
AIAccumulator class >> new [
	
	self shouldNotImplement
]

{ #category : #'instance creation' }
AIAccumulator class >> squaredSum [
	
	^self
		value: 0
		using: [:sum :each | sum + each squared]
]

{ #category : #'instance creation' }
AIAccumulator class >> sum [
	
	^self
		value: 0
		using: [:sum :each | sum + each]
]

{ #category : #'instance creation' }
AIAccumulator class >> using: anAccumulationBlock [
	
	^self
		value: Number zero
		using: anAccumulationBlock
]

{ #category : #'instance creation' }
AIAccumulator class >> value: initialValue using: anAccumulationBlock [
	
	^(self basicNew)
		setAccumulateBlock: anAccumulationBlock;
		resetValue: initialValue;
		yourself
]

{ #category : #accumulate }
AIAccumulator >> accumulate: aValue [
	
	size := size + 1.
	^value := accumulateBlock value: value value: aValue
]

{ #category : #accumulate }
AIAccumulator >> accumulate: aValue withIndex: anIndex [
	size := size + 1.
	^ value = (value := accumulateBlock value: value value: aValue)
		ifFalse: [ index := anIndex ]
]

{ #category : #accumulate }
AIAccumulator >> add: aValue [
	
	^self accumulate: aValue
]

{ #category : #accessing }
AIAccumulator >> average [
	
	^value / size
]

{ #category : #accumulate }
AIAccumulator >> enumerate: aCollection [
	
	aCollection do: [:each | self accumulate: each].
	^value
]

{ #category : #accumulate }
AIAccumulator >> enumerate: aCollection atAll: indices [
	
	indices do: [:key | self accumulate: (aCollection at: key)].
	^value
]

{ #category : #accumulate }
AIAccumulator >> enumerate: aMatrix atAll: rowIndices andAll: columnIndices [
	
	rowIndices
		do:
			[:row | 
			columnIndices
				do: [:column | self accumulate: (aMatrix at: row and: column)]].
	^value
]

{ #category : #accumulate }
AIAccumulator >> enumerateWithIndex: aSequencableCollection [
	
	aSequencableCollection
		doWithIndex: [:each :index0 | self accumulate: each withIndex: index0].
	^value
]

{ #category : #accumulate }
AIAccumulator >> from: start to: end do: aBlock [
	
	start
		to: end
		do: [:each | self accumulate: (aBlock value: each)].
	^value
]

{ #category : #accessing }
AIAccumulator >> index [
	
	^index
]

{ #category : #'initialize-release' }
AIAccumulator >> merge: anAccumulator [
	
	size := size + anAccumulator size.
	^self
		accumulate: anAccumulator value
		withIndex: anAccumulator index
]

{ #category : #'initialize-release' }
AIAccumulator >> resetValue: aValue [
	
	size := 0.
	index := nil.
	value := aValue
]

{ #category : #'initialize-release' }
AIAccumulator >> setAccumulateBlock: aBlock [
	
	accumulateBlock := aBlock
]

{ #category : #'initialize-release' }
AIAccumulator >> setValue: aValue [
	size := 0.
	^ value
]

{ #category : #accessing }
AIAccumulator >> size [
	
	^size
]

{ #category : #accumulate }
AIAccumulator >> upTo: end do: aBlock [
	
	^self from: 1 to: end do: aBlock
]

{ #category : #accessing }
AIAccumulator >> value [
	
	^value
]
