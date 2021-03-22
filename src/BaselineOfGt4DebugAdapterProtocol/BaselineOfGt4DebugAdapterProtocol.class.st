Class {
	#name : #BaselineOfGt4DebugAdapterProtocol,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4DebugAdapterProtocol
}

{ #category : #baseline }
BaselineOfGt4DebugAdapterProtocol >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'DebugAdapterProtocol' with: [
				spec repository: 'github://feenkcom/pharo-debugadapterprotocol:v0.5.123/src' ].
		spec package: 'Gt4DebugAdapterProtocol' with: [
				spec requires: #('DebugAdapterProtocol' ). ]. ].

]
