Extension { #name : #SequenceableCollection }

{ #category : #'*AI-MooseLinearAlgebra' }
SequenceableCollection >> asVector [

	^ AIArrayVector withAll: self.
]

{ #category : #'*AI-MooseLinearAlgebra' }
SequenceableCollection >> hasSize: size [

	^ self size = size.
]

{ #category : #'*AI-MooseLinearAlgebra' }
SequenceableCollection class >> withSize: size [

	^ self new: size
]
