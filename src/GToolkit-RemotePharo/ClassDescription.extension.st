Extension { #name : #ClassDescription }

{ #category : #'*GToolkit-RemotePharo' }
ClassDescription >> gtSubclassesFor: aView [
	<gtView>

	^ aView tree
		title: 'Subclasses';
		priority: 15;
		items: [ { self } ];
		children: [ :item | item subclasses ]
]
