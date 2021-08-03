Extension { #name : 'Object' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions' }
Object >> gRemoteRawFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Raw';
		priority: 50;
		items: [ self gtRemoteVariableValuePairsWithSelfIf: true ];
		column: 'Icon' 
			iconName: [ :anAssociation | anAssociation value class gtSystemIconName ]
			width: 36;
		column: 'Variable' item: [ :anAssociation | anAssociation key ];
		column: 'Value' item: [ :anAssociation | anAssociation value gtRemoteDisplayString ];
		send: [ :anAssociation | anAssociation value ]
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions' }
Object >> gtPharoDeclarativeViewSelectors [
	"Answer a collection of the object's declarative view selectors"

	^ ((Pragma 
		allNamed: #gtView
		from: self class
		to: Object) collect: [ :each | each method selector ]) asSet asArray
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions' }
Object >> gtPrintRemoteFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Print';
		priority: 110;
		text: [ self printString ]
]
