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
	#name : #GtPhlowViewSpecification,
	#superclass : #Object,
	#instVars : [
		'phlowDataSource',
		'methodSelector',
		'title',
		'priority',
		'dataTransport'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'data transport' }
GtPhlowViewSpecification class >> dataIncluded [
	"Answer the enumerated value for the display data being included with the specification"

	^1
]

{ #category : #'data transport' }
GtPhlowViewSpecification class >> dataLazy [
	"Answer the enumerated value for the display data accessor name being included with the specification.  This can then be used to retrieve the data at a later time"

	^2
]

{ #category : #'instance creation' }
GtPhlowViewSpecification class >> fromJSONDictionary: aDictionary [
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
GtPhlowViewSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ Dictionary new 
		at: #viewName put: self viewName;
		at: #title put: title;
		at: #priority put: priority;
		at: #dataTransport put: dataTransport;
		at: #methodSelector put: methodSelector;
		yourself
]

{ #category : #accessing }
GtPhlowViewSpecification >> dataTransport [
	^ dataTransport
]

{ #category : #accessing }
GtPhlowViewSpecification >> dataTransport: anObject [
	dataTransport := anObject
]

{ #category : #initialization }
GtPhlowViewSpecification >> initializeFromInspector: anInspector [
]

{ #category : #testing }
GtPhlowViewSpecification >> isWithLazyLoading [
	^ self dataTransport = self class dataLazy
]

{ #category : #accessing }
GtPhlowViewSpecification >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
GtPhlowViewSpecification >> methodSelector: aSelector [
	methodSelector := aSelector
]

{ #category : #accessing }
GtPhlowViewSpecification >> phlowDataSource [
	^ phlowDataSource
]

{ #category : #accessing }
GtPhlowViewSpecification >> phlowDataSource: aDataSource [
	phlowDataSource := aDataSource
]

{ #category : #printing }
GtPhlowViewSpecification >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: self title;
		nextPutAll: ', ';
		nextPutAll: self priority asString;
		nextPutAll: ')'
]

{ #category : #accessing }
GtPhlowViewSpecification >> priority [
	^ priority
]

{ #category : #accessing }
GtPhlowViewSpecification >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
GtPhlowViewSpecification >> title [
	^ title
]

{ #category : #accessing }
GtPhlowViewSpecification >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtPhlowViewSpecification >> viewName [
	"Answer the name of the receivers view"

	^self class name
]
