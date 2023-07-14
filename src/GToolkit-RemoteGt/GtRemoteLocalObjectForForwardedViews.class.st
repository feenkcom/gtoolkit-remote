Class {
	#name : #GtRemoteLocalObjectForForwardedViews,
	#superclass : #Object,
	#instVars : [
		'objectComputation'
	],
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #'instance creation' }
GtRemoteLocalObjectForForwardedViews class >> withObjectComputation: aBlock [
	^ self new
		objectComputation: aBlock
]

{ #category : #accessing }
GtRemoteLocalObjectForForwardedViews >> computeObject [
	^ self objectComputation value
]

{ #category : #'gt - extensions' }
GtRemoteLocalObjectForForwardedViews >> gtViewRemoteForwardListViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to list';
		priority: 10;
		object: [ self computeObject ];
		view: #gtListFor:
]

{ #category : #'gt - extensions' }
GtRemoteLocalObjectForForwardedViews >> gtViewRemoteForwardListViewWithLocalSendFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward with send - to list ';
		priority: 15;
		object: [ self computeObject ];
		view: #gtListFor:;
		send: [ :each | 
			{ each . each } ]
]

{ #category : #'gt - extensions' }
GtRemoteLocalObjectForForwardedViews >> gtViewRemoteForwardToForwardListWithSendViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to forward list with send';
		priority: 20;
		object: [ self computeObject ];
		view: #gtForwardListWithSendFor:
]

{ #category : #'gt - extensions' }
GtRemoteLocalObjectForForwardedViews >> gtViewRemoteForwardToListWithSendViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to list with send';
		priority: 12;
		object: [ self computeObject ];
		view: #gtListWithSendFor:
]

{ #category : #accessing }
GtRemoteLocalObjectForForwardedViews >> objectComputation [
	^ objectComputation ifNil: [
		self simulationObjectComputation ]
]

{ #category : #accessing }
GtRemoteLocalObjectForForwardedViews >> objectComputation: aBlock [ 
	objectComputation := aBlock
]

{ #category : #accessing }
GtRemoteLocalObjectForForwardedViews >> simulationObjectComputation [
	^ [ GtRemoteInspectionSimulation 
			openOn: GtRemotePhlowDeclarativeTestInspectable new ]
]
