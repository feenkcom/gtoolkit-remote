Class {
	#name : #GtRmGeolife,
	#superclass : #Object,
	#instVars : [
		'users'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #adding }
GtRmGeolife >> addUser: aUser [
	self users add: aUser
]

{ #category : #accessing }
GtRmGeolife >> allRecords [
	
	^ self users allRecords
]

{ #category : #accessing }
GtRmGeolife >> allTrajectories [
	
	^ self users allTrajectories
]

{ #category : #'gt - extensions' }
GtRmGeolife >> gtViewSummaryDataFor: aView [
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
GtRmGeolife >> gtViewUsersFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Users';
		priority: 10;
		object: [ users ];
		view: #gtItemsFor:
]

{ #category : #initialization }
GtRmGeolife >> initialize [
	super initialize.
	
	users := GtRmGeoGpsUsersGroup new.
]

{ #category : #accessing }
GtRmGeolife >> numberOfUsers [
	^ self users size
]

{ #category : #printing }
GtRmGeolife >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		<< '(';
		print: self numberOfUsers;
		<< ' users';
		<< ')'
]

{ #category : #accessing }
GtRmGeolife >> summaryData [
	^ {
		{'Users'. [ self users size]. [self users]}.
		{'Trajectories'. [ self allTrajectories size]. [self allTrajectories]}.
		{'Records'. [ self allRecords size]. [self allRecords]}
	}
]

{ #category : #accessing }
GtRmGeolife >> users [
	^ users
]
