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
				baseline: 'JavaScriptLink' with: [
					spec repository: 'github://feenkcom/JSLink/src' ];
				baseline: 'Chrome' with: [ 
					spec repository: 'github://feenkcom/Pharo-Chrome/repository' ];
				package: 'Gt4JSLink' with: [ spec requires: #( JavaScriptLink Chrome ) ]
		]
]
