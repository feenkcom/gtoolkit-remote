Class {
	#name : #GtPhlowListingViewSelectionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'examples - equality' }
GtPhlowListingViewSelectionExamples >> listAndTreeSelectionInequality [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| listSelection treeSelection |
	listSelection := self listSelectionSingle.
	treeSelection := self treeSelectionSingle.
	self assert: (listSelection = treeSelection) not.
	self assert: (treeSelection = listSelection) not.
	^ listSelection
]

{ #category : #'examples - list' }
GtPhlowListingViewSelectionExamples >> listSelectionComposite [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forListIndexes: #(1 3 5).
	selection := GtPhlowListingViewListSelection new
		nodeIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewListSelection.
	self assert: selection nodeIdentifier equals: identifier.
	self assert: selection printString equals: 'a GtPhlowListingViewListSelection(1, 3, 5)'.
	self assert: selection description equals: '1, 3, 5'.
	^ selection
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> listSelectionCompositeSerialization [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection dictionary deserialized expectedDictionary |
	selection := self listSelectionComposite.
	dictionary := selection asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtPhlowListingViewListSelection';
		at: 'nodeIdentifier' put: (Dictionary new
			at: '__typeName' put: 'GtRemotePhlowCompositeNodeIdentifier';
			at: 'nodeIdentifiers' put: {
				Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 1; yourself.
				Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 3; yourself.
				Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 5; yourself };
			yourself);
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - equality' }
GtPhlowListingViewSelectionExamples >> listSelectionEquality [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection1 selection2 |
	selection1 := self listSelectionSingle.
	selection2 := GtPhlowListingViewListSelection new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 3).
	self assert: selection1 equals: selection2.
	self assert: selection1 hash equals: selection2 hash.
	^ selection1
]

{ #category : #'examples - factory' }
GtPhlowListingViewSelectionExamples >> listSelectionFromMultipleListIndexes [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection |
	selection := GtPhlowListingViewSelection forMultipleListIndexes: #(1 3 5).
	self assert: selection class equals: GtPhlowListingViewListSelection.
	self assert: selection nodeIdentifier class equals: GtRemotePhlowCompositeNodeIdentifier.
	self assert: selection nodeIdentifier nodeIdentifiers size equals: 3.
	^ selection
]

{ #category : #'examples - factory' }
GtPhlowListingViewSelectionExamples >> listSelectionFromSingleIdentifier [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| identifier selection |
	identifier := GtRemotePhlowNodeIdentifier forListIndex: 3.
	selection := GtPhlowListingViewSelection forSingleListIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewListSelection.
	self assert: selection nodeIdentifier equals: identifier.
	^ selection
]

{ #category : #'examples - factory' }
GtPhlowListingViewSelectionExamples >> listSelectionFromSingleListIndex [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection |
	selection := GtPhlowListingViewSelection forSingleListIndex: 3.
	self assert: selection class equals: GtPhlowListingViewListSelection.
	self assert: selection nodeIdentifier class equals: GtRemotePhlowIndexNodeIdentifier.
	self assert: selection nodeIdentifier nodeIndex equals: 3.
	^ selection
]

{ #category : #'examples - equality' }
GtPhlowListingViewSelectionExamples >> listSelectionInequality [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection1 selection2 |
	selection1 := self listSelectionSingle.
	selection2 := GtPhlowListingViewListSelection new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 7).
	self assert: (selection1 = selection2) not.
	^ selection1
]

{ #category : #'examples - list' }
GtPhlowListingViewSelectionExamples >> listSelectionSingle [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forListIndex: 3.
	selection := GtPhlowListingViewListSelection new
		nodeIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewListSelection.
	self assert: selection nodeIdentifier equals: identifier.
	self assert: selection selectionIndex isNil.
	self assert: selection printString equals: 'a GtPhlowListingViewListSelection(3)'.
	self assert: selection description equals: '3'.
	^ selection
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> listSelectionSingleJsonRoundtrip [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection json dictionary deserialized |
	selection := self listSelectionSingle.
	json := selection asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> listSelectionSingleSerialization [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection dictionary deserialized expectedDictionary |
	selection := self listSelectionSingle.
	dictionary := selection asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtPhlowListingViewListSelection';
		at: 'nodeIdentifier' put: (Dictionary new
			at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier';
			at: 'nodeIndex' put: 3;
			yourself);
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - selectionIndex' }
GtPhlowListingViewSelectionExamples >> listSelectionWithSelectionIndex [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forListIndex: 3.
	selection := GtPhlowListingViewListSelection new
		nodeIdentifier: identifier;
		selectionIndex: #(3).
	self assert: selection nodeIdentifier equals: identifier.
	self assert: selection selectionIndex equals: #(3).
	self assert: selection printString equals: 'a GtPhlowListingViewListSelection(3 @ #(3))'.
	^ selection
]

{ #category : #'examples - selectionIndex' }
GtPhlowListingViewSelectionExamples >> selectionIndexEquality [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection1 selection2 |
	selection1 := self listSelectionWithSelectionIndex.
	selection2 := GtPhlowListingViewListSelection new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 3);
		selectionIndex: #(3).
	self assert: selection1 equals: selection2.
	self assert: selection1 hash equals: selection2 hash.
	^ selection1
]

{ #category : #'examples - selectionIndex' }
GtPhlowListingViewSelectionExamples >> selectionIndexInequality [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection1 selection2 |
	selection1 := self listSelectionWithSelectionIndex.
	selection2 := GtPhlowListingViewListSelection new
		nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 3);
		selectionIndex: #(7).
	self assert: (selection1 = selection2) not.
	^ selection1
]

{ #category : #'examples - selectionIndex' }
GtPhlowListingViewSelectionExamples >> selectionIndexJsonRoundtrip [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection json dictionary deserialized |
	selection := self listSelectionWithSelectionIndex.
	json := selection asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - selectionIndex' }
GtPhlowListingViewSelectionExamples >> selectionIndexSerialization [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| selection dictionary deserialized expectedDictionary |
	selection := self listSelectionWithSelectionIndex.
	dictionary := selection asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtPhlowListingViewListSelection';
		at: 'nodeIdentifier' put: (Dictionary new
			at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier';
			at: 'nodeIndex' put: 3;
			yourself);
		at: 'selectionIndex' put: #(3);
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - selectionIndex' }
GtPhlowListingViewSelectionExamples >> selectionWithoutIndexNotEqualToSelectionWithIndex [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| withoutIndex withIndex |
	withoutIndex := self listSelectionSingle.
	withIndex := self listSelectionWithSelectionIndex.
	self assert: (withoutIndex = withIndex) not.
	^ withoutIndex
]

{ #category : #'examples - equality' }
GtPhlowListingViewSelectionExamples >> singleAndCompositeListSelectionInequality [
	<gtExample>
	<return: #GtPhlowListingViewListSelection>
	| single composite |
	single := self listSelectionSingle.
	composite := self listSelectionComposite.
	self assert: (single = composite) not.
	^ single
]

{ #category : #'examples - tree' }
GtPhlowListingViewSelectionExamples >> treeSelectionComposite [
	<gtExample>
	<return: #GtPhlowListingViewTreeSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forTreePaths: { #(1 2). #(3 4) }.
	selection := GtPhlowListingViewTreeSelection new
		nodeIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewTreeSelection.
	self assert: selection nodeIdentifier equals: identifier.
	self assert: selection printString equals: 'a GtPhlowListingViewTreeSelection(#(1 2), #(3 4))'.
	^ selection
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> treeSelectionCompositeJsonRoundtrip [
	<gtExample>
	<return: #GtPhlowListingViewTreeSelection>
	| selection json dictionary deserialized |
	selection := self treeSelectionComposite.
	json := selection asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - factory' }
GtPhlowListingViewSelectionExamples >> treeSelectionFromMultipleTreePaths [
	<gtExample>
	<return: #GtPhlowListingViewTreeSelection>
	| selection |
	selection := GtPhlowListingViewSelection forMultipleTreePaths: { #(1 2). #(3 4) }.
	self assert: selection class equals: GtPhlowListingViewTreeSelection.
	self assert: selection nodeIdentifier class equals: GtRemotePhlowCompositeNodeIdentifier.
	self assert: selection nodeIdentifier nodeIdentifiers size equals: 2.
	^ selection
]

{ #category : #'examples - factory' }
GtPhlowListingViewSelectionExamples >> treeSelectionFromSingleIdentifier [
	<gtExample>
	<return: #GtPhlowListingViewTreeSelection>
	| identifier selection |
	identifier := GtRemotePhlowNodeIdentifier forTreePath: #(1 2).
	selection := GtPhlowListingViewSelection forSingleTreeIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewTreeSelection.
	self assert: selection nodeIdentifier equals: identifier.
	^ selection
]

{ #category : #'examples - factory' }
GtPhlowListingViewSelectionExamples >> treeSelectionFromSingleTreePath [
	<gtExample>
	<return: #GtPhlowListingViewTreeSelection>
	| selection |
	selection := GtPhlowListingViewSelection forSingleTreePath: #(1 2).
	self assert: selection class equals: GtPhlowListingViewTreeSelection.
	self assert: selection nodeIdentifier class equals: GtRemotePhlowPathNodeIdentifier.
	self assert: selection nodeIdentifier nodeIndexPath equals: #(1 2).
	^ selection
]

{ #category : #'examples - tree' }
GtPhlowListingViewSelectionExamples >> treeSelectionSingle [
	<gtExample>
	<return: #GtPhlowListingViewTreeSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forTreePath: #(1 2).
	selection := GtPhlowListingViewTreeSelection new
		nodeIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewTreeSelection.
	self assert: selection nodeIdentifier equals: identifier.
	self assert: selection selectionIndex isNil.
	self assert: selection printString equals: 'a GtPhlowListingViewTreeSelection(#(1 2))'.
	self assert: selection description equals: '#(1 2)'.
	^ selection
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> treeSelectionSingleSerialization [
	<gtExample>
	<return: #GtPhlowListingViewTreeSelection>
	| selection dictionary deserialized expectedDictionary |
	selection := self treeSelectionSingle.
	dictionary := selection asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtPhlowListingViewTreeSelection';
		at: 'nodeIdentifier' put: (Dictionary new
			at: '__typeName' put: 'GtRemotePhlowPathNodeIdentifier';
			at: 'nodeIndexPath' put: #(1 2);
			yourself);
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - selectionIndex' }
GtPhlowListingViewSelectionExamples >> treeSelectionWithSelectionIndex [
	<gtExample>
	<return: #GtPhlowListingViewTreeSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forTreePath: #(1 2).
	selection := GtPhlowListingViewTreeSelection new
		nodeIdentifier: identifier;
		selectionIndex: #(5).
	self assert: selection nodeIdentifier equals: identifier.
	self assert: selection selectionIndex equals: #(5).
	self assert: selection printString equals: 'a GtPhlowListingViewTreeSelection(#(1 2) @ #(5))'.
	^ selection
]
