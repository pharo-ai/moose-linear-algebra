Class {
	#name : #AIMedianAccumulator,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#category : #'AI-MooseLinearAlgebra-Accumulator'
}

{ #category : #'instance creation' }
AIMedianAccumulator class >> new [
	
	^self basicNew initialize
]

{ #category : #'instance creation' }
AIMedianAccumulator class >> withAll: aCollection [
	
	^(self new)
		addAll: aCollection;
		yourself
]

{ #category : #accumulating }
AIMedianAccumulator >> add: value [
	
	values add: value
]

{ #category : #accumulating }
AIMedianAccumulator >> addAll: aCollection [
	
	values addAll: aCollection
]

{ #category : #accessing }
AIMedianAccumulator >> bottom [
	
	^values last
]

{ #category : #accessing }
AIMedianAccumulator >> firstQuartil [
	
	^values at: (values size / 4) asInteger
]

{ #category : #'initialize-release' }
AIMedianAccumulator >> initialize [
	
	values := SortedCollection new
]

{ #category : #accessing }
AIMedianAccumulator >> median [
	
	^values at: (values size / 2) asInteger
]

{ #category : #printing }
AIMedianAccumulator >> printOn: aStream [
	
	aStream
		nextPutAll: 'Median = ';
		print: self median;
		space;
		nextPut: $(;
		print: self top;
		nextPut: $;;
		space;
		print: self firstQuartil;
		nextPut: $;;
		space;
		print: self median;
		nextPut: $;;
		space;
		print: self thirdQuartil;
		nextPut: $;;
		space;
		print: self bottom;
		nextPut: $)
]

{ #category : #accessing }
AIMedianAccumulator >> thirdQuartil [
	
	^values at: (values size / 4 * 3) asInteger
]

{ #category : #accessing }
AIMedianAccumulator >> top [
	
	^values first
]

{ #category : #accumulating }
AIMedianAccumulator >> value: value [
	
	values add: value
]
