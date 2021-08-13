Class {
	#name : #BaselineOfGtRemotePharoExamples,
	#superclass : #BaselineOf,
	#category : 'BaselineOfGtRemotePharoExamples'
}

{ #category : #baselines }
BaselineOfGtRemotePharoExamples >> baseline: spec [
	<baseline>

	spec for: #common do: [ 
		spec baseline: 'Gt4PharoLink' with: [
				spec repository: 'github://feenkcom/gtoolkit-remote:main/src' ].
		spec package: 'GToolkit-RemoteExamples-Pharo' with: [
				spec requires: #('Gt4PharoLink') ]
		 ].
]
