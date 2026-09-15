Class {
	#name : #GtPhlowListingViewSelectionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> multipleItemsSelection [
	<gtExample>
	<return: #GtPhlowListingViewMultipleListIndexSelection>
	| selection identifiers |
	identifiers := {
		GtRemotePhlowNodeIdentifier forListIndex: 1.
		GtRemotePhlowNodeIdentifier forListIndex: 3.
		GtRemotePhlowNodeIdentifier forListIndex: 5 }.
	selection := GtPhlowListingViewMultipleListIndexSelection new
		selectionIdentifiers: identifiers.
	self assert: selection class equals: GtPhlowListingViewMultipleListIndexSelection.
	self assert: selection selectionIdentifiers equals: identifiers.
	self assert: selection printString equals: 'a GtPhlowListingViewMultipleListIndexSelection(1, 3, 5)'.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> multipleItemsSelectionEquality [
	<gtExample>
	<return: #GtPhlowListingViewMultipleListIndexSelection>
	| selection1 selection2 identifiers |
	selection1 := self multipleItemsSelection.
	identifiers := {
		GtRemotePhlowNodeIdentifier forListIndex: 1.
		GtRemotePhlowNodeIdentifier forListIndex: 3.
		GtRemotePhlowNodeIdentifier forListIndex: 5 }.
	selection2 := GtPhlowListingViewMultipleListIndexSelection new
		selectionIdentifiers: identifiers.
	self assert: selection1 equals: selection2.
	self assert: selection1 hash equals: selection2 hash.
	^ selection1
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> multipleItemsSelectionForTree [
	<gtExample>
	<return: #GtPhlowListingViewMultipleTreeIndexSelection>
	| selection identifiers |
	identifiers := {
		GtRemotePhlowNodeIdentifier forTreePath: #(1 2).
		GtRemotePhlowNodeIdentifier forTreePath: #(3 4) }.
	selection := GtPhlowListingViewMultipleTreeIndexSelection new
		selectionIdentifiers: identifiers.
	self assert: selection class equals: GtPhlowListingViewMultipleTreeIndexSelection.
	self assert: selection selectionIdentifiers equals: identifiers.
	self assert: selection printString equals: 'a GtPhlowListingViewMultipleTreeIndexSelection(#(1 2), #(3 4))'.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> multipleItemsSelectionFromFactoryForList [
	<gtExample>
	<return: #GtPhlowListingViewMultipleListIndexSelection>
	| selection identifiers |
	identifiers := {
		GtRemotePhlowNodeIdentifier forListIndex: 1.
		GtRemotePhlowNodeIdentifier forListIndex: 3 }.
	selection := GtPhlowListingViewSelection forMultipleListIdentifiers: identifiers.
	self assert: selection class equals: GtPhlowListingViewMultipleListIndexSelection.
	self assert: selection selectionIdentifiers equals: identifiers.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> multipleItemsSelectionFromFactoryForTree [
	<gtExample>
	<return: #GtPhlowListingViewMultipleTreeIndexSelection>
	| selection identifiers |
	identifiers := {
		GtRemotePhlowNodeIdentifier forTreePath: #(1 2).
		GtRemotePhlowNodeIdentifier forTreePath: #(3 4) }.
	selection := GtPhlowListingViewSelection forMultipleTreeIdentifiers: identifiers.
	self assert: selection class equals: GtPhlowListingViewMultipleTreeIndexSelection.
	self assert: selection selectionIdentifiers equals: identifiers.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> multipleItemsSelectionFromListIndexes [
	<gtExample>
	<return: #GtPhlowListingViewMultipleListIndexSelection>
	| selection |
	selection := GtPhlowListingViewSelection forMultipleListIndexes: #(1 3 5).
	self assert: selection class equals: GtPhlowListingViewMultipleListIndexSelection.
	self assert: selection selectionIdentifiers equals: {
		GtRemotePhlowNodeIdentifier forListIndex: 1.
		GtRemotePhlowNodeIdentifier forListIndex: 3.
		GtRemotePhlowNodeIdentifier forListIndex: 5 }.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> multipleItemsSelectionFromTreePaths [
	<gtExample>
	<return: #GtPhlowListingViewMultipleTreeIndexSelection>
	| selection |
	selection := GtPhlowListingViewSelection forMultipleTreePaths: { #(1 2). #(3 4) }.
	self assert: selection class equals: GtPhlowListingViewMultipleTreeIndexSelection.
	self assert: selection selectionIdentifiers equals: {
		GtRemotePhlowNodeIdentifier forTreePath: #(1 2).
		GtRemotePhlowNodeIdentifier forTreePath: #(3 4) }.
	^ selection
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> multipleItemsSelectionJsonRoundtrip [
	<gtExample>
	<return: #GtPhlowListingViewMultipleListIndexSelection>
	| selection json dictionary deserialized |
	selection := self multipleItemsSelection.
	json := selection asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> multipleItemsSelectionSerialization [
	<gtExample>
	<return: #GtPhlowListingViewMultipleListIndexSelection>
	| selection dictionary deserialized expectedDictionary |
	selection := self multipleItemsSelection.
	dictionary := selection asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtPhlowListingViewMultipleListIndexSelection';
		at: 'selectionIdentifiers' put: {
			Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 1; yourself.
			Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 3; yourself.
			Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 5; yourself };
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleAndMultipleSelectionInequality [
	<gtExample>
	<return: #GtPhlowListingViewSingleItemSelection>
	| single multiple |
	single := self singleItemSelectionForList.
	multiple := self multipleItemsSelection.
	self assert: (single = multiple) not.
	^ single
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleItemSelectionEquality [
	<gtExample>
	<return: #GtPhlowListingViewSingleListIndexSelection>
	| selection1 selection2 |
	selection1 := self singleItemSelectionForList.
	selection2 := GtPhlowListingViewSingleListIndexSelection new
		selectionIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: 3).
	self assert: selection1 equals: selection2.
	self assert: selection1 hash equals: selection2 hash.
	^ selection1
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleItemSelectionForList [
	<gtExample>
	<return: #GtPhlowListingViewSingleListIndexSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forListIndex: 3.
	selection := GtPhlowListingViewSingleListIndexSelection new
		selectionIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewSingleListIndexSelection.
	self assert: selection selectionIdentifier equals: identifier.
	self assert: selection printString equals: 'a GtPhlowListingViewSingleListIndexSelection(3)'.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleItemSelectionForTree [
	<gtExample>
	<return: #GtPhlowListingViewSingleTreeIndexSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forTreePath: #(1 2).
	selection := GtPhlowListingViewSingleTreeIndexSelection new
		selectionIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewSingleTreeIndexSelection.
	self assert: selection selectionIdentifier equals: identifier.
	self assert: selection printString equals: 'a GtPhlowListingViewSingleTreeIndexSelection(#(1 2))'.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleItemSelectionFromFactoryForList [
	<gtExample>
	<return: #GtPhlowListingViewSingleListIndexSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forListIndex: 3.
	selection := GtPhlowListingViewSelection forSingleListIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewSingleListIndexSelection.
	self assert: selection selectionIdentifier equals: identifier.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleItemSelectionFromFactoryForTree [
	<gtExample>
	<return: #GtPhlowListingViewSingleTreeIndexSelection>
	| selection identifier |
	identifier := GtRemotePhlowNodeIdentifier forTreePath: #(1 2).
	selection := GtPhlowListingViewSelection forSingleTreeIdentifier: identifier.
	self assert: selection class equals: GtPhlowListingViewSingleTreeIndexSelection.
	self assert: selection selectionIdentifier equals: identifier.
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleItemSelectionFromListIndex [
	<gtExample>
	<return: #GtPhlowListingViewSingleListIndexSelection>
	| selection |
	selection := GtPhlowListingViewSelection forSingleListIndex: 3.
	self assert: selection class equals: GtPhlowListingViewSingleListIndexSelection.
	self assert: selection selectionIdentifier equals: (GtRemotePhlowNodeIdentifier forListIndex: 3).
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleItemSelectionFromTreePath [
	<gtExample>
	<return: #GtPhlowListingViewSingleTreeIndexSelection>
	| selection |
	selection := GtPhlowListingViewSelection forSingleTreePath: #(1 2).
	self assert: selection class equals: GtPhlowListingViewSingleTreeIndexSelection.
	self assert: selection selectionIdentifier equals: (GtRemotePhlowNodeIdentifier forTreePath: #(1 2)).
	^ selection
]

{ #category : #examples }
GtPhlowListingViewSelectionExamples >> singleItemSelectionInequality [
	<gtExample>
	<return: #GtPhlowListingViewSingleListIndexSelection>
	| selection1 selection2 |
	selection1 := self singleItemSelectionForList.
	selection2 := self singleItemSelectionForTree.
	self assert: (selection1 = selection2) not.
	^ selection1
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> singleItemSelectionJsonRoundtrip [
	<gtExample>
	<return: #GtPhlowListingViewSingleListIndexSelection>
	| selection json dictionary deserialized |
	selection := self singleItemSelectionForList.
	json := selection asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]

{ #category : #'examples - serialization' }
GtPhlowListingViewSelectionExamples >> singleItemSelectionSerialization [
	<gtExample>
	<return: #GtPhlowListingViewSingleListIndexSelection>
	| selection dictionary deserialized expectedDictionary |
	selection := self singleItemSelectionForList.
	dictionary := selection asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtPhlowListingViewSingleListIndexSelection';
		at: 'selectionIdentifier' put: (Dictionary new
			at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier';
			at: 'nodeIndex' put: 3;
			yourself);
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: selection.
	^ deserialized
]
