"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #AISparseRowMatrix,
	#superclass : #AIRowMatrix,
	#category : #'AI-LinearAlgebra-Matrix'
}

{ #category : #private }
AISparseRowMatrix class >> vectorSpecies [
	
	^AISparseVector
]

{ #category : #adding }
AISparseRowMatrix >> addColumn [
	
	rows do: #addLast
]

{ #category : #adding }
AISparseRowMatrix >> addRow [
	
	rows := rows copyWith: (self vectorSpecies new: self columnSize)
]

{ #category : #enumerating }
AISparseRowMatrix >> doSparseWithIndices: trinaryBlock [
	
	rows
		doWithIndex:
			[:vector :row | 
			vector
				doSparseWithIndex:
					[:each :column | trinaryBlock value: each value: row value: column]].
	^self
]

{ #category : #testing }
AISparseRowMatrix >> isZeroAt: row and: column [
	
	^(rows at: row) isZeroAt: column
]

{ #category : #accessing }
AISparseRowMatrix >> sparseSize [
	
	^rows
		inject: 0
		into: [:sum :each | sum + each sparseSize]
]

{ #category : #printing }
AISparseRowMatrix >> storeOn: stream [
	
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
