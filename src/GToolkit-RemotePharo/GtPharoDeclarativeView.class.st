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
	#name : #GtPharoDeclarativeView,
	#superclass : #Object,
	#instVars : [
		'accessor',
		'methodName',
		'title',
		'priority',
		'dataTransport'
	],
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #'instance creation' }
GtPharoDeclarativeView class >> accessor: aGtDViewAccessor [
	"Answer the view specified by the supplied accessor"

	^(self fromJSONString: aGtDViewAccessor asJSONForExport)
		accessor: aGtDViewAccessor;
		yourself
]

{ #category : #'data transport' }
GtPharoDeclarativeView class >> dataByKey [
	"Answer the enumerated value for the display data being accessed by reference and key"

	^4
]

{ #category : #'data transport' }
GtPharoDeclarativeView class >> dataByReference [
	"Answer the enumerated value for the display data being accessed by reference"

	^3
]

{ #category : #'data transport' }
GtPharoDeclarativeView class >> dataIncluded [
	"Answer the enumerated value for the display data being included with the specification"

	^1
]

{ #category : #'data transport' }
GtPharoDeclarativeView class >> dataLazy [
	"Answer the enumerated value for the display data accessor name being included with the specification.  This can then be used to retrieve the data at a later time"

	^2
]

{ #category : #'instance creation' }
GtPharoDeclarativeView class >> fromDictionary: viewDictionary [
	"Answer the view specified by viewDictionary"
	| viewName |

	StringSignal emit: 'fromDictionary:'.
	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : #'instance creation' }
GtPharoDeclarativeView class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^self new 
		title: (aDictionary at: #title);
		priority: (aDictionary at: #priority);
		dataTransport: (aDictionary at: #dataTransport);
		yourself
]

{ #category : #'instance creation' }
GtPharoDeclarativeView class >> fromJSONString: aString [
	"Answer the view specified by aString"

	| viewDictionary viewName |

	StringSignal emit: 'fromJSONString:'.
	viewDictionary := STONJSON fromString: aString.
	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : #accessing }
GtPharoDeclarativeView >> accessor [
	^ accessor
]

{ #category : #accessing }
GtPharoDeclarativeView >> accessor: anObject [
	accessor := anObject
]

{ #category : #converting }
GtPharoDeclarativeView >> asDictionaryForExport [
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
GtPharoDeclarativeView >> asJSONForExport [ 
	"Answer the receiver serialised in JSON format"

	^STONJSON toStringPretty: self asDictionaryForExport
]

{ #category : #accessing }
GtPharoDeclarativeView >> data [ 
	"Answer the data appropriate to the receiver's type"

	^self subclassResponsibility 
]

{ #category : #accessing }
GtPharoDeclarativeView >> dataTransport [
	^ dataTransport
]

{ #category : #accessing }
GtPharoDeclarativeView >> dataTransport: anObject [
	dataTransport := anObject
]

{ #category : #initialization }
GtPharoDeclarativeView >> initialize [

	super initialize.
	"The default is to include the data"
	dataTransport := self class dataIncluded.
]

{ #category : #accessing }
GtPharoDeclarativeView >> priority [
	^ priority
]

{ #category : #accessing }
GtPharoDeclarativeView >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
GtPharoDeclarativeView >> sentItemAt: selection [ 

	^ self subclassResponsibility 
]

{ #category : #accessing }
GtPharoDeclarativeView >> title [
	^ title
]

{ #category : #accessing }
GtPharoDeclarativeView >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtPharoDeclarativeView >> viewName [
	"Answer the name of the receivers matching view in the Gt image"

	^ self subclassResponsibility
]
