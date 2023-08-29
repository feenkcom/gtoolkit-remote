Class {
	#name : #GtRmGeolifeBaseImporter,
	#superclass : #Object,
	#instVars : [
		'currentDirectory',
		'usersCount'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #importing }
GtRmGeolifeBaseImporter >> createRecordFromLine: aLine [
	| parts record |
	record := GtRmGeoGpsRecord new.
	parts := aLine splitOn: ','.
	
	record 
		timestamp: (DateAndTime  
			date: (Date fromString: parts sixth)
			time: (Time fromString: parts seventh));
		longitude: (parts second asNumber);
		latitude:(parts first asNumber).
		
	^ record
]

{ #category : #importing }
GtRmGeolifeBaseImporter >> createTrajectoryFromDirectory: aTrajectoryFolder [ 
	| trajectory lines |
	
	trajectory := GtRmGeoGpsTrajectory new.
	trajectory targetFolderName: aTrajectoryFolder basename.
	lines := aTrajectoryFolder contents lines.
	7 to: lines size do: [ :anIndex |
		| record | 
		record := self createRecordFromLine: (lines at: anIndex).
		trajectory addRecord: record ].
		
	^ trajectory
]

{ #category : #accessing }
GtRmGeolifeBaseImporter >> directoriesToImport [
	| directories |
	
	directories := (currentDirectory / 'Data') directories.
	^ usersCount 
		ifNil: [ directories ] 
		ifNotNil: [ directories first: usersCount ]
]

{ #category : #accessing }
GtRmGeolifeBaseImporter >> usersCount: aNumber [
	usersCount := aNumber
]
