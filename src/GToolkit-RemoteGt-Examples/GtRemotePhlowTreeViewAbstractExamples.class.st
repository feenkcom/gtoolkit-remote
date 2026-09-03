"
Shared construction examples for tree Phlow views.
"
Class {
	#name : #GtRemotePhlowTreeViewAbstractExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API'
}

{ #category : #testing }
GtRemotePhlowTreeViewAbstractExamples class >> isAbstract [
	^self name = #GtRemotePhlowTreeViewAbstractExamples
]

{ #category : #'examples - support' }
GtRemotePhlowTreeViewAbstractExamples >> createProtoView [
	self subclassResponsibility
]

{ #category : #'examples - support' }
GtRemotePhlowTreeViewAbstractExamples >> expectedTreeWithNumberItems [
	^ ((Array new: 4) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'1'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'2'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'3'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->3); yourself); at: 4 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: ('__typeName'->#GtRemotePhlowItemTextualValue); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'4'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->4); yourself); yourself)
]

{ #category : #examples }
GtRemotePhlowTreeViewAbstractExamples >> treeView [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Tree';
		priority: 10;
		items: [ 1 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ 1 to: aNumber // 2 ] ].
	self assert: view title equals: 'Tree'.
	self assert: view priority equals: 10.
	^ view
]

{ #category : #examples }
GtRemotePhlowTreeViewAbstractExamples >> treeViewSpecification [
	<gtExample>
	<return: #GtPhlowTreeViewSpecification>
	| view declarativeSpecification |
	view := self treeView.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Tree'.
	self assert: declarativeSpecification priority equals: 10.
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedTreeWithNumberItems.

	^ declarativeSpecification
]

{ #category : #examples }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithItemText [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Tree - with item text';
		priority: 12;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | x asString, ' number' ].
	self assert: view title equals: 'Tree - with item text'.
	self assert: view priority equals: 12.
	^ view
]

{ #category : #examples }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithStyledText [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Tree - with styled text';
		priority: 11;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | 
			| computedString|
			computedString := x asString, ' number'.
			(x \\ 2) = 0 
				ifTrue: [
					computedString := computedString asRopedText
						bold;
						highlight: (GtPhlowColor named: #yellow) asColor ].
			computedString ].
	self assert: view title equals: 'Tree - with styled text'.
	self assert: view priority equals: 11.
	^ view
]

{ #category : #examples }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithStyledTextSpecification [
	<gtExample>
	<return: #GtPhlowTreeViewSpecification>
	| view declarativeSpecification |
	view := self treeViewWithStyledText.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Tree - with styled text'.
	self assert: declarativeSpecification priority equals: 11.

	^ declarativeSpecification
]
