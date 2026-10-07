Class {
	#name : #GtRemotePhlowContextMenuCompositeAction,
	#superclass : #GtRemotePhlowContextMenuBasicAction,
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #testing }
GtRemotePhlowContextMenuCompositeAction class >> isAbstract [
	^ self name = #GtRemotePhlowContextMenuCompositeAction
]

{ #category : #collecting }
GtRemotePhlowContextMenuCompositeAction >> collectInvidualActionsOn: aCollection forElement: anElement item: anObject index: aSelectionIndex [
	| collectedActions |
	collectedActions := self toActionOn: anObject index: aSelectionIndex element: anElement.
	aCollection addAll: (collectedActions select: [ :anAction | 
			anAction shouldShowContextActionOn: anObject viewSelection: aSelectionIndex ])
]
