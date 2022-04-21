Extension { #name : #Integer }

{ #category : #'*AI-MooseLinearAlgebra' }
Integer >> coerce: t1 [

	^ t1 asInteger
]

{ #category : #'*AI-MooseLinearAlgebra' }
Integer >> maskClear: t1 [

	^ self bitAnd: t1 bitInvert.
]

{ #category : #'*AI-MooseLinearAlgebra' }
Integer >> maskSet: t1 [

	^ self bitOr: t1.
]
