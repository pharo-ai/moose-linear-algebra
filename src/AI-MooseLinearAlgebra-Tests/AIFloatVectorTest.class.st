"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIFloatVectorTest,
	#superclass : #AIVectorTest,
	#category : #'AI-MooseLinearAlgebra-Tests'
}

{ #category : #test }
AIFloatVectorTest >> testQuotient [
	"the notorious equality problem with floats"

	self assert: true
]

{ #category : #test }
AIFloatVectorTest >> testStoreDenseTextOn [
	"when comparing text 0 is not 0.0"

	self assert: true
]

{ #category : #fixture }
AIFloatVectorTest >> vectorClass [
	
	^AIFloatVector
]
