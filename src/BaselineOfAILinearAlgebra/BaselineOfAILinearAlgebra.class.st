Class {
	#name : #BaselineOfAILinearAlgebra,
	#superclass : #BaselineOf,
	#category : #BaselineOfAILinearAlgebra
}

{ #category : #baselines }
BaselineOfAILinearAlgebra >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'AI-LinearAlgebra';
				package: 'AI-LinearAlgebra-Tests' with: [ spec requires: #('AI-LinearAlgebra') ].
			spec 
				group: 'Core' 						with: #('AI-LinearAlgebra');
				group: 'Tests' 						with: #('AI-LinearAlgebra' 'AI-LinearAlgebra-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
