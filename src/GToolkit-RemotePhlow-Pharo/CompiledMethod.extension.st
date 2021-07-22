Extension { #name : 'CompiledMethod' }

{ #category : '*GToolkit-RemotePhlow-Pharo' }
CompiledMethod >> gtSourceCodeFor: aView [
	<gtView>

	^ aView textEditor
		title: 'Source';
		priority: 10;
		text: [ self sourceCode ]
]
