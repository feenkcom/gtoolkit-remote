Class {
	#name : #GtRemotePhlowDeclarativeViewDetailsDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #views }
GtRemotePhlowDeclarativeViewDetailsDataSource >> gtPhlowViewRowsFor: aView [
	<gtView>
	^ aView forward
		title: 'Phlow rows';
		priority: 15;
		object: [ phlowView ];
		view: #gtRowsFor:
]

{ #category : #'as yet unclassified' }
GtRemotePhlowDeclarativeViewDetailsDataSource >> retrieveRowNodes [
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
