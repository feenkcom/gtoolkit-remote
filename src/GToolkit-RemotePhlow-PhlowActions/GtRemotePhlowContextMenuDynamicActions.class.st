Class {
	#name : #GtRemotePhlowContextMenuDynamicActions,
	#superclass : #GtRemotePhlowContextMenuCompositeAction,
	#instVars : [
		'label',
		'actionsComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #'instance creation' }
GtRemotePhlowContextMenuDynamicActions class >> label: aLabel actions: aBlockClosure [
	^ self new 
		label: 'Dynamic phlow menu items';
		actions: aBlockClosure 
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuDynamicActions >> actions: aBlockClosure [
	actionsComputation := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicActions >> actionsComputation [
	^ actionsComputation
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicActions >> label [
	^ label
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuDynamicActions >> label: aString [ 
	label := aString
]

{ #category : #collecting }
GtRemotePhlowContextMenuDynamicActions >> toActionOn: anItem index: anIndexSelection element: anElement [
	^ self actionsComputation cull: anElement cull: anItem cull: anIndexSelection
]
