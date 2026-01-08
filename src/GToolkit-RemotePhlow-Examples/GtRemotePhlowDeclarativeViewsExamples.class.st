"
GtRemoteDeclarativeGtExamples demonstrates the use of declarative views in Gtoolkit.

This class runs the examples within the one image, and thus can be run without any external server setup.  Subclasses overwrite various methods to run the examples connecting to the remote server.
"
Class {
	#name : #GtRemotePhlowDeclarativeViewsExamples,
	#superclass : #GtRemotePhlowDeclarativeExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #testing }
GtRemotePhlowDeclarativeViewsExamples class >> isAbstract [
	^ self name = #GtRemotePhlowDeclarativeViewsExamples
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertBasicStyledTextInViewSpecification: aViewSpecification expectedText: anExpectedText [
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
GtRemotePhlowDeclarativeViewsExamples >> assertChildColumnedTreeNodesInViewDatasource: viewDatasource forParentNode: aParentNode  forObjects: anExpectedCollectionOfObjects andColumnsComputation: aCollectionOfBlockClosures [
	^ self 
		assertChildNodesInViewDatasource: viewDatasource 
		forParentNode:  aParentNode
		ofType: GtRemotePhlowColumnedTreeNode
		equalNodes: (self 
			createColumnedNodesWithObjectValues: anExpectedCollectionOfObjects
			andColumnsComputation: aCollectionOfBlockClosures)
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertChildNodesInViewDatasource: viewDatasource forParentNode: aParentNode ofType: aPhlowDataNodeClass equalNodes: anExpectedCollectionOfNodes [ 
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
GtRemotePhlowDeclarativeViewsExamples >> assertChildTreeNodesInViewDatasource: viewDatasource forParentNode: aParentNode  forObjects: anExpectedCollectionOfObjects [
	^ self 
		assertChildNodesInViewDatasource: viewDatasource 
		forParentNode:  aParentNode
		ofType: GtRemotePhlowTreeNode
		equalNodes: (self 
			createTreeNodesWithObjectValues: anExpectedCollectionOfObjects)
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertListingNode: anObtainedObject equals: anExpectedNode [ 
	self assert: anObtainedObject nodeId = anExpectedNode nodeId.
	self assert: (anObtainedObject matchesNodeContentWith: anExpectedNode)
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertListingNodes: obtainedNodes equals: expectedNodes [
	self assert:  obtainedNodes size equals: expectedNodes size.
	
	expectedNodes withIndexDo: [ :anExpectedNode :anIndex |
		self 
			assertListingNode: (obtainedNodes at: anIndex) 
			equals: anExpectedNode ]
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertNodesInColumnedViewDatasource: viewDatasource forObjects: aCollectionOfObjects andColumnsComputation: aCollectionOfBlockClosures [
	^ self 
		assertNodesInViewDatasource: viewDatasource 
		ofType: GtRemotePhlowColumnedTreeNode
		equalNodes: (self 
			createColumnedNodesWithObjectValues: aCollectionOfObjects
			andColumnsComputation: aCollectionOfBlockClosures).
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertNodesInListViewDatasource: viewDatasource forObjects: anCollectionOfObjects [
	^ self 
		assertNodesInViewDatasource: viewDatasource 
		ofType: GtRemotePhlowDataNode
		equalNodes: (self 
			createListNodesWithObjectValues: anCollectionOfObjects).
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertNodesInTreeViewDatasource: viewDatasource forObjects: anCollectionOfObjects [
	^ self 
		assertNodesInViewDatasource: viewDatasource 
		ofType: GtRemotePhlowTreeNode
		equalNodes: (self 
			createTreeNodesWithObjectValues: anCollectionOfObjects).
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertNodesInViewDatasource: viewSpecification ofType: aPhlowDataNodeClass equalNodes: anExpectedCollectionOfNodes [ 
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
GtRemotePhlowDeclarativeViewsExamples >> assertStyledJsonTextInViewSpecification: aViewSpecification [
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
GtRemotePhlowDeclarativeViewsExamples >> assertTextAttributedRunStyleSpecification: aStyleSpecification equalsRuns: aRunsCollection [
	self 
		assert: aStyleSpecification numberOfRuns 
		equals: aRunsCollection size.
	
	self 
		assert: aStyleSpecification attributeRuns
		equals: aRunsCollection
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertTextualViewWithBasicStyledTextWithSelector: aViewSelector title: aTitle priority: aPriority expectedText: anExpectedText [
	| phlowSpecificationsProvider viewDictionary viewSpecification dataSource |

	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary :=  phlowSpecificationsProvider getViewDeclaration: aViewSelector.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: viewSpecification title equals: aTitle.
	self assert: viewSpecification priority equals: aPriority.
	
	dataSource := phlowSpecificationsProvider getDeclarativeViewFor: aViewSelector.
	self 
		assertBasicStyledTextInViewSpecification: dataSource
		expectedText: anExpectedText.
	
	^ viewSpecification
]

{ #category : #assertions }
GtRemotePhlowDeclarativeViewsExamples >> assertUnstyledStringInViewSpecification: aViewSpecification equals: aString [
	| stylableText |
	
	stylableText := (GtRemotePhlowStylableText 
		fromJSONDictionary: aViewSpecification getText).
	self assert: stylableText string equals: aString.
	self assert: stylableText stylerSpecification canAffectText not.
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> columnedListView [
	<gtExample>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDatasource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtColumnedListFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'Columned list'.
	self assert: viewSpecification columnTitles equals: #(Value Lowercase).
	self assert: viewSpecification columnWidths equals: #(nil 100).
	self
		assert: (viewSpecification columnTypes collect: #typeLabel)
		equals: #(text text).

	self
		assert: viewSpecification dataTransport
		equals: GtPhlowViewSpecification dataLazy.

	viewDatasource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtColumnedListFor:.
	self
		assertNodesInColumnedViewDatasource: viewDatasource
		forObjects: GtRemotePhlowDeclarativeTestInspectable new collectionOfObjects
		andColumnsComputation: {[ :anObject | anObject ].
				[ :anObject | anObject gtDisplayString asLowercase ]}.

	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> columnedListWithStyledText [
	<gtExample>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewDataSource viewDatasource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtColumnedListWithStyledTextFor:.
	viewDataSource := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewDataSource title equals: 'Columned list - styled text'.
	self
		assert: viewDataSource columnTitles
		equals: {'Plain'.
				'Styled'.
				'Number'}.
	self assert: viewDataSource columnWidths equals: #(nil nil nil).
	self
		assert: (viewDataSource columnTypes collect: #typeLabel)
		equals: #(text text number).
	self
		assert: viewDataSource dataTransport
		equals: GtPhlowViewSpecification dataLazy.

	viewDatasource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtColumnedListWithStyledTextFor:.

	self
		assertNodesInColumnedViewDatasource: viewDatasource
		forObjects: self objectsForListWithStyledTextComparison
		andColumnsComputation: {[ :anObject | anObject asString ].
				[ :anObject | anObject ].
				[  "(GtPhlowText forString: (index*100) asString) bold":anObject :index | (index * 100) asRopedText bold ]}.

	^ viewDataSource
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> columnedListWithTypedColumns [
	<gtExample>
	<after: #stopServer>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDatasource |

	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtColumnedListWithTypedColumnsFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	viewSpecification initializeFromInspector: phlowSpecificationsProvider.

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
	self assert: viewSpecification columnWidths equals: #(nil 100 75).

	self assert: viewSpecification totalItemsCount equals: 500.

	self
		assert: (viewSpecification retrieveItems: 2 fromIndex: 1)
		equals: (self expectedColumnedListTypedColumnsTwoItems).

	viewDatasource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtColumnedListWithTypedColumnsFor:.
	self
		assertNodesInColumnedViewDatasource: viewDatasource
		forObjects: (1 to: 500)
		andColumnsComputation: {[ :aNumber | '+' , (aNumber asFloat printShowingDecimalPlaces: 1) ].
				[ :aNumber | '+' , (aNumber + 1) asString ].
				[ :aNumber | self formatExpectedIconName: aNumber asFloat gtSystemIconName ]}.

	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> columnedTreeView [
	<gtExample>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDatasource obtainedNodes |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtColumnedTreeFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'Columned Tree'.
	self
		assert: viewSpecification columnTitles
		equals: {'x'.
				'x * x'}.
	self assert: viewSpecification columnWidths equals: #(nil nil).
	self
		assert: (viewSpecification columnTypes collect: #typeLabel)
		equals: #(text text).
	self
		assert: viewSpecification dataTransport
		equals: GtPhlowViewSpecification dataLazy.

	viewDatasource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtColumnedTreeFor:.

	obtainedNodes := self
			assertNodesInColumnedViewDatasource: viewDatasource
			forObjects: (1 to: 5)
			andColumnsComputation: {[ :aNumber | aNumber ].
					[ :aNumber | aNumber * aNumber ]}.

	self
		assertChildColumnedTreeNodesInViewDatasource: viewDatasource
		forParentNode: obtainedNodes third
		forObjects: (1 to: 2)
		andColumnsComputation: {[ :aNumber | aNumber ].
				[ :aNumber | aNumber * aNumber ]}.

	^ viewSpecification
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> computeStyledTextForTreeNumber: anInteger [
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
GtRemotePhlowDeclarativeViewsExamples >> convertIfNeededUsingDisplayTextObject: anObject [ 
	"When doing local inspection Phlow text objects are not special.
	They are just like any other normal objects and we convert them 
	as any other object"
	^ (self shouldConvertUsingDisplayTextObject: anObject)
			ifTrue: [ anObject gtDisplayText ]
			ifFalse: [ anObject ]
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> createColumnedNodesWithObjectValues: aCollectionOfObjects andColumnsComputation: aCollectionOfBlockClosures [
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
GtRemotePhlowDeclarativeViewsExamples >> createColumnedNodesWithRowValues: aCollectionOfRowValues [
	^ aCollectionOfRowValues withIndexCollect: [ :aRowValue :anIndex | 
	 	GtRemotePhlowColumnedTreeNode new
	 		nodeId: anIndex;
	 		nodeValue: aRowValue ]
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> createListNodesWithObjectValues: aCollectionOfObjects [
	^ self createListNodesWithTextValues: (aCollectionOfObjects 
		collect: [ :anObject | 
			self convertIfNeededUsingDisplayTextObject: anObject ])
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> createListNodesWithTextValues: aCollectionOfValues [
	^ aCollectionOfValues withIndexCollect: [ :aText :anIndex | 
	 	GtRemotePhlowDataNode new
	 		nodeId: anIndex;
	 		nodeValue: (self createPhlowTextValueFromText: aText) ]
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> createPhlowTextValueFromText: aText [
	| convertedText |
	convertedText := aText.
	convertedText class name = #BlRunRopedText ifTrue: [
		convertedText := convertedText asGtPlowText ]. 
	
	^ (GtRemotePhlowItemTextualValue new
	 	itemText: convertedText)
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> createTreeNodesWithObjectValues: aCollectionOfObjects [
	^ self createTreeNodesWithTextValues: (aCollectionOfObjects 
		collect: [ :anObject | 
			self convertIfNeededUsingDisplayTextObject: anObject ])
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> createTreeNodesWithTextValues: aCollectionOfValues [
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
GtRemotePhlowDeclarativeViewsExamples >> expectedBasicString [
	^ 'Now is the time'
]

{ #category : #'accessing - expected' }
GtRemotePhlowDeclarativeViewsExamples >> expectedColumnedListTypedColumnsTwoItems [
	^ ((Array new: 2) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+1.0'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+2'); yourself); at: 3 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->#class); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+2.0'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'+3'); yourself); at: 3 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->#class); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); yourself)
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsExamples >> expectedJsonString [
	^ '{
	"name":"Me", 
	"age":30, 
	"data":null
}'
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsExamples >> expectedNumberOfRunsForBasicStyledText [
	^ 9
]

{ #category : #'accessing - expected' }
GtRemotePhlowDeclarativeViewsExamples >> expectedStyledPhlowTextWithDecorations [
	^ GtRemotePhlowDeclarativeTextTestInspectable new  
		styledPhlowTextWithDecorations
]

{ #category : #'accessing - expected' }
GtRemotePhlowDeclarativeViewsExamples >> expectedStyledText [
	^ GtRemotePhlowDeclarativeTestInspectable new  
			styledText
]

{ #category : #utils }
GtRemotePhlowDeclarativeViewsExamples >> formatExpectedIconName: anIconName [
	^ anIconName
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> listView [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDatasource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider getViewDeclaration: #gtListFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: #List.
	self assert: viewSpecification priority equals: 15.

	viewDatasource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtListFor:.
	self
		assertNodesInListViewDatasource: viewDatasource
		forObjects: GtRemotePhlowDeclarativeTestInspectable new collectionOfObjects.

	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> listViewWithStyledText [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDatasource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtListWithStyledTextFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'List - styled text'.
	self assert: viewSpecification priority equals: 15.1.

	viewDatasource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtListWithStyledTextFor:.
	self
		assertNodesInListViewDatasource: viewDatasource
		forObjects: self objectsForListWithStyledTextComparison.

	^ viewSpecification
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsExamples >> objectsForListWithStyledTextComparison [
	^ GtRemotePhlowDeclarativeTestInspectable new 
			objectsForListWithStyledText
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> printForString [
	"Answer the string returned in the #gtPrintFor: view.
	Subclasses may overwrite this as appropriate."

	^ 'a GtRemotePhlowDeclarativeTestInspectable'
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> printView [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDataSource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider getViewDeclaration: #gtPrintFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: #Print.
	self assert: viewSpecification string equals: nil.	"self printForString"

	viewDataSource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtPrintFor:.
	self
		assertUnstyledStringInViewSpecification: viewDataSource
		equals: self printForString.

	^ viewSpecification
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> shouldConvertUsingDisplayTextObject: anObject [ 
	"When doing local inspection Phlow text objects are not special.
	They are just like any other normal objects and we convert them 
	as any other object"
	^ anObject isString not
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textEditorViewWithExplicitStyler [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDataSource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtStyledStringUsingStylerFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'Styled text (styler)'.
	self assert: viewSpecification priority equals: 11.2.
	self assert: viewSpecification string equals: nil.

	viewDataSource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtStyledStringUsingStylerFor:.
	self
		assertBasicStyledTextInViewSpecification: viewDataSource
		expectedText: self expectedStyledText.

	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textEditorViewWithParserStylerClass [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDataSource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtStyledStringJsonInEditorFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'Styled JSON'.
	self assert: viewSpecification priority equals: 11.5.
	self assert: viewSpecification string equals: nil.

	viewDataSource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtStyledStringJsonInEditorFor:.
	self assertStyledJsonTextInViewSpecification: viewDataSource.

	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textEditorViewWithSimpleString [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDataSource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtStringInTextEditorViewFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'String (editor)'.
	self assert: viewSpecification priority equals: 11.
	self assert: viewSpecification string equals: nil.

	viewDataSource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtStringInTextEditorViewFor:.
	self
		assertUnstyledStringInViewSpecification: viewDataSource
		equals: 'hello world'.

	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textEditorViewWithStyledPhlowText [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| view |
	view := self
			assertTextualViewWithBasicStyledTextWithSelector: #gtStyledPhlowTextInEditorFor:
			title: 'Styled phlow text (editor)'
			priority: 11.3
			expectedText: GtRemotePhlowDeclarativeTestInspectable new styledPhlowText.

	self assert: view string equals: nil.

	^ view
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textEditorViewWithStyledText [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| view |
	view := self
			assertTextualViewWithBasicStyledTextWithSelector: #gtStyledTextInEditorFor:
			title: 'Styled text (editor)'
			priority: 11.1
			expectedText: self expectedStyledText.

	self assert: view string equals: nil.

	^ view
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textViewWithSimpleString [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification viewDataSource |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtStringInTextViewFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'String (text)'.
	self assert: viewSpecification priority equals: 10.

	viewDataSource := phlowSpecificationsProvider
			getDeclarativeViewFor: #gtStringInTextViewFor:.
	self
		assertUnstyledStringInViewSpecification: viewDataSource
		equals: 'hello world'.

	^ viewSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textViewWithStyledPhlowText [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| view |
	view := self
			assertTextualViewWithBasicStyledTextWithSelector: #gtStyledPhlowTextFor:
			title: 'Styled phlow text'
			priority: 10.3
			expectedText: GtRemotePhlowDeclarativeTestInspectable new styledPhlowText.

	^ view
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textViewWithStyledPhlowTextWithDecorations [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| view |
	view := self
			assertTextualViewWithBasicStyledTextWithSelector: #gtStyledPhlowTextWithDecorationsFor:
			title: 'Styled phlow text with decorations'
			priority: 10.6
			expectedText: self expectedStyledPhlowTextWithDecorations.

	^ view
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> textViewWithStyledText [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	^ self
		assertTextualViewWithBasicStyledTextWithSelector: #gtStyledTextFor:
		title: 'Styled text'
		priority: 10.1
		expectedText: self expectedStyledText
]

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> treeView [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider getViewDeclaration: #gtTreeFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'Tree'.
	self assert: viewSpecification priority equals: 30.

	self treeViewLazyCheck: phlowSpecificationsProvider.

	^ viewSpecification
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> treeViewLazyCheck: viewProxy [
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

{ #category : #'examples - views' }
GtRemotePhlowDeclarativeViewsExamples >> treeViewWithStyledText [
	<gtExample>
	<after: #stopServer>
	<return: #SubclassResponsibility>
	| phlowSpecificationsProvider viewDictionary viewSpecification |
	phlowSpecificationsProvider := self remotePhlowSpecificationsProvider.
	viewDictionary := phlowSpecificationsProvider
			getViewDeclaration: #gtTreeWithStyledTextFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.

	self assert: viewSpecification title equals: 'Tree - with styled text'.
	self assert: viewSpecification priority equals: 30.1.

	self treeViewWithStyledTextLazyCheck: phlowSpecificationsProvider.

	^ viewSpecification
]

{ #category : #private }
GtRemotePhlowDeclarativeViewsExamples >> treeViewWithStyledTextLazyCheck: viewProxy [
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
