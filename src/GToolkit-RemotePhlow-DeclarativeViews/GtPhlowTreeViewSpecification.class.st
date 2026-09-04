Class {
	#name : #GtPhlowTreeViewSpecification,
	#superclass : #GtPhlowListingViewSpecification,
	#instVars : [
		'expander'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowTreeViewSpecification class >> fromJSONDictionary: aDictionary [
	| specification |
	specification := super fromJSONDictionary: aDictionary.
	
	(aDictionary at: 'expander' ifAbsent: [ nil ])
		ifNotNil: [ :expanderData |
			specification expander: (GtRemotePhlowTreeNodeExpander 
				fromDictionary: expanderData) ].
			
	^ specification
]

{ #category : #converting }
GtPhlowTreeViewSpecification >> asBasicViewDataForExport [
	| dictionary |
	
	dictionary := super asBasicViewDataForExport.
	self expander ifNotNil: [ :anExpander |
		dictionary at: 'expander' put: anExpander asDictionaryForExport ].
			
	^dictionary
]

{ #category : #accessing }
GtPhlowTreeViewSpecification >> expander [
	^ expander
]

{ #category : #accessing }
GtPhlowTreeViewSpecification >> expander: anExpander [
	expander := anExpander
]

{ #category : #'api - accessing' }
GtPhlowTreeViewSpecification >> retrieveChildrenForNodeAtPath: aNodePath [
	^ self phlowDataSource 
		retrieveChildrenForNodeAtPath: aNodePath
]

{ #category : #'api - accessing' }
GtPhlowTreeViewSpecification >> retrieveSentItemAtPath: aNodePath [
	^ self phlowDataSource 
		retrieveSentItemAtPath: aNodePath
]

{ #category : #'api - accessing' }
GtPhlowTreeViewSpecification >> retriveSentItemAtPath: aNodePath [
	^ self phlowDataSource 
		retriveSentItemAtPath: aNodePath
]
