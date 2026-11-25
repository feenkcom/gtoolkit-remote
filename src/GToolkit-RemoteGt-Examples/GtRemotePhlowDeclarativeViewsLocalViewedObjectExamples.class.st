Class {
	#name : #GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsDirectViewedObjectExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples >> remoteViewedObject [
	^ GtRemotePhlowViewedObject object: self remoteObject.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtLocalPhlowViewedObject remoteViewedObject: self remoteViewedObject
]

{ #category : #examples }
GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples >> viewSpecificationForSelectorReceivedAsString [
	"A PharoLink client sends the view selector through MessagePack, which answers it as a String:
	the viewed object finds the view specification by that selector"

	<gtExample>
	<return: #GtRemotePhlowViewedObject>
	| viewedObject |
	viewedObject := self remoteViewedObject.
	self assert: (viewedObject getViewSpecificationFor: 'gtPrintFor:')
			== (viewedObject getViewSpecificationFor: #gtPrintFor:).
	self
		assert: (viewedObject getViewSpecificationFor: 'gtPrintFor:') methodSelector
		equals: #gtPrintFor:.
	^ viewedObject
]
