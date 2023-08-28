Class {
	#name : #GtRmGeolifeBaseImporter,
	#superclass : #Object,
	#instVars : [
		'currentDirectory'
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
		longitude: (parts first asNumber);
		latitude:(parts second asNumber).
		
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
	^ (currentDirectory / 'Data') directories first: 5
]
