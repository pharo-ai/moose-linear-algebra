"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIAccumulatorTest,
	#superclass : #TestCase,
	#category : #'AI-LinearAlgebra-Tests'
}

{ #category : #test }
AIAccumulatorTest >> testAverage [
	| a |
	a := AIAccumulator sum.
	a accumulate: 10.
	self assert: a average equals: 10.
	a accumulate: 1.
	self assert: a average equals: 11 / 2.
	a accumulate: 100.
	self assert: a average equals: 111 / 3
]

{ #category : #test }
AIAccumulatorTest >> testCustomBlock [
	| a |
	a := AIAccumulator value: 0 using: [ :current :new | current max: new size ].
	a accumulate: 'ab'.
	self assert: a value equals: 2.
	a accumulate: 'a'.
	self assert: a value equals: 2.
	a accumulate: 'abc'.
	self assert: a value equals: 3
]

{ #category : #test }
AIAccumulatorTest >> testEnumerate [
	| a |
	a := AIAccumulator minimum.
	a enumerate: #(10 1 100).
	self assert: a value equals: 1
]

{ #category : #test }
AIAccumulatorTest >> testEnumerateWithIndex [
	| a |
	a := AIAccumulator minimum.
	a enumerateWithIndex: #(10 1 100).
	self assert: a index equals: 2.
	self assert: a value equals: 1
]

{ #category : #test }
AIAccumulatorTest >> testIfTruePut [
	| a |
	a := AIAccumulator maximum.
	a accumulate: 10 withIndex: 'first'.
	self assert: a index equals: 'first'.
	self assert: a value equals: 10.
	a accumulate: 1 withIndex: 'second'.
	self assert: a index equals: 'first'.
	self assert: a value equals: 10.
	a accumulate: 100 withIndex: 'third'.
	self assert: a index equals: 'third'.
	self assert: a value equals: 100
]

{ #category : #test }
AIAccumulatorTest >> testMaximum [
	| a |
	a := AIAccumulator maximum.
	a accumulate: 10.
	self assert: a value equals: 10.
	a accumulate: 1.
	self assert: a value equals: 10.
	a accumulate: 100.
	self assert: a value equals: 100
]

{ #category : #test }
AIAccumulatorTest >> testMinimum [
	| a |
	a := AIAccumulator minimum.
	a accumulate: 10.
	self assert: a value equals: 10.
	a accumulate: 1.
	self assert: a value equals: 1.
	a accumulate: 100.
	self assert: a value equals: 1
]

{ #category : #test }
AIAccumulatorTest >> testSquaredSum [
	| a |
	a := AIAccumulator squaredSum.
	a enumerate: #(1 2 3 4 5 6 7 8 9 10).
	self assert: a value equals: 385
]

{ #category : #test }
AIAccumulatorTest >> testSum [
	| a |
	a := AIAccumulator sum.
	a enumerate: #(1 2 3 4 5 6 7 8 9 10).
	self assert: a value equals: 55
]
