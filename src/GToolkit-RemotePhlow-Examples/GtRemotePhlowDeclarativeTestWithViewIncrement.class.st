Class {
	#name : #GtRemotePhlowDeclarativeTestWithViewIncrement,
	#superclass : #Object,
	#instVars : [
		'counter'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeTestWithViewIncrement >> gtViewCurrentCounterColumnedListFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Counter (columned list)';
		priority: 3;
		items: [ { self nextCounter } ];
		column: 'Counter' text: [ 'Counter' ];
		column: 'Value' text: [ :each | each ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestWithViewIncrement >> gtViewCurrentCounterFor: aView [
	<gtView>
	
	^ aView text
		title: 'Counter (text)';
		priority: 1;
		text: [ self nextCounter asString ] 
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestWithViewIncrement >> gtViewCurrentCounterListFor: aView [
	<gtView>
	
	^ aView list
		title: 'Counter (list)';
		priority: 2;
		items: [ {self nextCounter} ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestWithViewIncrement >> nextCounter [
	^ counter := counter 
		ifNil: [ 1 ]
		ifNotNil: [ counter + 1.]
]
