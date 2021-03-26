Class {
	#name : #AIBidirectionalMap,
	#superclass : #Collection,
	#instVars : [
		'backwards',
		'forwards'
	],
	#category : #'AI-LinearAlgebra-Vector'
}

{ #category : #'instance creation' }
AIBidirectionalMap class >> equalityNew: capacity [
	
	^self basicNew initialize: capacity type: Dictionary
]

{ #category : #'instance creation' }
AIBidirectionalMap class >> identityNew [
	
	^self identityNew: 5
]

{ #category : #'instance creation' }
AIBidirectionalMap class >> identityNew: capacity [
	
	^self basicNew initialize: capacity type: IdentityDictionary
]

{ #category : #'instance creation' }
AIBidirectionalMap class >> new [
	
	^self new: 5
]

{ #category : #'instance creation' }
AIBidirectionalMap class >> new: size [
	
	^self equalityNew: size
]

{ #category : #'instance creation' }
AIBidirectionalMap class >> withIndicesAndElements: aCollection [
	
	| map |
	map := self new: aCollection size * 3 // 2.
	aCollection doWithIndex: [:each :index | map at: index put: each].
	^map
]

{ #category : #adding }
AIBidirectionalMap >> add: anAssociation [
	
	self
		at: anAssociation key
		put: anAssociation value
]

{ #category : #accessing }
AIBidirectionalMap >> associations [
	
	^forwards associations asArray
]

{ #category : #accessing }
AIBidirectionalMap >> at: anObject [
	
	^self at: anObject ifAbsent: nil
]

{ #category : #accessing }
AIBidirectionalMap >> at: anObject ifAbsent: exceptionBlock [
	
	^forwards
		at: anObject
		ifAbsent: [backwards at: anObject ifAbsent: exceptionBlock]
]

{ #category : #accessing }
AIBidirectionalMap >> at: key put: value [
	
	(backwards includesKey: value)
		ifTrue: [self error: 'Value already mapped'].
	(forwards includesKey: key)
		ifTrue: [backwards removeKey: (forwards at: key)].
	forwards at: key put: value.
	backwards at: value put: key.	"[ self checkInvariant ] assert."
	^value
]

{ #category : #accessing }
AIBidirectionalMap >> atKey: key [
	
	^self atKey: key ifAbsent: nil
]

{ #category : #accessing }
AIBidirectionalMap >> atKey: key ifAbsent: exceptionBlock [
	
	^forwards at: key ifAbsent: exceptionBlock
]

{ #category : #accessing }
AIBidirectionalMap >> atKey: key ifAbsentPut: valueBlock [
	
	| value |
	value := self atKey: key.
	value == nil
		ifTrue:
			[value := self
				at: key
				put: valueBlock value].
	^value
]

{ #category : #accessing }
AIBidirectionalMap >> atValue: value [
	
	^self atValue: value ifAbsent: nil
]

{ #category : #accessing }
AIBidirectionalMap >> atValue: value ifAbsent: exceptionBlock [
	
	^backwards at: value ifAbsent: exceptionBlock
]

{ #category : #accessing }
AIBidirectionalMap >> atValue: value ifAbsentPut: keyBlock [
	
	| key |
	key := self atValue: value.
	key == nil
		ifTrue:
			[self
				at: (key := keyBlock value)
				put: value].
	^key
]

{ #category : #private }
AIBidirectionalMap >> checkInvariant [
	
	^forwards size = backwards size
		and:
			[(forwards keys \ backwards values) isEmpty
				and: [(forwards values \ backwards keys) isEmpty]]
]

{ #category : #enumerating }
AIBidirectionalMap >> do: aBlock [
	
	forwards do: aBlock
]

{ #category : #testing }
AIBidirectionalMap >> includes: value [
	
	^forwards includes: value
]

{ #category : #testing }
AIBidirectionalMap >> includesKey: key [
	
	^backwards includes: key
]

{ #category : #'initialize-release' }
AIBidirectionalMap >> initialize: capacity type: typeClass [
	
	forwards := typeClass new: capacity.
	backwards := typeClass new: capacity.
	[self checkInvariant] assert
]

{ #category : #copying }
AIBidirectionalMap >> postCopy [
	"Make sure to copy the contents fully."
	
	super postCopy.
	forwards := forwards copy.
	backwards := backwards copy
]

{ #category : #removing }
AIBidirectionalMap >> remove: anObject ifAbsent: exceptionBlock [
	
	self shouldNotImplement
]

{ #category : #removing }
AIBidirectionalMap >> removeKey: key [
	
	^self
		removeKey: key
		ifAbsent: [self error: 'key not found']
]

{ #category : #removing }
AIBidirectionalMap >> removeKey: key ifAbsent: exceptionBlock [
	
	| value |
	value := forwards removeKey: key ifAbsent: exceptionBlock.
	backwards removeKey: value.
	[self checkInvariant] assert.
	^value
]

{ #category : #removing }
AIBidirectionalMap >> removeValue: value [
	
	^self
		removeValue: value
		ifAbsent: [self error: 'value not found']
]

{ #category : #removing }
AIBidirectionalMap >> removeValue: value ifAbsent: exceptionBlock [
	
	| key |
	key := backwards removeKey: value ifAbsent: exceptionBlock.
	forwards removeKey: key.
	[self checkInvariant] assert.
	^key
]

{ #category : #accessing }
AIBidirectionalMap >> size [
	
	^forwards size
]
