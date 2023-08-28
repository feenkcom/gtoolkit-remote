Class {
	#name : #GtRmGeoGpsTrajectory,
	#superclass : #Object,
	#instVars : [
		'records',
		'targetFolderName'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #adding }
GtRmGeoGpsTrajectory >> addRecord: aRecord [
	self records add: aRecord
]

{ #category : #'gt - extensions' }
GtRmGeoGpsTrajectory >> gtViewRecordsFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Records';
		object: [ records ];
		view: #gtItemsFor: 
]

{ #category : #initialization }
GtRmGeoGpsTrajectory >> initialize [
	super initialize.
	
	records := GtRmGeoGpsRecordsGroup new.
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
	^ records
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> targetFolderName [
	^ targetFolderName
]

{ #category : #accessing }
GtRmGeoGpsTrajectory >> targetFolderName: aFolderName [
	targetFolderName := aFolderName
]
