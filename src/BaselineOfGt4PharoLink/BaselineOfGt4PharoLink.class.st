Class {
	#name : #BaselineOfGt4PharoLink,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4PharoLink
}

{ #category : #baseline }
BaselineOfGt4PharoLink >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'PharoLink' with: [
				spec repository: 'github://feenkcom/PharoLink:v0.8.520/src' ].
		spec
			baseline: 'GToolkitRemote' with: [
				spec repository: 'github://feenkcom/gtoolkit-remote:v0.9.99/src' ].

		spec package: 'Gt4PharoLink' with: [
			spec requires: #(#PharoLink #GToolkitRemote) ].
	]
]
