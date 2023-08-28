Class {
	#name : #GtRmGeolifeImporter,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #importing }
GtRmGeolifeImporter >> importFromDirectory: aDirectory [
	| geoLife |
	
	geoLife := GtRmGeolife new.
	
	((aDirectory / 'Data') directories first: 5) do: [ :aUserFolder |
		| user |
		user := self importUserFromDirectory: aUserFolder.
		geoLife addUser: user ].
		
	^ geoLife
]

{ #category : #importing }
GtRmGeolifeImporter >> importTrajectoryFromDirectory: aTrajectoryFolder [ 
	| trajectory lines |
	
	trajectory := GtRmGeoGpsTrajectory new.
	trajectory targetFolderName: aTrajectoryFolder basename.
	lines := aTrajectoryFolder contents lines.
	7 to: lines size do: [ :anIndex |
		| record | 
		record := self importTrajectoryFromLine: (lines at: anIndex).
		trajectory addRecord: record ].
		
	^ trajectory
]

{ #category : #importing }
GtRmGeolifeImporter >> importTrajectoryFromLine: aLine [
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
GtRmGeolifeImporter >> importUserFromDirectory: aUserFolder [ 
	| user |
	
	user := GtRmGeoUser new.
	user id: aUserFolder basename.
	((aUserFolder / 'Trajectory') childrenMatching: '*.plt') 
		do: [ :aTrajectoryFolder |
			| trajectory |
			trajectory := self importTrajectoryFromDirectory: aTrajectoryFolder.
			user addTrajectory:trajectory ].
	
	^ user
]
