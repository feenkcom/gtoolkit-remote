Class {
	#name : #GtRmMovie,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'propertyNames'
	],
	#category : #'GToolkit-RemotePhlow-MoviesDemo'
}

{ #category : #'instance creation' }
GtRmMovie class >> fromRawData: aRawData withProperties: aCollectionOfPropertyNames [
	^ self new 
		rawData: aRawData;
		propertyNames:aCollectionOfPropertyNames
]

{ #category : #'gt - extensions' }
GtRmMovie >> gtViewDetailsFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Details';
		priority: 20;
		items: [ 1 to: propertyNames size ];
		column: 'Key' text: [ :anIndex | propertyNames at: anIndex ];
		column: 'Value' text: [ :anIndex | rawData at: anIndex ];
		send: [ :anIndex | rawData at: anIndex ]
]

{ #category : #accessing }
GtRmMovie >> propertyNames [
	^ propertyNames
]

{ #category : #accessing }
GtRmMovie >> propertyNames: aCollectionOfPropertyNames [
	propertyNames := aCollectionOfPropertyNames
]

{ #category : #accessing }
GtRmMovie >> rawData [
	^ rawData
]

{ #category : #accessing }
GtRmMovie >> rawData: anObject [
	rawData := anObject
]
