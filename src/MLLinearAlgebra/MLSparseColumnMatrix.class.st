"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLSparseColumnMatrix,
	#superclass : #MLColumnMatrix,
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #private }
MLSparseColumnMatrix class >> vectorSpecies [
	
	^MLSparseVector
]

{ #category : #adding }
MLSparseColumnMatrix >> addColumn [
	
	columns := columns copyWith: (self vectorSpecies new: self rowSize)
]

{ #category : #adding }
MLSparseColumnMatrix >> addRow [
	
	columns do: #addLast
]

{ #category : #enumerating }
MLSparseColumnMatrix >> doSparseWithIndices: trinaryBlock [
	
	columns
		doWithIndex:
			[:vector :column | 
			vector
				doSparseWithIndex:
					[:each :row | trinaryBlock value: each value: row value: column]].
	^self
]

{ #category : #testing }
MLSparseColumnMatrix >> isZeroAt: row and: column [
	
	^(columns at: column) isZeroAt: row
]

{ #category : #accessing }
MLSparseColumnMatrix >> sparseSize [
	
	^columns
		inject: 0
		into: [:sum :each | sum + each sparseSize]
]

{ #category : #printing }
MLSparseColumnMatrix >> storeOn: stream [
	
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
