Extension { #name : #Integer }

{ #category : #'*MLLinearAlgebra' }
Integer >> coerce: t1 [

	^ t1 asInteger
]

{ #category : #'*MLLinearAlgebra' }
Integer >> maskClear: t1 [

	^ self bitAnd: t1 bitInvert.
]

{ #category : #'*MLLinearAlgebra' }
Integer >> maskSet: t1 [

	^ self bitOr: t1.
]
