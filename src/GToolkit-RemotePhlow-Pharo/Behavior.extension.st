Extension { #name : 'Behavior' }

{ #category : '*GToolkit-RemotePhlow-Pharo' }
Behavior >> gtMethodsRemoteFor: aView [
	"<gtView>"

	^ aView columnedList
		title: 'Methods';
		priority: 10;
		items: [ self gtSortedMethods ];
		column: 'Selector' item: [ :method | method selector ];
		column: 'Instance' item: [ :method | method methodClass isMeta not ] width: 100
]

{ #category : '*GToolkit-RemotePhlow-Pharo' }
Behavior >> gtSortedMethods [
	"Answer the methods sorted by instance/class, selector"

	^ (self instanceSide methods sorted: #selector ascending),
		(self classSide methods sorted: #selector ascending)
]
