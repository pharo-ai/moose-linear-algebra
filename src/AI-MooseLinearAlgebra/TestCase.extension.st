Extension { #name : #TestCase }

{ #category : #'*AI-MooseLinearAlgebra' }
TestCase >> assertBlock: aBlock raises: anExceptionalEvent [
	
	^[aBlock value.
	false]
		on: anExceptionalEvent
		do: [:ex | ex return: true]
]
