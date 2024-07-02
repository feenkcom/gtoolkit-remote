Extension { #name : #GtPhlowButtonActionSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowButtonActionSpecification >> actionFor: anAction [
	| localAction |
	localAction := anAction button.

	self priority ifNotNil: [ :aPriority |
		localAction priority: aPriority ].
	self label ifNotNil: [ :aLabel |
		localAction label: aLabel ].
	localAction action: [ :aButtonElement | 
		(GtRemotePhlowNavigationAction fromDictionary: self 
				phlowDataSource executeRemoteActionWithPhlowResult)
			applyOn: aButtonElement  ].
	
	^ localAction
]
