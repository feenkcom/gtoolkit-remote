Class {
	#name : #BaselineOfGt4DebugAdapterProtocol,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4DebugAdapterProtocol
}

{ #category : #baseline }
BaselineOfGt4DebugAdapterProtocol >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'DebugAdapterProtocol' with: [ 
					spec repository: 'github://feenkcom/pharo-debugadapterprotocol:main/src' ];
				package: 'Gt4DebugAdapterProtocol' with: [ spec requires: #( DebugAdapterProtocol ) ]
		]
]
