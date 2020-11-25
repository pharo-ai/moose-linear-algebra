"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLVector,
	#superclass : #ArrayedCollection,
	#category : #'MLLinearAlgebra-Vector'
}

{ #category : #accessing }
MLVector class >> browserIcon [
"Answer icon to be displayed with matrix classes."
	
	^ nil
]

{ #category : #'instance creation' }
MLVector class >> new [
	
	^self new: 0
]

{ #category : #'instance creation' }
MLVector class >> new: aSize [
	
	^(self basicNew)
		initializeSize: aSize;
		yourself
]

{ #category : #'instance creation' }
MLVector class >> new: aSize withAll: value [
	
	^(self new: aSize)
		atAllPut: value;
		yourself
]

{ #category : #'instance creation' }
MLVector class >> readFromDenseText: aStream [
	
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
MLVector class >> unity [
	
	^MLVectorCoercion with: 1
]

{ #category : #'instance creation' }
MLVector class >> withAll: aCollection [
	
	^(self new: aCollection size)
		atAllPut: aCollection;
		yourself
]

{ #category : #'constants access' }
MLVector class >> zero [
	
	^MLVectorCoercion with: 0
]

{ #category : #arithmetic }
MLVector >> * aNumber [
	
	^aNumber productFromVector: self
]

{ #category : #arithmetic }
MLVector >> *= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a * b]
]

{ #category : #arithmetic }
MLVector >> + aNumber [
	
	^aNumber sumFromVector: self
]

{ #category : #arithmetic }
MLVector >> += aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a + b]
]

{ #category : #arithmetic }
MLVector >> - aNumber [
	
	^aNumber differenceFromVector: self
]

{ #category : #arithmetic }
MLVector >> -= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a - b]
]

{ #category : #arithmetic }
MLVector >> / aNumber [
	
	^aNumber quotientFromVector: self
]

{ #category : #arithmetic }
MLVector >> /= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a / b]
]

{ #category : #comparing }
MLVector >> < aMagnitude [
	
	self error: 'Vectors are not ordered'
]

{ #category : #comparing }
MLVector >> = vector [
	
	^self == vector
		or:
			[(vector isKindOf: MLVector)
				and:
					[(vector hasSize: self size)
						and:
							[self
								with: vector
								do: [:a :b | a = b ifFalse: [^false]].
							true]]]
]

{ #category : #converting }
MLVector >> asVector [
	
	^self
]

{ #category : #accessing }
MLVector >> at: index [
	
	^self subclassResponsibility
]

{ #category : #arithmetic }
MLVector >> at: index add: aNumber [
	
	^self
		at: index
		put: (self at: index) + aNumber
]

{ #category : #accessing }
MLVector >> at: index ifNilPut: aBlock [
	"Answer the value at anIndex.  If the value is nil, set it to be
	the result of evaluating valueBlock, and answer that value."
	
	^(self at: index)
		ifNil:
			[self
				at: index
				put: aBlock value]
]

{ #category : #accessing }
MLVector >> at: index put: aNumber [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MLVector >> atAllPut: collection [
	collection isCollection
		ifTrue: [ self with: collection affect: [ :a :b | b ] ]
		ifFalse: [ super atAllPut: collection ]
]

{ #category : #coercing }
MLVector >> coerce: aNumber [
	
	^MLVectorCoercion with: aNumber
]

{ #category : #copying }
MLVector >> copyEmpty [
	
	^self copyEmpty: self size
]

{ #category : #copying }
MLVector >> copyEmpty: size [
	
	^self species new: size
]

{ #category : #'vector functions' }
MLVector >> cosine: aVector [
	
	^self unitVector dotProduct: aVector unitVector
]

{ #category : #copying }
MLVector >> deepCopy [
	
	^self species withAll: self
]

{ #category : #private }
MLVector >> defaultElement [
	
	^Float zero
]

{ #category : #'double dispatching' }
MLVector >> differenceFromDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> differenceFromFixedPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> differenceFromFloat: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> differenceFromFraction: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> differenceFromInteger: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> differenceFromNumber: aNumber [
	
	^self collect: [:b | aNumber - b]
]

{ #category : #'double dispatching' }
MLVector >> differenceFromPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> differenceFromSmallDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> differenceFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a - b]
]

{ #category : #'vector functions' }
MLVector >> dist: aVector [
	
	| sum |
	sum := 0.
	self
		with: aVector
		do: [:a :b | sum := sum + ((a - b) ** 2)].
	^sum
]

{ #category : #enumerating }
MLVector >> doSparseWithIndex: aBlock [
	
	self
		doWithIndex:
			[:each :index | each isZero ifFalse: [aBlock value: each value: index]].
	^self
]

{ #category : #'vector functions' }
MLVector >> dotProduct: aVector [
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
MLVector >> generality [
	
	^210
]

{ #category : #comparing }
MLVector >> hash [
	^ (self size hash bitXor: (self at: 1) hash) bitXor: (self at: self size) hash
]

{ #category : #'initialize-release' }
MLVector >> initializeSize: aSize [
	
	^self subclassResponsibility
]

{ #category : #testing }
MLVector >> isZero [
	"comment stating purpose of message"
	
	^self allSatisfy: #isZero
]

{ #category : #testing }
MLVector >> isZeroAt: index [
	
	^(self at: index) isZero
]

{ #category : #'vector functions' }
MLVector >> length [
	"comment stating purpose of message"
	
	^(self dotProduct: self) sqrt
]

{ #category : #arithmetic }
MLVector >> negated [
	"comment stating purpose of message"
	
	^self collect: #negated
]

{ #category : #enumerating }
MLVector >> noMatchError [
	self error: 'No match'
]

{ #category : #private }
MLVector >> noModificationError [
	self error: 'No modification'
]

{ #category : #'vector functions' }
MLVector >> normalize [
	"comment stating purpose of message"
	
	| len |
	len := self length.
	len isZero
		ifTrue: [self atAllPut: len]
		ifFalse: [self /= self length].
	^self
]

{ #category : #'double dispatching' }
MLVector >> productFromDouble: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MLVector >> productFromFixedPoint: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MLVector >> productFromFloat: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MLVector >> productFromFraction: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MLVector >> productFromInteger: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MLVector >> productFromNumber: aNumber [
	
	^self collect: [:b | aNumber * b]
]

{ #category : #'double dispatching' }
MLVector >> productFromPoint: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MLVector >> productFromSmallDouble: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MLVector >> productFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a * b]
]

{ #category : #enumerating }
MLVector >> putWithIndex: aBlock [
	
	1
		to: self size
		do:
			[:index | 
			self
				at: index
				put: (aBlock value: index)]
]

{ #category : #'double dispatching' }
MLVector >> quotientFromDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> quotientFromFixedPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> quotientFromFloat: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> quotientFromFraction: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> quotientFromInteger: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> quotientFromNumber: aNumber [
	
	^self collect: [:b | aNumber / b]
]

{ #category : #'double dispatching' }
MLVector >> quotientFromPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> quotientFromSmallDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> quotientFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a / b]
]

{ #category : #arithmetic }
MLVector >> reciprocal [
	"comment stating purpose of message"
	
	^self collect: #reciprocal
]

{ #category : #testing }
MLVector >> respondsToArithmetic [
	"We are arithmetic, yes."
	
	^true
]

{ #category : #accessing }
MLVector >> size [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MLVector >> sparseSize [
	
	| tally |
	tally := 0.
	self doSparseWithIndex: [:each :index | tally := tally + 1].
	^tally
]

{ #category : #'mathematical functions' }
MLVector >> sqrt [
	
	^self collect: #sqrt
]

{ #category : #printing }
MLVector >> storeDenseTextOn: aStream [
	
	aStream
		print: self size;
		cr.
	self
		do: [:each | aStream print: each]
		separatedBy: [aStream space].
	aStream cr
]

{ #category : #'mathematical functions' }
MLVector >> sum [
	
	^self
		inject: 0
		into: [:sum :each | sum + each]
]

{ #category : #'double dispatching' }
MLVector >> sumFromDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> sumFromFixedPoint: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> sumFromFloat: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> sumFromFraction: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> sumFromInteger: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> sumFromNumber: aNumber [
	
	^self collect: [:b | aNumber + b]
]

{ #category : #'double dispatching' }
MLVector >> sumFromPoint: aNumber [
	
	^self collect: [:b | aNumber + b]
]

{ #category : #'double dispatching' }
MLVector >> sumFromSmallDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLVector >> sumFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a + b]
]

{ #category : #'vector functions' }
MLVector >> unitVector [
	"comment stating purpose of message"
	
	self isZero ifTrue: [^self].
	^self / self length
]

{ #category : #enumerating }
MLVector >> with: vector affect: aBlock [
	
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
MLVector >> with: vector collect: aBlock [
	
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
MLVector >> with: vector do: aBlock [
	
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
