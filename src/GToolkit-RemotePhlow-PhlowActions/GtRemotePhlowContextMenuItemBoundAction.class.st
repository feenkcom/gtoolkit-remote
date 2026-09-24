Class {
	#name : #GtRemotePhlowContextMenuItemBoundAction,
	#superclass : #Object,
	#instVars : [
		'targetAction',
		'item',
		'viewSelection'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundAction >> actionComputation [
	^ targetAction actionComputation
]

{ #category : #converting }
GtRemotePhlowContextMenuItemBoundAction >> asGtDeclarativeAction [
	^ GtRemotePhlowContextMenuItemBoundActionSpecification new
		tooltipText: targetAction tooltipText;
		label: self label;
		iconStencil: targetAction iconStencil;
		phlowDataSource: (GtRemotePhlowContextMenuItemBoundActionDataSource new
			phlowAction: self)
]

{ #category : #actions }
GtRemotePhlowContextMenuItemBoundAction >> executeActionFrom: anElement [
	^ self actionComputation
			cull: anElement cull: item cull: viewSelection
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundAction >> item [
	^ item
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundAction >> item: anObject [
	item := anObject
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundAction >> label [
	^ targetAction label
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundAction >> targetAction [
	^ targetAction
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundAction >> targetAction: anObject [
	targetAction := anObject
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundAction >> viewSelection [
	^ viewSelection
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundAction >> viewSelection: anObject [
	viewSelection := anObject
]
