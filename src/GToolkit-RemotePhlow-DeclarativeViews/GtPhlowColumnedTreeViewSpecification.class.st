Class {
	#name : #GtPhlowColumnedTreeViewSpecification,
	#superclass : #GtPhlowBasicColumnedViewSpecification,
	#instVars : [
		'expander'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowColumnedTreeViewSpecification class >> fromJSONDictionary: aDictionary [
	| specification |
	specification := super fromJSONDictionary: aDictionary.
	
	(aDictionary at: 'expander' ifAbsent: [ nil ])
		ifNotNil: [ :expanderData |
			specification expander: (GtRemotePhlowTreeNodeExpander 
				fromDictionary: expanderData) ].
			
	^ specification
]

{ #category : #converting }
GtPhlowColumnedTreeViewSpecification >> asBasicViewDataForExport [
	| dictionary |
	
	dictionary := super asBasicViewDataForExport.
	self expander ifNotNil: [ :anExpander |
		dictionary at: 'expander' put: anExpander asDictionaryForExport ].
			
	^dictionary
]

{ #category : #accessing }
GtPhlowColumnedTreeViewSpecification >> expander [
	^ expander
]

{ #category : #accessing }
GtPhlowColumnedTreeViewSpecification >> expander: anExpander [
	expander := anExpander
]

{ #category : #'api - accessing' }
GtPhlowColumnedTreeViewSpecification >> retrieveChildrenForNodeAtPath: aNodePath [
	^ self phlowDataSource 
		retrieveChildrenForNodeAtPath: aNodePath
]

{ #category : #'api - accessing' }
GtPhlowColumnedTreeViewSpecification >> retrieveSentItemAtPath: aNodePath [
	^ self phlowDataSource 
		retrieveSentItemAtPath:aNodePath
]

{ #category : #'api - accessing' }
GtPhlowColumnedTreeViewSpecification >> retriveSentItemAtPath: aNodePath [
	^ self phlowDataSource 
		retriveSentItemAtPath:aNodePath
]
