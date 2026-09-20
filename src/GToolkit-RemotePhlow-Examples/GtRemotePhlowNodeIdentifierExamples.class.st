Class {
	#name : #GtRemotePhlowNodeIdentifierExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> compositeListNodeIdentifier [
	<gtExample>
	<return: #GtRemotePhlowCompositeNodeIdentifier>
	| identifier |
	identifier := GtRemotePhlowCompositeNodeIdentifier new
		nodeIdentifiers: {
			GtRemotePhlowIndexNodeIdentifier new nodeIndex: 1.
			GtRemotePhlowIndexNodeIdentifier new nodeIndex: 3.
			GtRemotePhlowIndexNodeIdentifier new nodeIndex: 5 }.
	self assert: identifier nodeIdentifiers size equals: 3.
	self assert: identifier printString equals: 'a GtRemotePhlowCompositeNodeIdentifier(1, 3, 5)'.
	self assert: identifier description equals: '1, 3, 5'.
	^ identifier
]

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> compositeListNodeIdentifierEquality [
	<gtExample>
	<return: #GtRemotePhlowCompositeNodeIdentifier>
	| identifier1 identifier2 |
	identifier1 := self compositeListNodeIdentifier.
	identifier2 := GtRemotePhlowCompositeNodeIdentifier new
		nodeIdentifiers: {
			GtRemotePhlowIndexNodeIdentifier new nodeIndex: 1.
			GtRemotePhlowIndexNodeIdentifier new nodeIndex: 3.
			GtRemotePhlowIndexNodeIdentifier new nodeIndex: 5 }.
	self assert: identifier1 equals: identifier2.
	self assert: identifier1 hash equals: identifier2 hash.
	^ identifier1
]

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> compositeListNodeIdentifierFromFactory [
	<gtExample>
	<return: #GtRemotePhlowCompositeNodeIdentifier>
	| identifier |
	identifier := GtRemotePhlowNodeIdentifier forListIndexes: #(1 3 5).
	self assert: identifier class equals: GtRemotePhlowCompositeNodeIdentifier.
	self assert: identifier nodeIdentifiers size equals: 3.
	self assert: (identifier nodeIdentifiers first) nodeIndex equals: 1.
	self assert: (identifier nodeIdentifiers last) nodeIndex equals: 5.
	^ identifier
]

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> compositeListNodeIdentifierInequality [
	<gtExample>
	<return: #GtRemotePhlowCompositeNodeIdentifier>
	| identifier1 identifier2 |
	identifier1 := self compositeListNodeIdentifier.
	identifier2 := GtRemotePhlowCompositeNodeIdentifier new
		nodeIdentifiers: {
			GtRemotePhlowIndexNodeIdentifier new nodeIndex: 2.
			GtRemotePhlowIndexNodeIdentifier new nodeIndex: 4 }.
	self assert: (identifier1 = identifier2) not.
	^ identifier1
]

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> compositeListNodeIdentifierJsonRoundtrip [
	<gtExample>
	<return: #GtRemotePhlowCompositeNodeIdentifier>
	| identifier json dictionary deserialized |
	identifier := self compositeListNodeIdentifier.
	json := identifier asJSONForExport.
	dictionary := STONJSON fromString: json.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: identifier.
	^ deserialized
]

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> compositeListNodeIdentifierSerialization [
	<gtExample>
	<return: #GtRemotePhlowCompositeNodeIdentifier>
	| identifier dictionary deserialized expectedDictionary |
	identifier := self compositeListNodeIdentifier.
	dictionary := identifier asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtRemotePhlowCompositeNodeIdentifier';
		at: 'nodeIdentifiers' put: {
			Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 1; yourself.
			Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 3; yourself.
			Dictionary new at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier'; at: 'nodeIndex' put: 5; yourself };
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtRemotePhlowNodeIdentifier fromDictionary: dictionary.
	self assert: deserialized equals: identifier.
	^ deserialized
]

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> compositeTreeNodeIdentifier [
	<gtExample>
	<return: #GtRemotePhlowCompositeNodeIdentifier>
	| identifier |
	identifier := GtRemotePhlowCompositeNodeIdentifier new
		nodeIdentifiers: {
			GtRemotePhlowPathNodeIdentifier new nodeIndexPath: #(1 2).
			GtRemotePhlowPathNodeIdentifier new nodeIndexPath: #(3 4) }.
	self assert: identifier nodeIdentifiers size equals: 2.
	self assert: identifier printString equals: 'a GtRemotePhlowCompositeNodeIdentifier(#(1 2), #(3 4))'.
	self assert: identifier description equals: '#(1 2), #(3 4)'.
	^ identifier
]

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> compositeTreeNodeIdentifierFromFactory [
	<gtExample>
	<return: #GtRemotePhlowCompositeNodeIdentifier>
	| identifier |
	identifier := GtRemotePhlowNodeIdentifier forTreePaths: { #(1 2). #(3 4) }.
	self assert: identifier class equals: GtRemotePhlowCompositeNodeIdentifier.
	self assert: identifier nodeIdentifiers size equals: 2.
	self assert: (identifier nodeIdentifiers first) nodeIndexPath equals: #(1 2).
	^ identifier
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> listAndTreeNodeIdentifierInequality [
	<gtExample>
	<return: #GtRemotePhlowIndexNodeIdentifier>
	| a b |
	a := self listNodeIdentifier.
	b := self treeNodeIdentifier.
	self assert: (a = b) not.
	^ a
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> listNodeIdentifier [
	<gtExample>
	<return: #GtRemotePhlowIndexNodeIdentifier>
	| identifier |
	identifier := GtRemotePhlowIndexNodeIdentifier new
		nodeIndex: 5.
	self assert: identifier nodeIndex equals: 5.
	self assert: identifier printString equals: 'a GtRemotePhlowIndexNodeIdentifier(5)'.
	self assert: identifier description equals: '5'.
	^ identifier
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> listNodeIdentifierEquality [
	<gtExample>
	<return: #GtRemotePhlowIndexNodeIdentifier>
	| a b |
	a := self listNodeIdentifier.
	b := GtRemotePhlowIndexNodeIdentifier new nodeIndex: 5.
	self assert: a equals: b.
	self assert: a hash equals: b hash.
	^ a
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> listNodeIdentifierFromFactory [
	<gtExample>
	<return: #GtRemotePhlowIndexNodeIdentifier>
	| identifier |
	identifier := GtRemotePhlowNodeIdentifier forListIndex: 5.
	self assert: identifier class equals: GtRemotePhlowIndexNodeIdentifier.
	self assert: identifier nodeIndex equals: 5.
	self assert: identifier equals: self listNodeIdentifier.
	^ identifier
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> listNodeIdentifierInequality [
	<gtExample>
	<return: #GtRemotePhlowIndexNodeIdentifier>
	| a b |
	a := self listNodeIdentifier.
	b := GtRemotePhlowIndexNodeIdentifier new nodeIndex: 7.
	self assert: (a = b) not.
	^ a
]

{ #category : #'examples - serialization' }
GtRemotePhlowNodeIdentifierExamples >> listNodeIdentifierJsonRoundtrip [
	<gtExample>
	<return: #GtRemotePhlowIndexNodeIdentifier>
	| identifier json dictionary deserialized expectedDictionary |
	identifier := self listNodeIdentifier.
	json := identifier asJSONForExport.
	dictionary := STONJSON fromString: json.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier';
		at: 'nodeIndex' put: 5;
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: identifier.
	^ deserialized
]

{ #category : #'examples - serialization' }
GtRemotePhlowNodeIdentifierExamples >> listNodeIdentifierSerialization [
	<gtExample>
	<return: #GtRemotePhlowIndexNodeIdentifier>
	| identifier dictionary deserialized expectedDictionary |
	identifier := self listNodeIdentifier.
	dictionary := identifier asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtRemotePhlowIndexNodeIdentifier';
		at: 'nodeIndex' put: 5;
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: identifier.
	^ deserialized
]

{ #category : #'examples - composite' }
GtRemotePhlowNodeIdentifierExamples >> singleAndCompositeNodeIdentifierInequality [
	<gtExample>
	<return: #GtRemotePhlowIndexNodeIdentifier>
	| single composite |
	single := self listNodeIdentifier.
	composite := self compositeListNodeIdentifier.
	self assert: (single = composite) not.
	self assert: (composite = single) not.
	^ single
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> treeNodeIdentifier [
	<gtExample>
	<return: #GtRemotePhlowPathNodeIdentifier>
	| identifier |
	identifier := GtRemotePhlowPathNodeIdentifier new
		nodeIndexPath: #(1 2 3).
	self assert: identifier nodeIndexPath equals: #(1 2 3).
	self assert: identifier printString equals: 'a GtRemotePhlowPathNodeIdentifier(#(1 2 3))'.
	self assert: identifier description equals: '#(1 2 3)'.
	^ identifier
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> treeNodeIdentifierEquality [
	<gtExample>
	<return: #GtRemotePhlowPathNodeIdentifier>
	| a b |
	a := self treeNodeIdentifier.
	b := GtRemotePhlowPathNodeIdentifier new nodeIndexPath: #(1 2 3).
	self assert: a equals: b.
	self assert: a hash equals: b hash.
	^ a
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> treeNodeIdentifierFromFactory [
	<gtExample>
	<return: #GtRemotePhlowPathNodeIdentifier>
	| identifier |
	identifier := GtRemotePhlowNodeIdentifier forTreePath: #(1 2 3).
	self assert: identifier class equals: GtRemotePhlowPathNodeIdentifier.
	self assert: identifier nodeIndexPath equals: #(1 2 3).
	self assert: identifier equals: self treeNodeIdentifier.
	^ identifier
]

{ #category : #examples }
GtRemotePhlowNodeIdentifierExamples >> treeNodeIdentifierInequality [
	<gtExample>
	<return: #GtRemotePhlowPathNodeIdentifier>
	| a b |
	a := self treeNodeIdentifier.
	b := GtRemotePhlowPathNodeIdentifier new nodeIndexPath: #(1 2).
	self assert: (a = b) not.
	^ a
]

{ #category : #'examples - serialization' }
GtRemotePhlowNodeIdentifierExamples >> treeNodeIdentifierJsonRoundtrip [
	<gtExample>
	<return: #GtRemotePhlowPathNodeIdentifier>
	| identifier json dictionary deserialized expectedDictionary |
	identifier := self treeNodeIdentifier.
	json := identifier asJSONForExport.
	dictionary := STONJSON fromString: json.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtRemotePhlowPathNodeIdentifier';
		at: 'nodeIndexPath' put: #(1 2 3);
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: identifier.
	^ deserialized
]

{ #category : #'examples - serialization' }
GtRemotePhlowNodeIdentifierExamples >> treeNodeIdentifierSerialization [
	<gtExample>
	<return: #GtRemotePhlowPathNodeIdentifier>
	| identifier dictionary deserialized expectedDictionary |
	identifier := self treeNodeIdentifier.
	dictionary := identifier asDictionaryForExport.
	expectedDictionary := Dictionary new
		at: '__typeName' put: 'GtRemotePhlowPathNodeIdentifier';
		at: 'nodeIndexPath' put: #(1 2 3);
		yourself.
	self assert: dictionary equals: expectedDictionary.
	deserialized := GtPhlowDeclarativeSpecification fromDictionary: dictionary.
	self assert: deserialized equals: identifier.
	^ deserialized
]
