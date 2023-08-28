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
	items add: anObject
]

{ #category : #accessing }
GtRmGeoGpsGroup >> addAll: aCollection [
	items addAll: aCollection
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
GtRmGeoGpsGroup >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [
	^ self items detect: aBlock ifFound: foundBlock ifNone: exceptionBlock
]

{ #category : #accessing }
GtRmGeoGpsGroup >> do: aBlock [ 
	self items do: aBlock
]

{ #category : #initialization }
GtRmGeoGpsGroup >> initialize [
	super initialize.
	
	items := OrderedCollection new
]

{ #category : #accessing }
GtRmGeoGpsGroup >> items [
	^ items
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
	^ items size
]

{ #category : #accessing }
GtRmGeoGpsGroup >> sumNumbers: aBlock [
	^ items sumNumbers: aBlock
]
