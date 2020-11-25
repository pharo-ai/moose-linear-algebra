"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLFloatVectorTest,
	#superclass : #MLVectorTest,
	#category : #'MLLinearAlgebra-Tests'
}

{ #category : #test }
MLFloatVectorTest >> testQuotient [
	"the notorious equality problem with floats"

	self assert: true
]

{ #category : #test }
MLFloatVectorTest >> testStoreDenseTextOn [
	"when comparing text 0 is not 0.0"

	self assert: true
]

{ #category : #fixture }
MLFloatVectorTest >> vectorClass [
	
	^MLFloatVector
]
