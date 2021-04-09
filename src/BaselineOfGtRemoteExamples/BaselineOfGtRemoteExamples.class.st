Class {
	#name : #BaselineOfGtRemoteExamples,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtRemoteExamples
}

{ #category : #baseline }
BaselineOfGtRemoteExamples >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'GToolkitRemote' 
					with: [ spec repository: 'github://feenkcom/gtoolkit-remote/src' ];
				package: 'GToolkit-RemoteExamples' 
					with: [ spec requires: #( GToolkitRemote ) ]
		]
]
