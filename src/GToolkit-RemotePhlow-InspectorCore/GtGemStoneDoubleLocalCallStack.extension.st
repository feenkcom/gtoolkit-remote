Extension { #name : #GtGemStoneDoubleLocalCallStack }

{ #category : #'*GToolkit-RemotePhlow-InspectorCore' }
GtGemStoneDoubleLocalCallStack >> gtViewDoubleStackFramesFor: aView withBackground: aBackgroundBlock [
	
	^ aView columnedList 
		items: [ callFrames ];
		column: 'Index' textDo: [ :aColumn |
			aColumn
				format: [ :aDoubleFrame :anIndex | anIndex ];
				width: 75;
				background: aBackgroundBlock ];
		column: 'Identifier' textDo: [ :aColumn | 
			aColumn
				format: [ :aDoubleFrame |
					aDoubleFrame frameIdentifierDescription ];
				width: 75;
				background: aBackgroundBlock ];
		column: 'IP Offset' textDo: [ :aColumn | 
			aColumn
				format: [ :aDoubleFrame |
					aDoubleFrame ipOffsetDescription ];
				width: 75;
				background: aBackgroundBlock ];
		column: 'New Stack'  textDo: [ :aColumn | 
			aColumn
				format: [ :aDoubleFrame |
					aDoubleFrame newCallFrame 
						ifNil: [ '-' ] ifNotNil: [ :aCallFrame | 
							aCallFrame methodDescription ] ];
				background: aBackgroundBlock ];
		column: 'Previous Stack'  textDo: [ :aColumn | 
			aColumn
				format: [ :aDoubleFrame |
					(aDoubleFrame isForSameMethodOrBlock not and: [
						aDoubleFrame newCallFrame notNil ])
							ifFalse: [ ''] 
							ifTrue: [ 
								aDoubleFrame newCallFrame methodDescription ] ];
				background: [ :aDescription :aDoubleFrame |
					aDoubleFrame isForSameMethodOrBlock 
						ifTrue: [GtPhlowColor transparent]
						ifFalse: [ 
							aBackgroundBlock cull: aDescription cull: aDoubleFrame ] ] ]
]
