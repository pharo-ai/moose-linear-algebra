Class {
	#name : 'AILocalWeighting',
	#superclass : 'AIWeighting',
	#category : 'AI-MooseLinearAlgebra-Vector',
	#package : 'AI-MooseLinearAlgebra',
	#tag : 'Vector'
}

{ #category : 'weighting' }
AILocalWeighting >> forValue: value [
	
	^self subclassResponsibility
]
