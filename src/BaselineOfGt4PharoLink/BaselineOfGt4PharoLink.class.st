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
				spec repository: 'github://feenkcom/PharoLink:v0.8.474/src' ].
		spec
			baseline: 'GToolkitRemote' with: [
				spec repository: 'github://feenkcom/gtoolkit-remote:v0.8.2105/src' ].

		spec package: 'Gt4PharoLink' with: [
			spec requires: #(#PharoLink #GToolkitRemote) ].
	]
]
