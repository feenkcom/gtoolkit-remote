Extension { #name : 'Behavior' }

{ #category : '*GToolkit-RemotePhlow-Gemstone' }
Behavior >> gtMethodsListRemoteFor: aView [
	<gtView>

	^ aView list
		title: 'Methods List';
		priority: 15;
		items: [ (self methodDictForEnv: 0) values asSortedCollection: [ :a :b | a selector < b selector ] ];
		itemText: [ :method | method selector ]
]
