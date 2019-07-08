Class {
	#name : #GtRemoteInspectorClient,
	#superclass : #GtRemoteInspector,
	#instVars : [
		'server'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #accessing }
GtRemoteInspectorClient >> declarativeViewAt: aString [
	"Answer the declarative view at the relative URL aString"

	| response |

	response := ZnEasy get: server / aString.
	self assert: response contentType main equals: 'application'.
	self assert: response contentType sub equals: 'json'.
	^GtDeclarativeView fromJSONString: response entity string.
]

{ #category : #private }
GtRemoteInspectorClient >> getNamedObjects [
	"Answer the Set of named objects from the server"

	| response |

	response := ZnEasy get: server / 'namedObjects'.
	self assert: response contentType main equals: 'application'.
	self assert: response contentType sub equals: 'json'.
	^STONJSON fromString: response entity string.

]

{ #category : #inspecting }
GtRemoteInspectorClient >> gtNamedObjectsFor: aView [
	"<gtView>"

	^aView list 
		title: 'Named Objects';
		display: [ self namedObjects keys asSortedCollection ];
		send: [ :name | self namedObjectAt: name ]
]

{ #category : #initialization }
GtRemoteInspectorClient >> initialize [ 

	super initialize.
	server := 'http://localhost:8080' asZnUrl.

]

{ #category : #acccessing }
GtRemoteInspectorClient >> namedObjects [
	"Answer the list of named objects for the receiver"

	^namedObjects ifNil: [ namedObjects := self getNamedObjects ]
]

{ #category : #accessing }
GtRemoteInspectorClient >> objectAt: aKey [
	"Answer the objects identified by aKey"

	| response objectDictionary |

	response := ZnEasy get: server / 'object' / aKey asString.
	self assert: response contentType main equals: 'application'.
	self assert: response contentType sub equals: 'json'.
	objectDictionary := STONJSON fromString: response entity string.
	^GtRemoteInspectorProxy 
		name: (objectDictionary at: #name)
		client: self 
		views: (objectDictionary at: #accessors)
]

{ #category : #accessing }
GtRemoteInspectorClient >> sentItemAt: relativeUrl [

	| objectDictionary response |

	response := ZnEasy get: server / relativeUrl.
	self assert: response contentType main equals: 'application'.
	self assert: response contentType sub equals: 'json'.
	objectDictionary := STONJSON fromString: response entity string.
	(self isLiteralObject: objectDictionary) ifTrue:
		[ ^objectDictionary ].
	^GtRemoteInspectorProxy 
		name: (objectDictionary at: #name) 
		client: self 
		views: (objectDictionary at: #accessors)
]
