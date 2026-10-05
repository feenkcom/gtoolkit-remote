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
		id: self targetAction id;
		label: self targetAction label;
		disabled: self shouldDisableContextAction;
		iconStencil: self targetAction iconStencil;
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

{ #category : #testing }
GtRemotePhlowContextMenuItemBoundAction >> shouldDisableContextAction [
	^ self targetAction 
			shouldDisableContextActionOn: item viewSelection: item
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
