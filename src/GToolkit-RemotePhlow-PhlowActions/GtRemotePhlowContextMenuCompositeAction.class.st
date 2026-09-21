Class {
	#name : #GtRemotePhlowContextMenuCompositeAction,
	#superclass : #GtRemotePhlowContextMenuBasicAction,
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #testing }
GtRemotePhlowContextMenuCompositeAction class >> isAbstract [
	^ self name = #GtRemotePhlowContextMenuCompositeAction
]
