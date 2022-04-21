"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIVector,
	#superclass : #ArrayedCollection,
	#category : #'AI-MooseLinearAlgebra-Vector'
}

{ #category : #accessing }
AIVector class >> browserIcon [
"Answer icon to be displayed with matrix classes."
	
	^ nil
]

{ #category : #'instance creation' }
AIVector class >> new [
	
	^self new: 0
]

{ #category : #'instance creation' }
AIVector class >> new: aSize [
	
	^(self basicNew)
		initializeSize: aSize;
		yourself
]

{ #category : #'instance creation' }
AIVector class >> new: aSize withAll: value [
	
	^(self new: aSize)
		atAllPut: value;
		yourself
]

{ #category : #'instance creation' }
AIVector class >> readFromDenseText: aStream [
	
	| size vector |
	size := Integer readFrom: aStream skipSeparators.
	vector := self new: size.
	1
		to: size
		do:
			[:index | 
			vector
				at: index
				"put: (Number readSmalltalkAndCSyntaxFrom: aStream skipSeparators)"
				put: (Number readFrom: aStream skipSeparators)].
	^vector
]

{ #category : #'constants access' }
AIVector class >> unity [
	
	^AIVectorCoercion with: 1
]

{ #category : #'instance creation' }
AIVector class >> withAll: aCollection [
	
	^(self new: aCollection size)
		atAllPut: aCollection;
		yourself
]

{ #category : #'constants access' }
AIVector class >> zero [
	
	^AIVectorCoercion with: 0
]

{ #category : #arithmetic }
AIVector >> * aNumber [
	
	^aNumber productFromVector: self
]

{ #category : #arithmetic }
AIVector >> *= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a * b]
]

{ #category : #arithmetic }
AIVector >> + aNumber [
	
	^aNumber sumFromVector: self
]

{ #category : #arithmetic }
AIVector >> += aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a + b]
]

{ #category : #arithmetic }
AIVector >> - aNumber [
	
	^aNumber differenceFromVector: self
]

{ #category : #arithmetic }
AIVector >> -= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a - b]
]

{ #category : #arithmetic }
AIVector >> / aNumber [
	
	^aNumber quotientFromVector: self
]

{ #category : #arithmetic }
AIVector >> /= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a / b]
]

{ #category : #comparing }
AIVector >> < aMagnitude [
	
	self error: 'Vectors are not ordered'
]

{ #category : #comparing }
AIVector >> = vector [
	
	^self == vector
		or:
			[(vector isKindOf: AIVector)
				and:
					[(vector hasSize: self size)
						and:
							[self
								with: vector
								do: [:a :b | a = b ifFalse: [^false]].
							true]]]
]

{ #category : #converting }
AIVector >> asVector [
	
	^self
]

{ #category : #accessing }
AIVector >> at: index [
	
	^self subclassResponsibility
]

{ #category : #arithmetic }
AIVector >> at: index add: aNumber [
	
	^self
		at: index
		put: (self at: index) + aNumber
]

{ #category : #accessing }
AIVector >> at: index ifNilPut: aBlock [
	"Answer the value at anIndex.  If the value is nil, set it to be
	the result of evaluating valueBlock, and answer that value."
	
	^(self at: index)
		ifNil:
			[self
				at: index
				put: aBlock value]
]

{ #category : #accessing }
AIVector >> at: index put: aNumber [
	
	^self subclassResponsibility
]

{ #category : #accessing }
AIVector >> atAllPut: collection [
	collection isCollection
		ifTrue: [ self with: collection affect: [ :a :b | b ] ]
		ifFalse: [ super atAllPut: collection ]
]

{ #category : #coercing }
AIVector >> coerce: aNumber [
	
	^AIVectorCoercion with: aNumber
]

{ #category : #copying }
AIVector >> copyEmpty [
	
	^self copyEmpty: self size
]

{ #category : #copying }
AIVector >> copyEmpty: size [
	
	^self species new: size
]

{ #category : #'vector functions' }
AIVector >> cosine: aVector [
	
	^self unitVector dotProduct: aVector unitVector
]

{ #category : #copying }
AIVector >> deepCopy [
	
	^self species withAll: self
]

{ #category : #private }
AIVector >> defaultElement [
	
	^Float zero
]

{ #category : #'double dispatching' }
AIVector >> differenceFromDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> differenceFromFixedPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> differenceFromFloat: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> differenceFromFraction: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> differenceFromInteger: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> differenceFromNumber: aNumber [
	
	^self collect: [:b | aNumber - b]
]

{ #category : #'double dispatching' }
AIVector >> differenceFromPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> differenceFromSmallDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> differenceFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a - b]
]

{ #category : #'vector functions' }
AIVector >> dist: aVector [
	
	| sum |
	sum := 0.
	self
		with: aVector
		do: [:a :b | sum := sum + ((a - b) ** 2)].
	^sum
]

{ #category : #enumerating }
AIVector >> doSparseWithIndex: aBlock [
	
	self
		doWithIndex:
			[:each :index | each isZero ifFalse: [aBlock value: each value: index]].
	^self
]

{ #category : #'vector functions' }
AIVector >> dotProduct: aVector [
	"comment stating purpose of message"
	
	| sum |
	(aVector hasSize: self size) ifFalse: [^self noMatchError].
	sum := 0.
	self
		with: aVector
		do: [:a :b | sum := sum + (a * b)].
	^sum
]

{ #category : #coercing }
AIVector >> generality [
	
	^210
]

{ #category : #comparing }
AIVector >> hash [
	^ (self size hash bitXor: (self at: 1) hash) bitXor: (self at: self size) hash
]

{ #category : #'initialize-release' }
AIVector >> initializeSize: aSize [
	
	^self subclassResponsibility
]

{ #category : #testing }
AIVector >> isZero [
	"comment stating purpose of message"
	
	^self allSatisfy: #isZero
]

{ #category : #testing }
AIVector >> isZeroAt: index [
	
	^(self at: index) isZero
]

{ #category : #'vector functions' }
AIVector >> length [
	"comment stating purpose of message"
	
	^(self dotProduct: self) sqrt
]

{ #category : #arithmetic }
AIVector >> negated [
	"comment stating purpose of message"
	
	^self collect: #negated
]

{ #category : #enumerating }
AIVector >> noMatchError [
	self error: 'No match'
]

{ #category : #private }
AIVector >> noModificationError [
	self error: 'No modification'
]

{ #category : #'vector functions' }
AIVector >> normalize [
	"comment stating purpose of message"
	
	| len |
	len := self length.
	len isZero
		ifTrue: [self atAllPut: len]
		ifFalse: [self /= self length].
	^self
]

{ #category : #'double dispatching' }
AIVector >> productFromDouble: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
AIVector >> productFromFixedPoint: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
AIVector >> productFromFloat: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
AIVector >> productFromFraction: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
AIVector >> productFromInteger: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
AIVector >> productFromNumber: aNumber [
	
	^self collect: [:b | aNumber * b]
]

{ #category : #'double dispatching' }
AIVector >> productFromPoint: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
AIVector >> productFromSmallDouble: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
AIVector >> productFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a * b]
]

{ #category : #enumerating }
AIVector >> putWithIndex: aBlock [
	
	1
		to: self size
		do:
			[:index | 
			self
				at: index
				put: (aBlock value: index)]
]

{ #category : #'double dispatching' }
AIVector >> quotientFromDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> quotientFromFixedPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> quotientFromFloat: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> quotientFromFraction: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> quotientFromInteger: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> quotientFromNumber: aNumber [
	
	^self collect: [:b | aNumber / b]
]

{ #category : #'double dispatching' }
AIVector >> quotientFromPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> quotientFromSmallDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> quotientFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a / b]
]

{ #category : #arithmetic }
AIVector >> reciprocal [
	"comment stating purpose of message"
	
	^self collect: #reciprocal
]

{ #category : #testing }
AIVector >> respondsToArithmetic [
	"We are arithmetic, yes."
	
	^true
]

{ #category : #accessing }
AIVector >> size [
	
	^self subclassResponsibility
]

{ #category : #accessing }
AIVector >> sparseSize [
	
	| tally |
	tally := 0.
	self doSparseWithIndex: [:each :index | tally := tally + 1].
	^tally
]

{ #category : #'mathematical functions' }
AIVector >> sqrt [
	
	^self collect: #sqrt
]

{ #category : #printing }
AIVector >> storeDenseTextOn: aStream [
	
	aStream
		print: self size;
		cr.
	self
		do: [:each | aStream print: each]
		separatedBy: [aStream space].
	aStream cr
]

{ #category : #'mathematical functions' }
AIVector >> sum [
	
	^self
		inject: 0
		into: [:sum :each | sum + each]
]

{ #category : #'double dispatching' }
AIVector >> sumFromDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> sumFromFixedPoint: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> sumFromFloat: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> sumFromFraction: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> sumFromInteger: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> sumFromNumber: aNumber [
	
	^self collect: [:b | aNumber + b]
]

{ #category : #'double dispatching' }
AIVector >> sumFromPoint: aNumber [
	
	^self collect: [:b | aNumber + b]
]

{ #category : #'double dispatching' }
AIVector >> sumFromSmallDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
AIVector >> sumFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a + b]
]

{ #category : #'vector functions' }
AIVector >> unitVector [
	"comment stating purpose of message"
	
	self isZero ifTrue: [^self].
	^self / self length
]

{ #category : #enumerating }
AIVector >> with: vector affect: aBlock [
	
	(vector hasSize: self size) ifFalse: [^self noMatchError].
	1
		to: self size
		do:
			[:index | 
			self
				at: index
				put:
					(aBlock
						value: (self at: index)
						value: (vector at: index))].
	^self
]

{ #category : #enumerating }
AIVector >> with: vector collect: aBlock [
	
	| newVector |
	(vector hasSize: self size) ifFalse: [^self noMatchError].
	newVector := self species new: self size.
	1
		to: self size
		do:
			[:index | 
			newVector
				at: index
				put:
					(aBlock
						value: (self at: index)
						value: (vector at: index))].
	^newVector
]

{ #category : #enumerating }
AIVector >> with: vector do: aBlock [
	
	(vector hasSize: self size) ifFalse: [^self noMatchError].
	1
		to: self size
		do:
			[:index | 
			aBlock
				value: (self at: index)
				value: (vector at: index)].
	^self
]
