"
SparseVector has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables:
	contents	<(ArrayList of: (Association | Attribute | CodeComponentProperty | DeferredBinding | IndexedVariable | KeyedElement | LabelAndValue | NamedVariable | SetElement | SourceMapEntry | VariableBinding)) | (OrderedCollection of: (Association | Attribute | CodeComponentProperty | DeferredBinding | IndexedVariable | KeyedElement | LabelAndValue | NamedVariable | SetElement | SourceMapEntry | VariableBinding))>	description of contents
	size	<ArithmeticValue | CPointer | Matrix | Rectangle | String | Vector>	description of size


"
Class {
	#name : #AISparseVector,
	#superclass : #AIVector,
	#instVars : [
		'size',
		'contents'
	],
	#category : #'AI-MooseLinearAlgebra-Vector'
}

{ #category : #adding }
AISparseVector >> addLast [
	
	size := size + 1
]

{ #category : #accessing }
AISparseVector >> at: anIndex [
	
	| spot |
	spot := self internalIndexOf: anIndex.
	^spot > 0
		ifTrue: [(contents at: spot) value]
		ifFalse: [0]
]

{ #category : #accessing }
AISparseVector >> at: anIndex put: aNumber [
	
	aNumber isZero
		ifTrue: [self removeValueAt: anIndex]
		ifFalse: [self setValue: aNumber at: anIndex].
	^aNumber
]

{ #category : #enumerating }
AISparseVector >> collect: aBlock [
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
AISparseVector >> distByAngle: aVector [
	
	^1 - (self cosine: aVector)
]

{ #category : #enumerating }
AISparseVector >> doSparseWithIndex: aBlock [
	
	contents
		do:
			[:each | 
			aBlock
				value: each value
				value: each key]
]

{ #category : #'vector functions' }
AISparseVector >> dotProduct: aVector [
	
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
AISparseVector >> initializeContents: anAssociationArray [
	
	contents := anAssociationArray
]

{ #category : #'initialize-release' }
AISparseVector >> initializeSize: aSize [
	size := aSize.
	contents := OrderedCollection new
]

{ #category : #private }
AISparseVector >> internalIndexOf: anIndex [
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
AISparseVector >> removeValueAt: anIndex [
	
	| spot |
	spot := self internalIndexOf: anIndex.
	spot > 0 ifTrue: [contents removeIndex: spot]
]

{ #category : #private }
AISparseVector >> setValue: aNumber at: anIndex [
	
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
AISparseVector >> size [
	
	^size
]

{ #category : #accessing }
AISparseVector >> sparseSize [
	
	^contents size
]

{ #category : #'mathematical functions' }
AISparseVector >> sum [
	
	^contents
		inject: 0
		into: [:sum :each | sum + each value]
]
