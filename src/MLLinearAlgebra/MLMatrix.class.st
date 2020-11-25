"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MLMatrix,
	#superclass : #Object,
	#category : #'MLLinearAlgebra-Matrix'
}

{ #category : #accessing }
MLMatrix class >> browserIcon [
"Answer icon to be displayed with matrix classes."
	
	^ nil
]

{ #category : #'instance creation' }
MLMatrix class >> new [
	"Create a new matrix with dimension zero."
	
	^self new: Number zero
]

{ #category : #'instance creation' }
MLMatrix class >> new: numberOrPoint [
	"Create a new square matrix with the given dimension."
	
	| point |
	point := numberOrPoint asPoint.
	^self
		rows: point x
		columns: point y
]

{ #category : #'instance creation' }
MLMatrix class >> new: numberOrPoint withAll: value [
	
	^(self new: numberOrPoint)
		atAllPut: value;
		yourself
]

{ #category : #'instance creation' }
MLMatrix class >> readFromDenseText: aStream [
	| m n matrix |
	m := Integer readFrom: aStream skipSeparators.
	n := Integer readFrom: aStream skipSeparators.
	matrix := self rows: m columns: n.
	1 to: m do: [ :row | 1 to: n do: [ :column | matrix at: row and: column put: (Number readFrom: aStream skipSeparators) ] ].
	^ matrix
]

{ #category : #'instance creation' }
MLMatrix class >> readFromSparseText: aStream [
	
	| m n matrix |
	n := Integer readFrom: aStream skipSeparators.
	m := Integer readFrom: aStream skipSeparators.
	Integer readFrom: aStream skipSeparators.
	matrix := self
		rows: m
		columns: n
		withAll: Number zero.
	1
		to: m
		do:
			[:rows | 
			1
				to: (Integer readFrom: aStream skipSeparators)
				do:
					[:unused | 
					matrix
						at: rows
						and: (Integer readFrom: aStream skipSeparators) + 1
						put: (Number readFrom: aStream skipSeparators)]].
	^matrix
]

{ #category : #'instance creation' }
MLMatrix class >> rows: m columns: n [
	"Create a new matrix with m rows and n columns."
	
	^(self basicNew)
		initializeRows: m columns: n;
		yourself
]

{ #category : #'instance creation' }
MLMatrix class >> rows: m columns: n withAll: value [
	
	^(self rows: m columns: n)
		atAllPut: value;
		yourself
]

{ #category : #private }
MLMatrix class >> switch: anObject caseMatrix: matrixBlock caseNestedCollection: nestedColletionBlock caseCollection: collectionBlock default: defaultBlock [
	(anObject isKindOf: MLMatrix) ifTrue: [ ^ matrixBlock value ].
	
	anObject isCollection
		ifTrue: [ (anObject isNotEmpty and: [ anObject allSatisfy: [ :each | each isCollection and: [ each size = anObject first size ] ] ])
				ifTrue: [ ^ nestedColletionBlock value ]
				ifFalse: [ ^ collectionBlock value ] ].
	^ defaultBlock value
]

{ #category : #'constants access' }
MLMatrix class >> unity [
	
	^MLMatrixCoercion with: 1
]

{ #category : #private }
MLMatrix class >> vectorSpecies [
	
	^MLArrayVector
]

{ #category : #'instance creation' }
MLMatrix class >> withAll: object [
	
	| dimension |
	dimension := self
		switch: object
		caseMatrix: [object dimension]
		caseNestedCollection: [object size @ object first size]
		caseCollection: [1 @ object size]
		default: [0].
	^(self new: dimension)
		atAllPut: object;
		yourself
]

{ #category : #'constants access' }
MLMatrix class >> zero [
	
	^MLMatrixCoercion with: 0
]

{ #category : #arithmetic }
MLMatrix >> * aNumber [
	
	^aNumber productFromMatrix: self
]

{ #category : #arithmetic }
MLMatrix >> *= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a * b]
]

{ #category : #'matrix functions' }
MLMatrix >> *~ aMatrix [
	"Answer the matrix multiplication of the reciever with the argument."
	
	| newMatrix |
	self columnSize = aMatrix rowSize ifFalse: [Array new noMatchError].
	newMatrix := self species
		rows: self rowSize
		columns: aMatrix columnSize.	"workaround: this should be done in a more generic way with double dispatch."
	newMatrix
		putWithIndices:
			((aMatrix isKindOf: MLDiagonalMatrix)
				ifTrue: [[:i :j | (self at: i and: j) * (aMatrix at: j and: j)]]
				ifFalse:
					[[:i :j | 
					(1 to: self columnSize)
						inject: 0
						into:
							[:sum :k | sum + ((self at: i and: k) * (aMatrix at: k and: j))]]]).
	^newMatrix
]

{ #category : #arithmetic }
MLMatrix >> + aNumber [
	
	^aNumber sumFromMatrix: self
]

{ #category : #arithmetic }
MLMatrix >> += aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a + b]
]

{ #category : #arithmetic }
MLMatrix >> - aNumber [
	
	^aNumber differenceFromMatrix: self
]

{ #category : #arithmetic }
MLMatrix >> -= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a - b]
]

{ #category : #arithmetic }
MLMatrix >> / aNumber [
	
	^aNumber quotientFromMatrix: self
]

{ #category : #arithmetic }
MLMatrix >> /= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a / b]
]

{ #category : #comparing }
MLMatrix >> = matrix [
	"Answer whether the dimension of the receiver is the same as otherMatrix' dimension,
	and each of the receiver's elements equal the corresponding element of otherMatrix."
	
	^self == matrix
		or:
			[(matrix isKindOf: MLMatrix)
				and:
					[(matrix hasDimension: self dimension)
						and:
							[self
								with: matrix
								do: [:a :b | a = b ifFalse: [^false]].
							true]]]
]

{ #category : #arithmetic }
MLMatrix >> adaptToNumber: rcvr andSend: selector [

	^ self perform: selector with: rcvr
]

{ #category : #arithmetic }
MLMatrix >> adaptToPoint: rcvr andSend: selector [

	^ self perform: selector with: rcvr
]

{ #category : #resizing }
MLMatrix >> addColumn [
	"Add a column. Must implement if isExtendable returns true."
	
	self shouldNotImplement
]

{ #category : #resizing }
MLMatrix >> addColumnBeforeIndex: anIndex [
	"Insert a column before anIndex. Must implement if isResizebale returns true."
	
	self shouldNotImplement
]

{ #category : #resizing }
MLMatrix >> addRow [
	"Add a row. Must implement if isExtendable returns true."
	
	self shouldNotImplement
]

{ #category : #resizing }
MLMatrix >> addRowBeforeIndex: anIndex [
	"Insert a row before anIndex. Must implement if isResizebale returns true."
	
	self shouldNotImplement
]

{ #category : #converting }
MLMatrix >> asArray [
	
	| array stream |
	array := Array new: self rowSize * self columnSize.
	stream := WriteStream on: array.
	self do: [:each | stream nextPut: each].
	^array
]

{ #category : #accessing }
MLMatrix >> at: row and: column [
	"Answer the vakue at the given indices."
	
	^self subclassResponsibility
]

{ #category : #arithmetic }
MLMatrix >> at: row and: column add: aNumber [
	"Add aNumber to the element at row and column.  Answer the sum."
	
	^self
		at: row
		and: column
		put: (self at: row and: column) + aNumber
]

{ #category : #arithmetic }
MLMatrix >> at: row and: column divide: aNumber [
	"Divide the element at row and column by aNumber.  Answer the quotient."
	
	^self
		at: row
		and: column
		put: (self at: row and: column) / aNumber
]

{ #category : #arithmetic }
MLMatrix >> at: row and: column multiply: aNumber [
	"Multiply aNumber with the element at row and column.  Answer the product."
	
	^self
		at: row
		and: column
		put: (self at: row and: column) * aNumber
]

{ #category : #accessing }
MLMatrix >> at: row and: column put: aNumber [
	"Store the vakue at the given indices."
	
	^self subclassResponsibility
]

{ #category : #arithmetic }
MLMatrix >> at: row and: column subtract: aNumber [
	"Subtract aNumber from the element at row and column.  Answer the difference."
	
	^self
		at: row
		and: column
		put: (self at: row and: column) - aNumber
]

{ #category : #accessing }
MLMatrix >> atAllPut: object [
	
	self class
		switch: object
		caseMatrix:
			[self
				with: object
				affect: [:a :b | b]]
		caseNestedCollection:
			[object size = self rowSize
				ifTrue:
					[[object first size = self columnSize] assert.
					self putWithIndices: [:row :column | (object at: row) at: column]]
				ifFalse:
					[object size = self columnSize
						ifTrue:
							[[object first size = self rowSize] assert.
							self putWithIndices: [:row :column | (object at: column) at: row]]
						ifFalse: [self error]]]
		caseCollection:
			[| stream |
			[object size = (self rowSize * self columnSize)] assert.
			stream := ReadStream on: object.
			self
				withIndices:
					[:row :column | 
					self
						at: row
						and: column
						put: stream next]]
		default:
			[self withIndices: [:row :column | self at: row and: column put: object]].
	^object
]

{ #category : #accessing }
MLMatrix >> atPoint: rowColumnCoordinate [
	
	^self
		at: rowColumnCoordinate x
		and: rowColumnCoordinate y
]

{ #category : #accessing }
MLMatrix >> atPoint: rowColumnCoordinate put: aNumber [
	
	^self
		at: rowColumnCoordinate x
		and: rowColumnCoordinate y
		put: aNumber
]

{ #category : #private }
MLMatrix >> checkInvariant [
	
	^self subclassResponsibility
]

{ #category : #coercing }
MLMatrix >> coerce: aNumber [
	
	^MLMatrixCoercion with: aNumber
]

{ #category : #enumerating }
MLMatrix >> collect: aBlock [
	
	| newMatrix |
	newMatrix := self copyEmpty.
	self
		withIndices:
			[:row :column | 
			newMatrix
				at: row
				and: column
				put: (aBlock value: (self at: row and: column))].
	^newMatrix
]

{ #category : #'accessing vectorwise' }
MLMatrix >> columnAt: columnIndex [
	
	^MLMatrixPath column: columnIndex on: self
]

{ #category : #'accessing vectorwise' }
MLMatrix >> columnAt: columnIndex put: vector [
	
	vector doWithIndex: [:each :row | self at: row and: columnIndex put: each].
	^vector
]

{ #category : #accessing }
MLMatrix >> columnSize [
	
	^self subclassResponsibility
]

{ #category : #'accessing vectorwise' }
MLMatrix >> columns [
	
	| array |
	array := Array new: self columnSize.
	1
		to: self columnSize
		do:
			[:index | 
			array
				at: index
				put: (self columnAt: index)].
	^array
]

{ #category : #copying }
MLMatrix >> copyEmpty [
	"Answer a copy of the receiver that contains no elements."
	
	^self copyEmpty: self dimension
]

{ #category : #copying }
MLMatrix >> copyEmpty: dimension [
	"Answer a copy of the receiver that contains no elements."
	
	^self species new: dimension
]

{ #category : #copying }
MLMatrix >> deepCopy [
	
	^self species withAll: self
]

{ #category : #accessing }
MLMatrix >> density [
	
	^self sparseSize / self size
]

{ #category : #arithmetic }
MLMatrix >> determinant [
	
	| a11 a12 a21 a22 |
	[self hasDimension: 2 @ 2] assert.
	a11 := self atPoint: 1 @ 1.
	a12 := self atPoint: 1 @ 2.
	a21 := self atPoint: 2 @ 1.
	a22 := self atPoint: 2 @ 2.
	^a11 * a22 - (a12 * a21)
]

{ #category : #'accessing vectorwise' }
MLMatrix >> diagonal [
	
	^MLMatrixPath diagonalOn: self
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromFixedPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromFloat: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromFraction: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromInteger: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromMatrix: aMatrix [
	
	^aMatrix
		with: self
		collect: [:a :b | a - b]
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromNumber: aNumber [
	
	^self collect: [:b | aNumber - b]
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> differenceFromSmallDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #accessing }
MLMatrix >> dimension [
	
	^self rowSize @ self columnSize
]

{ #category : #enumerating }
MLMatrix >> do: aBlock [
	
	self
		withIndices: [:row :column | aBlock value: (self at: row and: column)].
	^self
]

{ #category : #enumerating }
MLMatrix >> doSparseWithIndices: eachRowColumnBlock [
	
	self
		doWithIndices:
			[:each :row :column | 
			each isZero
				ifFalse: [eachRowColumnBlock value: each value: row value: column]].
	^self
]

{ #category : #enumerating }
MLMatrix >> doWithIndices: eachRowColumnBlock [
	
	self
		withIndices:
			[:row :column | 
			eachRowColumnBlock
				value: (self at: row and: column)
				value: row
				value: column]
]

{ #category : #accessing }
MLMatrix >> first [
	
	^self at: 1 and: 1
]

{ #category : #coercing }
MLMatrix >> generality [
	
	^240
]

{ #category : #testing }
MLMatrix >> hasDimension: aDimension [
	
	^self dimension = aDimension
]

{ #category : #comparing }
MLMatrix >> hash [
	
	^(self dimension hash bitXor: (self at: 1) hash)
		bitXor: (self at: self dimension) hash
]

{ #category : #'initialize-release' }
MLMatrix >> initializeRows: m columns: n [
	
	^self subclassResponsibility
]

{ #category : #enumerating }
MLMatrix >> inject: value into: aBlock [
	
	| result |
	result := value.
	self do: [:each | result := aBlock value: result value: each].
	^result
]

{ #category : #testing }
MLMatrix >> isComplex [
	
	^false
]

{ #category : #testing }
MLMatrix >> isDiagonal [
	"Answer if the reciever is a diagonal matrix."
	
	self isSquare ifFalse: [^false].
	self
		doSparseWithIndices:
			[:value :row :column | row = column ifFalse: [^false]].
	^true
]

{ #category : #testing }
MLMatrix >> isResizeable [
	
	^false
]

{ #category : #testing }
MLMatrix >> isSquare [
	"Answer if the reciever is a square matrix."
	
	^self rowSize = self columnSize
]

{ #category : #testing }
MLMatrix >> isSymetric [
	"Answer if the reciever is a symetric matrix."
	
	self isSquare ifFalse: [^false].
	1
		to: self columnSize
		do:
			[:column | 
			1
				to: column
				do:
					[:row | (self at: column and: row) = (self at: row and: column) ifFalse: [^false]]].
	^true
]

{ #category : #testing }
MLMatrix >> isZero [
	"Answer if the reciever contains no non-zero numbers."
	
	self doSparseWithIndices: [:value :row :column | ^false].
	^true
]

{ #category : #testing }
MLMatrix >> isZeroAt: row and: column [
	
	^(self at: row and: column) isZero
]

{ #category : #accessing }
MLMatrix >> last [
	
	^self
		at: self rowSize
		and: self columnSize
]

{ #category : #private }
MLMatrix >> noMatchError [
	self error: 'No match'
]

{ #category : #private }
MLMatrix >> noModificationError [
	self error: 'No modification'
]

{ #category : #printing }
MLMatrix >> printOn: aStream [
	"Append to the argument aStream a sequence of characters that identifies the matrix."

	| tooMany |
	tooMany := aStream position + 5000.
	aStream
		print: self class;
		space;
		print: self dimension;
		space;
		nextPut: $(.
	(1 to: self rowSize)
		do: [ :row | 
			aStream nextPut: $(.
			(1 to: self columnSize)
				do: [ :column | 
					aStream position > tooMany
						ifTrue: [ aStream
								nextPutAll: (#etc << #dialogs >> '...etc...') asString;
								nextPutAll: '))'.
							^ self ].
					aStream print: (self at: row and: column) ]
				separatedBy: [ aStream space ].
			aStream nextPut: $) ]
		separatedBy: [ aStream space ].
	aStream nextPut: $)
]

{ #category : #'double dispatching' }
MLMatrix >> productFromDouble: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> productFromFixedPoint: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> productFromFloat: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> productFromFraction: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> productFromInteger: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> productFromMatrix: aMatrix [
	
	^aMatrix
		with: self
		collect: [:a :b | a * b]
]

{ #category : #'double dispatching' }
MLMatrix >> productFromNumber: aNumber [
	
	^self collect: [:b | aNumber * b]
]

{ #category : #'double dispatching' }
MLMatrix >> productFromPoint: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> productFromSmallDouble: aNumber [
	
	^self productFromNumber: aNumber
]

{ #category : #enumerating }
MLMatrix >> putWithIndices: rowColumnBlock [
	
	self
		withIndices:
			[:row :column | 
			self
				at: row
				and: column
				put: (rowColumnBlock value: row value: column)].
	^self
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromFixedPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromFloat: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromFraction: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromInteger: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromMatrix: aMatrix [
	
	^aMatrix
		with: self
		collect: [:a :b | a / b]
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromNumber: aNumber [
	
	^self collect: [:b | aNumber / b]
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> quotientFromSmallDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #arithmetic }
MLMatrix >> reciprocal [
	
	^self
		collect:
			[:each | 
			each isZero
				ifTrue: [each]
				ifFalse: [each reciprocal]]
]

{ #category : #converting }
MLMatrix >> remap: mapping [
	
	^MLMappedMatrix on: self rowMap: mapping columnMap: mapping
]

{ #category : #resizing }
MLMatrix >> removeColumnAtIndex: anIndex [
	
	self shouldNotImplement
]

{ #category : #resizing }
MLMatrix >> removeRowAtIndex: anIndex [
	
	self shouldNotImplement
]

{ #category : #testing }
MLMatrix >> respondsToArithmetic [
	"We are arithmetic, yes."
	
	^true
]

{ #category : #arithmetic }
MLMatrix >> roundTo: aNumber [
	
	^self collect: [:each | each roundTo: aNumber]
]

{ #category : #'accessing vectorwise' }
MLMatrix >> rowAt: rowIndex [
	
	^MLMatrixPath row: rowIndex on: self
]

{ #category : #'accessing vectorwise' }
MLMatrix >> rowAt: rowIndex put: vector [
	
	vector
		doWithIndex: [:each :column | self at: rowIndex and: column put: each].
	^vector
]

{ #category : #accessing }
MLMatrix >> rowSize [
	
	^self subclassResponsibility
]

{ #category : #'accessing vectorwise' }
MLMatrix >> rows [
	
	| array |
	array := Array new: self rowSize.
	1
		to: self rowSize
		do:
			[:index | 
			array
				at: index
				put: (self rowAt: index)].
	^array
]

{ #category : #accessing }
MLMatrix >> size [
	
	^self rowSize * self columnSize
]

{ #category : #accessing }
MLMatrix >> sparseSize [
	
	| tally |
	tally := 0.
	self do: [:each | each isZero ifTrue: [tally := tally + 1]].
	^tally
]

{ #category : #private }
MLMatrix >> species [
	
	^self class
]

{ #category : #printing }
MLMatrix >> storeDenseTextOn: aStream [
	"Append to the argument aStream a sequence of characters 
	that identifies the collection."
	
	aStream
		print: self rowSize;
		space;
		print: self columnSize;
		cr.
	1
		to: self rowSize
		do:
			[:row | 
			(1 to: self columnSize)
				do: [:column | aStream print: (self at: row and: column)]
				separatedBy: [aStream space].
			aStream cr]
]

{ #category : #printing }
MLMatrix >> storeSparseTextOn: aStream [
	"Append to the argument aStream a sequence of characters 
	that identifies the collection."
	
	aStream
		print: self columnSize;
		space;
		print: self rowSize;
		space;
		print: self sparseSize;
		cr.
	self rows
		do:
			[:row | 
			aStream
				print: row sparseSize;
				cr.
			row
				doSparseWithIndex:
					[:value :index | 
					aStream
						print: index - 1;
						space;
						print: value;
						cr]]
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromFixedPoint: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromFloat: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromFraction: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromInteger: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromMatrix: aMatrix [
	
	^aMatrix
		with: self
		collect: [:a :b | a + b]
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromNumber: aNumber [
	
	^self collect: [:b | aNumber + b]
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromPoint: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MLMatrix >> sumFromSmallDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'matrix functions' }
MLMatrix >> transposed [
	
	^MLMatrixView transposeOn: self
]

{ #category : #private }
MLMatrix >> vectorSpecies [
	
	^self class vectorSpecies
]

{ #category : #enumerating }
MLMatrix >> with: aMatrix affect: eachOtherBlock [
	
	[aMatrix hasDimension: self dimension] assert.
	self
		putWithIndices:
			[:row :column | 
			eachOtherBlock
				value: (self at: row and: column)
				value: (aMatrix at: row and: column)]
]

{ #category : #enumerating }
MLMatrix >> with: aMatrix collect: eachOtherBlock [
	
	| newMatrix |
	[aMatrix hasDimension: self dimension] assert.
	newMatrix := self copyEmpty: self dimension.
	newMatrix
		putWithIndices:
			[:row :column | 
			eachOtherBlock
				value: (self at: row and: column)
				value: (aMatrix at: row and: column)].
	^newMatrix
]

{ #category : #enumerating }
MLMatrix >> with: aMatrix do: eachOtherBlock [
	
	[aMatrix hasDimension: self dimension] assert.
	self
		withIndices:
			[:row :column | 
			eachOtherBlock
				value: (self at: row and: column)
				value: (aMatrix at: row and: column)]
]

{ #category : #enumerating }
MLMatrix >> withIndices: aBlock [
	
	1
		to: self rowSize
		do:
			[:row | 
			1
				to: self columnSize
				do: [:column | aBlock value: row value: column]]
]
