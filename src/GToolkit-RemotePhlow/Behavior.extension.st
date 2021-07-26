Extension { #name : 'Behavior' }

{ #category : '*GToolkit-RemotePhlow' }
Behavior >> gtMethodsListRemoteFor: aView [
	<gtView>

	^ aView list
		title: 'Methods List';
		priority: 15;
		items: [ self methods sorted: [ :a :b | a selector < b selector ] ];
		itemText: [ :method | method selector ]
]
