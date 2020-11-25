"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLAccumulator,
	#superclass : #Object,
	#instVars : [
		'accumulateBlock',
		'size',
		'value',
		'index'
	],
	#category : #'MLLinearAlgebra-Accumulator'
}

{ #category : #'instance creation' }
MLAccumulator class >> extreme [
	
	^self
		value: 0
		using:
			[:extreme :each | 
			extreme abs > each abs
				ifTrue: [extreme]
				ifFalse: [each]]
]

{ #category : #'instance creation' }
MLAccumulator class >> maximum [
	
	^self
		value: MLUnlimited negative
		using: [:max :each | max max: each]
]

{ #category : #'instance creation' }
MLAccumulator class >> minimum [
	
	^self
		value: MLUnlimited positive
		using: [:min :each | min min: each]
]

{ #category : #'instance creation' }
MLAccumulator class >> new [
	
	self shouldNotImplement
]

{ #category : #'instance creation' }
MLAccumulator class >> squaredSum [
	
	^self
		value: 0
		using: [:sum :each | sum + each squared]
]

{ #category : #'instance creation' }
MLAccumulator class >> sum [
	
	^self
		value: 0
		using: [:sum :each | sum + each]
]

{ #category : #'instance creation' }
MLAccumulator class >> using: anAccumulationBlock [
	
	^self
		value: Number zero
		using: anAccumulationBlock
]

{ #category : #'instance creation' }
MLAccumulator class >> value: initialValue using: anAccumulationBlock [
	
	^(self basicNew)
		setAccumulateBlock: anAccumulationBlock;
		resetValue: initialValue;
		yourself
]

{ #category : #accumulate }
MLAccumulator >> accumulate: aValue [
	
	size := size + 1.
	^value := accumulateBlock value: value value: aValue
]

{ #category : #accumulate }
MLAccumulator >> accumulate: aValue withIndex: anIndex [
	size := size + 1.
	^ value = (value := accumulateBlock value: value value: aValue)
		ifFalse: [ index := anIndex ]
]

{ #category : #accumulate }
MLAccumulator >> add: aValue [
	
	^self accumulate: aValue
]

{ #category : #accessing }
MLAccumulator >> average [
	
	^value / size
]

{ #category : #accumulate }
MLAccumulator >> enumerate: aCollection [
	
	aCollection do: [:each | self accumulate: each].
	^value
]

{ #category : #accumulate }
MLAccumulator >> enumerate: aCollection atAll: indices [
	
	indices do: [:key | self accumulate: (aCollection at: key)].
	^value
]

{ #category : #accumulate }
MLAccumulator >> enumerate: aMatrix atAll: rowIndices andAll: columnIndices [
	
	rowIndices
		do:
			[:row | 
			columnIndices
				do: [:column | self accumulate: (aMatrix at: row and: column)]].
	^value
]

{ #category : #accumulate }
MLAccumulator >> enumerateWithIndex: aSequencableCollection [
	
	aSequencableCollection
		doWithIndex: [:each :index0 | self accumulate: each withIndex: index0].
	^value
]

{ #category : #accumulate }
MLAccumulator >> from: start to: end do: aBlock [
	
	start
		to: end
		do: [:each | self accumulate: (aBlock value: each)].
	^value
]

{ #category : #accessing }
MLAccumulator >> index [
	
	^index
]

{ #category : #'initialize-release' }
MLAccumulator >> merge: anAccumulator [
	
	size := size + anAccumulator size.
	^self
		accumulate: anAccumulator value
		withIndex: anAccumulator index
]

{ #category : #'initialize-release' }
MLAccumulator >> resetValue: aValue [
	
	size := 0.
	index := nil.
	value := aValue
]

{ #category : #'initialize-release' }
MLAccumulator >> setAccumulateBlock: aBlock [
	
	accumulateBlock := aBlock
]

{ #category : #'initialize-release' }
MLAccumulator >> setValue: aValue [
	size := 0.
	^ value
]

{ #category : #accessing }
MLAccumulator >> size [
	
	^size
]

{ #category : #accumulate }
MLAccumulator >> upTo: end do: aBlock [
	
	^self from: 1 to: end do: aBlock
]

{ #category : #accessing }
MLAccumulator >> value [
	
	^value
]
