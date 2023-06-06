Class {
	#name : #GtPhlowTreeViewSpecification,
	#superclass : #GtPhlowListingViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'api - accessing' }
GtPhlowTreeViewSpecification >> retrieveChildrenForNodeAtPath: aNodePath [
	^ self phlowDataSource 
		retrieveChildrenForNodeAtPath: aNodePath
]

{ #category : #'api - accessing' }
GtPhlowTreeViewSpecification >> retriveSentItemAtPath: aNodePath [
	^ self phlowDataSource 
		retriveSentItemAtPath: aNodePath
]
