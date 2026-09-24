Class {
	#name : #GtRemotePhlowListingViewSelectionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> listAndTreeItemInequality [
	<gtExample>
	<return: #GtRemotePhlowListingViewListSelectionItem>
	| listItem treeItem |
	listItem := self listSelectionItem.
	treeItem := self treeSelectionItem.
	self assert: (listItem = treeItem) not.
	^ listItem
]

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> listSelectionItem [
	<gtExample>
	<return: #GtRemotePhlowListingViewListSelectionItem>
	| item |
	item := GtRemotePhlowListingViewListSelectionItem new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 3).
	self assert: item class equals: GtRemotePhlowListingViewListSelectionItem.
	self assert: item nodeIdentifier nodeIndex equals: 3.
	self assert: item selectionIndex isNil.
	self assert: item printString equals: 'a GtRemotePhlowListingViewListSelectionItem(3)'.
	^ item
]

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> listSelectionItemWithIndex [
	<gtExample>
	<return: #GtRemotePhlowListingViewListSelectionItem>
	| item |
	item := GtRemotePhlowListingViewListSelectionItem new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 3);
		selectionIndex: 3.
	self assert: item selectionIndex equals: 3.
	self assert: item printString equals: 'a GtRemotePhlowListingViewListSelectionItem(3 @ 3)'.
	^ item
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListingViewSelectionExamples >> multipleListSelection [
	<gtExample>
	<return: #GtRemotePhlowListingViewMultipleSelection>
	| selection |
	selection := GtRemotePhlowListingViewSelection forMultipleListIndexes: #(1 3 5).
	self assert: selection class equals: GtRemotePhlowListingViewMultipleSelection.
	self assert: selection selectionItems size equals: 3.
	self assert: (selection selectionItems allSatisfy: [ :each | each class = GtRemotePhlowListingViewListSelectionItem ]).
	self assert: selection selectionItems first nodeIdentifier nodeIndex equals: 1.
	self assert: selection selectionItems last nodeIdentifier nodeIndex equals: 5.
	^ selection
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListingViewSelectionExamples >> multipleSelectionEquality [
	<gtExample>
	<return: #GtRemotePhlowListingViewMultipleSelection>
	| selection1 selection2 |
	selection1 := self multipleListSelection.
	selection2 := GtRemotePhlowListingViewSelection forMultipleListIndexes: #(1 3 5).
	self assert: selection1 equals: selection2.
	self assert: selection1 hash equals: selection2 hash.
	^ selection1
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListingViewSelectionExamples >> multipleSelectionJsonRoundtrip [
	<gtExample>
	<return: #GtRemotePhlowListingViewMultipleSelection>
	| selection json dictionary deserialized |
	selection := self multipleListSelection.
	json := selection asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListingViewSelectionExamples >> multipleSelectionNodeIdentifiersDo [
	<gtExample>
	<return: #OrderedCollection>
	| selection collected |
	selection := self multipleListSelection.
	collected := OrderedCollection new.
	selection nodeIdentifiersDo: [ :each | collected add: each ].
	self assert: collected size equals: 3.
	self assert: collected first nodeIndex equals: 1.
	self assert: collected second nodeIndex equals: 3.
	self assert: collected third nodeIndex equals: 5.
	^ collected
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListingViewSelectionExamples >> multipleSelectionSerialization [
	<gtExample>
	<return: #GtRemotePhlowListingViewMultipleSelection>
	| selection dictionary deserialized expectedDictionary |
	selection := self multipleListSelection.
	dictionary := selection asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtRemotePhlowListingViewMultipleSelection';
		at: 'selectionItems' put: {
			Dictionary new
				at: '__typeName' put: 'GtRemotePhlowListingViewListSelectionItem';
				at: 'nodeIdentifier' put: (Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 1; yourself);
				yourself.
			Dictionary new
				at: '__typeName' put: 'GtRemotePhlowListingViewListSelectionItem';
				at: 'nodeIdentifier' put: (Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 3; yourself);
				yourself.
			Dictionary new
				at: '__typeName' put: 'GtRemotePhlowListingViewListSelectionItem';
				at: 'nodeIdentifier' put: (Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 5; yourself);
				yourself };
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListingViewSelectionExamples >> multipleTreeSelection [
	<gtExample>
	<return: #GtRemotePhlowListingViewMultipleSelection>
	| selection |
	selection := GtRemotePhlowListingViewSelection forMultipleTreePaths: { #(1 2). #(3 4) }.
	self assert: selection class equals: GtRemotePhlowListingViewMultipleSelection.
	self assert: selection selectionItems size equals: 2.
	self assert: (selection selectionItems allSatisfy: [ :each | each class = GtRemotePhlowListingViewTreeSelectionItem ]).
	^ selection
]

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> selectionItemEquality [
	<gtExample>
	<return: #GtRemotePhlowListingViewListSelectionItem>
	| item1 item2 |
	item1 := self listSelectionItem.
	item2 := GtRemotePhlowListingViewListSelectionItem new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 3).
	self assert: item1 equals: item2.
	self assert: item1 hash equals: item2 hash.
	^ item1
]

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> selectionItemInequality [
	<gtExample>
	<return: #GtRemotePhlowListingViewListSelectionItem>
	| item1 item2 |
	item1 := self listSelectionItem.
	item2 := GtRemotePhlowListingViewListSelectionItem new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 7).
	self assert: (item1 = item2) not.
	^ item1
]

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> selectionItemJsonRoundtrip [
	<gtExample>
	<return: #GtRemotePhlowListingViewListSelectionItem>
	| item json dictionary deserialized |
	item := self listSelectionItemWithIndex.
	json := item asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: item.
	^ deserialized
]

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> selectionItemSerialization [
	<gtExample>
	<return: #GtRemotePhlowListingViewListSelectionItem>
	| item dictionary deserialized expectedDictionary |
	item := self listSelectionItemWithIndex.
	dictionary := item asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtRemotePhlowListingViewListSelectionItem';
		at: 'nodeIdentifier' put: (Dictionary new
			at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier';
			at: 'nodeIndex' put: 3;
			yourself);
		at: 'selectionIndex' put: 3;
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: item.
	^ deserialized
]

{ #category : #'examples - equality' }
GtRemotePhlowListingViewSelectionExamples >> singleAndMultipleSelectionInequality [
	<gtExample>
	<return: #GtRemotePhlowListingViewSingleSelection>
	| single multiple |
	single := self singleListSelection.
	multiple := self multipleListSelection.
	self assert: (single = multiple) not.
	^ single
]

{ #category : #'examples - single selection' }
GtRemotePhlowListingViewSelectionExamples >> singleListSelection [
	<gtExample>
	<return: #GtRemotePhlowListingViewSingleSelection>
	| selection |
	selection := GtRemotePhlowListingViewSelection forSingleListIndex: 3.
	self assert: selection class equals: GtRemotePhlowListingViewSingleSelection.
	self assert: selection selectionItem class equals: GtRemotePhlowListingViewListSelectionItem.
	self assert: selection selectionItem nodeIdentifier nodeIndex equals: 3.
	self assert: selection selectionItems size equals: 1.
	^ selection
]

{ #category : #'examples - single selection' }
GtRemotePhlowListingViewSelectionExamples >> singleSelectionEquality [
	<gtExample>
	<return: #GtRemotePhlowListingViewSingleSelection>
	| selection1 selection2 |
	selection1 := self singleListSelection.
	selection2 := GtRemotePhlowListingViewSelection forSingleListIndex: 3.
	self assert: selection1 equals: selection2.
	self assert: selection1 hash equals: selection2 hash.
	^ selection1
]

{ #category : #'examples - single selection' }
GtRemotePhlowListingViewSelectionExamples >> singleSelectionInequality [
	<gtExample>
	<return: #GtRemotePhlowListingViewSingleSelection>
	| selection1 selection2 |
	selection1 := self singleListSelection.
	selection2 := GtRemotePhlowListingViewSelection forSingleListIndex: 7.
	self assert: (selection1 = selection2) not.
	^ selection1
]

{ #category : #'examples - single selection' }
GtRemotePhlowListingViewSelectionExamples >> singleSelectionJsonRoundtrip [
	<gtExample>
	<return: #GtRemotePhlowListingViewSingleSelection>
	| selection json dictionary deserialized |
	selection := self singleListSelection.
	json := selection asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - single selection' }
GtRemotePhlowListingViewSelectionExamples >> singleSelectionNodeIdentifiersDo [
	<gtExample>
	<return: #OrderedCollection>
	| selection collected |
	selection := self singleListSelection.
	collected := OrderedCollection new.
	selection nodeIdentifiersDo: [ :each | collected add: each ].
	self assert: collected size equals: 1.
	self assert: collected first nodeIndex equals: 3.
	^ collected
]

{ #category : #'examples - single selection' }
GtRemotePhlowListingViewSelectionExamples >> singleSelectionSerialization [
	<gtExample>
	<return: #GtRemotePhlowListingViewSingleSelection>
	| selection dictionary deserialized expectedDictionary |
	selection := self singleListSelection.
	dictionary := selection asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtRemotePhlowListingViewSingleSelection';
		at: 'selectionItem' put: (Dictionary new
			at: '__typeName' put: 'GtRemotePhlowListingViewListSelectionItem';
			at: 'nodeIdentifier' put: (Dictionary new
				at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier';
				at: 'nodeIndex' put: 3;
				yourself);
			yourself);
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - single selection' }
GtRemotePhlowListingViewSelectionExamples >> singleTreeSelection [
	<gtExample>
	<return: #GtRemotePhlowListingViewSingleSelection>
	| selection |
	selection := GtRemotePhlowListingViewSelection forSingleTreePath: #(1 2).
	self assert: selection class equals: GtRemotePhlowListingViewSingleSelection.
	self assert: selection selectionItem class equals: GtRemotePhlowListingViewTreeSelectionItem.
	self assert: selection selectionItem nodeIdentifier nodeIndexPath equals: #(1 2).
	self assert: selection selectionItems size equals: 1.
	^ selection
]

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> treeSelectionItem [
	<gtExample>
	<return: #GtRemotePhlowListingViewTreeSelectionItem>
	| item |
	item := GtRemotePhlowListingViewTreeSelectionItem new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: #(1 2)).
	self assert: item class equals: GtRemotePhlowListingViewTreeSelectionItem.
	self assert: item nodeIdentifier nodeIndexPath equals: #(1 2).
	self assert: item printString equals: 'a GtRemotePhlowListingViewTreeSelectionItem(#(1 2))'.
	^ item
]

{ #category : #'examples - items' }
GtRemotePhlowListingViewSelectionExamples >> treeSelectionItemWithIndex [
	<gtExample>
	<return: #GtRemotePhlowListingViewTreeSelectionItem>
	| item |
	item := GtRemotePhlowListingViewTreeSelectionItem new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: #(1 2));
		selectionIndex: 5.
	self assert: item selectionIndex equals: 5.
	self assert: item printString equals: 'a GtRemotePhlowListingViewTreeSelectionItem(#(1 2) @ 5)'.
	^ item
]
