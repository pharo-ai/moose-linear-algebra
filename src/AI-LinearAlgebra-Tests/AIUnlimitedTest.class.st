"
A MLUnlimitedTest is a test class for testing the behavior of MLUnlimited
"
Class {
	#name : #AIUnlimitedTest,
	#superclass : #TestCase,
	#category : #'AI-LinearAlgebra-Tests-Mapping'
}

{ #category : #test }
AIUnlimitedTest >> testEqualsSign [

	self assert: AIUnlimited positive equals: AIUnlimited positive.
	self assert: AIUnlimited negative equals: AIUnlimited negative
]

{ #category : #test }
AIUnlimitedTest >> testNegated [

	self assert: AIUnlimited positive negated equals: AIUnlimited negative.
	self assert: AIUnlimited negative negated equals: AIUnlimited positive.
]

{ #category : #test }
AIUnlimitedTest >> testNegative [

	" Every unlimited negative is not bigger than any magnitude "
	self assert: AIUnlimited negative > 0 equals: false.
	self assert: AIUnlimited negative > 1 equals: false.
	self assert: AIUnlimited negative > 1 negated equals: false.

	" Every unlimited negative is smaller than any magnitude "
	self assert: AIUnlimited negative < 0 equals: true.
	self assert: AIUnlimited negative < 1 equals: true.
	self assert: AIUnlimited negative < 1 negated equals: true.

]

{ #category : #test }
AIUnlimitedTest >> testPositive [

	" Every unlimited positive is greater than any magnitude "
	self assert: AIUnlimited positive > 0 equals: true.
	self assert: AIUnlimited positive > 1 equals: true.
	self assert: AIUnlimited positive > 1 negated equals: true.

	" Every unlimited positive is not smaller than any magnitude "
	self assert: AIUnlimited positive < 0 equals: false.
	self assert: AIUnlimited positive < 1 equals: false.
	self assert: AIUnlimited positive < 1 negated equals: false.
]
