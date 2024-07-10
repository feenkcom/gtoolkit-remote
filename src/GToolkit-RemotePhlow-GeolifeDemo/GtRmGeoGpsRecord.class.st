Class {
	#name : #GtRmGeoGpsRecord,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'latitude',
		'longitude'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #'instance creation' }
GtRmGeoGpsRecord class >> fromJsonDictionary: aDictionary [
	^ self new 
		initializeFomJsonDictionary: aDictionary
]

{ #category : #converting }
GtRmGeoGpsRecord >> asJsonDictionary [
	^ {
		#timestamp -> self timestamp.
		#latitude -> self latitude.
		#longitude -> self longitude } asDictionary
]

{ #category : #accessing }
GtRmGeoGpsRecord >> asPoint [

	^ self longitude @ self latitude
]

{ #category : #accessing }
GtRmGeoGpsRecord >> googleMapsUrl [
	^ 'https://www.google.com/maps/search/?api=1&query='
		,self latitude printString
		,'%2C'
		, self longitude printString 
]

{ #category : #initialization }
GtRmGeoGpsRecord >> initializeFomJsonDictionary: aDictionary [
	self latitude: (aDictionary at: #latitude).
	self longitude: (aDictionary at: #longitude).
	self timestamp: (aDictionary at: #timestamp)
]

{ #category : #accessing }
GtRmGeoGpsRecord >> latitude [
	^ latitude
]

{ #category : #accessing }
GtRmGeoGpsRecord >> latitude: aFloat [
	latitude := aFloat
]

{ #category : #accessing }
GtRmGeoGpsRecord >> longitude [
	^ longitude
]

{ #category : #accessing }
GtRmGeoGpsRecord >> longitude: aFloat [
	longitude := aFloat
]

{ #category : #printing }
GtRmGeoGpsRecord >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		<< '(';
		print: self timestamp;
		<< '; ';
		print: self latitude;
		<< ', ';
		print: self longitude;
		<< ')'
]

{ #category : #accessing }
GtRmGeoGpsRecord >> timestamp [
	^ timestamp
]

{ #category : #accessing }
GtRmGeoGpsRecord >> timestamp: aDateAndTime [
	timestamp := aDateAndTime
]
