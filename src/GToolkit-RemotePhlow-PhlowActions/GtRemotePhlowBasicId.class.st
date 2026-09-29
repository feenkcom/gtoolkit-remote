"
Concrete subclass pattern for remote phlow action ids. Each subclass represents a specific id. No instance state - the class itself is the identity.
"
Class {
	#name : #GtRemotePhlowBasicId,
	#superclass : #GtRemotePhlowId,
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #converting }
GtRemotePhlowBasicId class >> asBlocElementId [
	^ self new
]

{ #category : #converting }
GtRemotePhlowBasicId class >> asElementQuerySelector [
	^ BlElementQueryByIdStep new elementId: self
]

{ #category : #testing }
GtRemotePhlowBasicId class >> isAbstract [
	^ self name = #GtRemotePhlowBasicId
]

{ #category : #comparing }
GtRemotePhlowBasicId >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]
