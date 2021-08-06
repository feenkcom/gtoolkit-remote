Extension { #name : #SmalltalkImage }

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
SmalltalkImage >> gtClassesListRemoteFor: aView [
	<gtView>

	^ aView list
		title: 'Classes List';
		priority: 55;
		items: [ self allClasses sorted: [ :a :b | a name < b name ] ];
		itemText: [ :class | class name ]
]
