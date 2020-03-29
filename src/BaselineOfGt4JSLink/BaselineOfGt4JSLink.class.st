Class {
	#name : #BaselineOfGt4JSLink,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4JSLink
}

{ #category : #baseline }
BaselineOfGt4JSLink >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'JSLink' with: [
					spec repository: 'github://feenkcom/JSLink/src' ];
				package: 'Gt4JSLink' with: [ spec requires: #( JSLink ) ]
		]
]
