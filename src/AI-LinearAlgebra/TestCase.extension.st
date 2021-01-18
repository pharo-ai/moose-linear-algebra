Extension { #name : #TestCase }

{ #category : #'*AI-LinearAlgebra' }
TestCase >> assertBlock: aBlock raises: anExceptionalEvent [
	
	^[aBlock value.
	false]
		on: anExceptionalEvent
		do: [:ex | ex return: true]
]
