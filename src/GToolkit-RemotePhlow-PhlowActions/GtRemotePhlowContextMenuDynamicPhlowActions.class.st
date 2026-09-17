Class {
	#name : #GtRemotePhlowContextMenuDynamicPhlowActions,
	#superclass : #GtRemotePhlowContextMenuCompositeAction,
	#instVars : [
		'actionsComputation',
		'label'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #'instance creation' }
GtRemotePhlowContextMenuDynamicPhlowActions class >> label: aLabel actions: aBlockClosure [
	^ self new 
		label: 'Dynamic phlow menu items';
		actions: aBlockClosure 
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicPhlowActions >> actions: aBlockClosure [
	actionsComputation := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicPhlowActions >> actionsComputation [
	^ actionsComputation
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicPhlowActions >> collectInvidualActionsOn: aCollection forElement: anElement item: anObject index: anIndex [
	aCollection addAll: (self actionsComputation 
		cull: GtRemotePhlowAction noAction
		cull: anElement 
		cull: anObject 
		cull: anIndex )
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicPhlowActions >> label [
	^ label
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicPhlowActions >> label: aString [ 
	label := aString
]
