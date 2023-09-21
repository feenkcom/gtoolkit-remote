Class {
	#name : #GtPhlowColumnedTreeViewSpecification,
	#superclass : #GtPhlowBasicColumnedViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

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
