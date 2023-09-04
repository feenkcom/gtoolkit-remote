Class {
	#name : #GtRemotePhlowTypedColumn,
	#superclass : #GtRemotePhlowColumn,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #testing }
GtRemotePhlowTypedColumn class >> isAbstract [
	^ self name = #GtRemotePhlowTypedColumn
]
