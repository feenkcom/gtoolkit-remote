Class {
	#name : #GtRmGeoGpsTrajectoriesGroup,
	#superclass : #GtRmGeoGpsGroup,
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #accessing }
GtRmGeoGpsTrajectoriesGroup >> allRecords [
	^ self 
		cacheAt: #allRecords 
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
		items: [ items ];
		column: 'Filename' text: [ :aTrajectory | 
			aTrajectory targetFolderName ];
		column: 'Records' text: [ :aTrajectory | 
			aTrajectory numberOfRecords ]
]
