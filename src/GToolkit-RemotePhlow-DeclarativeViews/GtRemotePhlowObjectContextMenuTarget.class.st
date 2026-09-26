Class {
	#name : #GtRemotePhlowObjectContextMenuTarget,
	#superclass : #GtRemotePhlowActionTarget,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowObjectContextMenuTarget class >> typeLabel [
	^ 'objectContextMenu'
]

{ #category : #converting }
GtRemotePhlowObjectContextMenuTarget >> asLocalPhlowTarget [
	^ GtPhlowObjectContextMenuTarget uniqueInstance
]
