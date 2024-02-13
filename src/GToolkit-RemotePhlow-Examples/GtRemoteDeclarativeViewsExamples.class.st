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
GtRemoteDeclarativeViewsExamples >> assertBasicStyledTextInViewSpecification: aViewSpecification expectedText: anExpectedText [
	| obtainedStylableText |
	
	obtainedStylableText := (GtRemotePhlowStylableText 
			fromJSONDictionary: aViewSpecification getText).
			

	self assert: obtainedStylableText string equals: anExpectedText asString.
	self assert: obtainedStylableText stylerSpecification canAffectText.
	
	self 
		assertTextAttributedRunStyleSpecification: obtainedStylableText stylerSpecification
		equalsRuns: ((self shouldConvertUsingDisplayTextObject: anExpectedText)
			ifTrue: [ anExpectedText asRopedText extractRemotePhlowRuns ]
			ifFalse: [ anExpectedText attributeRuns ]).
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertChildColumnedTreeNodesInViewDatasource: viewDatasource forParentNode: aParentNode  forObjects: anExpectedCollectionOfObjects andColumnsComputation: aCollectionOfBlockClosures [
	^ self 
		assertChildNodesInViewDatasource: viewDatasource 
		forParentNode:  aParentNode
		ofType: GtRemotePhlowColumnedTreeNode
		equalNodes: (self 
			createColumnedNodesWithObjectValues: anExpectedCollectionOfObjects
			andColumnsComputation: aCollectionOfBlockClosures)
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertChildNodesInViewDatasource: viewDatasource forParentNode: aParentNode ofType: aPhlowDataNodeClass equalNodes: anExpectedCollectionOfNodes [ 
	| obtainedChildNodes |
	obtainedChildNodes := (viewDatasource 
		retrieveChildrenForNodeAtPath:  aParentNode  nodePath)
			collect: [ :aNodeValueDictionary |
				aPhlowDataNodeClass 
					fromJSONDictionary: aNodeValueDictionary ].
	self 
		assertListingNodes: obtainedChildNodes 
		equals: anExpectedCollectionOfNodes.
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertChildTreeNodesInViewDatasource: viewDatasource forParentNode: aParentNode  forObjects: anExpectedCollectionOfObjects [
	^ self 
		assertChildNodesInViewDatasource: viewDatasource 
		forParentNode:  aParentNode
		ofType: GtRemotePhlowTreeNode
		equalNodes: (self 
			createTreeNodesWithObjectValues: anExpectedCollectionOfObjects)
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertListingNode: anObtainedObject equals: anExpectedNode [ 
	self assert: anObtainedObject nodeId = anExpectedNode nodeId.
	self assert: (anObtainedObject matchesNodeContentWith: anExpectedNode)
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertListingNodes: obtainedNodes equals: expectedNodes [
	self assert:  obtainedNodes size equals: expectedNodes size.
	
	expectedNodes withIndexDo: [ :anExpectedNode :anIndex |
		self 
			assertListingNode: (obtainedNodes at: anIndex) 
			equals: anExpectedNode ]
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertNodesInColumnedViewDatasource: viewDatasource forObjects: aCollectionOfObjects andColumnsComputation: aCollectionOfBlockClosures [
	^ self 
		assertNodesInViewDatasource: viewDatasource 
		ofType: GtRemotePhlowColumnedTreeNode
		equalNodes: (self 
			createColumnedNodesWithObjectValues: aCollectionOfObjects
			andColumnsComputation: aCollectionOfBlockClosures).
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertNodesInListViewDatasource: viewDatasource forObjects: anCollectionOfObjects [
	self 
		assertNodesInViewDatasource: viewDatasource 
		ofType: GtRemotePhlowDataNode
		equalNodes: (self 
			createListNodesWithObjectValues: anCollectionOfObjects).
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertNodesInTreeViewDatasource: viewDatasource forObjects: anCollectionOfObjects [
	^ self 
		assertNodesInViewDatasource: viewDatasource 
		ofType: GtRemotePhlowTreeNode
		equalNodes: (self 
			createTreeNodesWithObjectValues: anCollectionOfObjects).
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertNodesInViewDatasource: viewSpecification ofType: aPhlowDataNodeClass equalNodes: anExpectedCollectionOfNodes [ 
	| obtainedNodes |
	
	self 
		assert: viewSpecification retrieveTotalItemsCount 
		equals: anExpectedCollectionOfNodes size.
	
	obtainedNodes := viewSpecification retrieveFormattedItems 
		collect: [ :aNodeValueDictionary |
			aPhlowDataNodeClass 
				fromJSONDictionary: aNodeValueDictionary ].
	
	self 
		assertListingNodes: obtainedNodes 
		equals: anExpectedCollectionOfNodes.
	
	^ obtainedNodes
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
GtRemoteDeclarativeViewsExamples >> assertTextAttributedRunStyleSpecification: aStyleSpecification equalsRuns: aRunsCollection [
	self 
		assert: aStyleSpecification numberOfRuns 
		equals: aRunsCollection size.
	
	self 
		assert: aStyleSpecification attributeRuns
		equals: aRunsCollection
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertTextualViewWithBasicStyledTextWithSelector: aViewSelector title: aTitle priority: aPriority expectedText: anExpectedText [
	| viewedObjectProxy viewDictionary viewSpecification dataSource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: aViewSelector.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: aTitle.
	self assert: viewSpecification priority equals: aPriority.
	
	dataSource := viewedObjectProxy getDeclarativeViewFor: aViewSelector.
	self 
		assertBasicStyledTextInViewSpecification: dataSource
		expectedText: anExpectedText.
	
	^ viewSpecification
]

{ #category : #assertions }
GtRemoteDeclarativeViewsExamples >> assertUnstyledStringInViewSpecification: aViewSpecification equals: aString [
	| stylableText |
	
	stylableText := (GtRemotePhlowStylableText 
		fromJSONDictionary: aViewSpecification getText).
	self assert: stylableText string equals: aString.
	self assert: stylableText stylerSpecification canAffectText not.
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> columnedListView [
	<gtExample>
	| viewProxy viewDictionary viewSpecification viewDatasource |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtColumnedListFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'Columned list'.
	self assert: viewSpecification columnTitles equals: #(Value Lowercase).
	self assert: viewSpecification columnWidths equals: #(nil 100).
	self 
		assert: (viewSpecification columnTypes collect: #typeLabel) 
		equals: #(text text).
	
	self assert: viewSpecification dataTransport equals: GtPhlowViewSpecification dataLazy.
	
	viewDatasource := viewProxy getDeclarativeViewFor: #gtColumnedListFor:.
	self 
		assertNodesInColumnedViewDatasource: viewDatasource 
		forObjects: (GtRemotePhlowDeclarativeTestInspectable new 
			collectionOfObjects) 
		andColumnsComputation: {
			[ :anObject | anObject  ].
			[ :anObject | anObject asString asLowercase ] }.
	
	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> columnedListWithStyledText [
	<gtExample>
	| viewedObjectProxy viewDictionary viewDataSource viewDatasource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtColumnedListWithStyledTextFor:.
	viewDataSource := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewDataSource title equals: 'Columned list - styled text'.
	self assert: viewDataSource columnTitles equals: {'Plain' . 'Styled' . 'Number'}.
	self assert: viewDataSource columnWidths equals: #(nil nil nil).
	self 
		assert: (viewDataSource columnTypes collect: #typeLabel) 
		equals: #(text text number).
	self assert: viewDataSource dataTransport equals: GtPhlowViewSpecification dataLazy.
	
	viewDatasource := viewedObjectProxy getDeclarativeViewFor: #gtColumnedListWithStyledTextFor:.
	
	self 
		assertNodesInColumnedViewDatasource: viewDatasource 
		forObjects: self objectsForListWithStyledTextComparison 
		andColumnsComputation: {
			[ :anObject | anObject asString ].
			[ :anObject | anObject ].
			[ :anObject :index | 
				"(GtPhlowText forString: (index*100) asString) bold"
				(index*100) asRopedText bold ] }.
	
	^ viewDataSource
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> columnedListWithTypedColumns [
	<gtExample>
	<after: #stopServer>
	| viewProxy viewDictionary viewSpecification viewDatasource |

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
				
	viewDatasource := viewProxy getDeclarativeViewFor: #gtColumnedListWithTypedColumnsFor:.
	self 
		assertNodesInColumnedViewDatasource: viewDatasource 
		forObjects: (1 to: 500)
		andColumnsComputation: {
			[ :aNumber | '+',aNumber asFloat asString ].
			[ :aNumber | '+',(aNumber + 1) asString].
			[ :aNumber | aNumber asFloat gtSystemIconName ] }.
	
	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> columnedTreeView [
	<gtExample>
	| viewedObjectProxy viewDictionary viewSpecification viewDatasource obtainedNodes |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtColumnedTreeFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'Columned Tree'.
	self assert: viewSpecification columnTitles equals: {'x' . 'x * x'}.
	self assert: viewSpecification columnWidths equals: #(nil nil).
	self 
		assert: (viewSpecification columnTypes collect: #typeLabel) 
		equals: #(text text).
	self 
		assert: viewSpecification dataTransport 
		equals: GtPhlowViewSpecification dataLazy.
	
	viewDatasource := viewedObjectProxy getDeclarativeViewFor: #gtColumnedTreeFor:.
	
	obtainedNodes := self 
		assertNodesInColumnedViewDatasource: viewDatasource 
		forObjects: (1 to: 5 ) 
		andColumnsComputation: {
			[ :aNumber | aNumber ].
			[ :aNumber | aNumber * aNumber ] }.
			
	self 
		assertChildColumnedTreeNodesInViewDatasource: viewDatasource 
		forParentNode:  obtainedNodes third
		forObjects: (1 to: 2 ) 
		andColumnsComputation: {
			[ :aNumber | aNumber ].
			[ :aNumber | aNumber * aNumber ] }.
	
	^ viewSpecification
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> computeStyledTextForTreeNumber: anInteger [
	| computedString|
	computedString := anInteger asString, ' number'.
	(anInteger \\ 2) = 0 
		ifTrue: [
			computedString :=  computedString asRopedText
				bold;
				highlight: (GtPhlowColor named: #yellow) asColor ].
	^ computedString
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> convertIfNeededUsingDisplayTextObject: anObject [ 
	"When doing local inspection Phlow text objects are not special.
	They are just like any other normal objects and we convert them 
	as any other object"
	^ (self shouldConvertUsingDisplayTextObject: anObject)
			ifTrue: [ anObject gtDisplayText ]
			ifFalse: [ anObject ]
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> createColumnedNodesWithObjectValues: aCollectionOfObjects andColumnsComputation: aCollectionOfBlockClosures [
	^ self createColumnedNodesWithRowValues:  (aCollectionOfObjects 
		withIndexCollect: [ :anObject :aRowIndex | 
			GtRemotePhlowRowValue new
				columnValues: (aCollectionOfBlockClosures 
					collect: [ :aColumnComputation |
						| columnedText |
						columnedText := self convertIfNeededUsingDisplayTextObject: (aColumnComputation 
							cull: anObject cull: aRowIndex).
						self createPhlowTextValueFromText: columnedText ]) ])
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> createColumnedNodesWithRowValues: aCollectionOfRowValues [
	^ aCollectionOfRowValues withIndexCollect: [ :aRowValue :anIndex | 
	 	GtRemotePhlowColumnedTreeNode new
	 		nodeId: anIndex;
	 		nodeValue: aRowValue ]
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> createListNodesWithObjectValues: aCollectionOfObjects [
	^ self createListNodesWithTextValues: (aCollectionOfObjects 
		collect: [ :anObject | 
			self convertIfNeededUsingDisplayTextObject: anObject ])
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> createListNodesWithTextValues: aCollectionOfValues [
	^ aCollectionOfValues withIndexCollect: [ :aText :anIndex | 
	 	GtRemotePhlowDataNode new
	 		nodeId: anIndex;
	 		nodeValue: (self createPhlowTextValueFromText: aText) ]
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> createPhlowTextValueFromText: aText [
	| convertedText |
	convertedText := aText.
	convertedText class name = #BlRunRopedText ifTrue: [
		convertedText := convertedText asGtPlowText ]. 
	
	^ (GtRemotePhlowItemTextualValue new
	 	itemText: convertedText)
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> createTreeNodesWithObjectValues: aCollectionOfObjects [
	^ self createTreeNodesWithTextValues: (aCollectionOfObjects 
		collect: [ :anObject | 
			self convertIfNeededUsingDisplayTextObject: anObject ])
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> createTreeNodesWithTextValues: aCollectionOfValues [
	^ aCollectionOfValues withIndexCollect: [ :aText :anIndex | 
		| convertedText |
		convertedText := aText.
		convertedText class name = #BlRunRopedText ifTrue: [
			convertedText := convertedText asGtPlowText ]. 
		 GtRemotePhlowTreeNode new
	 		nodeId: anIndex;
	 		nodeValue: (GtRemotePhlowItemTextualValue new
	 			itemText: convertedText)]
]

{ #category : #accessing }
GtRemoteDeclarativeViewsExamples >> expectedBasicString [
	^ 'Now is the time'
]

{ #category : #'accessing - expected' }
GtRemoteDeclarativeViewsExamples >> expectedColumnedListTypedColumnsTwoItems [
	^ ((Array new: 2) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+1.0'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+2'); yourself); at: 3 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->#classIcon); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+2.0'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+3'); yourself); at: 3 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->#classIcon); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); yourself)
]

{ #category : #'accessing - expected' }
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

{ #category : #'accessing - expected' }
GtRemoteDeclarativeViewsExamples >> expectedStyledText [
	^ GtRemotePhlowDeclarativeTestInspectable new  
			styledText
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
	| viewedObjectProxy viewDictionary viewSpecification viewDatasource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary := viewedObjectProxy getViewDeclaration: #gtListFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: #List.
	self assert: viewSpecification priority equals: 15.
	
	viewDatasource := viewedObjectProxy getDeclarativeViewFor: #gtListFor:.
	self 
		assertNodesInListViewDatasource: viewDatasource 
		forObjects: (GtRemotePhlowDeclarativeTestInspectable new 
			collectionOfObjects).
	
	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> listViewWithStyledText [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary viewSpecification viewDatasource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary := viewedObjectProxy getViewDeclaration: #gtListWithStyledTextFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'List - styled text'.
	self assert: viewSpecification priority equals: 15.1.
	 
	viewDatasource := viewedObjectProxy getDeclarativeViewFor: #gtListWithStyledTextFor:.
	self 
		assertNodesInListViewDatasource: viewDatasource 
		forObjects: self objectsForListWithStyledTextComparison.
	
	^ viewSpecification
]

{ #category : #accessing }
GtRemoteDeclarativeViewsExamples >> objectsForListWithStyledTextComparison [
	^ GtRemotePhlowDeclarativeTestInspectable new 
			objectsForListWithStyledText
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view.
	Subclasses may overwrite this as appropriate."

	^ 'a GtRemotePhlowDeclarativeTestInspectable'
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> printView [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary viewSpecification viewDataSource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtPrintFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: #Print.
	self assert: viewSpecification string equals: nil "self printForString".
	
	viewDataSource := viewedObjectProxy getDeclarativeViewFor: #gtPrintFor: .
	self 
		assertUnstyledStringInViewSpecification: viewDataSource 
		equals: self printForString.
	
	^ viewSpecification
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
GtRemoteDeclarativeViewsExamples >> shouldConvertUsingDisplayTextObject: anObject [ 
	"When doing local inspection Phlow text objects are not special.
	They are just like any other normal objects and we convert them 
	as any other object"
	^ anObject isString not
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
	| viewedObjectProxy viewDictionary viewSpecification viewDataSource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtStyledStringUsingStylerFor: .
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'Styled text (styler)'.
	self assert: viewSpecification priority equals: 11.2.
	self assert: viewSpecification string equals: nil.
	
	viewDataSource := viewedObjectProxy getDeclarativeViewFor: #gtStyledStringUsingStylerFor: .
	self 
		assertBasicStyledTextInViewSpecification: viewDataSource
		expectedText: self expectedStyledText.
	
	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textEditorViewWithParserStylerClass [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary viewSpecification viewDataSource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtStyledStringJsonInEditorFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'Styled JSON'.
	self assert: viewSpecification priority equals: 11.5.
	self assert: viewSpecification string equals: nil.
	
	viewDataSource := viewedObjectProxy getDeclarativeViewFor: #gtStyledStringJsonInEditorFor:.
	self assertStyledJsonTextInViewSpecification:  viewDataSource.
	
	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textEditorViewWithSimpleString [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary viewSpecification viewDataSource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtStringInTextEditorViewFor: .
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'String (editor)'.
	self assert: viewSpecification priority equals: 11.
	self assert: viewSpecification string equals: nil.
	
	viewDataSource := viewedObjectProxy getDeclarativeViewFor: #gtStringInTextEditorViewFor: .
	self 
		assertUnstyledStringInViewSpecification: viewDataSource 
		equals: 'hello world'.
	
	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textEditorViewWithStyledPhlowText [
	<gtExample>
	<after: #stopServer>
	| view |

	view := self 
		assertTextualViewWithBasicStyledTextWithSelector: #gtStyledPhlowTextInEditorFor: 
		title: 'Styled phlow text (editor)'
		priority: 11.3
		expectedText: GtRemotePhlowDeclarativeTestInspectable new  
			styledPhlowText.
	
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
		priority: 11.1
		expectedText:  self expectedStyledText.
		
	self assert: view string equals: nil.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textViewWithSimpleString [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary viewSpecification viewDataSource |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary :=  viewedObjectProxy getViewDeclaration: #gtStringInTextViewFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'String (text)'.
	self assert: viewSpecification priority equals: 10.
	
	viewDataSource := viewedObjectProxy getDeclarativeViewFor: #gtStringInTextViewFor: .
	self 
		assertUnstyledStringInViewSpecification: viewDataSource 
		equals: 'hello world'.
	
	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textViewWithStyledPhlowText [
	<gtExample>
	<after: #stopServer>
	| view |
	
	view := self 
		assertTextualViewWithBasicStyledTextWithSelector: #gtStyledPhlowTextFor: 
		title: 'Styled phlow text'
		priority: 10.3
		expectedText: GtRemotePhlowDeclarativeTestInspectable new  
			styledPhlowText.
	
	^ view
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> textViewWithStyledText [
	<gtExample>
	<after: #stopServer>
	
	^ self 
		assertTextualViewWithBasicStyledTextWithSelector: #gtStyledTextFor: 
		title: 'Styled text'
		priority: 10.1
		expectedText:  self expectedStyledText.
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> treeView [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary viewSpecification |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary := viewedObjectProxy getViewDeclaration: #gtTreeFor: .
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'Tree'.
	self assert: viewSpecification priority equals: 30.
	
	self treeViewLazyCheck: viewedObjectProxy.
	
	^ viewSpecification
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> treeViewLazyCheck: viewProxy [
	| viewDatasource obtainedNodes|

	viewDatasource := viewProxy getDeclarativeViewFor: #gtTreeFor:.
	self assert: viewDatasource retrieveTotalItemsCount equals: 5.
	
	obtainedNodes := self 
		assertNodesInTreeViewDatasource: viewDatasource 
		forObjects: ((1 to: 5) 
			collect: [ :x | x asString, ' number' ]).
			
	self 
		assertChildTreeNodesInViewDatasource: viewDatasource 
		forParentNode:  obtainedNodes third
		forObjects:  ((1 to: 2) 
			collect: [ :x | x asString, ' number' ]).
]

{ #category : #private }
GtRemoteDeclarativeViewsExamples >> treeViewWithStyledTextLazyCheck: viewProxy [
	| viewDatasource obtainedNodes|

	viewDatasource := viewProxy getDeclarativeViewFor: #gtTreeWithStyledTextFor:.
	self assert: viewDatasource retrieveTotalItemsCount equals: 5.
	
	obtainedNodes := self 
		assertNodesInTreeViewDatasource: viewDatasource 
		forObjects: ((1 to: 5) 
			collect: [ :aNumber | self computeStyledTextForTreeNumber: aNumber ]).
			
	self 
		assertChildTreeNodesInViewDatasource: viewDatasource 
		forParentNode:  obtainedNodes third
		forObjects: ((1 to: 2) 
			collect: [ :aNumber | self computeStyledTextForTreeNumber: aNumber  ]).
]

{ #category : #'examples - views' }
GtRemoteDeclarativeViewsExamples >> treeViewWithStyledtext [
	<gtExample>
	<after: #stopServer>
	| viewedObjectProxy viewDictionary viewSpecification |

	viewedObjectProxy := self viewedObjectProxy.
	viewDictionary := viewedObjectProxy getViewDeclaration: #gtTreeWithStyledTextFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: 'Tree - with styled text'.
	self assert: viewSpecification priority equals: 30.1.
	
	self treeViewWithStyledTextLazyCheck: viewedObjectProxy.
	
	^ viewSpecification
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
