"
Test object containing columned tree views for testing remote Phlow columned tree-based views.
"
Class {
	#name : #GtRemotePhlowColumnedTreeViewTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'gt - extensions' }
GtRemotePhlowColumnedTreeViewTestObject >> gtColumnedTreeFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Columned Tree';
		priority: 35;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		send: [ :x | x + 1000 ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowColumnedTreeViewTestObject >> gtColumnedTreeWithAllLevelsExpansionFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Expansion - all levels';
		priority: 44;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		expandAll
]

{ #category : #'gt - extensions' }
GtRemotePhlowColumnedTreeViewTestObject >> gtColumnedTreeWithBelowFourFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Expansion - below four';
		priority: 50;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		expandSuchThat: [ :aNode :aNumber | aNumber < 4 ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowColumnedTreeViewTestObject >> gtColumnedTreeWithOneLevelExpansionFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Expansion - one level';
		priority: 40;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		expandUpTo: 1
]
