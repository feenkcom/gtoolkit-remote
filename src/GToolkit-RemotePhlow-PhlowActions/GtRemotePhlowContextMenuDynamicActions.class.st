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

{ #category : #collecting }
GtRemotePhlowContextMenuDynamicActions >> collectInvidualActionsOn: aCollection forElement: anElement item: anObject index: anIndex [
	aCollection addAll: (self actionsComputation 
		cull: anElement cull: anObject cull: anIndex )
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicActions >> label [
	^ label
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuDynamicActions >> label: aString [ 
	label := aString
]
