Class {
	#name : #GtRmGeoGpsUsersGroup,
	#superclass : #GtRmGeoGpsGroup,
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #accessing }
GtRmGeoGpsUsersGroup >> allRecords [
	^ self 
		cacheAt: 'allRecords'
		ifAbsentPut: [ 
			self allTrajectories allRecords ]
]

{ #category : #accessing }
GtRmGeoGpsUsersGroup >> allTrajectories [
	^ self 
		cacheAt: 'allTrajectories'
		ifAbsentPut: [  
			self items
				inject: GtRmGeoGpsTrajectoriesGroup new 
				into: [ :trajectories :aUser |
					trajectories addAll: aUser trajectories.
					trajectories ] ]
]

{ #category : #'gt - extensions' }
GtRmGeoGpsUsersGroup >> gtItemsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Users';
		priority: 5;
		items: [ self items ];
		column: 'Id' text: [ :aUser | aUser id ];
		column: 'Number of trajectories' 
			text: [ :aUser | aUser numberOfTrajectories ];
		column: 'Number of records' 
			text: [ :aUser | aUser numberOfRecords  ]
]

{ #category : #'gt - extensions' }
GtRmGeoGpsUsersGroup >> gtViewAllTrajectoriesFor: aView [
	<gtView>
	
	^ aView forward
		title: 'All trajectories';
		priority: 45;
		object: [ self allTrajectories ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtRmGeoGpsUsersGroup >> removeUser: aString [
	"Remove the supplied user.
	GS only has #detect:ifNone: (not #detect:ifFound:)"

	(items
		detect: [ :user | user id = aString ]
		ifNone: [ nil ]) ifNotNil:
			[ :user | items remove: user ]
]

{ #category : #accessing }
GtRmGeoGpsUsersGroup >> shortDistancesWithBug [
	^ self allTrajectories select: [ :aTrajectory |
		aTrajectory distanceWithBug < 5 ]
]
