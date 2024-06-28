Class {
	#name : #GtRmGeoGpsTrajectory,
	#superclass : #Object,
	#instVars : [
		'records',
		'targetFolderName'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #'instance creation' }
GtRmGeoGpsTrajectory class >> fromJsonDictionary: aDictionary [
	^ self new 
		initializeFomJsonDictionary: aDictionary
]

{ #category : #adding }
GtRmGeoGpsTrajectory >> addRecord: aRecord [
	self records add: aRecord
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> asJsonDictionary [
	^ {
		'targetFolderName' -> self targetFolderName.
		'records' -> self recordsAsJsonData  } asDictionary
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> distance [
	^ self records distance
]

{ #category : #'gt - extensions' }
GtRmGeoGpsTrajectory >> gtViewGpsRecordsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Records';
		priority: 10;
		items: [ self records items ];
		column: 'Timestamp' text: [ :aRecord | aRecord timestamp ];
		column: 'Latitude' text: [ :aRecord | aRecord latitude ];
		column: 'Longitude' text: [ :aRecord | aRecord longitude ]
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> gtViewMapFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'OSM';
		priority: 20;
		stencil: [ self osmMap ]
]

{ #category : #initialization }
GtRmGeoGpsTrajectory >> initializeFomJsonDictionary: aDictionary [
	self targetFolderName: (aDictionary at: 'targetFolderName').
	
	(aDictionary at: 'records') do: [ :aRecordData |
		self addRecord:  (GtRmGeoGpsRecord 
			fromJsonDictionary: aRecordData) ].
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> numberOfRecords [
	^ self records size
]

{ #category : #printing }
GtRmGeoGpsTrajectory >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		<< '(';
		print: self targetFolderName;
		<< '; ';
		print: self records size;
		<< ' records';
		<< ')'
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> records [
	^ records ifNil: [
		records := GtRmGeoGpsRecordsGroup new ]
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> recordsAsJsonData [
	^ (self records collect: [ :aRecord |
			aRecord asJsonDictionary ]) asArray
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> targetFolderName [
	^ targetFolderName
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> targetFolderName: aFolderName [
	targetFolderName := aFolderName
]
