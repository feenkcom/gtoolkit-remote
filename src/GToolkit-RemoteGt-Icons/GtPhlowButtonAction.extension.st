Extension { #name : #GtPhlowButtonAction }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> asGtDeclarativeAction [
	| specification |
	specification := GtPhlowButtonActionSpecification new
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
			targetBlock: self actionComputation).
	self asMenuOptionsSpecification ifNotNil: [ :currentMenuOptions |
		specification menuOptions: currentMenuOptions ].
	self target asRemotePhlowActionTarget ifNotNil: [ :aRemoteTarget |
		specification target: aRemoteTarget ].
	^ specification
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> asItemBoundActionToItem: anItem viewSelection: anIndex [
	"Normal phlow actions do no get the item or the selection as parameters.
	They are bound already to them when they are created."
	^ self
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> canBeGtDeclarativeAction [
	"
	Allow icons as they get serialized.
	(icon notNil and: [
			(icon isKindOf: GtPhlowIconStencil) not ]) ifTrue: [ ^ false ]."
	
	self target asRemotePhlowActionTarget ifNil: [ ^ false ].
	^ true
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowButtonAction >> shouldShowContextActionOn: anItem viewSelection: aSelectionIndex [ 
	^ true
]
