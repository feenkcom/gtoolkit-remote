"
GtRemoteDeclarativeGtExamples demonstrates the use of declarative views in Gtoolkit.

This class runs the examples within the one image, and thus can be run without any external server setup.  Subclasses overwrite various methods to run the examples connecting to the remote server.
"
Class {
	#name : #GtRemoteDeclarativeViewsExamples,
	#superclass : #Object,
	#instVars : [
		'server'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertBasicTextAttributedRunStyleSpecification: aStyleSpecification [
	self 
		assert: aStyleSpecification numberOfRuns 
		equals: self expectedNumberOfRunsForBasicStyledText
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertSimpleUnstyledStringInViewSpecification: aViewSpecification [
	| stylableText |
	
	stylableText := (GtRemotePhlowStylableText 
		fromJSONDictionary: aViewSpecification getText).
	self assert: stylableText string equals: 'hello world'.
	self assert: stylableText stylerSpecification canAffectText not.
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertStyledJsonTextInViewSpecification: aViewSpecification [
	| stylableText |
	
	stylableText := (GtRemotePhlowStylableText 
			fromJSONDictionary: aViewSpecification getText).
	self 
		assert: stylableText string withUnixLineEndings 
		equals: self expectedJsonString withUnixLineEndings.
	self assert: stylableText stylerSpecification canAffectText.
	self 
		assert: stylableText stylerSpecification parserClassName equals: #JSONParser.
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertStyledTextInViewSpecification: aViewSpecification [
	| stylableText |
	
	stylableText := (GtRemotePhlowStylableText 
			fromJSONDictionary: aViewSpecification getText).
	self assert: stylableText string equals: self expectedBasicString.
	self assert: stylableText stylerSpecification canAffectText.
	self 
		assertBasicTextAttributedRunStyleSpecification: stylableText stylerSpecification.
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> assertTextualViewWithBasicStyledTextWithSelector: aViewSelector title: aTitle priority: aPriority [
	| viewedObjectProxy viewDictionary initialSpecification dataSource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: aViewSelector.
	initialSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: initialSpecification title equals: aTitle.
	self assert: initialSpecification priority equals: aPriority.
	
	dataSource := viewedObjectProxy getDeclarativeViewFor: aViewSelector.
	self assertStyledTextInViewSpecification: dataSource.
	
	^ initialSpecification
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> columnedListView [
	<gtExample>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtColumnedListFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: 'Columned list'.
	self assert: view columnTitles equals: #(Value Lowercase).
	self assert: view columnWidths equals: #(nil 100).
	self 
		assert: (view columnTypes collect: #typeLabel) 
		equals: #(text text).
	
	self assert: view dataTransport equals: GtPhlowViewSpecification dataLazy.
	self columnedListViewLazyCheck: viewProxy.
	
	^ view
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> columnedListViewLazyCheck: viewProxy [
	| declarativeView |

	declarativeView := viewProxy getDeclarativeViewFor: #gtColumnedListFor:.
	self assert: declarativeView retrieveTotalItemsCount equals: 3.

]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> columnedListWithTypedColumns [
	<gtExample>
	<after: #stopServer>
	| viewProxy viewDictionary viewSpecification |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy getViewDeclaration: #gtColumnedListWithTypedColumnsFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	viewSpecification initializeFromInspector: viewProxy.
	
	self assert: viewSpecification title equals: 'Columned list with typed columns'.
	self assert: viewSpecification priority equals: 24.
	
	self 
		assert: viewSpecification methodSelector 
		equals: #gtColumnedListWithTypedColumnsFor:.
	self 
		assert: (viewSpecification columnSpecifications 
			collect: [ :aColumnSpecification | aColumnSpecification typeLabel ])
		equals: #('text' 'number' 'icon').
	self 
		assert: viewSpecification columnTitles 
		equals: #('Text' 'Number' 'Icon Name').
	self 
		assert: viewSpecification columnWidths 
		equals: #(nil 100 75).
	
	self assert: viewSpecification totalItemsCount equals: 500.
	
	self 
		assert: (viewSpecification retrieveItems: 2 fromIndex: 1)
		equals: (self 
			forPharo11: [
				self expectedColumnedListTypedColumnsTwoItemsPharo11]
			forPharo10: [
				self expectedColumnedListTypedColumnsTwoItems ]).
	
	^ viewSpecification
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> declarativeViewNames [
	"Answer the expected array of declarative views from the remote.
	Subclasses may overwrite this if the set of views is different."

	^ #('gtLargeListFor:' 'gtStringFor:' 'gtListFor:' 'gtLargeColumnedListWithIndexFor:' 'gtColumnedListFor:' 'gtLargeColumnedListFor:' 'gtRemotePrintFor:')
]

{ #category : #accessing }
GtRemoteDeclarativeViewsExamples >> expectedBasicString [
	^ 'Now is the time'
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> expectedColumnedListTypedColumnsTwoItems [
	^ ((Array new: 2) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+1.0'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+2'); yourself); at: 3 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->#classIcon); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+2.0'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+3'); yourself); at: 3 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->#classIcon); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); yourself)
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> expectedColumnedListTypedColumnsTwoItemsPharo11 [
	^ ((Array new: 2) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+1.0'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+2'); yourself); at: 3 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->#class); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+2.0'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+3'); yourself); at: 3 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->#class); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); yourself)
]

{ #category : #accessing }
GtRemoteDeclarativeViewsExamples >> expectedJsonString [
	^ '{
	"name":"Me", 
	"age":30, 
	"data":null
}'
]

{ #category : #accessing }
GtRemoteDeclarativeViewsExamples >> expectedNumberOfRunsForBasicStyledText [
	^ 9
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> getRemoteObject [

	^ GtRemotePhlowDeclarativeTestInspectable new
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> getViewedObjectProxy [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtRemotePhlowViewedObject object: self remoteObject.

]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> listView [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary view |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary := viewedObjectProxy getViewDeclaration: #gtListFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: #List.
	self assert: view priority equals: 15.
	
	self listViewLazyCheck: viewedObjectProxy.
	
	^ view
]

{ #category : #'private - commands' }
GtRemoteDeclarativeViewsExamples >> listViewDisplayArray [
	"Answer the command Array returned by the remote's list view"

	^ #('42' 'Hello World' '2021-04-06T14:43:49.623384+02:00')
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> listViewLazyCheck: viewProxy [
	| declarativeView |

	declarativeView := viewProxy getDeclarativeViewFor: #gtListFor:.
	self assert: declarativeView retrieveTotalItemsCount equals: 3.
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view.
	Subclasses may overwrite this as appropriate."

	^ 'a GtRemotePhlowDeclarativeTestInspectable'
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> printView [
	"Disable since this relies on having GToolkit-RemotePhlow-InspectorExtensions,
	which is currently not the case in the CI"
	"<gtExample>"
	<after: #stopServer>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtRemotePrintFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: #Print.
	self assert: view string equals: self printForString.
	
	^ view
]

{ #category : #examples }
GtRemoteDeclarativeViewsExamples >> remoteObject [
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
GtRemoteDeclarativeViewsExamples >> runningServer [
	"Answer a running server.
	No server is required running the examples in a single image.
	Subclasses should overwrite this to start the server"
	<gtExample>
	<after: #stopServer>

]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> stopServer [ 

	server ifNotNil: 
		[ server stop.
		server := nil ]
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textEditorViewWithExplicitStyler [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary view viewSpecification |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtStyledStringUsingStylerFor: .
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: 'Styled text (styler)'.
	self assert: view priority equals: 11.2.
	self assert: view string equals: nil.
	
	viewSpecification := viewedObjectProxy getDeclarativeViewFor: #gtStyledStringUsingStylerFor: .
	self assertStyledTextInViewSpecification: viewSpecification.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textEditorViewWithParserStylerClass [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary view viewSpecification |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtStyledStringJsonInEditorFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: 'Styled JSON'.
	self assert: view priority equals: 11.5.
	self assert: view string equals: nil.
	
	viewSpecification := viewedObjectProxy getDeclarativeViewFor: #gtStyledStringJsonInEditorFor:.
	self assertStyledJsonTextInViewSpecification:  viewSpecification.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textEditorViewWithSimpleString [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary view viewSpecification |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtStringInTextEditorViewFor: .
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: 'String (editor)'.
	self assert: view priority equals: 11.
	self assert: view string equals: nil.
	
	viewSpecification := viewedObjectProxy getDeclarativeViewFor: #gtStringInTextEditorViewFor: .
	self assertSimpleUnstyledStringInViewSpecification: viewSpecification.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textEditorViewWithStyledPhlowText [
	<gtExample>
	<after: #stopServer>
	| view |

	view := self 
		assertTextualViewWithBasicStyledTextWithSelector: #gtStyledPhlowTextInEditorFor: 
		title: 'Styled phlow text (editor)'
		priority: 11.3.
	
	self assert: view string equals: nil.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textEditorViewWithStyledText [
	<gtExample>
	<after: #stopServer>
	| view |
	
	view := self 
		assertTextualViewWithBasicStyledTextWithSelector: #gtStyledTextInEditorFor: 
		title: 'Styled text (editor)' 
		priority: 11.1.
		
	self assert: view string equals: nil.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textViewWithSimpleString [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary view viewSpecification |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtStringInTextViewFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: 'String (text)'.
	self assert: view priority equals: 10.
	
	viewSpecification := viewedObjectProxy getDeclarativeViewFor: #gtStringInTextViewFor: .
	self assertSimpleUnstyledStringInViewSpecification: viewSpecification.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textViewWithStyledPhlowText [
	<gtExample>
	<after: #stopServer>
	| view |
	
	view := self 
		assertTextualViewWithBasicStyledTextWithSelector: #gtStyledPhlowTextFor: 
		title: 'Styled phlow text'
		priority: 10.3.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textViewWithStyledText [
	<gtExample>
	<after: #stopServer>
	
	^ self 
		assertTextualViewWithBasicStyledTextWithSelector: #gtStyledTextFor: 
		title: 'Styled text'
		priority: 10.1.
]

{ #category : #examples }
GtRemoteDeclarativeViewsExamples >> viewedObjectProxy [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"
	<gtExample>
	<after: #stopServer>
	| viewedObject declarativeViews |

	viewedObject :=  self getViewedObjectProxy.

	"The set of views can vary depending on configuration,
	just check that a common view is present."
	declarativeViews :=  viewedObject getDeclarativeViewMethodNames.
	self assert: (declarativeViews includes: #gtListFor:).

	^ viewedObject
]
