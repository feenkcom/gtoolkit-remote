Class {
	#name : #GtRmGeoGpsTrajectoriesGroup,
	#superclass : #GtRmGeoGpsGroup,
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #accessing }
GtRmGeoGpsTrajectoriesGroup >> allRecords [
	^ self 
		cacheAt: 'allRecords' 
		ifAbsentPut: [  
			self items
				inject: GtRmGeoGpsRecordsGroup new 
				into: [ :records :aTrajectory |
					records addAll: aTrajectory records items.
					records ] ]
]

{ #category : #'gt - extensions' }
GtRmGeoGpsTrajectoriesGroup >> gtItemsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Trajectories';
		items: [ self items ];
		column: 'Filename' text: [ :aTrajectory | 
			aTrajectory targetFolderName ];
		column: 'Records' text: [ :aTrajectory | 
			aTrajectory numberOfRecords ];
		column: 'Distance (km)' text: [ :aTrajectory | 
			self 
				gtDo: [
					(aTrajectory distance /1000) printShowingDecimalPlaces: 2] 
				gemstoneDo: [
					(aTrajectory distance /1000) asStringUsingFormat: #(0 2 false)  ] ]
]
