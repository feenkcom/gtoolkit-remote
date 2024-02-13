Class {
	#name : #GtRemotePhlowColumnedTreeNode,
	#superclass : #GtRemotePhlowTreeNode,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowColumnedTreeNode class >> valueType [
	^ GtRemotePhlowRowValue
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeNode >> columnValueAt: anIndex [
	^ self nodeValue columnValueAt: anIndex
]

{ #category : #'gt - extensions' }
GtRemotePhlowColumnedTreeNode >> gtViewColumnValuesFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Column Values';
		priority: 10;
		object: [ self nodeValue ];
		view: #gtViewColumnValuesFor:
]
