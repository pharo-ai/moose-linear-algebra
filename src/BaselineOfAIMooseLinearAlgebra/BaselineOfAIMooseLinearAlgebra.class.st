Class {
	#name : #BaselineOfAIMooseLinearAlgebra,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIMooseLinearAlgebra
}

{ #category : #baselines }
BaselineOfAIMooseLinearAlgebra >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'AI-MooseLinearAlgebra';
				package: 'AI-MooseLinearAlgebra-Tests' with: [ spec requires: #('AI-MooseLinearAlgebra') ].
			spec 
				group: 'Core' with: #('AI-MooseLinearAlgebra');
				group: 'Tests' with: #('AI-MooseLinearAlgebra' 'AI-MooseLinearAlgebra-Tests');
				group: 'default' with: #('Core' 'Tests') ]
]
