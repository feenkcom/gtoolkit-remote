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
	#name : 'GtRemotePhlowDeclarativeView',
	#superclass : 'Object',
	#instVars : [
		'title',
		'priority'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'converting' }
GtRemotePhlowDeclarativeView >> asGtDeclarativeView [
	^ nil
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeView >> priority [
	^ priority
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeView >> priority: anObject [
	priority := anObject
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeView >> title [
	^ title
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeView >> title: anObject [
	title := anObject
]
