"
SparseVector has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables:
	contents	<(ArrayList of: (Association | Attribute | CodeComponentProperty | DeferredBinding | IndexedVariable | KeyedElement | LabelAndValue | NamedVariable | SetElement | SourceMapEntry | VariableBinding)) | (OrderedCollection of: (Association | Attribute | CodeComponentProperty | DeferredBinding | IndexedVariable | KeyedElement | LabelAndValue | NamedVariable | SetElement | SourceMapEntry | VariableBinding))>	description of contents
	size	<ArithmeticValue | CPointer | Matrix | Rectangle | String | Vector>	description of size


"
Class {
	#name : #MLSparseVector,
	#superclass : #MLVector,
	#instVars : [
		'size',
		'contents'
	],
	#category : #'MLLinearAlgebra-Vector'
}

{ #category : #adding }
MLSparseVector >> addLast [
	
	size := size + 1
]

{ #category : #accessing }
MLSparseVector >> at: anIndex [
	
	| spot |
	spot := self internalIndexOf: anIndex.
	^spot > 0
		ifTrue: [(contents at: spot) value]
		ifFalse: [0]
]

{ #category : #accessing }
MLSparseVector >> at: anIndex put: aNumber [
	
	aNumber isZero
		ifTrue: [self removeValueAt: anIndex]
		ifFalse: [self setValue: aNumber at: anIndex].
	^aNumber
]

{ #category : #enumerating }
MLSparseVector >> collect: aBlock [
	"Evaluate aBlock with each of the values of the receiver as the  
	argument.  Collect the resulting values into a collection that is like 
	the receiver.  Answer the new collection."
	
	| newCollection newContents |
	newCollection := self species withSize: self size.
	newContents := contents
		collect: [:each | each key -> (aBlock value: each value)].
	newCollection initializeContents: newContents.
	^newCollection
]

{ #category : #'vector functions' }
MLSparseVector >> distByAngle: aVector [
	
	^1 - (self cosine: aVector)
]

{ #category : #enumerating }
MLSparseVector >> doSparseWithIndex: aBlock [
	
	contents
		do:
			[:each | 
			aBlock
				value: each value
				value: each key]
]

{ #category : #'vector functions' }
MLSparseVector >> dotProduct: aVector [
	
	| sum otherValueBlock |
	(aVector hasSize: self size) ifFalse: [^self noMatchError].
	sum := 0.
	otherValueBlock := aVector == self
		ifTrue: [[:each :index | each]]
		ifFalse: [[:each :index | aVector at: index]].
	self
		doSparseWithIndex:
			[:each :index | sum := sum + (each * (otherValueBlock value: each value: index))].
	^sum
]

{ #category : #'initialize-release' }
MLSparseVector >> initializeContents: anAssociationArray [
	
	contents := anAssociationArray
]

{ #category : #'initialize-release' }
MLSparseVector >> initializeSize: aSize [
	size := aSize.
	contents := OrderedCollection new
]

{ #category : #private }
MLSparseVector >> internalIndexOf: anIndex [
	"Searchs for the internal index of anIndex with O(log n) using binary search, returns
	either the internal index of anIndex or, if anIndex is not found, the negated internal 
	index to be used for insertion."
	
	| mid low high index0 |
	low := 1.
	high := contents size.
	[mid := (high + low) // 2.
	low > high]
		whileFalse:
			[index0 := contents at: mid.
			index0 key <= anIndex
				ifTrue:
					[index0 key = anIndex
						ifTrue: [^mid]
						ifFalse: [low := mid + 1]]
				ifFalse: [high := mid - 1]].
	^low negated
]

{ #category : #private }
MLSparseVector >> removeValueAt: anIndex [
	
	| spot |
	spot := self internalIndexOf: anIndex.
	spot > 0 ifTrue: [contents removeIndex: spot]
]

{ #category : #private }
MLSparseVector >> setValue: aNumber at: anIndex [
	
	| spot |
	spot := self internalIndexOf: anIndex.
	spot > 0
		ifTrue: [(contents at: spot) value: aNumber]
		ifFalse:
			[contents
				add: anIndex -> aNumber
				beforeIndex: spot negated]
]

{ #category : #accessing }
MLSparseVector >> size [
	
	^size
]

{ #category : #accessing }
MLSparseVector >> sparseSize [
	
	^contents size
]

{ #category : #'mathematical functions' }
MLSparseVector >> sum [
	
	^contents
		inject: 0
		into: [:sum :each | sum + each value]
]
