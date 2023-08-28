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
