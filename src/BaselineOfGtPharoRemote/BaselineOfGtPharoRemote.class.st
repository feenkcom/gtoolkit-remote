"
Load the server for remote Gt access to a Pharo image.

Note that this package isn't normally loaded in a Gt image, see ${class:name=BaselineOfGToolkitRemote}$.
"
Class {
	#name : #BaselineOfGtPharoRemote,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtPharoRemote
}

{ #category : #baseline }
BaselineOfGtPharoRemote >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'PharoLink' with: [ spec repository: 'github://feenkcom/Pharolink/src' ];
				package: 'GToolkit-RemotePharo' with: [ spec requires: #( PharoLink ) ]
		]
]
