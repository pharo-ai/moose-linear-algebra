Class {
	#name : #BaselineOfMLLinearAlgebra,
	#superclass : #BaselineOf,
	#category : #BaselineOfMLLinearAlgebra
}

{ #category : #baselines }
BaselineOfMLLinearAlgebra >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'MLLinearAlgebra';
				package: 'MLLinearAlgebra-Tests' with: [ spec requires: #(MLLinearAlgebra) ].
			spec 
				group: 'Core' 						with: #('MLLinearAlgebra');
				group: 'Tests' 						with: #('MLLinearAlgebra' 'MLLinearAlgebra-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
