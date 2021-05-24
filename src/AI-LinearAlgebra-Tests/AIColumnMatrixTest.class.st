"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIColumnMatrixTest,
	#superclass : #AIMatrixTest,
	#category : #'AI-LinearAlgebra-Tests'
}

{ #category : #fixture }
AIColumnMatrixTest >> matrixClass [
	
	^AIColumnMatrix
]

{ #category : #tests }
AIColumnMatrixTest >> testColumns [
	
	|m|
	m := AIColumnMatrix new columns: #( #(0 1 2) #(2 3 4)).
	self assert: (m at: 1 and: 2) equals: 2.
	self assert: (m at: 3 and: 1)  equals: 2.
]

{ #category : #tests }
AIColumnMatrixTest >> testinitialization [ 
	
	|m|
	m := AIColumnMatrix  new initializeRows: 3 columns: 4.
	self assert: m rowSize equals: 3.
	self assert: m columnSize  equals: 4.
]
