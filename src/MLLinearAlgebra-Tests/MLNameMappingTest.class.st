"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLNameMappingTest,
	#superclass : #TestCase,
	#category : #'MLLinearAlgebra-Tests'
}

{ #category : #test }
MLNameMappingTest >> testAddDuplicate [
	
	| m |
	m := MLNameMapping new addAll: #(#a #b #c #d); yourself.
	self
		should: [m add: #a]
		raise: Error
]

{ #category : #test }
MLNameMappingTest >> testNames [
	
	| m |
	m := MLNameMapping new addAll: #(#a #b #c #d); yourself.
	self assert: m asArray equals: #(1 2 3 4).
	self assert: m names asArray equals: #(#a #b #c #d)
]
