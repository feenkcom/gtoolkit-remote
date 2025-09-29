"
I am a simple object that can be used to test the Gt declarative views. 

 
## Internal Representation and Key Implementation Points.

### Instance Variables

	collectionOfObjects:		<Array>  a collection of objects for displaying in lists
	string:		<String> for displaying in a text view


"
Class {
	#name : #GtRemotePhlowDeclarativeTestInspectable,
	#superclass : #Object,
	#instVars : [
		'string',
		'collectionOfObjects'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> collectionAt: anIndex put: anObject [

	^collectionOfObjects at: anIndex put: anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> collectionOfObjects [
	^ collectionOfObjects
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> collectionOfObjects: anObject [
	collectionOfObjects := anObject
]

{ #category : #actions }
GtRemotePhlowDeclarativeTestInspectable >> gtButtonActionWithBothIconAndLabelFor: anAction [
	<gtAction>
	
	^ anAction button
		tooltip: 'Inspect objects';
		priority: 12;
		label: 'Inspect';
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #playinspect);
		action: [ :aButton |
			aButton phlow 
				spawnObject: collectionOfObjects ]
]

{ #category : #actions }
GtRemotePhlowDeclarativeTestInspectable >> gtButtonActionWithIconFor: anAction [
	<gtAction>
	
	^ anAction button
		tooltip: 'Inspect objects';
		priority: 11;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #playinspect);
		action: [ :aButton |
			aButton phlow 
				spawnObject: collectionOfObjects ]
]

{ #category : #actions }
GtRemotePhlowDeclarativeTestInspectable >> gtButtonActionWithLabelFor: anAction [
	<gtAction>
	
	^ anAction button
		tooltip: 'Inspect objects';
		priority: 10;
		label: 'Inspect 1';
		action: [ :aButton |
			aButton phlow 
				spawnObject: 1 ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list';
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Lowercase' text: [ :anObject | 
			anObject gtDisplayString asLowercase ] width: 100.
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListSpawnTextFor: aView [
	<gtView>

	^aView columnedList
		title: 'Spawn text columned list';
		priority: 20.2;
		items: [ collectionOfObjects ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Value with spawn' 
			text: [ :anObject | anObject ] 
			spawn: [ :anObject | anObject ];
		column: 'Class' 
			text: [ :anObject | anObject class name ] 
			spawn: [ :anObject | anObject class ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListWithHorizontalScrollingFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list with scrolling' ;
		priority: 23;
		items: [ 1 to: 500 ];
		withHorizontalScrolling;
		column: 'Value' text: [ :anInteger | anInteger ] width: 250;
		column: 'Value + 1' text: [ :anInteger | anInteger + 1 ] width: 250;
		column: 'Value + 2' text: [ :anInteger | anInteger + 2 ] width: 250;
		column: 'Value + 3' text: [ :anInteger | anInteger + 3 ] width: 250;
		column: 'Value + 4' text: [ :anInteger | anInteger + 4 ] width: 250.
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListWithStyledTextFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list - styled text';
		priority: 20.1;
		items: [ self objectsForListWithStyledText ];
		column: 'Plain' text: [ :anObject | anObject asString ];
		column: 'Styled' text: [ :anObject | anObject ];
		column: 'Number' 
			number: [ :anObject :index | (index*100) asRopedText bold  ].
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListWithTypedColumnsFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list with typed columns';
		priority: 24;
		items: [ 1 to: 500 ];
		column: 'Text' textDo: [ :aColumn | 
			aColumn 
				item: [ :aNumber | aNumber asFloat ];
				format: [ :aFloat | 
					'+',aFloat asString ] ];
		column: 'Number' numberDo: [ :aColumn | 
			aColumn
				item: [ :aNumber | aNumber + 1 ];
				format: [ :aNumber | '+',aNumber asString ];
				width: 100 ];
		column: 'Icon Name' iconNameDo: [ :aColumn | 
			aColumn 
				item: [ :aNumber | aNumber asFloat ];
				iconName: [ :aFloat | 
					aFloat gtSystemIconName ];
				width: 75 ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListWithTypedColumnsInGenericColumnFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list with typed columns - generic';
		priority: 24.1;
		items: [ 1 to: 500 ];
		column: 'Text' do: [ :aColumn | 
			aColumn 
				item: [ :aNumber | aNumber asFloat ];
				text: [ :aFloat | 
					'+',aFloat asString ] ];
		column: 'Icon Name' do: [ :aColumn | 
			aColumn 
				item: [ :aNumber | aNumber asFloat ];
				iconName: [ :aFloat | 
					aFloat gtSystemIconName ];
				width: 75 ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedTreeFor: aView [
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

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedWithObjectsFor: aView [
	<gtView>

	^aView columnedList
		title: 'With Objects';
		priority: 55;
		items: [ {
			'New Instance' -> self class new initialize .
			'Class Object' -> self class.
			'Dictionary With Object Keys' -> {
				Object new -> 'one'.
				Object new -> 'two'} asDictionary.
			'Dictionary With Primitive Data' -> {
				1 -> 10.
				2 -> 20 }.
			'Array With Objects' -> (Array 
				with: Object new 
				with: Object new).
			'Array With Numbers' -> (Array with: 1 with: 2) } ];
		column: 'Key' text: [ :assoc | assoc key ];
		column: 'Object' text: [ :assoc | assoc value ];
		send: [ :assoc | assoc value ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtForwardListFor: aView [
	<gtView>

	^aView forward
		title: 'Forward List';
		priority: 45;
		object: [ self ];
		view: #gtLargeListFor:;
		send: [ :x | x * 10 ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtForwardListTwiceFor: aView [
	<gtView>

	^aView forward
		title: 'Forward List Twice';
		priority: 46;
		object: [ self ];
		view: #gtForwardListFor:;
		send: [ :x | x + 1 ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtForwardListWithSendFor: aView [
	<gtView>

	^aView forward
		title: 'Forward List Send';
		priority: 46;
		object: [ self ];
		view: #gtLargeListFor:;
		send: [ :x | x * 10 + 2 ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtItemsWithBackgroundFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'background: usage';
		priority: 50;
		items: [ {
			'Bob' -> -43.
			'Alice' -> 27.
			'Mike' -> 0.
			'Jane' -> -32.
			'Ben' -> 12
		} ];
		column: 'name' text: [ :x | x key ];
		column: 'value' do: [ :aColumn |
			aColumn
				text: [ :x | x value ];
				background: [ :v |
					v > 0
						ifTrue: [ 
							GtPhlowColor named: #green alpha: 0.3 ]
						ifFalse: [ v < 0
							ifTrue: [ 
								GtPhlowColor named: #red alpha: 0.3 ]
							ifFalse: [ 
								GtPhlowColor named: #gray alpha: 0.3] ] ] ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Large columned list' ;
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Value * 10' text: [ :anObject | (anObject * 10) asString asLowercase ] width: 100.
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeColumnedListWithIndexFor: aView [
	<gtView>

	^aView columnedList
		title: 'Large columned list with index';
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Index' text: [ :anObject  :anIndex | anIndex ];
		column: 'Value' text: [ :anObject | anObject ].
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeListFor: aView [
	<gtView>

	^aView list
		title: 'Large list';
		priority: 20;
		items: [ 1 to: 1022 ];
		itemText: [ :item | item  ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtListFor: aView [
	<gtView>

	^aView list
		title: 'List';
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtListWithSendFor: aView [
	<gtView>

	^aView list
		title: 'List with send';
		priority: 15.2;
		items: [ collectionOfObjects ];
		itemText: [ :item | item ];
		send: [ :item | {item. item. item }]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtListWithStyledTextFor: aView [
	<gtView>

	^aView list
		title: 'List - styled text';
		priority: 15.1;
		items: [ self objectsForListWithStyledText ];
		itemText: [ :item | item ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStringInTextEditorViewFor: aView [
	<gtView>
	
	^aView textEditor
		title: 'String (editor)';
		priority: 11;
		text: [ self string ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStringInTextViewFor: aView [
	<gtView>
	
	^aView text
		title: 'String (text)';
		priority: 10;
		text: [ self string ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStyledPhlowTextFor: aView [
	<gtView>
	
	^ aView text
		title: 'Styled phlow text';
		priority: 10.3;
		text: [ self styledPhlowText ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStyledPhlowTextInEditorFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'Styled phlow text (editor)';
		priority: 11.3;
		text: [ self styledPhlowText ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStyledPhlowTextWithDecorationsFor: aView [
	<gtView>
	
	^ aView text
		title: 'Styled phlow text with decorations';
		priority: 10.6;
		text: [ GtRemotePhlowDeclarativeTextTestInspectable new
			styledPhlowTextWithDecorations ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStyledStringJsonInEditorFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'Styled JSON';
		priority: 11.5;
		text: [ 
			'{
	"name":"Me", 
	"age":30, 
	"data":null
}' ];
		stylerParserClassName: #JSONParser
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStyledStringUsingStylerFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'Styled text (styler)';
		priority: 11.2;
		text: [ 'Now is the time' ];
		styler: [ GtRemotePhlowDummyTextStyler  new ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStyledTextFor: aView [
	<gtView>
	
	^ aView text
		title: 'Styled text';
		priority: 10.1;
		text: [ self styledText ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStyledTextInEditorFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'Styled text (editor)';
		priority: 11.1;
		text: [ self styledText ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtTreeFor: aView [
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

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtTreeWithStyledTextFor: aView [
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

{ #category : #initialization }
GtRemotePhlowDeclarativeTestInspectable >> initialize [ 

	super initialize.
	string := 'hello world'.
	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime readFrom: '2021-04-06T14:43:50.123456+02:00' readStream }.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> objectsForListWithStyledText [
	^ { 
			'42' asRopedText bold.
			self styledHelloWorld.
			self styledText.
			self styledPhlowText
		}
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> objectsForListWithStyledTextForRemoteComparison [
	^ { 
			'42' asRopedText bold.
			self styledHelloWorldForRemoteComparison.
			self styledPhlowTextForRemoteComparison.
			self styledPhlowTextForRemoteComparison
		}
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> printStringFor: anObject [
	^ anObject printString
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> string [

	^string
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> string: anObject [
	string := anObject
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> styledHelloWorld [
	| text |
	text := 'Hello World' asRopedText.
	
	(text from: 1 to: 5)
		highlight: (GtPhlowColor named: #yellow) asColor;
		fontSize: 20.
		
	^ text
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> styledHelloWorldForRemoteComparison [
	| text |
	text := GtPhlowText forString: 'Hello World'.
	
	(text from: 1 to: 5)
		highlight: (GtPhlowColor named: #yellow) "asColor";
		fontSize: 20.
		
	^ text
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> styledPhlowText [
	| text |
	text := GtPhlowText forString: 'Now is the time'.
	text glamorousCodeFont.
	(text from: 12 to: 15) fontSize: 20.
	(text from: 5 to: 6) highlight: (GtPhlowColor named: #yellow) .
	(text from: 1 to: 4) bold.
	(text from: 8 to: 10) foreground: (GtPhlowColor named: #red) .
	(text from: 12 to: 12) glamorousRegularFont.
	(text from: 1 to: 6) italic.
	(text from: 8 to: 15) thin.
	^ text
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> styledPhlowTextForRemoteComparison [
	| text |
	text := GtPhlowText forString: 'Now is the time'.
	text glamorousCodeFont.
	(text from: 12 to: 15) fontSize: 20.
	(text from: 5 to: 6) highlight: (GtPhlowColor named: #yellow) "asColor".
	(text from: 1 to: 4) bold.
	(text from: 8 to: 10) foreground: (GtPhlowColor named: #red) "asColor".
	(text from: 12 to: 12) glamorousRegularFont.
	(text from: 1 to: 6) italic.
	(text from: 8 to: 15) thin.
	^ text
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> styledText [
	| text |
	text := 'Now is the time' asRopedText.
	text glamorousCodeFont.
	(text from: 12 to: 15) fontSize: 20.
	(text from: 5 to: 6) highlight: (GtPhlowColor named: #yellow) asColor.
	(text from: 1 to: 4) bold.
	(text from: 8 to: 10) foreground: (GtPhlowColor named: #red) asColor.
	(text from: 12 to: 12) glamorousRegularFont.
	(text from: 1 to: 6) italic.
	(text from: 8 to: 15) thin.
	^ text
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> text [

	^string asRopedText 
]
