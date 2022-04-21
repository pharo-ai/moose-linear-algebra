Extension { #name : #Point }

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> differenceFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a - self]
]

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> differenceFromVector: aVector [
	
	^aVector collect: [:a | a - self]
]

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> productFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a * self]
]

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> productFromVector: aVector [
	
	^aVector collect: [:a | a * self]
]

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> quotientFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a / self]
]

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> quotientFromVector: aVector [
	
	^aVector collect: [:a | a / self]
]

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> sumFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a + self]
]

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> sumFromVector: aVector [
	
	^aVector collect: [:a | a + self]
]

{ #category : #'*AI-MooseLinearAlgebra' }
Point >> transpose [
	^ y@x
]
