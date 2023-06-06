Class {
	#name : #GtRemotePhlowColumnedTreeNode,
	#superclass : #GtRemotePhlowTreeNode,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowColumnedTreeNode class >> valueType [
	^ GtRemotePhlowRowValue
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeNode >> columnValueAt: anIndex [
	^ self nodeValue columnValueAt: anIndex
]
