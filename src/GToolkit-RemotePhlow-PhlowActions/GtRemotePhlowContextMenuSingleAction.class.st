Class {
	#name : #GtRemotePhlowContextMenuSingleAction,
	#superclass : #GtRemotePhlowContextMenuBasicAction,
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #collecting }
GtRemotePhlowContextMenuSingleAction >> collectInvidualActionsOn: aCollection forElement: anElement item: anObject index: anIndex [
	"At this point we collect the actions; for single actions it does not need anything else"
	aCollection add: self
]
