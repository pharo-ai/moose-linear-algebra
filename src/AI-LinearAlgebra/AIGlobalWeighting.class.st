Class {
	#name : #AIGlobalWeighting,
	#superclass : #AIWeighting,
	#instVars : [
		'globalFrequencies',
		'documentFrequencies'
	],
	#category : #'AI-LinearAlgebra-Vector'
}

{ #category : #weighting }
AIGlobalWeighting >> documentFrequency: aVector [
	
	^aVector sparseSize
]

{ #category : #weighting }
AIGlobalWeighting >> forTerm: aVector [
	
	^self subclassResponsibility
]

{ #category : #weighting }
AIGlobalWeighting >> globalFrequency: aVector [
	
	^aVector sum
]
