Class {
	#name : #GtRemotePhlowDeclarativeErrorTestInspectable,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeErrorTestInspectable >> gtColumnedListWithFormatErrorsFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list - format error';
		priority: 20;
		items: [ 1 to: 4 ];
		column: 'Value' text: [ :item | 
			item < 3 ifTrue: [ 1/ 0]. 
			item ];
		column: 'Lowercase' text: [ :item | 
			item = 2 ifTrue: [ 1/ 0].
			item asString asLowercase ] width: 100.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeErrorTestInspectable >> gtColumnedListWithItemErrorsFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list - item error';
		priority: 20;
		items: [ 1/0. 1 to: 4 ];
		column: 'Value' text: [ :item | 
			item ];
		column: 'Lowercase' text: [ :item | 
			item asString asLowercase ] width: 100.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeErrorTestInspectable >> gtForwardListWithIFormatErrorsFor: aView [
	<gtView>

	^aView forward
		title: 'Forward List';
		priority: 45;
		object: [ self ];
		view: #gtListWithFormatErrors:
]

{ #category : #accessing }
GtRemotePhlowDeclarativeErrorTestInspectable >> gtForwardListWithItemsErrorsFor: aView [
	<gtView>

	^aView forward
		title: 'Forward List';
		priority: 45;
		object: [ self ];
		view: #gtListWithItemsErrors:
]

{ #category : #accessing }
GtRemotePhlowDeclarativeErrorTestInspectable >> gtListWithFormatErrors: aView [
	<gtView>

	^aView list
		title: 'List';
		priority: 15;
		items: [ 1 to: 4 ];
		itemText: [ :item | item < 3 ifTrue: [ 1/ 0]. item ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeErrorTestInspectable >> gtListWithItemsErrors: aView [
	<gtView>

	^aView list
		title: 'List';
		priority: 15;
		items: [ 1/0. 1 to: 4 ];
		itemText: [ :item | item ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeErrorTestInspectable >> gtStringWithTextErrorFor: aView [
	<gtView>
	
	^aView textEditor
		title: 'String';
		priority: 10;
		text: [ 1/0 . 'text value' ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeErrorTestInspectable >> gtTreeWithFormatErrorsFor: aView [
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
		itemText: [ :x | 
			x < 3 ifTrue: [ 1/ 0]. 
			x asString, ' number']
]
