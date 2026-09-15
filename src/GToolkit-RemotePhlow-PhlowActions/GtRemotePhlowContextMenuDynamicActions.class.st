Class {
	#name : #GtRemotePhlowContextMenuDynamicActions,
	#superclass : #GtRemotePhlowContextMenuCompositeAction,
	#instVars : [
		'label',
		'actionsComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #accessing }
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

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicActions >> label: aString [ 
	label := aString
]
