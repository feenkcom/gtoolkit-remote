"
Load the client and server components for remote Gt access.
"
Class {
	#name : #BaselineOfGToolkitRemote,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitRemote
}

{ #category : #baseline }
BaselineOfGToolkitRemote >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.346/src' ].
		spec package: 'GToolkit-RemoteGt' with: [
				spec requires: #('GToolkitPhlow' ). ]. ].

]
