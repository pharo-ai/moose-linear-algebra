"
An **unlimited** is a `Magnitude` which could be positive or negative.

When positive, it's always greater than any other magnitude.
When negative, it's always smaller than any other magnitude.

## Examples

MLUnlimited positive < 0.  ""true""
MLUnlimited positive > 0. ""true""
MLUnlimited positive > 1. ""true""
MLUnlimited positive > 2. ""true""

MLUnlimited negative > 0.  ""false""
MLUnlimited negative < 0.  ""true""
MLUnlimited negative < 1.  ""true""
MLUnlimited negative < 2.  ""true""

"
Class {
	#name : #AIUnlimited,
	#superclass : #Magnitude,
	#instVars : [
		'positive'
	],
	#classVars : [
		'Negative',
		'Positive'
	],
	#category : #'AI-LinearAlgebra-Mapping'
}

{ #category : #testing }
AIUnlimited class >> negative [

	^Negative ifNil: [Negative := super new initializeWith: false]
]

{ #category : #'instance creation' }
AIUnlimited class >> new [

	^self positive
]

{ #category : #testing }
AIUnlimited class >> positive [

	^Positive ifNil: [Positive := super new initializeWith: true ]
]

{ #category : #comparing }
AIUnlimited >> < aMagnitude [
	"Any number is larger than Unlimited negative, except Unlimited negative itself."

	^(positive not) and: [ self ~~ aMagnitude ]
]

{ #category : #comparing }
AIUnlimited >> = aMagnitude [
	
	^self == aMagnitude
]

{ #category : #converting }
AIUnlimited >> adaptToNumber: rcvr andSend: selector [
	selector = #<
		ifTrue: [ self positive
				ifTrue: [ ^ true ]
				ifFalse: [ ^ false ] ].
	selector = #>
		ifTrue: [ self positive
				ifTrue: [ ^ false ]
				ifFalse: [ ^ true ] ]
]

{ #category : #comparing }
AIUnlimited >> hash [

	^positive 
		ifTrue: [ 16r3FFF ]
		ifFalse: [ 16rBFFF ]
]

{ #category : #initialization }
AIUnlimited >> initializeWith: isPositive [

	positive := isPositive.
	^self
]

{ #category : #arithmetic }
AIUnlimited >> negated [

	^self positive 
		ifTrue: [ self class negative ] 
		ifFalse: [ self class positive ]
]

{ #category : #testing }
AIUnlimited >> negative [

	^positive not
]

{ #category : #accessing }
AIUnlimited >> positive [

	^positive
]

{ #category : #printing }
AIUnlimited >> printOn: aStream [
	" Private - See superimplementor's comment "

	super printOn: aStream.
	aStream 
		<< $(;
		<< (self positive ifTrue: [ $+ ] ifFalse: [ $- ]);
		<< $).
]
