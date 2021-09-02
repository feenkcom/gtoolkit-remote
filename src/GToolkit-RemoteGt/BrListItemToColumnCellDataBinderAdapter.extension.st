Extension { #name : 'BrListItemToColumnCellDataBinderAdapter' }

{ #category : '*GToolkit-RemoteGt' }
BrListItemToColumnCellDataBinderAdapter >> asRemotePhlowDeclarativeListingType [
	^ listItemDataBinder asRemotePhlowDeclarativeListingType
]

{ #category : '*GToolkit-RemoteGt' }
BrListItemToColumnCellDataBinderAdapter >> asRemotePhlowDeclarativeValueComputationFor: anItemObject index: anItemIndex [
	^ listItemDataBinder
		asRemotePhlowDeclarativeValueComputationFor: anItemObject
		index: anItemIndex
]
