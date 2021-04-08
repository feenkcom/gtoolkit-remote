"
GtRemoteDeclarativeGtExamples demonstrates the use of ${class:name=GtDeclarativeView}$ with a Gt server.

Note that it starts and stops server images as part of the examples.
"
Class {
	#name : #GtRemoteDeclarativeExamples,
	#superclass : #Object,
	#instVars : [
		'server'
	],
	#category : #'GToolkit-RemoteExamples'
}

{ #category : #'examples - views' }
GtRemoteDeclarativeExamples >> columnedListView [
	<gtExample>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< 'self getViewDeclaration: #gtColumnedListFor:';
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: 'Columned List'.
	data := view items.
	self assert: data size equals: 3.
	self assert: data first equals: #('42' '42').
	self assert: data second equals: #('Hello World' 'hello world').
	self assert: view columnTitles equals: #(Value Lowercase).
	self assert: view columnWidths equals: #(nil 100).
	^ view
]

{ #category : #private }
GtRemoteDeclarativeExamples >> declarativeViewNames [
	"Answer the expected array of declarative views from the remote"

	^ self subclassResponsibility 
]

{ #category : #'examples - views' }
GtRemoteDeclarativeExamples >> listView [
	<gtExample>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< 'self getViewDeclaration: #gtListFor:';
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #List.
	data := view items.
	self assert: data size equals: 3.
	self assert: data equals: #('42' 'Hello World' '2021-04-06T14:43:49.623384+02:00').
	^ view
]

{ #category : #private }
GtRemoteDeclarativeExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view"

	^ self subclassResponsibility 
]

{ #category : #'examples - views' }
GtRemoteDeclarativeExamples >> printView [
	<gtExample>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< 'self getViewDeclaration: #gtPrintFor:';
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #Print.
	self assert: view string equals: self printForString.
	^ view
]

{ #category : #examples }
GtRemoteDeclarativeExamples >> remoteObject [
	"Answer a proxy to a remote GtDeclarativeTestInspectable instance"
	<gtExample>
	| proxyObject localObject string collection |

	proxyObject := self runningServer newCommandFactory
		<< (self testInspectableName, ' new');
		sendAndWait.

	localObject := GtPharoDeclarativeTestInspectable new.
	string := proxyObject newCommandFactory
		<< 'self string';
		sendAndWait.
	self assert: string equals: localObject string.

	collection := proxyObject newCommandFactory
		<< 'self collectionOfObjects';
		sendAndWait.
	"Check the size and immediate value objects, but assume that proxies are working correctly"
	self assert: collection size equals: localObject collectionOfObjects size.
	self assert: collection first equals: localObject collectionOfObjects first.
	self assert: collection second equals: localObject collectionOfObjects second.

	^ proxyObject
]

{ #category : #examples }
GtRemoteDeclarativeExamples >> runningServer [
	"Answer a running server
	<gtExample>"

	^ self subclassResponsibility
]

{ #category : #private }
GtRemoteDeclarativeExamples >> stopServer [ 

	server ifNotNil: 
		[ server stop.
		server := nil. ]
]

{ #category : #'examples - views' }
GtRemoteDeclarativeExamples >> stringView [
	<gtExample>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< 'self getViewDeclaration: #gtStringFor:';
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #String.
	self assert: view string equals: 'hello world'.
	^ view
]

{ #category : #private }
GtRemoteDeclarativeExamples >> testInspectableName [
	"Answer the name of the test inspectable class on the remote"

	^ self subclassResponsibility 
]

{ #category : #examples }
GtRemoteDeclarativeExamples >> viewedObjectProxy [
	"Answer the GtViewedObject proxy for the remote object"
	<gtExample>
	| viewedObject declarativeViews |

	self remoteObject viewProxyDo: [ :aProxy |
		viewedObject := aProxy ].

	declarativeViews := viewedObject newCommandFactory
		<< 'self getGtViewMethodNames';
		sendAndWait.

	self assert: declarativeViews equals: self declarativeViewNames.

	^ viewedObject
]
