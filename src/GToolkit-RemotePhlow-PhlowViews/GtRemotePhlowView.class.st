"
GtDeclarativeView provides a declarative UI specification for presenting data that can be easily serialised and sent over the wire, including between applications written in different languages.

dataTransport is an emumerated value indicating whether the data to be displayed will be included with the specification or is available via reference or by key.]

- 1: data is included in the response
- 2: data is available by reference
- 3: data is available by reference and key (tbc)


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	dataTransport:		<Object>


    Implementation Points
"
Class {
	#name : #GtRemotePhlowView,
	#superclass : #Object,
	#instVars : [
		'title',
		'priority',
		'definingSelector'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowView >> asGtDeclarativeView [
	^ nil
]

{ #category : #testing }
GtRemotePhlowView >> canBeGtDeclarativeView [
	^ true
]

{ #category : #accessing }
GtRemotePhlowView >> definingSelector [

	^ definingSelector
]

{ #category : #accessing }
GtRemotePhlowView >> definingSelector: aSelector [

	definingSelector := aSelector
]

{ #category : #printing }
GtRemotePhlowView >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << (self title ifNil: ['']) ]
]

{ #category : #accessing }
GtRemotePhlowView >> priority [
	^ priority
]

{ #category : #accessing }
GtRemotePhlowView >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
GtRemotePhlowView >> title [
	^ title
]

{ #category : #accessing }
GtRemotePhlowView >> title: anObject [
	title := anObject
]
