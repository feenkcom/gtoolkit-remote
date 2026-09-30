"
Remote phlow version of GtInspectorCompareObjectsId.
"
Class {
	#name : #GtRemotePhlowCompareObjectsActionId,
	#superclass : #GtRemotePhlowBasicId,
	#category : #'GToolkit-RemotePhlow-ObjectComparer'
}

{ #category : #accessing }
GtRemotePhlowCompareObjectsActionId class >> typeLabel [
	^ 'remotePhlowCompareObjectsActionId'
]

{ #category : #accessing }
GtRemotePhlowCompareObjectsActionId >> asSymbol [
	^ #'inspector--compare-objects'
]
