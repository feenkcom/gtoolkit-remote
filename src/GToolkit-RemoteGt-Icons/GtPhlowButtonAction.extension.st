Extension { #name : #GtPhlowButtonAction }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> asGtDeclarativeAction [
	^ GtPhlowButtonActionSpecification new
		priority: self priority;
		label: label;
		iconStencil: (((icon isKindOf: BlElement) or: [ icon isKindOf: BlStencil])
			ifTrue: [ GtPhlowPngBytesIconStencil fromElement: icon asElement ] 
			ifFalse: [ icon ]);
		in: [ :aSpecification | 
			self tooltipBuilder 
				applyToActionSpecification: aSpecification ];
		phlowDataSource: (GtRemotePhlowDeclarativeBlockActionDataSource new
			phlowAction: self;
			targetBlock: self actionComputation)
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> asItemBoundActionToItem: anItem viewSelection: anIndex [
	"Normal phlow actions do no get the item or the selection as parameters.
	They are bound already to them when they are created."
	^ self
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> canBeGtDeclarativeAction [
	^ icon isNil or: [
		icon isKindOf: GtPhlowIconStencil ]
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> shouldShowContextActionOn: anItem viewSelection: aSelectionIndex [ 
	^ true
]
