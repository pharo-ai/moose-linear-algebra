Extension { #name : #TestCase }

{ #category : #'*MLLinearAlgebra' }
TestCase >> assertBlock: aBlock raises: anExceptionalEvent [
	
	^[aBlock value.
	false]
		on: anExceptionalEvent
		do: [:ex | ex return: true]
]
