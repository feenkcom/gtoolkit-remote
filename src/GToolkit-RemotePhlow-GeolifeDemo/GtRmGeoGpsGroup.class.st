Class {
	#name : #GtRmGeoGpsGroup,
	#superclass : #Object,
	#instVars : [
		'items',
		'cache'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #accessing }
GtRmGeoGpsGroup >> add: anObject [
	self items add: anObject
]

{ #category : #accessing }
GtRmGeoGpsGroup >> addAll: aCollection [
	self items addAll: aCollection
]

{ #category : #accessing }
GtRmGeoGpsGroup >> cacheAt: aKey ifAbsentPut: aBlock [
	cache ifNil: [ 
		cache := Dictionary new].
	^ cache 
		at: aKey
		ifAbsentPut: [ aBlock value ]
]

{ #category : #accessing }
GtRmGeoGpsGroup >> collect: aBlock [
	^ self items  collect: aBlock
]

{ #category : #accessing }
GtRmGeoGpsGroup >> detect: aBlock ifNone: exceptionBlock [
	^ self items 
		detect: aBlock ifNone: exceptionBlock
]

{ #category : #accessing }
GtRmGeoGpsGroup >> do: aBlock [ 
	self items do: aBlock
]

{ #category : #accessing }
GtRmGeoGpsGroup >> items [
	^ items ifNil: [
		items := OrderedCollection new ]
]

{ #category : #printing }
GtRmGeoGpsGroup >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		<< '[';
		print: self size;
		<< ' items';
		<< ']'
]

{ #category : #accessing }
GtRmGeoGpsGroup >> size [
	^ self items size
]

{ #category : #accessing }
GtRmGeoGpsGroup >> sumNumbers: aBlock [
	^ self items sumNumbers: aBlock
]
