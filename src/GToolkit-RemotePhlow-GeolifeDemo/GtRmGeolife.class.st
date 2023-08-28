Class {
	#name : #GtRmGeolife,
	#superclass : #Object,
	#instVars : [
		'users'
	],
	#classVars : [
		'DEFAULT'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #accessing }
GtRmGeolife class >> defaultInstance [
	^ DEFAULT ifNil: [
		DEFAULT := self new ]
]

{ #category : #accessing }
GtRmGeolife class >> resetDefaultInstance [
	DEFAULT := nil
]

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

{ #category : #adding }
GtRmGeolife >> ensureUserWithId: anId [
	^ self users 
		detect: [ :aUser | aUser id = anId ]
		ifFound: [ :aUser ] 
		ifNone: [ 
			| newUser |
			newUser := GtRmGeoUser new 
				id: anId.
			self addUser: newUser.
			newUser ]
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
