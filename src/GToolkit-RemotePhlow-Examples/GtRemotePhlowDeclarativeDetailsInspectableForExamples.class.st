Class {
	#name : #GtRemotePhlowDeclarativeDetailsInspectableForExamples,
	#superclass : #Object,
	#instVars : [
		'propertyOne',
		'propertyTwo'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> exampleDate [
	^ DateAndTime readFrom: '2021-04-06T14:43:50.123456+02:00' readStream
]

{ #category : #views }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> gtDetailsCustomPrintViewFor: aView [
	<gtView>

	^aView details
		title: 'Details (custom print)';
		priority: 37.1;
		row: 'Class' 
			value: [ self class name ] 
			text:  [ :each |
				| text |
				text := each asString asRopedText.
				text bold.
				text highlight: (GtPhlowColor named: #yellow) asColor.
				text ];
		row: 'String value' value: [ self string ] text: [ :each | each ];
		row: 'Text value' value: [ self styledPhlowText ];
		row: 'Date' 
			value: [ self exampleDate ]
			text: [ :each | each printString ]
]

{ #category : #views }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> gtDetailsViewFor: aView [
	<gtView>

	^aView details
		title: 'Details (default print)';
		priority: 37;
		row: 'Class' value: [ self class name ];
		row: 'String value' value: [ self string ];
		row: 'Date' value: [ self exampleDate ]
]

{ #category : #views }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> gtDetailsViewWithPropertiesFor: aView [
	<gtView>

	^aView details
		title: 'Properties';
		priority: 40;
		row: 'Property One' value: [ self propertyOne ifNil: ['<missing>'] ];
		row: 'Property Two' value: [ self propertyTwo ifNil: ['<missing>'] ]
]

{ #category : #views }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> gtDetailsWithErrorsViewFor: aView [
	<gtView>

	^aView details
		title: 'Details (with errors)';
		priority: 37.3;
		row: 'No error' value: [ 'hello world' ] text: [ :each | each ];
		row: 'Error in value' value: [ 1/0 ];
		row: 'Error in print' value: [ 1 ] text: [ :each | each / 0];
		row: 'Also no error' value: [ 'hello world' ] text: [ :each | each ];
		row: 'Error in both' value: [ 1/0 ] text: [ :each | 1 / 0]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> propertyOne [
	^ propertyOne
]

{ #category : #accessing }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> propertyOne: anObject [
	propertyOne := anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> propertyTwo [
	^ propertyTwo
]

{ #category : #accessing }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> propertyTwo: anObject [
	propertyTwo := anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> string [
	^ 'hello world'
]

{ #category : #accessing }
GtRemotePhlowDeclarativeDetailsInspectableForExamples >> styledPhlowText [
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
