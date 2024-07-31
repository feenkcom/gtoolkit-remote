Class {
	#name : 'GtRemotePhlowDeclarativeTestForCustomProxyInspectable',
	#superclass : 'Object',
	#instVars : [
		'collectionOfObjects'
	],
	#category : 'GToolkit-RemotePhlow-Examples'
}

{ #category : 'inspection' }
GtRemotePhlowDeclarativeTestForCustomProxyInspectable >> gtButtonActionWithBothIconAndLabelFor: anAction [
	<gtAction>
	
	^ anAction button
		tooltip: 'Inspect object';
		priority: 12;
		label: 'Remote';
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #playinspect);
		action: [ :aButton |
			aButton phlow 
				spawnObject: self ]
]

{ #category : 'inspection' }
GtRemotePhlowDeclarativeTestForCustomProxyInspectable >> gtColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list';
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Lowercase' text: [ :anObject | 
			anObject gtDisplayString asLowercase ] width: 100.
]

{ #category : 'initialization' }
GtRemotePhlowDeclarativeTestForCustomProxyInspectable >> initialize [  

	super initialize.

	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime readFrom: '2021-04-06T14:43:50.123456+02:00' readStream }.
]
