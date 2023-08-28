Class {
	#name : #GtRmGeolifeLocalImporter,
	#superclass : #GtRmGeolifeBaseImporter,
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #importing }
GtRmGeolifeLocalImporter >> createUserFromDirectory: aUserFolder [
	| user |
	
	user := GtRmGeoUser new.
	user id: aUserFolder basename.
	((aUserFolder / 'Trajectory') childrenMatching: '*.plt') 
		do: [ :aTrajectoryFolder |
			| trajectory |
			trajectory := self createTrajectoryFromDirectory: aTrajectoryFolder.
			user addTrajectory:trajectory ].
	
	^ user
]

{ #category : #importing }
GtRmGeolifeLocalImporter >> importFromDirectory: aDirectory [
	| geoLife |
	
	currentDirectory := aDirectory.
	geoLife := GtRmGeolife new.
	
	self directoriesToImport do: [ :aUserFolder |
		self 
			importUserFromDirectory: aUserFolder
			into: geoLife ].
		
	^ geoLife
]

{ #category : #importing }
GtRmGeolifeLocalImporter >> importUserFromDirectory: aUserFolder into: aGeolife [
	| user |
	user := self createUserFromDirectory: aUserFolder.
	aGeolife addUser: user
]
