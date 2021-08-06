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
	#name : #GtPhlowDeclarativeView,
	#superclass : #Object,
	#instVars : [
		'phlowDataSource',
		'methodSelector',
		'title',
		'priority',
		'dataTransport'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'data transport' }
GtPhlowDeclarativeView class >> dataIncluded [
	"Answer the enumerated value for the display data being included with the specification"

	^1
]

{ #category : #'data transport' }
GtPhlowDeclarativeView class >> dataLazy [
	"Answer the enumerated value for the display data accessor name being included with the specification.  This can then be used to retrieve the data at a later time"

	^2
]

{ #category : #'instance creation' }
GtPhlowDeclarativeView class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^self new 
		title: (aDictionary at: #title);
		priority: (aDictionary at: #priority);
		dataTransport: (aDictionary at: #dataTransport);
		methodSelector: (aDictionary at: #methodSelector);
		yourself
]

{ #category : #converting }
GtPhlowDeclarativeView >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^Dictionary new 
		at: #viewName put: self viewName;
		at: #title put: title;
		at: #priority put: priority;
		at: #dataTransport put: dataTransport;
		at: #methodSelector put: methodSelector;
		yourself
]

{ #category : #accessing }
GtPhlowDeclarativeView >> dataTransport [
	^ dataTransport
]

{ #category : #accessing }
GtPhlowDeclarativeView >> dataTransport: anObject [
	dataTransport := anObject
]

{ #category : #initialization }
GtPhlowDeclarativeView >> initializeFromInspector: anInspector [
]

{ #category : #testing }
GtPhlowDeclarativeView >> isWithLazyLoading [
	^ self dataTransport = self class dataLazy
]

{ #category : #accessing }
GtPhlowDeclarativeView >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
GtPhlowDeclarativeView >> methodSelector: aSelector [
	methodSelector := aSelector
]

{ #category : #accessing }
GtPhlowDeclarativeView >> phlowDataSource [
	^ phlowDataSource
]

{ #category : #accessing }
GtPhlowDeclarativeView >> phlowDataSource: aDataSource [
	phlowDataSource := aDataSource
]

{ #category : #accessing }
GtPhlowDeclarativeView >> priority [
	^ priority
]

{ #category : #accessing }
GtPhlowDeclarativeView >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
GtPhlowDeclarativeView >> title [
	^ title
]

{ #category : #accessing }
GtPhlowDeclarativeView >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtPhlowDeclarativeView >> viewName [
	"Answer the name of the receivers view"

	^self class name
]
