Class {
	#name : #GtRmGeolifeGemstoneImporter,
	#superclass : #GtRmGeolifeBaseImporter,
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #accessing }
GtRmGeolifeGemstoneImporter >> ensureGemstoneUserWithId: anId [ 
	^ self gemStoneSession 
		evaluateAndWait: 'GtRmGeolife defaultInstance ensureUserWithId: ', anId printString
]

{ #category : #accessing }
GtRmGeolifeGemstoneImporter >> gemStoneSession [
	^ GtGemStoneSessionRegistry default
]

{ #category : #accessing }
GtRmGeolifeGemstoneImporter >> importFromDirectory: aDirectory [
	
	currentDirectory := aDirectory.
	
	self directoriesToImport do: [ :aUserFolder |
		self importUserFromDirectory: aUserFolder ]
]

{ #category : #accessing }
GtRmGeolifeGemstoneImporter >> importUserFromDirectory: aUserFolder [ 
	| user |
	
	user := self ensureGemstoneUserWithId: aUserFolder basename.
	
	((aUserFolder / 'Trajectory') childrenMatching: '*.plt') 
		do: [ :aTrajectoryFolder |
			| trajectory |
			trajectory := self createTrajectoryFromDirectory: aTrajectoryFolder.
			user addTrajectoryFromJsonData: trajectory ].
	
	^ user
]
