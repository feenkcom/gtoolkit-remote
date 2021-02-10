Class {
	#name : #BaselineOfGToolkitRemote,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitRemote
}

{ #category : #baseline }
BaselineOfGToolkitRemote >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'GToolkitPhlow' with: [ spec repository: 'github://feenkcom/gtoolkit-phlow/src' ];
				package: 'GToolkit-Remote' with: [ spec requires: #( GToolkitPhlow ) ]
		]
]
