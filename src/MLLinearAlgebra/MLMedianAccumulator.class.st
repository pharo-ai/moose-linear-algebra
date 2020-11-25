Class {
	#name : #MLMedianAccumulator,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#category : #'MLLinearAlgebra-Accumulator'
}

{ #category : #'instance creation' }
MLMedianAccumulator class >> new [
	
	^self basicNew initialize
]

{ #category : #'instance creation' }
MLMedianAccumulator class >> withAll: aCollection [
	
	^(self new)
		addAll: aCollection;
		yourself
]

{ #category : #accumulating }
MLMedianAccumulator >> add: value [
	
	values add: value
]

{ #category : #accumulating }
MLMedianAccumulator >> addAll: aCollection [
	
	values addAll: aCollection
]

{ #category : #accessing }
MLMedianAccumulator >> bottom [
	
	^values last
]

{ #category : #accessing }
MLMedianAccumulator >> firstQuartil [
	
	^values at: (values size / 4) asInteger
]

{ #category : #'initialize-release' }
MLMedianAccumulator >> initialize [
	
	values := SortedCollection new
]

{ #category : #accessing }
MLMedianAccumulator >> median [
	
	^values at: (values size / 2) asInteger
]

{ #category : #printing }
MLMedianAccumulator >> printOn: aStream [
	
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
MLMedianAccumulator >> thirdQuartil [
	
	^values at: (values size / 4 * 3) asInteger
]

{ #category : #accessing }
MLMedianAccumulator >> top [
	
	^values first
]

{ #category : #accumulating }
MLMedianAccumulator >> value: value [
	
	values add: value
]
