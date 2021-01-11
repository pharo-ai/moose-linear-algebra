"
A MLUnlimitedTest is a test class for testing the behavior of MLUnlimited
"
Class {
	#name : #MLUnlimitedTest,
	#superclass : #TestCase,
	#category : #'MLLinearAlgebra-Tests-Mapping'
}

{ #category : #test }
MLUnlimitedTest >> testEqualsSign [

	self assert: MLUnlimited positive equals: MLUnlimited positive.
	self assert: MLUnlimited negative equals: MLUnlimited negative
]

{ #category : #test }
MLUnlimitedTest >> testNegated [

	self assert: MLUnlimited positive negated equals: MLUnlimited negative.
	self assert: MLUnlimited negative negated equals: MLUnlimited positive.
]

{ #category : #test }
MLUnlimitedTest >> testNegative [

	" Every unlimited negative is not bigger than any magnitude "
	self assert: MLUnlimited negative > 0 equals: false.
	self assert: MLUnlimited negative > 1 equals: false.
	self assert: MLUnlimited negative > 1 negated equals: false.

	" Every unlimited negative is smaller than any magnitude "
	self assert: MLUnlimited negative < 0 equals: true.
	self assert: MLUnlimited negative < 1 equals: true.
	self assert: MLUnlimited negative < 1 negated equals: true.

]

{ #category : #test }
MLUnlimitedTest >> testPositive [

	" Every unlimited positive is greater than any magnitude "
	self assert: MLUnlimited positive > 0 equals: true.
	self assert: MLUnlimited positive > 1 equals: true.
	self assert: MLUnlimited positive > 1 negated equals: true.

	" Every unlimited positive is not smaller than any magnitude "
	self assert: MLUnlimited positive < 0 equals: false.
	self assert: MLUnlimited positive < 1 equals: false.
	self assert: MLUnlimited positive < 1 negated equals: false.
]
