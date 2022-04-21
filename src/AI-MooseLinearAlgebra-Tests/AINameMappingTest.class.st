"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AINameMappingTest,
	#superclass : #TestCase,
	#category : #'AI-MooseLinearAlgebra-Tests'
}

{ #category : #test }
AINameMappingTest >> testAddDuplicate [
	
	| m |
	m := AINameMapping new addAll: #(#a #b #c #d); yourself.
	self
		should: [m add: #a]
		raise: Error
]

{ #category : #test }
AINameMappingTest >> testNames [
	
	| m |
	m := AINameMapping new addAll: #(#a #b #c #d); yourself.
	self assert: m asArray equals: #(1 2 3 4).
	self assert: m names asArray equals: #(#a #b #c #d)
]
