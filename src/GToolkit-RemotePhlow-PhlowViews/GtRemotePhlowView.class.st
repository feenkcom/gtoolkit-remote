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
	#superclass : #GtRemotePhlowProtoView,
	#instVars : [
		'title',
		'priority',
		'definingSelector',
		'definingClass'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowView >> actionUpdateButton [
	"stub"
]

{ #category : #converting }
GtRemotePhlowView >> asGtDeclarativeView [
	^ nil
]

{ #category : #'message performning' }
GtRemotePhlowView >> basicOn: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments [ 
	^ anObject  
		perform: aMessageSymbol
		with: aCollectionOfArguments first
]

{ #category : #testing }
GtRemotePhlowView >> canBeGtDeclarativeView [
	^ true
]

{ #category : #copying }
GtRemotePhlowView >> copyTransformationFrom: aSendBlock [
	"Do nothing by default. This is a callback used by forward views that define #send: to still work in case the view that we forward to does not support #send:"
]

{ #category : #accessing }
GtRemotePhlowView >> definingClass [
	^ definingClass
]

{ #category : #accessing }
GtRemotePhlowView >> definingClass: aClass [
	definingClass := aClass
]

{ #category : #accessing }
GtRemotePhlowView >> definingMethod [
	^ (definingClass whichClassIncludesSelector: definingSelector) 
		ifNil: [ nil ]
		ifNotNil: [ :aClass | aClass compiledMethodAt: definingSelector ]
]

{ #category : #accessing }
GtRemotePhlowView >> definingSelector [

	^ definingSelector
]

{ #category : #accessing }
GtRemotePhlowView >> definingSelector: aSelector [

	definingSelector := aSelector
]

{ #category : #'message performing' }
GtRemotePhlowView >> on: anObject perform: aMessageSymbol [ 
	<return: #GtRemotePhlowView>
	
	^ self 
		on: anObject 
		perform: aMessageSymbol 
		withArguments: { self }
]

{ #category : #'message performning' }
GtRemotePhlowView >> on: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments [
	<return: #GtRemotePhlowView>
	
	^ [ 
			self 
				basicOn: anObject 
				perform: aMessageSymbol 
				withArguments: aCollectionOfArguments
	] on: Error do: [ :anError |
			self 
				phlowErrorViewWithException: anError 
				forBuildContext: nil "(GtPhlowBuildContext new 
					object: anObject; 
					arguments: aCollectionOfArguments) "
				andSelector: aMessageSymbol ]
]

{ #category : #'message performning' }
GtRemotePhlowView >> phlowErrorViewWithException: anException [ 
	| aTitle |
	aTitle := 'Error'.
	
	^ GtRemotePhlowViewErrorView new
		title: aTitle;
		errorMessage: anException description
]

{ #category : #'error handling' }
GtRemotePhlowView >> phlowErrorViewWithException: anException forBuildContext: aContext andSelector: aMessageSymbol [
	| aPhlow | 

	aPhlow := self phlowErrorViewWithException: anException.
	
	"aPhlow buildContext: aContext.
	aPhlow failedComputation: aFailedComputation."

	^ aPhlow
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
