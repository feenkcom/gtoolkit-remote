Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow-InspectorExtensions' }
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
		column: 'Value' item: [ :anAssociation | anAssociation value gtDisplayString ];
		send: [ :anAssociation | anAssociation value ]
]

{ #category : #'*GToolkit-RemotePhlow-InspectorExtensions' }
Object >> gtRemotePrintFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Print';
		priority: 110;
		text: [ self printString ]
]
