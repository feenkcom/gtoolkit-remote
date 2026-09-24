Class {
	#name : #GtRemotePhlowNodeIdentifierExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

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
