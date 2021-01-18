Extension { #name : #Point }

{ #category : #'*AI-LinearAlgebra' }
Point >> differenceFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a - self]
]

{ #category : #'*AI-LinearAlgebra' }
Point >> differenceFromVector: aVector [
	
	^aVector collect: [:a | a - self]
]

{ #category : #'*AI-LinearAlgebra' }
Point >> productFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a * self]
]

{ #category : #'*AI-LinearAlgebra' }
Point >> productFromVector: aVector [
	
	^aVector collect: [:a | a * self]
]

{ #category : #'*AI-LinearAlgebra' }
Point >> quotientFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a / self]
]

{ #category : #'*AI-LinearAlgebra' }
Point >> quotientFromVector: aVector [
	
	^aVector collect: [:a | a / self]
]

{ #category : #'*AI-LinearAlgebra' }
Point >> sumFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a + self]
]

{ #category : #'*AI-LinearAlgebra' }
Point >> sumFromVector: aVector [
	
	^aVector collect: [:a | a + self]
]

{ #category : #'*AI-LinearAlgebra' }
Point >> transpose [
	^ y@x
]
