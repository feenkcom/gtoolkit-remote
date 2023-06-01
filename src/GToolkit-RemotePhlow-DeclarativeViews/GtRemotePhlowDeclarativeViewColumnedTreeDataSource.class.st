Class {
	#name : #GtRemotePhlowDeclarativeViewColumnedTreeDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewTreeDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> instantiateNode [
	^ GtRemotePhlowColumnedTreeNode new
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> instantiateValueBuilder [
	^ GtRemotePhlowRowBuilder new
]
