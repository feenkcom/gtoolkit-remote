"
GtRemoteDeclarativeGtExamples demonstrates the use of declarative views in Gtoolkit.

This class runs the examples within the one image, and thus can be run without any external server setup.  Subclasses overwrite various methods to run the examples connecting to the remote server.
"
Class {
	#name : #GtRemoteDeclarativeExamples,
	#superclass : #Object,
	#instVars : [
		'server'
	],
	#category : 'GToolkit-RemotePhlow-Examples'
}

{ #category : #'examples - views' }
GtRemoteDeclarativeExamples >> columnedListView [
	<gtExample>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtColumnedListFor:.
	view := GtPhlowDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: 'Columned List'.
	self assert: view columnTitles equals: #(Value Lowercase).
	self assert: view columnWidths equals: #(nil 100).
	self assert: view columnTypes equals: #(text text).
	view dataTransport = GtPhlowDeclarativeView dataIncluded ifTrue:
		[ data := view items.
		self assert: data size equals: 3.
		self assert: data first equals: #('42' '42').
		self assert: data second equals: #('Hello World' 'hello world') ].
	view dataTransport = GtPhlowDeclarativeView dataLazy ifTrue:
		[ self columnedListViewLazyCheck: viewProxy ].
	^ view
]

{ #category : #private }
GtRemoteDeclarativeExamples >> columnedListViewLazyCheck: viewProxy [
	| declarativeView |

	declarativeView := viewProxy getDeclarativeViewFor: #gtColumnedListFor:.
	self assert: declarativeView retrieveTotalItemsCount equals: 3.

]

{ #category : #private }
GtRemoteDeclarativeExamples >> declarativeViewNames [
	"Answer the expected array of declarative views from the remote.
	Subclasses may overwrite this if the set of views is different."

	^ #('gtLargeListFor:' 'gtStringFor:' 'gtListFor:' 'gtLargeColumnedListWithIndexFor:' 'gtColumnedListFor:' 'gtLargeColumnedListFor:' 'gtRemotePrintFor:')
]

{ #category : #private }
GtRemoteDeclarativeExamples >> getRemoteObject [

	^ GtRemotePhlowDeclarativeTestInspectable new
]

{ #category : #private }
GtRemoteDeclarativeExamples >> getViewedObjectProxy [
	"Answer the GtViewedObject proxy for the remote object"

	^ GtViewedObject object: self remoteObject.

]

{ #category : #'examples - views' }
GtRemoteDeclarativeExamples >> listView [
	<gtExample>
	<after: #stopServer>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtListFor:.
	view := GtPhlowDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #List.
	self assert: view priority equals: 15.
	view dataTransport = GtPhlowDeclarativeView dataIncluded ifTrue:
		[ data := view items.
		self assert: data size equals: 3.
		self assert: data equals: self listViewDisplayArray ].
	view dataTransport = GtPhlowDeclarativeView dataLazy ifTrue:
		[ self listViewLazyCheck: viewProxy ].
	^ view
]

{ #category : #'private - commands' }
GtRemoteDeclarativeExamples >> listViewDisplayArray [
	"Answer the command Array returned by the remote's list view"

	^ #('42' 'Hello World' '2021-04-06T14:43:49.623384+02:00')
]

{ #category : #private }
GtRemoteDeclarativeExamples >> listViewLazyCheck: viewProxy [
	| declarativeView |

	declarativeView := viewProxy getDeclarativeViewFor: #gtListFor:.
	self assert: declarativeView retrieveTotalItemsCount equals: 3.

]

{ #category : #private }
GtRemoteDeclarativeExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view.
	Subclasses may overwrite this as appropriate."

	^ 'a GtRemotePhlowDeclarativeTestInspectable'
]

{ #category : #'examples - views' }
GtRemoteDeclarativeExamples >> printView [
	<gtExample>
	<after: #stopServer>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtRemotePrintFor:.
	view := GtPhlowDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #Print.
	self assert: view string equals: self printForString.
	^ view
]

{ #category : #examples }
GtRemoteDeclarativeExamples >> remoteObject [
	"Answer the remote GtDeclarativeTestInspectable instance.
	This will be a proxy with a remote server."
	<gtExample>
	<after: #stopServer>
	| remoteObject collection |

	remoteObject :=  self getRemoteObject.

	self assert: remoteObject string equals: 'hello world'.

	collection :=  remoteObject collectionOfObjects.
	"Check the size and immediate value objects, but assume that proxies are working correctly"
	self assert: collection size equals: 3.
	self assert: collection first equals: 42.
	self assert: collection second equals: 'Hello World'.

	^ remoteObject
]

{ #category : #private }
GtRemoteDeclarativeExamples >> runningServer [
	"Answer a running server.
	No server is required running the examples in a single image.
	Subclasses should overwrite this to start the server"
	<gtExample>
	<after: #stopServer>

]

{ #category : #private }
GtRemoteDeclarativeExamples >> stopServer [ 

	server ifNotNil: 
		[ server stop.
		server := nil ]
]

{ #category : #'examples - views' }
GtRemoteDeclarativeExamples >> stringView [
	<gtExample>
	<after: #stopServer>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtStringFor:.
	view :=  GtPhlowDeclarativeView fromDictionary: viewDictionary.
	self assert: view title equals: #String.
	self assert: view string equals: 'hello world'.
	^ view
]

{ #category : #examples }
GtRemoteDeclarativeExamples >> viewedObjectProxy [
	"Answer the GtViewedObject proxy for the remote object"
	<gtExample>
	<after: #stopServer>
	| viewedObject declarativeViews |

	viewedObject :=  self getViewedObjectProxy.

	declarativeViews :=  viewedObject getDeclarativeViewMethodNames.
	self assert: declarativeViews asSet equals: self declarativeViewNames asSet.

	^ viewedObject
]
