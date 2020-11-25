Extension { #name : #SequenceableCollection }

{ #category : #'*MLLinearAlgebra' }
SequenceableCollection >> asVector [

	^ MLArrayVector withAll: self.
]

{ #category : #'*MLLinearAlgebra' }
SequenceableCollection >> hasSize: size [

	^ self size = size.
]

{ #category : #'*MLLinearAlgebra' }
SequenceableCollection class >> withSize: size [

	^ self new: size
]
