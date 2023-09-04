Class {
	#name : #GtRemotePhlowExplicitColumn,
	#superclass : #GtRemotePhlowColumn,
	#instVars : [
		'spawnObjectComputation',
		'type'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowExplicitColumn >> asGtDeclarativeColumnDataType [
	^ type ifNil: [
		GtPhlowDeclarativeListingType unknown ]
]

{ #category : #configuration }
GtRemotePhlowExplicitColumn >> iconName: aBlock [
	self item: aBlock.
	type := GtPhlowDeclarativeListingType iconName
]

{ #category : #testing }
GtRemotePhlowExplicitColumn >> isSpawningObject [
	^ self asGtDeclarativeColumnDataType isTextLinkListingType
]

{ #category : #accessing }
GtRemotePhlowExplicitColumn >> spawnObjectComputation [
	"If nil, the cell does not spawn an object"

	^ spawnObjectComputation
]

{ #category : #configuration }
GtRemotePhlowExplicitColumn >> text: aBlock [
	self item: aBlock.
	type := GtPhlowDeclarativeListingType text
]

{ #category : #configuration }
GtRemotePhlowExplicitColumn >> text: aBlock spawn: aSpawnObjectComputation [
	"aSpawnObjectComputation should return an Object that should be spawned when clicked on:
		- a link button if the column data type is #text
		- a link icon if the column data type is #icon.

	Setting a spawnObject influences how a cell is rendered"
	
	self item: aBlock.
	spawnObjectComputation := aSpawnObjectComputation.
	type := GtPhlowDeclarativeListingType textLink
]
