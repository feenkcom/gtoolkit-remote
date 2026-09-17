Extension { #name : #GtRemotePhlowContextMenuItemBoundActionSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowContextMenuItemBoundActionSpecification >> actionFor: anAction [
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
		
	localAction action: [ :anElement | 
		| remoteWrappedActionData |
		remoteWrappedActionData := self phlowDataSource
			executeRemoteActionWithPhlowResult.
		remoteWrappedActionData ifNotNil: [ 
			| remoteWrappedAction |
			remoteWrappedAction := GtRemotePhlowNavigationAction 
				navigationActionFromDictionary: remoteWrappedActionData.
			remoteWrappedAction applyOn: anElement ] ].
	
	^ localAction
]
