"
GtRemoteDeclarativeGtExamples demonstrates the use of ${class:name=GtDeclarativeView}$ with a Gt server.

Note that it starts and stops server images as part of the examples.
"
Class {
	#name : 'GtRemoteDeclarativeExamples',
	#superclass : 'Object',
	#instVars : [
		'server'
	],
	#category : 'GToolkit-RemoteExamples'
}

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> collectionOfObjectsCommand [
	"Answer the command to retrieve the test inspectable's collectionOfObjects"

	^ self subclassResponsibility
]

{ #category : 'examples - views' }
GtRemoteDeclarativeExamples >> columnedListView [
	<gtExample>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< self columnedListViewDeclarationCommand;
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

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> columnedListViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's list view declaration"

	^ self subclassResponsibility
]

{ #category : 'private' }
GtRemoteDeclarativeExamples >> declarativeViewNames [
	"Answer the expected array of declarative views from the remote"

	^ self subclassResponsibility 
]

{ #category : 'examples - views' }
GtRemoteDeclarativeExamples >> listView [
	<gtExample>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< self listViewDeclarationCommand;
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #List.
	data := view items.
	self assert: data size equals: 3.
	self assert: data equals: self listViewDisplayArray.
	^ view
]

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> listViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's list view declaration"

	^ self subclassResponsibility
]

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> listViewDisplayArray [
	"Answer the command Array returned by the remote's list view"

	^ self subclassResponsibility
]

{ #category : 'private' }
GtRemoteDeclarativeExamples >> localObject [
	"Answer the object which will be instantiated in the remote (for comparison)"

	^ GtDeclarativeTestInspectable new
]

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> methodNamesCommand [
	"Answer the command to retrieve the test inspectable's view method names"

	^ self subclassResponsibility
]

{ #category : 'private' }
GtRemoteDeclarativeExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view"

	^ self subclassResponsibility 
]

{ #category : 'examples - views' }
GtRemoteDeclarativeExamples >> printView [
	<gtExample>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< self printViewDeclarationCommand;
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #Print.
	self assert: view string equals: self printForString.
	^ view
]

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> printViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's print view declaration"

	^ self subclassResponsibility
]

{ #category : 'examples' }
GtRemoteDeclarativeExamples >> remoteObject [
	"Answer a proxy to a remote GtDeclarativeTestInspectable instance"
	<gtExample>
	| proxyObject localObject string collection |

	proxyObject := self runningServer newCommandFactory
		<< self remoteObjectCommand;
		sendAndWait.

	localObject := self localObject.
	string := proxyObject newCommandFactory
		<< self stringCommand;
		sendAndWait.
	self assert: string equals: localObject string.

	collection := proxyObject newCommandFactory
		<< self collectionOfObjectsCommand;
		sendAndWait.
	"Check the size and immediate value objects, but assume that proxies are working correctly"
	self assert: collection size equals: localObject collectionOfObjects size.
	self assert: collection first equals: localObject collectionOfObjects first.
	self assert: collection second equals: localObject collectionOfObjects second.

	^ proxyObject
]

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> remoteObjectCommand [
	"Answer the command to retrieve the test inspectable from the remote"

	^ self subclassResponsibility
]

{ #category : 'private' }
GtRemoteDeclarativeExamples >> runningServer [
	"Answer a running server"
	<gtExample>
	<after: #stopServer>

	^ self subclassResponsibility
]

{ #category : 'private' }
GtRemoteDeclarativeExamples >> stopServer [ 

	server ifNotNil: 
		[ server stop.
		server := nil. ]
]

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> stringCommand [
	"Answer the command to retrieve the test inspectable's string"

	^ self subclassResponsibility
]

{ #category : 'examples - views' }
GtRemoteDeclarativeExamples >> stringView [
	<gtExample>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy newCommandFactory
		<< self stringViewDeclarationCommand;
		sendAndWait.
	view := GtDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #String.
	self assert: view string equals: 'hello world'.
	^ view
]

{ #category : 'private - commands' }
GtRemoteDeclarativeExamples >> stringViewDeclarationCommand [
	"Answer the command to retrieve the test inspectable's string view declaration"

	^ self subclassResponsibility
]

{ #category : 'private' }
GtRemoteDeclarativeExamples >> testInspectableName [
	"Answer the name of the test inspectable class on the remote"

	^ self subclassResponsibility 
]

{ #category : 'examples' }
GtRemoteDeclarativeExamples >> viewedObjectProxy [
	"Answer the GtViewedObject proxy for the remote object"
	<gtExample>
	| viewedObject declarativeViews |

	self remoteObject viewProxyDo: [ :aProxy |
		viewedObject := aProxy ].

	declarativeViews := viewedObject newCommandFactory
		<< self methodNamesCommand;
		sendAndWait.

	self assert: declarativeViews asSet equals: self declarativeViewNames asSet.

	^ viewedObject
]
