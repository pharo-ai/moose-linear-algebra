"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLSparseRowMatrix,
	#superclass : #MLRowMatrix,
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #private }
MLSparseRowMatrix class >> vectorSpecies [
	
	^MLSparseVector
]

{ #category : #adding }
MLSparseRowMatrix >> addColumn [
	
	rows do: #addLast
]

{ #category : #adding }
MLSparseRowMatrix >> addRow [
	
	rows := rows copyWith: (self vectorSpecies new: self columnSize)
]

{ #category : #enumerating }
MLSparseRowMatrix >> doSparseWithIndices: trinaryBlock [
	
	rows
		doWithIndex:
			[:vector :row | 
			vector
				doSparseWithIndex:
					[:each :column | trinaryBlock value: each value: row value: column]].
	^self
]

{ #category : #testing }
MLSparseRowMatrix >> isZeroAt: row and: column [
	
	^(rows at: row) isZeroAt: column
]

{ #category : #accessing }
MLSparseRowMatrix >> sparseSize [
	
	^rows
		inject: 0
		into: [:sum :each | sum + each sparseSize]
]

{ #category : #printing }
MLSparseRowMatrix >> storeOn: stream [
	
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
