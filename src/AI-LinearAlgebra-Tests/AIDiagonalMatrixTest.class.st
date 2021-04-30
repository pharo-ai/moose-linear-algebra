Class {
	#name : #AIDiagonalMatrixTest,
	#superclass : #TestCase,
	#category : #'AI-LinearAlgebra-Tests'
}

{ #category : #tests }
AIDiagonalMatrixTest >> testAccessors [


	| m |
	m := AIDiagonalMatrix withDiagonal: #(3 4 5).
	
	self assert: (m at: 1 and: 1) equals: 3.
	self assert: (m at: 2 and: 1) equals: 0.
	self assert: (m at: 3 and: 3) equals: 5.
   
]

{ #category : #tests }
AIDiagonalMatrixTest >> testDimension [


	| m |
	m := AIDiagonalMatrix new: 5.
	self assert: m rowSize equals: 5.
	self assert: m columnSize equals: 5.

]
