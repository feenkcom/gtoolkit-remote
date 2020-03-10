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
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.7.414/src' ].
		spec package: 'GToolkit-Remote' with: [
				spec requires: #(#GToolkitPhlow ). ]. ].

]
