Class {
	#name : #GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeActionsDirectViewedObjectExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #examples }
GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples >> actionSpecificationForSelectorReceivedAsString [
	"A PharoLink client sends the action selector through MessagePack, which answers it as a String:
	the viewed object finds the action specification by that selector"

	<gtExample>
	<return: #GtRemotePhlowViewedObject>
	| viewedObject |
	viewedObject := self remoteViewedObject.
	self assert: (viewedObject getActionSpecificationFor: 'gtButtonActionWithLabelFor:')
			== (viewedObject getActionSpecificationFor: #gtButtonActionWithLabelFor:).
	self
		assert: (viewedObject getActionSpecificationFor: 'gtButtonActionWithLabelFor:') methodSelector
		equals: #gtButtonActionWithLabelFor:.
	^ viewedObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples >> remoteViewedObject [
	^ GtRemotePhlowViewedObject object: self remoteObject.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtLocalPhlowViewedObject remoteViewedObject: self remoteViewedObject
]
