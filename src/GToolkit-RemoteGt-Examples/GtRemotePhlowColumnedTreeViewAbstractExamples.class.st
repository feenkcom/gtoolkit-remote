"
Shared construction examples for columned tree Phlow views.
"
Class {
	#name : #GtRemotePhlowColumnedTreeViewAbstractExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API'
}

{ #category : #testing }
GtRemotePhlowColumnedTreeViewAbstractExamples class >> isAbstract [
	^self name = #GtRemotePhlowColumnedTreeViewAbstractExamples
]

{ #category : #examples }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeView [
	<gtExample>
	<return: #GtPhlowColumnedTreeView>
	| view |
	view := self createProtoView columnedTree
		title: 'Columned Tree';
		priority: 10;
		items: [ 1 to: 4 ];
		children: [ :aNumber | aNumber = 0 ifTrue: [ #() ] ifFalse: [ 1 to: aNumber // 2 ] ];
		column: 'One' text: [ :item | item ];
		column: 'Two'
			text: [ :item | (item + 1) asString ]
			width: 100.
	self assert: view title equals: 'Columned Tree'.
	self assert: view priority equals: 10.
	self assert: view columns size equals: 2.
	self assert: view columns first title equals: 'One'.
	self assert: view columns second title equals: 'Two'.
	^ view
]

{ #category : #examples }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewSpecification [
	<gtExample>
	<return: #GtPhlowColumnedTreeViewSpecification>
	| view declarativeSpecification |
	view := self columnedTreeView.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Columned Tree'.
	self assert: declarativeSpecification priority equals: 10.
	self assert: declarativeSpecification columnTitles equals: #('One' 'Two').
	self assert: declarativeSpecification columnWidths equals: #(nil 100).
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedColumnedTreeWithNumberItems.

	^ declarativeSpecification
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithAllLevelsExpansion [
	<gtExample>
	<return: #GtPhlowColumnedTreeView>
	| view |
	view := self createProtoView columnedTree
		title: 'Expansion - all';
		priority: 20;
		items: [ 0 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		expandAll.
	self assert: view title equals: 'Expansion - all'.
	self assert: view priority equals: 20.
	self assert: view expander level equals: 20.
	^ view
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithAllLevelsExpansionSpecification [
	<gtExample>
	<return: #GtPhlowColumnedTreeViewSpecification>
	| view declarativeSpecification |
	view := self columnedTreeViewWithAllLevelsExpansion.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - all'.
	self assert: declarativeSpecification priority equals: 20.
	self assert: declarativeSpecification expander level equals: 20.

	^ declarativeSpecification
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithNoLevelExpansion [
	<gtExample>
	<return: #GtPhlowColumnedTreeView>
	| view |
	view := self createProtoView columnedTree
		title: 'Expansion - no level';
		priority: 15;
		items: [ 0 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ].
	self assert: view title equals: 'Expansion - no level'.
	self assert: view priority equals: 15.
	self assert: view expander isNullExpander.
	^ view
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithNoLevelExpansionSpecification [
	<gtExample>
	<return: #GtPhlowColumnedTreeViewSpecification>
	| view declarativeSpecification |
	view := self columnedTreeViewWithNoLevelExpansion.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - no level'.
	self assert: declarativeSpecification priority equals: 15.

	^ declarativeSpecification
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithOneLevelExpansion [
	<gtExample>
	<return: #GtPhlowColumnedTreeView>
	| view |
	view := self createProtoView columnedTree
		title: 'Expansion - one level';
		priority: 20;
		items: [ 0 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		expandUpTo: 1.
	self assert: view title equals: 'Expansion - one level'.
	self assert: view priority equals: 20.
	self assert: view expander level equals: 1.
	self assert: view expander asDeclarativeExpander level equals: 1.
	^ view
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithOneLevelExpansionSpecification [
	<gtExample>
	<return: #GtPhlowColumnedTreeViewSpecification>
	| view declarativeSpecification |
	view := self columnedTreeViewWithOneLevelExpansion.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - one level'.
	self assert: declarativeSpecification priority equals: 20.
	self assert: declarativeSpecification expander level equals: 1.

	^ declarativeSpecification
]

{ #category : #examples }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithSend [
	<gtExample>
	<return: #GtPhlowColumnedTreeView>
	| view |
	view := self createProtoView columnedTree
		title: 'Columned Tree - with send';
		priority: 11;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		send: [ :x | x + 1000 ].
	self assert: view title equals: 'Columned Tree - with send'.
	self assert: view priority equals: 11.
	^ view
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithSuchThatExpansionBelowFour [
	<gtExample>
	<return: #GtPhlowColumnedTreeView>
	| view |
	view := self createProtoView columnedTree
		title: 'Expansion - below four';
		priority: 20;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		expandSuchThat: [ :aNode :aNumber | aNumber < 4 ].
	self assert: view title equals: 'Expansion - below four'.
	self assert: view priority equals: 20.
	self 
		assert: view expander asDeclarativeExpander conditionString 
		equals: '[ :aNode :aNumber | aNumber < 4 ]'.
	^ view
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithSuchThatExpansionBelowFourSpecification [
	<gtExample>
	<return: #GtPhlowColumnedTreeViewSpecification>
	| view declarativeSpecification |
	view := self columnedTreeViewWithSuchThatExpansionBelowFour.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - below four'.
	self assert: declarativeSpecification priority equals: 20.

	^ declarativeSpecification
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithTwoLevelsExpansion [
	<gtExample>
	<return: #GtPhlowColumnedTreeView>
	| view |
	view := self createProtoView columnedTree
		title: 'Expansion - two levels';
		priority: 20;
		items: [ 0 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		expandUpTo: 2.
	self assert: view title equals: 'Expansion - two levels'.
	self assert: view priority equals: 20.
	self assert: view expander level equals: 2.
	^ view
]

{ #category : #'examples - expander' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> columnedTreeViewWithTwoLevelsExpansionSpecification [
	<gtExample>
	<return: #GtPhlowColumnedTreeViewSpecification>
	| view declarativeSpecification |
	view := self columnedTreeViewWithTwoLevelsExpansion.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - two levels'.
	self assert: declarativeSpecification priority equals: 20.
	self assert: declarativeSpecification expander level equals: 2.

	^ declarativeSpecification
]

{ #category : #'examples - support' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> createProtoView [
	self subclassResponsibility
]

{ #category : #'examples - support' }
GtRemotePhlowColumnedTreeViewAbstractExamples >> expectedColumnedTreeWithNumberItems [
	^ ((Array new: 4) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'1'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->'2'); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'2'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->'3'); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'3'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->'4'); yourself); yourself)); yourself)); add: (#nodeId->3); yourself); at: 4 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'4'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->'5'); yourself); yourself)); yourself)); add: (#nodeId->4); yourself); yourself)
]
