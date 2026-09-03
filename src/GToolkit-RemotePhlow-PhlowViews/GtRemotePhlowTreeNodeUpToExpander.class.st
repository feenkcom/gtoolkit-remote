Class {
	#name : #GtRemotePhlowTreeNodeUpToExpander,
	#superclass : #GtRemotePhlowTreeNodeExpander,
	#instVars : [
		'level'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowTreeNodeUpToExpander >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'level' put: level.
	^ specificationData
]

{ #category : #'api - configuration' }
GtRemotePhlowTreeNodeUpToExpander >> configurePhlowView: aPhlowView [
	self level ifNotNil: [ :aLevel | 
		aPhlowView expandUpTo: self level ]
]

{ #category : #initialization }
GtRemotePhlowTreeNodeUpToExpander >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary  
		at: 'level' ifPresent: [ :aLevel |
			self level: aLevel ].
]

{ #category : #'api - accessing' }
GtRemotePhlowTreeNodeUpToExpander >> level [
	^ level
]

{ #category : #'api - accessing' }
GtRemotePhlowTreeNodeUpToExpander >> level: aLevelIndex [
	self 
		assert: [ aLevelIndex isInteger and: [ aLevelIndex > 0 ] ] 
		description: [ 'Level index must be a natural number' ].
	level := aLevelIndex
]
