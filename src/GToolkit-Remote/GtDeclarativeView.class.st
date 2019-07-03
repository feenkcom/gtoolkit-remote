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
	#name : #GtDeclarativeView,
	#superclass : #Object,
	#instVars : [
		'accessor',
		'title',
		'priority',
		'dataTransport'
	],
	#category : #'GToolkit-Remote-Declarative Views'
}

{ #category : #'instance creation' }
GtDeclarativeView class >> accessor: aGtDViewAccessor [
	"Answer the view specified by the supplied accessor"

	^(self fromJSONString: aGtDViewAccessor asJSONForExport)
		accessor: aGtDViewAccessor;
		yourself
]

{ #category : #'data transport' }
GtDeclarativeView class >> dataByKey [
	"Answer the enumerated value for the display data being accessed by reference and key"

	^3
]

{ #category : #'data transport' }
GtDeclarativeView class >> dataByReference [
	"Answer the enumerated value for the display data being accessed by reference"

	^2
]

{ #category : #'data transport' }
GtDeclarativeView class >> dataIncluded [
	"Answer the enumerated value for the display data being included with the specification"

	^1
]

{ #category : #'instance creation' }
GtDeclarativeView class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^self new 
		title: (aDictionary at: #title);
		priority: (aDictionary at: #priority);
		dataTransport: (aDictionary at: #dataTransport);
		yourself
]

{ #category : #'instance creation' }
GtDeclarativeView class >> fromJSONString: aString [
	"Answer the view specified by aString"

	| viewDictionary viewName |

	viewDictionary := STONJSON fromString: aString.
	viewName := viewDictionary at: #viewName.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : #accessing }
GtDeclarativeView >> accessor [
	^ accessor
]

{ #category : #accessing }
GtDeclarativeView >> accessor: anObject [
	accessor := anObject
]

{ #category : #converting }
GtDeclarativeView >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^Dictionary new 
		at: #viewName put: self viewName;
		at: #title put: title;
		at: #priority put: priority;
		at: #dataTransport put: dataTransport;
		yourself
]

{ #category : #serialization }
GtDeclarativeView >> asJSONForExport [ 
	"Answer the receiver serialised in JSON format"

	^STONJSON toStringPretty: self asDictionaryForExport
]

{ #category : #accessing }
GtDeclarativeView >> dataTransport [
	^ dataTransport
]

{ #category : #accessing }
GtDeclarativeView >> dataTransport: anObject [
	dataTransport := anObject
]

{ #category : #accessing }
GtDeclarativeView >> priority [
	^ priority
]

{ #category : #accessing }
GtDeclarativeView >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
GtDeclarativeView >> title [
	^ title
]

{ #category : #accessing }
GtDeclarativeView >> title: anObject [
	title := anObject
]

{ #category : #'building - graph' }
GtDeclarativeView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^self subclassResponsibility 
]

{ #category : #accessing }
GtDeclarativeView >> viewName [
	"Answer the name of the receivers view"

	^self class name
]
