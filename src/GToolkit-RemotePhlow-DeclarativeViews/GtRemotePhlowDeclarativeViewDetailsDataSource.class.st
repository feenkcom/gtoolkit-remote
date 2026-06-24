Class {
	#name : #GtRemotePhlowDeclarativeViewDetailsDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#instVars : [
		'cachedNodes'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowDeclarativeViewDetailsDataSource >> computeRowNodes [
	| rowIndex |
	rowIndex := 1.
	^ self phlowView phlowDetailRows 
			collect: [ :aPhlowRow |
				| nodeValue currentIndex rowValue text |
				currentIndex := rowIndex.
				rowIndex := rowIndex + 1.
				
				nodeValue := [
					rowValue := aPhlowRow valueComputation value.
					text := aPhlowRow textComputation value: rowValue.
				 	GtRemotePhlowDetailsRowValue new 
							rowIndex: currentIndex;
							itemText: text;
							rowValue: rowValue
				] on: Error 
					do: [ :anError |
						GtRemotePhlowItemErrorValue new
							itemText: anError description ].
	
				GtRemotePhlowDetailsNode new
					nodeId: currentIndex;
					targetObject: rowValue;
					nodeValue:nodeValue ]
]

{ #category : #views }
GtRemotePhlowDeclarativeViewDetailsDataSource >> gtPhlowViewRowsFor: aView [
	<gtView>
	^ aView forward
		title: 'Phlow rows';
		priority: 15;
		object: [ phlowView ];
		view: #gtRowsFor:
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewDetailsDataSource >> retrieveRowNodeData [
	^ (self retrieveRowNodes collect: [ :each | each asDictionaryForExport ]) asArray
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewDetailsDataSource >> retrieveRowNodeRawValueAtRowIndex: aRowIndex [
	^ self retrieveRowNodes 
			detect: [ :each | each nodeId = aRowIndex ]
			ifFound: [ :each | each targetObject ]
			ifNone: [ nil ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewDetailsDataSource >> retrieveRowNodes [
	^ cachedNodes ifNil: [
			cachedNodes := self computeRowNodes ]
]
