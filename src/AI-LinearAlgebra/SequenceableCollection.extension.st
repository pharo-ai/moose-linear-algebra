Extension { #name : #SequenceableCollection }

{ #category : #'*AI-LinearAlgebra' }
SequenceableCollection >> asVector [

	^ AIArrayVector withAll: self.
]

{ #category : #'*AI-LinearAlgebra' }
SequenceableCollection >> hasSize: size [

	^ self size = size.
]

{ #category : #'*AI-LinearAlgebra' }
SequenceableCollection class >> withSize: size [

	^ self new: size
]
