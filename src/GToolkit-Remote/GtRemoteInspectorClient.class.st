"
GtRemoteInspectorClient connects to a matching REST/JSON server to enable inspection / viewing of remote objects.

A typical startup script is:

[[[
GtRemoteInspectorServer new
	server: 'http://localhost:8080'
]]]

Default values are specified in ${method:name=GtRemoteInspectorClient>>#initialize}.

Inspecting the result will provide an inspector showing the list of named root objects.

!!Public API and Key Messages

- server: specify the address of the server (see example above)
- namedObjectAt: 	Retrieve the proxy for the well known object named

 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	server:		<ZnUrl>

"
Class {
	#name : #GtRemoteInspectorClient,
	#superclass : #GtRemoteInspector,
	#instVars : [
		'server'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #accessing }
GtRemoteInspectorClient >> dataAt: relativeUrl [

	| response |

	response := ZnEasy get: server / relativeUrl / 'data'.
	self assert: response contentType main equals: 'application'.
	self assert: response contentType sub equals: 'json'.
	^STONJSON fromString: response entity string.

]

{ #category : #accessing }
GtRemoteInspectorClient >> declarativeViewAt: aString [
	"Answer the declarative view at the relative URL aString"

	| response |

	"Building views can take a while at the moment (will be better with lazy data retrieval).
	Set a long timeout for now"
	ZnConnectionTimeout 
		value: 120
		during: [ response := ZnEasy get: server / aString ].
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

{ #category : #configuration }
GtRemoteInspectorClient >> server [
	^ server
]

{ #category : #configuration }
GtRemoteInspectorClient >> server: aString [

	server := aString asZnUrl 
]
