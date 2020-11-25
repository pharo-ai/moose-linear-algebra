Class {
	#name : #MLUnlimited,
	#superclass : #Magnitude,
	#instVars : [
		'positive'
	],
	#classVars : [
		'Negative',
		'Positive'
	],
	#category : #'MLLinearAlgebra-Mapping'
}

{ #category : #testing }
MLUnlimited class >> negative [

	^Negative ifNil: [Negative := super new initializeWith: false]
]

{ #category : #'instance creation' }
MLUnlimited class >> new [

	^self positive
]

{ #category : #testing }
MLUnlimited class >> positive [

	^Positive ifNil: [Positive := super new initializeWith: true ]
]

{ #category : #comparing }
MLUnlimited >> < aMagnitude [
	"Any number is larger than Unlimited negative, except Unlimited negative itself."

	^(positive not) and: [ self ~~ aMagnitude ]
]

{ #category : #comparing }
MLUnlimited >> = aMagnitude [
	
	^self == aMagnitude
]

{ #category : #converting }
MLUnlimited >> adaptToNumber: rcvr andSend: selector [
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
MLUnlimited >> hash [

	^positive 
		ifTrue: [ 16r3FFF ]
		ifFalse: [ 16rBFFF ]
]

{ #category : #initialization }
MLUnlimited >> initializeWith: isPositive [

	positive := isPositive.
	^self
]

{ #category : #arithmetic }
MLUnlimited >> negated [

	^self positive 
		ifTrue: [ self class negative ] 
		ifFalse: [ self class positive ]
]

{ #category : #testing }
MLUnlimited >> negative [

	^positive not
]

{ #category : #accessing }
MLUnlimited >> positive [

	^positive
]
