Class {
	#name : #GtRemotePhlowLocalObjectForForwardedViews,
	#superclass : #Object,
	#instVars : [
		'objectComputation'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowLocalObjectForForwardedViews class >> withObjectComputation: aBlock [
	^ self new
		objectComputation: aBlock
]

{ #category : #accessing }
GtRemotePhlowLocalObjectForForwardedViews >> computeObject [
	^ self objectComputation value
]

{ #category : #'gt - extensions' }
GtRemotePhlowLocalObjectForForwardedViews >> gtViewRemoteForwardListViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to list';
		priority: 10;
		object: [ self computeObject ];
		view: #gtListFor:
]

{ #category : #'gt - extensions' }
GtRemotePhlowLocalObjectForForwardedViews >> gtViewRemoteForwardListViewWithLocalSendFor: aView [
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
GtRemotePhlowLocalObjectForForwardedViews >> gtViewRemoteForwardToForwardListWithSendViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to forward list with send';
		priority: 20;
		object: [ self computeObject ];
		view: #gtForwardListWithSendFor:
]

{ #category : #'gt - extensions' }
GtRemotePhlowLocalObjectForForwardedViews >> gtViewRemoteForwardToListWithSendViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to list with send';
		priority: 12;
		object: [ self computeObject ];
		view: #gtListWithSendFor:
]

{ #category : #accessing }
GtRemotePhlowLocalObjectForForwardedViews >> objectComputation [
	^ objectComputation ifNil: [
		self simulationObjectComputation ]
]

{ #category : #accessing }
GtRemotePhlowLocalObjectForForwardedViews >> objectComputation: aBlock [ 
	objectComputation := aBlock
]

{ #category : #accessing }
GtRemotePhlowLocalObjectForForwardedViews >> simulationObjectComputation [
	^ [ GtRemoteInspectionSimulation 
			openOn: GtRemotePhlowDeclarativeTestInspectable new ]
]
