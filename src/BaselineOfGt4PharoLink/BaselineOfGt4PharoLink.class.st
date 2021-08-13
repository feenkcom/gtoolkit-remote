Class {
	#name : 'BaselineOfGt4PharoLink',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfGt4PharoLink'
}

{ #category : 'baseline' }
BaselineOfGt4PharoLink >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'PharoLink' with: [
				spec repository: 'github://feenkcom/PharoLink:main/src' ].
		spec baseline: 'GToolkitRemote' with: [
				spec repository: 'github://feenkcom/gtoolkit-remote:main/src' ].
		spec package: 'Gt4PharoLink' with: [
				spec requires: #('PharoLink' 'GToolkitRemote'). ]. ].

]
