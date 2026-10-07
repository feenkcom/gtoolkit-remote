"
Concrete subclass pattern for remote phlow action ids. Each subclass represents a specific id. No instance state - the class itself is the identity.
"
Class {
	#name : #GtRemotePhlowBasicId,
	#superclass : #GtRemotePhlowId,
	#category : #'GToolkit-RemotePhlow-DeclarativeSpecification'
}

{ #category : #converting }
GtRemotePhlowBasicId class >> asBlocElementId [
	^ self new
]

{ #category : #testing }
GtRemotePhlowBasicId class >> isAbstract [
	^ self name = #GtRemotePhlowBasicId
]

{ #category : #testing }
GtRemotePhlowBasicId class >> isRemotePhlowId [
	^ true
]

{ #category : #comparing }
GtRemotePhlowBasicId >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	
	^ self class = anObject class or: [ 
		(anObject isBlocElementId) and: [ 
			self asSymbol = anObject asSymbol  ]]
]
