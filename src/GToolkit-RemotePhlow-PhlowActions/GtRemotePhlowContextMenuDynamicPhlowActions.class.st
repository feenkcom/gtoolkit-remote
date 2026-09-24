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
GtRemotePhlowContextMenuDynamicPhlowActions >> collectInvidualActionsOn: aCollection forElement: anElement item: anObject index: aSelectionIndex [
	| collectedActions |
	collectedActions := self toActionOn: anObject index: aSelectionIndex element: anElement.
	aCollection addAll: (collectedActions select: [ :anAction | 
			anAction shouldShowContextActionOn: anObject viewSelection: aSelectionIndex ])
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicPhlowActions >> label [
	^ label
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicPhlowActions >> label: aString [ 
	label := aString
]

{ #category : #accessing }
GtRemotePhlowContextMenuDynamicPhlowActions >> toActionOn: anItem index: anItemIndex element: anElement [
	^ self actionsComputation 
			cull: GtRemotePhlowAction noAction
			cull: anElement 
			cull: anItem 
			cull: anItemIndex
]
