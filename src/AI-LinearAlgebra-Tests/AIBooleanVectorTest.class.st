"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AIBooleanVectorTest,
	#superclass : #TestCase,
	#instVars : [
		'v'
	],
	#category : #'AI-LinearAlgebra-Tests'
}

{ #category : #running }
AIBooleanVectorTest >> testAccessingLarge [
	v := AIBooleanVector new: 100.
	v at: 83 put: true.
	self assert: v size equals: 100.
	self assert: (v at: 82) not.
	self assert: (v at: 83).
	self assert: (v at: 84) not.
	v at: 83 put: false.
	self assert: (v allSatisfy: #not)
]

{ #category : #running }
AIBooleanVectorTest >> testAccessingSmall [
	v := AIBooleanVector new: 5.
	v at: 3 put: true.
	self assert: v size equals: 5.
	self assert: (v at: 2) not.
	self assert: (v at: 3).
	self assert: (v at: 4) not.
	v at: 3 put: false.
	self assert: (v allSatisfy: #not)
]

{ #category : #running }
AIBooleanVectorTest >> testAnd [
	| w vw |
	v := AIBooleanVector withAll: #(false false true true false false true true).
	w := AIBooleanVector withAll: #(false true false true true false true false).
	vw := v & w.
	self assert: vw size equals: 8.
	self assert: vw asArray equals: #(false false false true false false true false)
]

{ #category : #running }
AIBooleanVectorTest >> testNew [
	v := AIBooleanVector new.
	self assert: v size equals: 0
]

{ #category : #running }
AIBooleanVectorTest >> testNewLarge [
	v := AIBooleanVector new: 100.
	self assert: v size equals: 100.
	self assert: (v allSatisfy: #not)
]

{ #category : #running }
AIBooleanVectorTest >> testNewSmall [
	v := AIBooleanVector new: 5.
	self assert: v size equals: 5.
	self assert: (v allSatisfy: #not)
]

{ #category : #running }
AIBooleanVectorTest >> testNewWithAll [
	v := AIBooleanVector new: 100 withAll: true.
	self assert: v size equals: 100.
	self assert: (v allSatisfy: #yourself)
]

{ #category : #running }
AIBooleanVectorTest >> testNot [
	v := AIBooleanVector withAll: #(false false true true false false true true).
	self assert: v not size equals: 8.
	self assert: v not asArray equals: #(true true false false true true false false)
]

{ #category : #running }
AIBooleanVectorTest >> testOr [
	| w vw |
	v := AIBooleanVector withAll: #(false false true true false false true true).
	w := AIBooleanVector withAll: #(false true false true true false true false).
	vw := v | w.
	self assert: vw size equals: 8.
	self assert: vw asArray equals: #(false true true true true false true true)
]
