Extension { #name : #GtPhlowButtonAction }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowButtonAction >> asGtDeclarativeAction [
	^ GtPhlowButtonActionSpecification new
		priority: self priority;
		label: label;
		phlowDataSource: (GtRemotePhlowDeclarativeBlockActionDataSource new
			phlowAction: self;
			targetBlock: self actionBlock)
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowButtonAction >> canBeGtDeclarativeAction [
	^ true
]
