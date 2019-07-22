Class {
	#name : #GtDeclarativeViewAccessorServer,
	#superclass : #GtDeclarativeViewAccessor,
	#instVars : [
		'object'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> declarativeView [
	^ declarativeView ifNil: [ declarativeView := view asGtDeclarativeView accessor: self ]
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> id [ 

	^object identityHash
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> object [
	^ object
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> object: anObject [
	object := anObject
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> objectId [ 

	^self object identityHash
]

{ #category : #printing }
GtDeclarativeViewAccessorServer >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self title;
		nextPut: $)
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> relativeUrl [
	"Answer the relative URL of the receiver"

	^String streamContents: [ :stream |
		stream 
			<< 'object/';
			<< object identityHash asString;
			<< '/';
			<< self selector ].
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> selector [
	"Answer the selector name that defines the receiver's view"

	^view definingMethod selector
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> sentItemAt: sentItemKey [
	"Answer the send object at sentItemKey.
	TODO: This method currently rebuilds the sent item list every time it is called, and probably should be cached"

	^view itemsBuilder value at: sentItemKey
]

{ #category : #'private - accessing' }
GtDeclarativeViewAccessorServer >> sentItems [
	"Answer the collection of sent items of the receiver.
	This method is provided to facilitate the export of serialised view definitions by GtRemoteInspectorExporter and is not a general access method."
	"HACK: If the item is a GTInspectorVariableNode we actually want the raw value"
	^self declarativeView sentItems collect: [ :each |
		(each isKindOf: GTInspectorVariableNode)
			ifTrue: [ each rawValue ]
			ifFalse: [ each ]]
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> view [

	^view
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> view: aView [

	view := aView
]
