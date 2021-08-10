Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
Object >> gtRemotePrintFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Print';
		priority: 110;
		text: [ self printString ]
]

{ #category : #'*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
Object >> gtRemoteRawFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Raw';
		priority: 100;
		items: [ self gtRemoteVariableValuePairsWithSelfIf: true ];
		column: 'Icon' 
			iconName: [ :anAssociation | anAssociation value class gtSystemIconName ]
			width: 36;
		column: 'Variable' text: [ :anAssociation | anAssociation key ];
		column: 'Value' text: [ :anAssociation | anAssociation value gtDisplayString ];
		send: [ :anAssociation | anAssociation value ]
]
