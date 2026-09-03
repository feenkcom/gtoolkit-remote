"
Test object containing tree views for testing remote Phlow tree-based views.
"
Class {
	#name : #GtRemotePhlowTreeViewTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'gt - extensions' }
GtRemotePhlowTreeViewTestObject >> gtTreeFor: aView [
	<gtView>

	^aView tree
		title: 'Tree';
		priority: 30;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | x asString, ' number']
]

{ #category : #'gt - extensions' }
GtRemotePhlowTreeViewTestObject >> gtTreeWithAllLevelsExpansionFor: aView [
	<gtView>

	^aView tree
		title: 'Expansion - all levels';
		priority: 44;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | x asString, ' number'];
		expandAll
]

{ #category : #'gt - extensions' }
GtRemotePhlowTreeViewTestObject >> gtTreeWithOneLevelExpansionFor: aView [
	<gtView>

	^aView tree
		title: 'Expansion - one level';
		priority: 40;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | x asString, ' number'];
		expandUpTo: 1
]

{ #category : #'gt - extensions' }
GtRemotePhlowTreeViewTestObject >> gtTreeWithStyledTextFor: aView [
	<gtView>

	^aView tree
		title: 'Tree - with styled text';
		priority: 30.1;
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
			computedString ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowTreeViewTestObject >> gtTreeWithTwoLevelsExpansionFor: aView [
	<gtView>

	^aView tree
		title: 'Expansion - two levels';
		priority: 42;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | x asString, ' number'];
		expandUpTo: 2
]
