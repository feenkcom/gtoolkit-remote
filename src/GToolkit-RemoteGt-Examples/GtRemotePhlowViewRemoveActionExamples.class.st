"
Scripter-based examples testing the Remove context menu action on OrderedCollection's Items view. Tests single removal, multiple consecutive and non-consecutive removal, and index-based removal of duplicates.
"
Class {
	#name : #GtRemotePhlowViewRemoveActionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowViewRemoveActionExamples class >> isAbstract [
	^ self name = #GtRemotePhlowViewRemoveActionExamples
]

{ #category : #private }
GtRemotePhlowViewRemoveActionExamples >> assertCollectionDisplayString: expectedDisplayString inScripter: aScripter [
	aScripter assert
		label: 'Assert collection after removal';
		onModel;
		value: [ :aCollection | aCollection gtDisplayString ] equals: expectedDisplayString;
		play
]

{ #category : #private }
GtRemotePhlowViewRemoveActionExamples >> assertItemColumnTexts: expectedTexts inScripter: aScripter [
	aScripter assert
		label: 'Assert item column texts after removal';
		value: [ :aPager |
			| cells |
			cells := (aPager query // GtPhlowCellElement) result.
			((cells withIndexCollect: [ :cell :idx |
				idx even 
					ifTrue: [ cell content text asString ] 
					ifFalse: [ nil ] ]) select: #notNil) asArray ]
		equals: expectedTexts;
		play
]

{ #category : #private }
GtRemotePhlowViewRemoveActionExamples >> clickRemoveWithLabel: aLabel inScripter: aScripter [
	aScripter click
		label: 'Click Remove menu item';
		onSpaceRoot;
		// BrMenuSteppedElement;
		// #'menu--list';
		// #'menu--label';
		@ [ :each | each text asString = aLabel ];
		play
]

{ #category : #'examples - setup' }
GtRemotePhlowViewRemoveActionExamples >> createTestCollection [
	<gtExample>
	^ self wrapTestObject: (OrderedCollection withAll: #(10 20 30 20 40 50 20 60))
]

{ #category : #private }
GtRemotePhlowViewRemoveActionExamples >> openContextMenuAndRemoveWithLabel: aLabel onCellWithString: aCellString inScripter: aScripter [
	aScripter menuStep
		openContextMenu;
		onPhlowCellWithString: aCellString;
		play.
	self clickRemoveWithLabel: aLabel inScripter: aScripter
]

{ #category : #private }
GtRemotePhlowViewRemoveActionExamples >> openContextMenuAndRemoveWithLabel: aLabel onCellWithString: aCellString index: anIndex inScripter: aScripter [
	aScripter menuStep
		openContextMenu;
		onPhlowCellWithString: aCellString index: anIndex;
		play.
	self clickRemoveWithLabel: aLabel inScripter: aScripter
]

{ #category : #private }
GtRemotePhlowViewRemoveActionExamples >> orderedCollectionDisplayName [
	^ 'an OrderedCollection'
]

{ #category : #'examples - remove' }
GtRemotePhlowViewRemoveActionExamples >> removeAllElements [
	<gtExample>
	| scripter |
	scripter := self scripterOnItemsView.

	scripter click
		onPhlowCellWithString: '10';
		play.

	scripter click
		modifiers: BlKeyModifiers shift;
		onPhlowCellWithString: '60';
		play.

	self 
		openContextMenuAndRemoveWithLabel: 'Remove items with indexes 1, 2, 3, 4, 5, 6, 7, 8'
		onCellWithString: '60' 
		inScripter: scripter.

	self 
		assertItemColumnTexts: #() 
		inScripter: scripter.
	self
		assertCollectionDisplayString: self orderedCollectionDisplayName, ' [0 items] ()'
		inScripter: scripter.

	^ scripter
]

{ #category : #'examples - remove' }
GtRemotePhlowViewRemoveActionExamples >> removeConsecutiveElements [
	<gtExample>
	| scripter |
	scripter := self scripterOnItemsView.

	scripter click
		onPhlowCellWithString: '20' index: 1;
		play.

	scripter click
		modifiers: BlKeyModifiers shift;
		onPhlowCellWithString: '30';
		play.

	self 
		openContextMenuAndRemoveWithLabel: 'Remove items with indexes 2, 3'
		onCellWithString: '30' 
		inScripter: scripter.

	self 
		assertItemColumnTexts: #('10' '20' '40' '50' '20' '60') 
		inScripter: scripter.
	self
		assertCollectionDisplayString: self orderedCollectionDisplayName, ' [6 items] (10 20 40 50 20 60)'
		inScripter: scripter.

	^ scripter
]

{ #category : #'examples - remove' }
GtRemotePhlowViewRemoveActionExamples >> removeDuplicateByIndex [
	<gtExample>
	| scripter |
	scripter := self scripterOnItemsView.

	self 
		openContextMenuAndRemoveWithLabel: 'Remove item with index 4'
		onCellWithString: '20' index: 2
		inScripter: scripter.

	self 
		assertItemColumnTexts: #('10' '20' '30' '40' '50' '20' '60') 
		inScripter: scripter.
	self
		assertCollectionDisplayString: self orderedCollectionDisplayName, ' [7 items] (10 20 30 40 50 20 60)'
		inScripter: scripter.

	^ scripter
]

{ #category : #'examples - remove' }
GtRemotePhlowViewRemoveActionExamples >> removeNonConsecutiveElements [
	<gtExample>
	| scripter |
	scripter := self scripterOnItemsView.

	scripter click
		onPhlowCellWithString: '10';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: '40';
		play.

	self 
		openContextMenuAndRemoveWithLabel: 'Remove items with indexes 1, 5'
		onCellWithString: '40' 
		inScripter: scripter.

	self 
		assertItemColumnTexts: #('20' '30' '20' '50' '20' '60') 
		inScripter: scripter.
	self
		assertCollectionDisplayString: self orderedCollectionDisplayName, ' [6 items] (20 30 20 50 20 60)'
		inScripter: scripter.

	^ scripter
]

{ #category : #'examples - remove' }
GtRemotePhlowViewRemoveActionExamples >> removeSingleElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnItemsView.

	self 
		openContextMenuAndRemoveWithLabel: 'Remove item with index 3'
		onCellWithString: '30' 
		inScripter: scripter.

	self 
		assertItemColumnTexts: #('10' '20' '20' '40' '50' '20' '60') 
		inScripter: scripter.
	self
		assertCollectionDisplayString: self orderedCollectionDisplayName, ' [7 items] (10 20 20 40 50 20 60)'
		inScripter: scripter.

	^ scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowViewRemoveActionExamples >> scripterOnItemsView [
	<gtExample>
	| scripter collection |
	collection := self createTestCollection.
	scripter := BlScripter new.
	scripter model: collection.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: collection gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Items';
		assertSelectedTabWithName: 'Items';
		play.
	^ scripter
]

{ #category : #private }
GtRemotePhlowViewRemoveActionExamples >> wrapTestObject: anObject [
	^ anObject
]
