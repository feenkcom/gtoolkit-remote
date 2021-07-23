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
	#name : #GtRemotePhlowDeclarativeView,
	#superclass : #Object,
	#instVars : [
		'accessor',
		'methodName',
		'title',
		'priority',
		'dataTransport'
	],
	#category : 'GToolkit-RemotePhlow'
}

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeView class >> accessor: aGtDViewAccessor [
	"Answer the view specified by the supplied accessor"

	^(self fromJSONString: aGtDViewAccessor asJSONForExport)
		accessor: aGtDViewAccessor;
		yourself
]

{ #category : #'data transport' }
GtRemotePhlowDeclarativeView class >> dataByKey [
	"Answer the enumerated value for the display data being accessed by reference and key"

	^4
]

{ #category : #'data transport' }
GtRemotePhlowDeclarativeView class >> dataByReference [
	"Answer the enumerated value for the display data being accessed by reference"

	^3
]

{ #category : #'data transport' }
GtRemotePhlowDeclarativeView class >> dataIncluded [
	"Answer the enumerated value for the display data being included with the specification"

	^1
]

{ #category : #'data transport' }
GtRemotePhlowDeclarativeView class >> dataLazy [
	"Answer the enumerated value for the display data accessor name being included with the specification.  This can then be used to retrieve the data at a later time"

	^2
]

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeView class >> fromDictionary: viewDictionary [
	"Answer the view specified by viewDictionary"
	| viewName |

	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(self globalsDictionary at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeView class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^self new 
		title: (aDictionary at: #title);
		priority: (aDictionary at: #priority);
		dataTransport: (aDictionary at: #dataTransport);
		yourself
]

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeView class >> fromJSONString: aString [
	"Answer the view specified by aString"

	| viewDictionary viewName |

	viewDictionary := self readJsonString: aString.
	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(self globalsDictionary at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> accessor [
	^ accessor
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> accessor: anObject [
	accessor := anObject
]

{ #category : #converting }
GtRemotePhlowDeclarativeView >> asDictionaryForExport [
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
GtRemotePhlowDeclarativeView >> asJSONForExport [ 
	"Answer the receiver serialised in JSON format"

	^self writeJsonString: self asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> data [ 
	"Answer the data appropriate to the receiver's type"

	^self subclassResponsibility 
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> dataTransport [
	^ dataTransport
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> dataTransport: anObject [
	dataTransport := anObject
]

{ #category : #initialization }
GtRemotePhlowDeclarativeView >> initialize [

	super initialize.
	"The default is to include the data"
	dataTransport := self class dataIncluded.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> methodName [
	^ methodName
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> methodName: anObject [
	methodName := anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> priority [
	^ priority
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> sentItemAt: selection [ 

	^ self subclassResponsibility 
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> title [
	^ title
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeView >> viewName [
	"Answer the name of the receivers matching view in the Gt image"

	^ self subclassResponsibility
]
