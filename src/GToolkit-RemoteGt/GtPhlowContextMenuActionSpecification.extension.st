Extension { #name : #GtPhlowContextMenuActionSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowContextMenuActionSpecification >> actionFor: anAction [
	^ self menuActionFor: anAction item: nil index: nil
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowContextMenuActionSpecification >> menuActionFor: anAction item: anItem index: anIndex [
	^ BrMenuActionItem new
		label: (self label ifNil: [ '' ]);
		action: [ :anElement | 
			| remoteWrappedActionData |
			remoteWrappedActionData := self phlowDataSource
				executeContextMenuActionForElement: anElement item: anItem index: anIndex.
			remoteWrappedActionData ifNotNil: [ 
				| remoteWrappedAction |
				remoteWrappedAction := GtRemotePhlowNavigationAction 
					navigationActionFromDictionary: remoteWrappedActionData.
				remoteWrappedAction applyOn: anElement ] ]
]
