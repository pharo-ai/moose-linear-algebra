Extension { #name : #Point }

{ #category : #'*MLLinearAlgebra' }
Point >> differenceFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a - self]
]

{ #category : #'*MLLinearAlgebra' }
Point >> differenceFromVector: aVector [
	
	^aVector collect: [:a | a - self]
]

{ #category : #'*MLLinearAlgebra' }
Point >> productFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a * self]
]

{ #category : #'*MLLinearAlgebra' }
Point >> productFromVector: aVector [
	
	^aVector collect: [:a | a * self]
]

{ #category : #'*MLLinearAlgebra' }
Point >> quotientFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a / self]
]

{ #category : #'*MLLinearAlgebra' }
Point >> quotientFromVector: aVector [
	
	^aVector collect: [:a | a / self]
]

{ #category : #'*MLLinearAlgebra' }
Point >> sumFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a + self]
]

{ #category : #'*MLLinearAlgebra' }
Point >> sumFromVector: aVector [
	
	^aVector collect: [:a | a + self]
]

{ #category : #'*MLLinearAlgebra' }
Point >> transpose [
	^ y@x
]
