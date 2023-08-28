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
		'records' -> (self records collect: [ :aRecord |
			aRecord asJsonDictionary ]) asArray  }
]

{ #category : #'gt - extensions' }
GtRmGeoGpsTrajectory >> gtViewRecordsFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Records';
		object: [ self records ];
		view: #gtItemsFor: 
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
GtRmGeoGpsTrajectory >> targetFolderName [
	^ targetFolderName
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> targetFolderName: aFolderName [
	targetFolderName := aFolderName
]
