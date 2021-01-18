Extension { #name : #Integer }

{ #category : #'*AI-LinearAlgebra' }
Integer >> coerce: t1 [

	^ t1 asInteger
]

{ #category : #'*AI-LinearAlgebra' }
Integer >> maskClear: t1 [

	^ self bitAnd: t1 bitInvert.
]

{ #category : #'*AI-LinearAlgebra' }
Integer >> maskSet: t1 [

	^ self bitOr: t1.
]
