Extension { #name : #Behavior }

{ #category : #'*GToolkit-RemotePhlow' }
Behavior >> gtMethodsListRemoteFor: aView [
	<gtView>

	^ aView list
		title: 'Methods List';
		priority: 15;
		items: [ self methods sorted: [ :a :b | a selector < b selector ] ];
		itemText: [ :method | method selector ]
]

{ #category : #'*GToolkit-RemotePhlow' }
Behavior >> gtMethodsRemoteFor: aView [
	"<gtView>"

	^ aView columnedList
		title: 'Methods';
		priority: 10;
		items: [ self gtSortedMethods ];
		column: 'Selector' item: [ :method | method selector ];
		column: 'Instance' item: [ :method | method methodClass isMeta not ] width: 100
]

{ #category : #'*GToolkit-RemotePhlow' }
Behavior >> gtSortedMethods [
	"Answer the methods sorted by instance/class, selector"

	^ (self instanceSide methods sorted: #selector ascending),
		(self classSide methods sorted: #selector ascending)
]
