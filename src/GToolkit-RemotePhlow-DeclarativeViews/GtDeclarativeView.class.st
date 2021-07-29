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
		'phlowDataSource',
		'methodSelector',
		'title',
		'priority',
		'dataTransport'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'data transport' }
GtDeclarativeView class >> dataIncluded [
	"Answer the enumerated value for the display data being included with the specification"

	^1
]

{ #category : 'data transport' }
GtDeclarativeView class >> dataLazy [
	"Answer the enumerated value for the display data accessor name being included with the specification.  This can then be used to retrieve the data at a later time"

	^2
]

{ #category : 'instance creation' }
GtDeclarativeView class >> fromDictionary: viewDictionary [
	"Answer the view specified by viewDictionary"
	| viewName |

	StringSignal emit: 'fromDictionary:'.
	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : 'instance creation' }
GtDeclarativeView class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^self new 
		title: (aDictionary at: #title);
		priority: (aDictionary at: #priority);
		dataTransport: (aDictionary at: #dataTransport);
		yourself
]

{ #category : 'instance creation' }
GtDeclarativeView class >> fromJSONString: aString [
	"Answer the view specified by aString"

	| viewDictionary viewName |

	StringSignal emit: 'fromJSONString:'.
	viewDictionary := STONJSON fromString: aString.
	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : 'converting' }
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

{ #category : 'serialization' }
GtDeclarativeView >> asJSONForExport [ 
	"Answer the receiver serialised in JSON format"

	^STONJSON toStringPretty: self asDictionaryForExport
]

{ #category : 'accessing' }
GtDeclarativeView >> dataTransport [
	^ dataTransport
]

{ #category : 'accessing' }
GtDeclarativeView >> dataTransport: anObject [
	dataTransport := anObject
]

{ #category : 'initialization' }
GtDeclarativeView >> initializeFromInspector: anInspector [
]

{ #category : 'testing' }
GtDeclarativeView >> isWithLazyLoading [
	^ self dataTransport = self class dataLazy
]

{ #category : 'accessing' }
GtDeclarativeView >> methodSelector [
	^ methodSelector
]

{ #category : 'accessing' }
GtDeclarativeView >> methodSelector: aSelector [
	methodSelector := aSelector
]

{ #category : 'accessing' }
GtDeclarativeView >> phlowDataSource [
	^ phlowDataSource
]

{ #category : 'accessing' }
GtDeclarativeView >> phlowDataSource: aDataSource [
	phlowDataSource := aDataSource
]

{ #category : 'accessing' }
GtDeclarativeView >> priority [
	^ priority
]

{ #category : 'accessing' }
GtDeclarativeView >> priority: anObject [
	priority := anObject
]

{ #category : 'accessing' }
GtDeclarativeView >> title [
	^ title
]

{ #category : 'accessing' }
GtDeclarativeView >> title: anObject [
	title := anObject
]

{ #category : 'accessing' }
GtDeclarativeView >> viewName [
	"Answer the name of the receivers view"

	^self class name
]