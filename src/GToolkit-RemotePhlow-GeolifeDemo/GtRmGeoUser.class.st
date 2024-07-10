Class {
	#name : #GtRmGeoUser,
	#superclass : #Object,
	#instVars : [
		'trajectories',
		'id'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #accessing }
GtRmGeoUser class >> fromJsonDictionary: aDictionary [
	^ self new 
		initializeFomJsonDictionary: aDictionary
]

{ #category : #adding }
GtRmGeoUser >> addTrajectory: aTrajectory [ 
	self trajectories add: aTrajectory
]

{ #category : #adding }
GtRmGeoUser >> addTrajectoryFromJsonData: aJsonData [
	self addTrajectory: (GtRmGeoGpsTrajectory 
		fromJsonDictionary:  aJsonData)
]

{ #category : #accessing }
GtRmGeoUser >> allRecords [
	
	^ self trajectories allRecords
]

{ #category : #accessing }
GtRmGeoUser >> asJsonDictionary [
	^ {
		'id' -> self id.
		'trajectories' -> self trajectoriesAsJsonData  } asDictionary
]

{ #category : #'gt - extensions' }
GtRmGeoUser >> gtViewRecordsFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Records';
		priority: 10;
		object: [ self allRecords ];
		view: #gtItemsFor: 
]

{ #category : #'gt - extensions' }
GtRmGeoUser >> gtViewSummaryDataFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Overview';
		priority: 1;
		items: [ self summaryData ];
		column: 'Name' text: [ :array | array first ];
		column: 'Value' text: [ :array | array second value ];
		send: [ :array | array third value ]
]

{ #category : #'gt - extensions' }
GtRmGeoUser >> gtViewTrajectoriesFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Trajectories';
		priority: 5;
		object: [ self trajectories ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtRmGeoUser >> id [
	^ id
]

{ #category : #accessing }
GtRmGeoUser >> id: anObject [
	id := anObject
]

{ #category : #initialization }
GtRmGeoUser >> initializeFomJsonDictionary: aDictionary [
	self id: (aDictionary at: 'id').
	
	(aDictionary at: 'trajectories') do: [ :aTrajectoryData |
		self addTrajectory:  (GtRmGeoGpsTrajectory 
			fromJsonDictionary: aTrajectoryData) ].
]

{ #category : #accessing }
GtRmGeoUser >> numberOfRecords [
	^ self trajectories sumNumbers: [ :aTrajectory |
		aTrajectory numberOfRecords ]
]

{ #category : #accessing }
GtRmGeoUser >> numberOfTrajectories [
	^ self trajectories size
]

{ #category : #printing }
GtRmGeoUser >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		<< '(';
		print: self id;
		<< '; ';
		print: self trajectories size;
		<< ' trajectories';
		<< ')'
]

{ #category : #accessing }
GtRmGeoUser >> summaryData [
	^ {
		{'Trajectories'. [ self trajectories size]. [self trajectories]}.
		{'Records'. [ self allRecords size]. [self allRecords]}
	}
]

{ #category : #accessing }
GtRmGeoUser >> trajectories [
	^ trajectories ifNil: [
		trajectories := GtRmGeoGpsTrajectoriesGroup new ]
]

{ #category : #accessing }
GtRmGeoUser >> trajectoriesAsJsonData [
	^ (self trajectories collect: [ :aTrajectory |
			aTrajectory asJsonDictionary ]) asArray
]
