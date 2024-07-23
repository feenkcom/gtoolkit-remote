Extension { #name : #GtPhlowButtonAction }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> asGtDeclarativeAction [
	^ GtPhlowButtonActionSpecification new
		priority: self priority;
		label: label;
		iconStencil: icon;
		phlowDataSource: (GtRemotePhlowDeclarativeBlockActionDataSource new
			phlowAction: self;
			targetBlock: self actionBlock)
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> canBeGtDeclarativeAction [
	^ icon isNil or: [
		icon isKindOf: GtPhlowIconStencil ]
]
