"
This is an example of defining a view locally that uses the remote column model.
"
Class {
	#name : #GtRemotePhlowLocalViewWithRemoteColumnsExample,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-LocalPhlow'
}

{ #category : #accessing }
GtRemotePhlowLocalViewWithRemoteColumnsExample >> columnedViewElementHasCorrectFirstRowContent [
	<gtExample>
	<return: #BlScripter>
	| scripter |
	scripter := BlScripter new.
	scripter element: self phlowViewWithRemoteColumns asElement.

	scripter
		assertStep: [ :s | 
			s
				on: GtPhlowCellElement index: 1;
				// #content;
				value: [ :aLabel | aLabel text asString ] equals: '1.00' ].

	scripter
		assertStep: [ :s | 
			s
				on: GtPhlowCellElement index: 2;
				// #content;
				value: [ :aLabel | aLabel text asString ] equals: '1.01' ].

	^ scripter
]

{ #category : #accessing }
GtRemotePhlowLocalViewWithRemoteColumnsExample >> columnedViewElementHasNoErrors [
	<gtExample>
	<return: #GtRemotePhlowLocalViewWithRemoteColumnsExample>
	self assertObjectPhlowViewsFor: self class new	"| phlowView |
	
	phlowView := self phlowViewWithRemoteColumns.
	GtPhlowViewTester new 
		assertViewOk: self phlowViewWithRemoteColumns.
		
	^ phlowView"
]

{ #category : #'gt - extensions' }
GtRemotePhlowLocalViewWithRemoteColumnsExample >> gtViewLocalWithRemoteColumnsFor: aView [
	| currentView textColumn numberColumn iconColumn |
	currentView := aView columnedList.
	currentView title: 'Experiment'.

	textColumn := currentView columnOfType: GtRemotePhlowTextColumn.
	textColumn 
		title: 'Text';
		item: [ :anInteger | anInteger asFloat ];
		format: [ :aFloat | aFloat printShowingDecimalPlaces: 2];
		background: [ :aString :aValue |
			(aValue asInteger \\ 2 = 0) 
				ifTrue: [ Color veryVeryLightGray ]
				ifFalse: [ Color transparent ] ]. 
			
	numberColumn := currentView columnOfType: GtRemotePhlowNumberColumn.
	numberColumn 
		title: 'Number';
		item: [ :anInteger | anInteger asFloat + 0.01 ];
		format: [ :aFloat | aFloat printShowingDecimalPlaces: 2];
		background: [ :aString :aValue |
			(aValue asInteger \\ 2 = 0) 
				ifTrue: [ Color veryVeryLightGray ]
				ifFalse: [ Color transparent ] ]. 
			
	iconColumn := currentView columnOfType: GtRemotePhlowThemeIconNameColumn.
	iconColumn 
		title: 'Icon';
		item: [ :anInteger | anInteger asFloat ];
		iconName: [ :aFloat | aFloat class gtSystemIconName ];
		width: 50. 

	currentView items: [ 1 to: 10 ].
	^ currentView
]

{ #category : #accessing }
GtRemotePhlowLocalViewWithRemoteColumnsExample >> phlowViewWithRemoteColumns [
	<gtExample>
	<return: #GtPhlowColumnedListView>
	| view columns |
	view := self gtViewLocalWithRemoteColumnsFor: GtPhlowView empty.
	columns := view columns.

	self assert: columns size equals: 3.
	self assert: columns first title equals: 'Text'.
	self assert: columns second title equals: 'Number'.
	self assert: columns third title equals: 'Icon'.

	self assert: columns third backgroundComputation isNil.
	self assert: columns third localBackgroundComputation notNil.

	self assert: columns first cellWidth isNil.
	self assert: columns third localCellWidth notNil.

	^ view
]
