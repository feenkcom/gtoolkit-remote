Extension { #name : 'Object' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
Object >> gtActionBrowseFor: anAction [
	<gtAction>
	
	^ anAction button
		tooltip: 'Browse class for current object';
		priority: 70;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #emphasizedBrowse);
		action: [ :aButton |
			aButton phlow 
				spawnObject: self class ]
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
Object >> gtActionInspectFor: anAction [
	<gtAction>
	
	^ anAction button
		tooltip:'Inspect current object';
		priority: 75;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #inspect);
		action: [ :aButton |
			aButton phlow 
				spawnObject: self ]
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
Object >> gtPrintFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Print';
		priority: 110;
		text: [ self printString ]
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
Object >> gtRawFor: aView [
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
