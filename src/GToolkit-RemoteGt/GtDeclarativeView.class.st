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
	#name : 'GtDeclarativeView',
	#superclass : 'Object',
	#instVars : [
		'accessor',
		'methodName',
		'title',
		'priority',
		'dataTransport'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : '*GToolkit-RemoteGt' }
GtDeclarativeView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^self subclassResponsibility 
]
