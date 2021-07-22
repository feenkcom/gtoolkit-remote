Extension { #name : 'GtRemotePhlowViewedObject' }

{ #category : '*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowViewedObject >> addRawSelfNodeTo: variableNodes [
	^ variableNodes add: (GTInspectorSelfNode hostObject: object).
	
]
