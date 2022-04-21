"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AISparseColumnMatrix,
	#superclass : #AIColumnMatrix,
	#category : #'AI-MooseLinearAlgebra-Matrix'
}

{ #category : #private }
AISparseColumnMatrix class >> vectorSpecies [
	
	^AISparseVector
]

{ #category : #adding }
AISparseColumnMatrix >> addColumn [
	
	columns := columns copyWith: (self vectorSpecies new: self rowSize)
]

{ #category : #adding }
AISparseColumnMatrix >> addRow [
	
	columns do: #addLast
]

{ #category : #enumerating }
AISparseColumnMatrix >> doSparseWithIndices: trinaryBlock [
	
	columns
		doWithIndex:
			[:vector :column | 
			vector
				doSparseWithIndex:
					[:each :row | trinaryBlock value: each value: row value: column]].
	^self
]

{ #category : #testing }
AISparseColumnMatrix >> isZeroAt: row and: column [
	
	^(columns at: column) isZeroAt: row
]

{ #category : #accessing }
AISparseColumnMatrix >> sparseSize [
	
	^columns
		inject: 0
		into: [:sum :each | sum + each sparseSize]
]

{ #category : #printing }
AISparseColumnMatrix >> storeOn: stream [
	
	| text |
	text := String new writeStream.
	self storeSparseTextOn: text.
	stream
		print: self class;
		space;
		nextPutAll: #readFromSparseText:;
		space;
		print:
				(text contents
						replaceAll: Character cr
						with: Character space);
		space;
		nextPutAll: 'readStream'
]
