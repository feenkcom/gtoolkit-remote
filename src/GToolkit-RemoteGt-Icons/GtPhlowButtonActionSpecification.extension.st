Extension { #name : #GtPhlowButtonActionSpecification }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonActionSpecification >> actionFor: anAction [
	| localAction |
	localAction := anAction button.

	self priority ifNotNil: [ :aPriority |
		localAction priority: aPriority ].
	self tooltipText ifNotNil: [ :aText |
		localAction tooltip: aText ].
	self label ifNotNil: [ :aText |
		localAction label: aText ].
	self iconStencil ifNotNil: [ :anIconStencil |
		localAction icon: anIconStencil ].
	localAction action: [ :aButtonElement | 
		(GtRemotePhlowNavigationAction navigationActionFromDictionary: self 
				phlowDataSource executeRemoteActionWithPhlowResult)
			applyOn: aButtonElement  ].
	
	^ localAction
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonActionSpecification >> gtViewJSONFor: aView [
	<gtView>
	
	^ aView forward
		title: 'JSON';
		priority: 10;
		object: [ GtJson
			forJsonString: (NeoJSONWriter 
				toStringPretty:  self asDictionaryForExport) ];
		view: #gtJsonStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect 
			label: 'Json'
			tooltip: 'Inspect the JSON object'
			action: [ :aButton |
				aButton phlow 
					spawnObject: aButton phlow forwardViewObjectFromViewAction ]
]
