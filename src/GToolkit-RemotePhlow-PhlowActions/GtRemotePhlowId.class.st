"
Abstract base class for remote phlow action ids. Subclasses represent specific action identities, serializable for remote phlow.
"
Class {
	#name : #GtRemotePhlowId,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #testing }
GtRemotePhlowId class >> isAbstract [
	^ self name = #GtRemotePhlowId
]

{ #category : #comparing }
GtRemotePhlowId >> = anObject [
	"Comparing `self = anObject` must provide 
	same results as `self asSymbol = anObject asSymbol`. 
	See the #hash method comment."

	^ self subclassResponsibility
]

{ #category : #converting }
GtRemotePhlowId >> asBlocElementId [
	^ self
]

{ #category : #converting }
GtRemotePhlowId >> asSymbol [
	^ self subclassResponsibility
]

{ #category : #comparing }
GtRemotePhlowId >> hash [
	^ self asSymbol hash
]

{ #category : #testing }
GtRemotePhlowId >> isBlocElementId [
	^ true
]

{ #category : #testing }
GtRemotePhlowId >> isIndexed [
	^ false
]

{ #category : #testing }
GtRemotePhlowId >> isRemotePhlowId [
	^ true
]

{ #category : #printing }
GtRemotePhlowId >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [ aStream nextPutAll: self asSymbol ]
]
