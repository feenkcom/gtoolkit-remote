Class {
	#name : #BaselineOfGt4PharoLink,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4PharoLink
}

{ #category : #baseline }
BaselineOfGt4PharoLink >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'PharoLink' with: [
					spec repository: 'github://feenkcom/PharoLink/src' ];
				package: 'Gt4PharoLink' with: [ spec requires: #( PharoLink ) ]
		]
]
