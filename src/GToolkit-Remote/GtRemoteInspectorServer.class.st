Class {
	#name : #GtRemoteInspectorServer,
	#superclass : #GtRemoteInspector,
	#instVars : [
		'teapot',
		'accessorLists'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #accessing }
GtRemoteInspectorServer >> accessorListAt: aKey [

	^accessorLists at: aKey
]

{ #category : #development }
GtRemoteInspectorServer >> akgInspectable [
	"Testing method"

	self register: (
			AkgInspectable new 
				collectionAt: 1 put: AkgInspectable new;
				yourself) 
		name: #akg.
]

{ #category : #inspecting }
GtRemoteInspectorServer >> gtNamedObjectsFor: aView [
	<gtView>

	^aView list 
		title: 'Named Objects';
		display: [ self namedObjects keys asSortedCollection ];
		send: [ :name | self namedAccessorListAt: name ]
]

{ #category : #'request handling' }
GtRemoteInspectorServer >> handleNamedObjectsRequest: request [
	"Answer the request for the list of named objects"

	^namedObjects.

]

{ #category : #'request handling' }
GtRemoteInspectorServer >> handleObjectRequest: request [
	"Answer the collection of views on the requested object <id>"

	^self objectDictionaryFor: (request at: #id ) asNumber.

]

{ #category : #'request handling' }
GtRemoteInspectorServer >> handleSentItemRequest: request [
	"Answer the collection of views on the requested sent item"

	| objectId viewName sentItemKey sentObject sentObjectId accessorList accessor |

	objectId := (request at: #id) asNumber.
	viewName := request at: #viewName.
	sentItemKey := (request at: #sentItemKey) asNumber.
	accessorList := self accessorListAt: objectId.
	accessor := accessorList accessorWithTitle: viewName.
	sentObject := accessor view itemsBuilder value at: sentItemKey.
	sentObjectId := self register: sentObject.
	^self objectDictionaryFor: sentObjectId

]

{ #category : #'request handling' }
GtRemoteInspectorServer >> handleViewRequest: request [
	"Answer the collection of views on the requested object <id>"

	| objectId viewName accessorList |

	objectId := (request at: #id) asNumber.
	viewName := request at: #viewName.
	accessorList := self accessorListAt: objectId.
	^(accessorList accessors detect: [ :each |
		each title = viewName ]) asDictionaryForExport.
]

{ #category : #initialization }
GtRemoteInspectorServer >> initialize [ 

	super initialize.
	accessorLists := Dictionary new.
	namedObjects := Dictionary new.
	teapot := Teapot configure: { 
		#defaultOutput -> #json.
		#port -> 8080.
		#debugMode -> true. }.
	teapot
		GET: '/ping' -> [ :req | DateAndTime now printString ];
		GET: '/namedObjects' -> [ :req | self handleNamedObjectsRequest: req ];
		GET: '/object/<id>/<viewName>/<sentItemKey>' -> [ :req | self handleSentItemRequest: req ];
		GET: '/object/<id>/<viewName>' -> [ :req | self handleViewRequest: req ];
		GET: '/object/<id>' -> [ :req | self handleObjectRequest: req ].

]

{ #category : #accessing }
GtRemoteInspectorServer >> namedAccessorListAt: aString [

	^accessorLists at: (namedObjects at: aString)
]

{ #category : #accessing }
GtRemoteInspectorServer >> namedObjects [
	"Answer the list of named objects for the receiver"

	^namedObjects
]

{ #category : #accessing }
GtRemoteInspectorServer >> objectAt: aKey [
	"Answer the object identified by aKey"

	^(self accessorListAt: aKey) object
]

{ #category : #private }
GtRemoteInspectorServer >> objectDictionaryFor: objectId [
	"Answer the dictionary representation of the supplied objectId"

	| object accessorList accessors |

	object := self objectAt: objectId.
	(self isLiteralObject: object) ifTrue: 
		[ ^object ].
	accessorList := self accessorListAt: objectId.
	accessors := accessorList accessorsCollect: [ :each |
		{ each title.
		each priority.
		self objectViewURLFor: objectId title: each title. } ].
	^Dictionary new
		at: #name put: (self objectAt: objectId) printString;
		at: #accessors put: accessors;
		yourself
]

{ #category : #private }
GtRemoteInspectorServer >> objectURLFor: aString [
	"Answer the relative URL to access the object aString"

	^'/object/', aString
]

{ #category : #private }
GtRemoteInspectorServer >> objectViewURLFor: objectId title: title [

	^String streamContents: [ :stream |
		stream
			<< '/object/';
			print: objectId;
			<< '/';
			<< title ]
]

{ #category : #accessing }
GtRemoteInspectorServer >> register: anObject [
	"Register the supplied anonymous object and answer its key"

	| idHash |

	idHash := anObject identityHash.
	accessorLists at: idHash put: (GtDeclarativeViewAccessorList for: anObject).
	^idHash

]

{ #category : #accessing }
GtRemoteInspectorServer >> register: anObject name: aString [
	"Register the supplied object with aKey"

	| idHash |

	idHash := self register: anObject.
	namedObjects at: aString put: idHash.
]

{ #category : #'server actions' }
GtRemoteInspectorServer >> start [ 
	"Start the server"

	teapot start
]

{ #category : #'server actions' }
GtRemoteInspectorServer >> stop [ 
	"Stop the server"

	teapot stop
]
